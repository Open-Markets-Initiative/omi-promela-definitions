/*
 * Australian Securities Exchange New Trading Platform
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
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 219

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

/* A ‘seconds’ Nanoseconds is issued every second and any message thereafter will be stamped with the number of nanoseconds past the last Time message received as a time reference point */
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

/* ---- End Of Business Trade Date Message: 7 bytes ----------------------------- */

/* This message will be sent as the last message for a Business Trade Date to signal no further messages will be disseminated for that date. */
typedef EndOfBusinessTradeDateMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte event_code
};

int end_of_business_trade_date_message_at;

/* every byte of End Of Business Trade Date Message set to one value */
inline fill_end_of_business_trade_date_message(end_of_business_trade_date_message_record, end_of_business_trade_date_message_value) {
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 4 -> end_of_business_trade_date_message_record.nanoseconds[end_of_business_trade_date_message_at] = end_of_business_trade_date_message_value; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 2 -> end_of_business_trade_date_message_record.trade_date[end_of_business_trade_date_message_at] = end_of_business_trade_date_message_value; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_record.event_code = end_of_business_trade_date_message_value;
  skip
}

/* each byte of End Of Business Trade Date Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_business_trade_date_message(end_of_business_trade_date_message_record, end_of_business_trade_date_message_base) {
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 4 -> end_of_business_trade_date_message_record.nanoseconds[end_of_business_trade_date_message_at] = (end_of_business_trade_date_message_base + 0 + end_of_business_trade_date_message_at + 1) % 256; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 2 -> end_of_business_trade_date_message_record.trade_date[end_of_business_trade_date_message_at] = (end_of_business_trade_date_message_base + 4 + end_of_business_trade_date_message_at + 1) % 256; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_record.event_code = (end_of_business_trade_date_message_base + 6 + 1) % 256;
  skip
}

/* End Of Business Trade Date Message to the wire, 7 bytes from where the cursor stands */
inline encode_end_of_business_trade_date_message(end_of_business_trade_date_message_record) {
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 4 -> wire[at] = end_of_business_trade_date_message_record.nanoseconds[end_of_business_trade_date_message_at]; at = at + 1; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 2 -> wire[at] = end_of_business_trade_date_message_record.trade_date[end_of_business_trade_date_message_at]; at = at + 1; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  wire[at] = end_of_business_trade_date_message_record.event_code; at = at + 1;
  skip
}

/* End Of Business Trade Date Message off the wire, 7 bytes from where the cursor stands */
inline decode_end_of_business_trade_date_message(end_of_business_trade_date_message_record) {
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 4 -> end_of_business_trade_date_message_record.nanoseconds[end_of_business_trade_date_message_at] = wire[at]; at = at + 1; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 2 -> end_of_business_trade_date_message_record.trade_date[end_of_business_trade_date_message_at] = wire[at]; at = at + 1; end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Business Trade Date Message is what was written, byte for byte */
inline equal_end_of_business_trade_date_message(end_of_business_trade_date_message_read, end_of_business_trade_date_message_written) {
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 4 -> assert(end_of_business_trade_date_message_read.nanoseconds[end_of_business_trade_date_message_at] == end_of_business_trade_date_message_written.nanoseconds[end_of_business_trade_date_message_at]); end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  end_of_business_trade_date_message_at = 0;
  do
  :: end_of_business_trade_date_message_at < 2 -> assert(end_of_business_trade_date_message_read.trade_date[end_of_business_trade_date_message_at] == end_of_business_trade_date_message_written.trade_date[end_of_business_trade_date_message_at]); end_of_business_trade_date_message_at = end_of_business_trade_date_message_at + 1
  :: else -> break
  od;
  assert(end_of_business_trade_date_message_read.event_code == end_of_business_trade_date_message_written.event_code);
  skip
}

/* ---- Future Symbol Directory Message: 179 bytes ------------------------------ */

/* The Future Symbol Directory message describes futures contract */
typedef FutureSymbolDirectoryMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte symbol_name[32];
  byte long_name[60];
  byte isin[12];
  byte exchange[6];
  byte instrument[6];
  byte cfi_code[6];
  byte expiry_year[2];
  byte expiry_month;
  byte price_display_decimals;
  byte price_fractional_denominator[4];
  byte price_minimum_tick[4];
  byte last_trading_date[4];
  byte prior_day_settlement[8];
  byte currency[3];
  byte lot_size_or_face_value[8];
  byte maturity_value;
  byte coupon_rate[2];
  byte payments_per_year;
  byte block_lot_size[4];
  byte expiry_date[4]
};

int future_symbol_directory_message_at;

/* every byte of Future Symbol Directory Message set to one value */
inline fill_future_symbol_directory_message(future_symbol_directory_message_record, future_symbol_directory_message_value) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.tradeable_instrument_id[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 32 -> future_symbol_directory_message_record.symbol_name[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 60 -> future_symbol_directory_message_record.long_name[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 12 -> future_symbol_directory_message_record.isin[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.cfi_code[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = future_symbol_directory_message_value;
  future_symbol_directory_message_record.price_display_decimals = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.block_lot_size[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.expiry_date[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Future Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_future_symbol_directory_message(future_symbol_directory_message_record, future_symbol_directory_message_base) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 0 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 4 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.tradeable_instrument_id[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 6 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 32 -> future_symbol_directory_message_record.symbol_name[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 10 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 60 -> future_symbol_directory_message_record.long_name[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 42 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 12 -> future_symbol_directory_message_record.isin[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 102 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 114 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 120 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.cfi_code[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 126 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 132 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = (future_symbol_directory_message_base + 134 + 1) % 256;
  future_symbol_directory_message_record.price_display_decimals = (future_symbol_directory_message_base + 135 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 136 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 140 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 144 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 148 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 156 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 159 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = (future_symbol_directory_message_base + 167 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 168 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = (future_symbol_directory_message_base + 170 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.block_lot_size[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 171 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.expiry_date[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 175 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Future Symbol Directory Message to the wire, 179 bytes from where the cursor stands */
inline encode_future_symbol_directory_message(future_symbol_directory_message_record) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.tradeable_instrument_id[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 32 -> wire[at] = future_symbol_directory_message_record.symbol_name[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 60 -> wire[at] = future_symbol_directory_message_record.long_name[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 12 -> wire[at] = future_symbol_directory_message_record.isin[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> wire[at] = future_symbol_directory_message_record.exchange[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> wire[at] = future_symbol_directory_message_record.instrument[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> wire[at] = future_symbol_directory_message_record.cfi_code[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.expiry_month; at = at + 1;
  wire[at] = future_symbol_directory_message_record.price_display_decimals; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> wire[at] = future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> wire[at] = future_symbol_directory_message_record.currency[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> wire[at] = future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.maturity_value; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.payments_per_year; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.block_lot_size[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.expiry_date[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Future Symbol Directory Message off the wire, 179 bytes from where the cursor stands */
inline decode_future_symbol_directory_message(future_symbol_directory_message_record) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.tradeable_instrument_id[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 32 -> future_symbol_directory_message_record.symbol_name[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 60 -> future_symbol_directory_message_record.long_name[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 12 -> future_symbol_directory_message_record.isin[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.cfi_code[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = wire[at]; at = at + 1;
  future_symbol_directory_message_record.price_display_decimals = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.block_lot_size[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.expiry_date[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Future Symbol Directory Message is what was written, byte for byte */
inline equal_future_symbol_directory_message(future_symbol_directory_message_read, future_symbol_directory_message_written) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.nanoseconds[future_symbol_directory_message_at] == future_symbol_directory_message_written.nanoseconds[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.trade_date[future_symbol_directory_message_at] == future_symbol_directory_message_written.trade_date[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.tradeable_instrument_id[future_symbol_directory_message_at] == future_symbol_directory_message_written.tradeable_instrument_id[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 32 -> assert(future_symbol_directory_message_read.symbol_name[future_symbol_directory_message_at] == future_symbol_directory_message_written.symbol_name[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 60 -> assert(future_symbol_directory_message_read.long_name[future_symbol_directory_message_at] == future_symbol_directory_message_written.long_name[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 12 -> assert(future_symbol_directory_message_read.isin[future_symbol_directory_message_at] == future_symbol_directory_message_written.isin[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> assert(future_symbol_directory_message_read.exchange[future_symbol_directory_message_at] == future_symbol_directory_message_written.exchange[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> assert(future_symbol_directory_message_read.instrument[future_symbol_directory_message_at] == future_symbol_directory_message_written.instrument[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> assert(future_symbol_directory_message_read.cfi_code[future_symbol_directory_message_at] == future_symbol_directory_message_written.cfi_code[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.expiry_year[future_symbol_directory_message_at] == future_symbol_directory_message_written.expiry_year[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.expiry_month == future_symbol_directory_message_written.expiry_month);
  assert(future_symbol_directory_message_read.price_display_decimals == future_symbol_directory_message_written.price_display_decimals);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.price_fractional_denominator[future_symbol_directory_message_at] == future_symbol_directory_message_written.price_fractional_denominator[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.price_minimum_tick[future_symbol_directory_message_at] == future_symbol_directory_message_written.price_minimum_tick[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.last_trading_date[future_symbol_directory_message_at] == future_symbol_directory_message_written.last_trading_date[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> assert(future_symbol_directory_message_read.prior_day_settlement[future_symbol_directory_message_at] == future_symbol_directory_message_written.prior_day_settlement[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> assert(future_symbol_directory_message_read.currency[future_symbol_directory_message_at] == future_symbol_directory_message_written.currency[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 8 -> assert(future_symbol_directory_message_read.lot_size_or_face_value[future_symbol_directory_message_at] == future_symbol_directory_message_written.lot_size_or_face_value[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.maturity_value == future_symbol_directory_message_written.maturity_value);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.coupon_rate[future_symbol_directory_message_at] == future_symbol_directory_message_written.coupon_rate[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.payments_per_year == future_symbol_directory_message_written.payments_per_year);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.block_lot_size[future_symbol_directory_message_at] == future_symbol_directory_message_written.block_lot_size[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.expiry_date[future_symbol_directory_message_at] == future_symbol_directory_message_written.expiry_date[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Options Symbol Directory Message: 219 bytes ----------------------------- */

/* The Options Symbol Directory message describes options and warrants contracts. */
typedef OptionsSymbolDirectoryMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte symbol_name[32];
  byte long_name[60];
  byte isin[12];
  byte exchange[6];
  byte instrument[6];
  byte cfi_code[6];
  byte expiry_year[2];
  byte expiry_month;
  byte option_type;
  byte strike[8];
  byte underlying_tradeable_instrument_id[4];
  byte price_display_decimals;
  byte price_fractional_denominator[4];
  byte price_minimum_tick[4];
  byte strike_price_decimal_position;
  byte strike_price_fractional_denominator[4];
  byte strike_price_minimum_tick[4];
  byte last_trading_date[4];
  byte prior_day_settlement[8];
  byte volatility[8];
  byte currency[3];
  byte lot_size_or_face_value[8];
  byte maturity_value;
  byte coupon_rate[2];
  byte payments_per_year;
  byte block_lot_size[4];
  byte expiry_date[4];
  byte basis_of_quotation[10]
};

int options_symbol_directory_message_at;

/* every byte of Options Symbol Directory Message set to one value */
inline fill_options_symbol_directory_message(options_symbol_directory_message_record, options_symbol_directory_message_value) {
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.nanoseconds[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.trade_date[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.tradeable_instrument_id[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 32 -> options_symbol_directory_message_record.symbol_name[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 60 -> options_symbol_directory_message_record.long_name[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 12 -> options_symbol_directory_message_record.isin[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.exchange[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.instrument[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.cfi_code[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.expiry_year[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.expiry_month = options_symbol_directory_message_value;
  options_symbol_directory_message_record.option_type = options_symbol_directory_message_value;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.strike[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.underlying_tradeable_instrument_id[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.price_display_decimals = options_symbol_directory_message_value;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_fractional_denominator[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_minimum_tick[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.strike_price_decimal_position = options_symbol_directory_message_value;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_fractional_denominator[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_minimum_tick[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.last_trading_date[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.prior_day_settlement[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.volatility[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 3 -> options_symbol_directory_message_record.currency[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.lot_size_or_face_value[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.maturity_value = options_symbol_directory_message_value;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.coupon_rate[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.payments_per_year = options_symbol_directory_message_value;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.block_lot_size[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.expiry_date[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 10 -> options_symbol_directory_message_record.basis_of_quotation[options_symbol_directory_message_at] = options_symbol_directory_message_value; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_options_symbol_directory_message(options_symbol_directory_message_record, options_symbol_directory_message_base) {
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.nanoseconds[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 0 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.trade_date[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 4 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.tradeable_instrument_id[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 6 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 32 -> options_symbol_directory_message_record.symbol_name[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 10 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 60 -> options_symbol_directory_message_record.long_name[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 42 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 12 -> options_symbol_directory_message_record.isin[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 102 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.exchange[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 114 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.instrument[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 120 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.cfi_code[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 126 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.expiry_year[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 132 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.expiry_month = (options_symbol_directory_message_base + 134 + 1) % 256;
  options_symbol_directory_message_record.option_type = (options_symbol_directory_message_base + 135 + 1) % 256;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.strike[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 136 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.underlying_tradeable_instrument_id[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 144 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.price_display_decimals = (options_symbol_directory_message_base + 148 + 1) % 256;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_fractional_denominator[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 149 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_minimum_tick[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 153 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.strike_price_decimal_position = (options_symbol_directory_message_base + 157 + 1) % 256;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_fractional_denominator[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 158 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_minimum_tick[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 162 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.last_trading_date[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 166 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.prior_day_settlement[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 170 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.volatility[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 178 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 3 -> options_symbol_directory_message_record.currency[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 186 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.lot_size_or_face_value[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 189 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.maturity_value = (options_symbol_directory_message_base + 197 + 1) % 256;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.coupon_rate[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 198 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.payments_per_year = (options_symbol_directory_message_base + 200 + 1) % 256;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.block_lot_size[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 201 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.expiry_date[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 205 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 10 -> options_symbol_directory_message_record.basis_of_quotation[options_symbol_directory_message_at] = (options_symbol_directory_message_base + 209 + options_symbol_directory_message_at + 1) % 256; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Symbol Directory Message to the wire, 219 bytes from where the cursor stands */
inline encode_options_symbol_directory_message(options_symbol_directory_message_record) {
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.nanoseconds[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> wire[at] = options_symbol_directory_message_record.trade_date[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.tradeable_instrument_id[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 32 -> wire[at] = options_symbol_directory_message_record.symbol_name[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 60 -> wire[at] = options_symbol_directory_message_record.long_name[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 12 -> wire[at] = options_symbol_directory_message_record.isin[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> wire[at] = options_symbol_directory_message_record.exchange[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> wire[at] = options_symbol_directory_message_record.instrument[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> wire[at] = options_symbol_directory_message_record.cfi_code[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> wire[at] = options_symbol_directory_message_record.expiry_year[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_symbol_directory_message_record.expiry_month; at = at + 1;
  wire[at] = options_symbol_directory_message_record.option_type; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> wire[at] = options_symbol_directory_message_record.strike[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.underlying_tradeable_instrument_id[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_symbol_directory_message_record.price_display_decimals; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.price_fractional_denominator[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.price_minimum_tick[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_symbol_directory_message_record.strike_price_decimal_position; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.strike_price_fractional_denominator[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.strike_price_minimum_tick[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.last_trading_date[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> wire[at] = options_symbol_directory_message_record.prior_day_settlement[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> wire[at] = options_symbol_directory_message_record.volatility[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 3 -> wire[at] = options_symbol_directory_message_record.currency[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> wire[at] = options_symbol_directory_message_record.lot_size_or_face_value[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_symbol_directory_message_record.maturity_value; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> wire[at] = options_symbol_directory_message_record.coupon_rate[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = options_symbol_directory_message_record.payments_per_year; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.block_lot_size[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> wire[at] = options_symbol_directory_message_record.expiry_date[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 10 -> wire[at] = options_symbol_directory_message_record.basis_of_quotation[options_symbol_directory_message_at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Symbol Directory Message off the wire, 219 bytes from where the cursor stands */
inline decode_options_symbol_directory_message(options_symbol_directory_message_record) {
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.nanoseconds[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.trade_date[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.tradeable_instrument_id[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 32 -> options_symbol_directory_message_record.symbol_name[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 60 -> options_symbol_directory_message_record.long_name[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 12 -> options_symbol_directory_message_record.isin[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.exchange[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.instrument[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> options_symbol_directory_message_record.cfi_code[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.expiry_year[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.expiry_month = wire[at]; at = at + 1;
  options_symbol_directory_message_record.option_type = wire[at]; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.strike[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.underlying_tradeable_instrument_id[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.price_display_decimals = wire[at]; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_fractional_denominator[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.price_minimum_tick[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.strike_price_decimal_position = wire[at]; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_fractional_denominator[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.strike_price_minimum_tick[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.last_trading_date[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.prior_day_settlement[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.volatility[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 3 -> options_symbol_directory_message_record.currency[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> options_symbol_directory_message_record.lot_size_or_face_value[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.maturity_value = wire[at]; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> options_symbol_directory_message_record.coupon_rate[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_record.payments_per_year = wire[at]; at = at + 1;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.block_lot_size[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> options_symbol_directory_message_record.expiry_date[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 10 -> options_symbol_directory_message_record.basis_of_quotation[options_symbol_directory_message_at] = wire[at]; at = at + 1; options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Symbol Directory Message is what was written, byte for byte */
inline equal_options_symbol_directory_message(options_symbol_directory_message_read, options_symbol_directory_message_written) {
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.nanoseconds[options_symbol_directory_message_at] == options_symbol_directory_message_written.nanoseconds[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> assert(options_symbol_directory_message_read.trade_date[options_symbol_directory_message_at] == options_symbol_directory_message_written.trade_date[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.tradeable_instrument_id[options_symbol_directory_message_at] == options_symbol_directory_message_written.tradeable_instrument_id[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 32 -> assert(options_symbol_directory_message_read.symbol_name[options_symbol_directory_message_at] == options_symbol_directory_message_written.symbol_name[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 60 -> assert(options_symbol_directory_message_read.long_name[options_symbol_directory_message_at] == options_symbol_directory_message_written.long_name[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 12 -> assert(options_symbol_directory_message_read.isin[options_symbol_directory_message_at] == options_symbol_directory_message_written.isin[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> assert(options_symbol_directory_message_read.exchange[options_symbol_directory_message_at] == options_symbol_directory_message_written.exchange[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> assert(options_symbol_directory_message_read.instrument[options_symbol_directory_message_at] == options_symbol_directory_message_written.instrument[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 6 -> assert(options_symbol_directory_message_read.cfi_code[options_symbol_directory_message_at] == options_symbol_directory_message_written.cfi_code[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> assert(options_symbol_directory_message_read.expiry_year[options_symbol_directory_message_at] == options_symbol_directory_message_written.expiry_year[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(options_symbol_directory_message_read.expiry_month == options_symbol_directory_message_written.expiry_month);
  assert(options_symbol_directory_message_read.option_type == options_symbol_directory_message_written.option_type);
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> assert(options_symbol_directory_message_read.strike[options_symbol_directory_message_at] == options_symbol_directory_message_written.strike[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.underlying_tradeable_instrument_id[options_symbol_directory_message_at] == options_symbol_directory_message_written.underlying_tradeable_instrument_id[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(options_symbol_directory_message_read.price_display_decimals == options_symbol_directory_message_written.price_display_decimals);
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.price_fractional_denominator[options_symbol_directory_message_at] == options_symbol_directory_message_written.price_fractional_denominator[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.price_minimum_tick[options_symbol_directory_message_at] == options_symbol_directory_message_written.price_minimum_tick[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(options_symbol_directory_message_read.strike_price_decimal_position == options_symbol_directory_message_written.strike_price_decimal_position);
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.strike_price_fractional_denominator[options_symbol_directory_message_at] == options_symbol_directory_message_written.strike_price_fractional_denominator[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.strike_price_minimum_tick[options_symbol_directory_message_at] == options_symbol_directory_message_written.strike_price_minimum_tick[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.last_trading_date[options_symbol_directory_message_at] == options_symbol_directory_message_written.last_trading_date[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> assert(options_symbol_directory_message_read.prior_day_settlement[options_symbol_directory_message_at] == options_symbol_directory_message_written.prior_day_settlement[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> assert(options_symbol_directory_message_read.volatility[options_symbol_directory_message_at] == options_symbol_directory_message_written.volatility[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 3 -> assert(options_symbol_directory_message_read.currency[options_symbol_directory_message_at] == options_symbol_directory_message_written.currency[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 8 -> assert(options_symbol_directory_message_read.lot_size_or_face_value[options_symbol_directory_message_at] == options_symbol_directory_message_written.lot_size_or_face_value[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(options_symbol_directory_message_read.maturity_value == options_symbol_directory_message_written.maturity_value);
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 2 -> assert(options_symbol_directory_message_read.coupon_rate[options_symbol_directory_message_at] == options_symbol_directory_message_written.coupon_rate[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(options_symbol_directory_message_read.payments_per_year == options_symbol_directory_message_written.payments_per_year);
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.block_lot_size[options_symbol_directory_message_at] == options_symbol_directory_message_written.block_lot_size[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 4 -> assert(options_symbol_directory_message_read.expiry_date[options_symbol_directory_message_at] == options_symbol_directory_message_written.expiry_date[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  options_symbol_directory_message_at = 0;
  do
  :: options_symbol_directory_message_at < 10 -> assert(options_symbol_directory_message_read.basis_of_quotation[options_symbol_directory_message_at] == options_symbol_directory_message_written.basis_of_quotation[options_symbol_directory_message_at]); options_symbol_directory_message_at = options_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Book State Message: 11 bytes -------------------------------------- */

/* This message indicates the current session state of a contract to the market */
typedef OrderBookStateMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte session_state
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
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.tradeable_instrument_id[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.session_state = order_book_state_message_value;
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
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = (order_book_state_message_base + 4 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.tradeable_instrument_id[order_book_state_message_at] = (order_book_state_message_base + 6 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.session_state = (order_book_state_message_base + 10 + 1) % 256;
  skip
}

/* Order Book State Message to the wire, 11 bytes from where the cursor stands */
inline encode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> wire[at] = order_book_state_message_record.trade_date[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.tradeable_instrument_id[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_state_message_record.session_state; at = at + 1;
  skip
}

/* Order Book State Message off the wire, 11 bytes from where the cursor stands */
inline decode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.tradeable_instrument_id[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.session_state = wire[at]; at = at + 1;
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
  :: order_book_state_message_at < 2 -> assert(order_book_state_message_read.trade_date[order_book_state_message_at] == order_book_state_message_written.trade_date[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.tradeable_instrument_id[order_book_state_message_at] == order_book_state_message_written.tradeable_instrument_id[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  assert(order_book_state_message_read.session_state == order_book_state_message_written.session_state);
  skip
}

/* ---- Add Order Message: 39 bytes --------------------------------------------- */

/* An Order Added message indicates a new order or a restated order that has been accepted by the matching engine and added to the order book */
typedef AddOrderMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte order_book_priority[8];
  byte quantity[4];
  byte price[8]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.trade_date[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.tradeable_instrument_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_book_priority[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.trade_date[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.tradeable_instrument_id[add_order_message_at] = (add_order_message_base + 6 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = (add_order_message_base + 10 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 11 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_book_priority[add_order_message_at] = (add_order_message_base + 19 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = (add_order_message_base + 27 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 31 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 39 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.nanoseconds[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.trade_date[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.tradeable_instrument_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_book_priority[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.quantity[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 39 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.trade_date[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.tradeable_instrument_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_book_priority[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.quantity[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.nanoseconds[add_order_message_at] == add_order_message_written.nanoseconds[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.trade_date[add_order_message_at] == add_order_message_written.trade_date[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.tradeable_instrument_id[add_order_message_at] == add_order_message_written.tradeable_instrument_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side == add_order_message_written.side);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_book_priority[add_order_message_at] == add_order_message_written.order_book_priority[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.quantity[add_order_message_at] == add_order_message_written.quantity[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Volume Cancelled Message: 23 bytes -------------------------------- */

/* An Order Volume Cancelled message is sent when an order is modified as a result of partial cancellation of volume */
typedef OrderVolumeCancelledMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte quantity[4]
};

int order_volume_cancelled_message_at;

/* every byte of Order Volume Cancelled Message set to one value */
inline fill_order_volume_cancelled_message(order_volume_cancelled_message_record, order_volume_cancelled_message_value) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.tradeable_instrument_id[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = order_volume_cancelled_message_value;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_id[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Volume Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_order_volume_cancelled_message(order_volume_cancelled_message_record, order_volume_cancelled_message_base) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 0 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 4 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.tradeable_instrument_id[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 6 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = (order_volume_cancelled_message_base + 10 + 1) % 256;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_id[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 11 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 19 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Volume Cancelled Message to the wire, 23 bytes from where the cursor stands */
inline encode_order_volume_cancelled_message(order_volume_cancelled_message_record) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> wire[at] = order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.tradeable_instrument_id[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_volume_cancelled_message_record.side; at = at + 1;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> wire[at] = order_volume_cancelled_message_record.order_id[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Volume Cancelled Message off the wire, 23 bytes from where the cursor stands */
inline decode_order_volume_cancelled_message(order_volume_cancelled_message_record) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.tradeable_instrument_id[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = wire[at]; at = at + 1;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_id[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Volume Cancelled Message is what was written, byte for byte */
inline equal_order_volume_cancelled_message(order_volume_cancelled_message_read, order_volume_cancelled_message_written) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.nanoseconds[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.nanoseconds[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> assert(order_volume_cancelled_message_read.trade_date[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.trade_date[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.tradeable_instrument_id[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.tradeable_instrument_id[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_volume_cancelled_message_read.side == order_volume_cancelled_message_written.side);
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> assert(order_volume_cancelled_message_read.order_id[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.order_id[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.quantity[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.quantity[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Deleted Message: 19 bytes ----------------------------------------- */

/* This message is sent whenever an order in the book is cancelled by the owner, expired, cancelled by the exchange, purged or volume cancelled */
typedef OrderDeletedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8]
};

int order_deleted_message_at;

/* every byte of Order Deleted Message set to one value */
inline fill_order_deleted_message(order_deleted_message_record, order_deleted_message_value) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.tradeable_instrument_id[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = order_deleted_message_value;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_order_deleted_message(order_deleted_message_record, order_deleted_message_base) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = (order_deleted_message_base + 0 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = (order_deleted_message_base + 4 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.tradeable_instrument_id[order_deleted_message_at] = (order_deleted_message_base + 6 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = (order_deleted_message_base + 10 + 1) % 256;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = (order_deleted_message_base + 11 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.nanoseconds[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> wire[at] = order_deleted_message_record.trade_date[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.tradeable_instrument_id[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_deleted_message_record.side; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.order_id[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.tradeable_instrument_id[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = wire[at]; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_id[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Deleted Message is what was written, byte for byte */
inline equal_order_deleted_message(order_deleted_message_read, order_deleted_message_written) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.nanoseconds[order_deleted_message_at] == order_deleted_message_written.nanoseconds[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> assert(order_deleted_message_read.trade_date[order_deleted_message_at] == order_deleted_message_written.trade_date[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.tradeable_instrument_id[order_deleted_message_at] == order_deleted_message_written.tradeable_instrument_id[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  assert(order_deleted_message_read.side == order_deleted_message_written.side);
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.order_id[order_deleted_message_at] == order_deleted_message_written.order_id[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 55 bytes ---------------------------------------- */

/* This message is sent whenever a resting order of the book is executed in whole or in part and the counterparty to the trade is an aggressive order */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte trade_id[8];
  byte executed_quantity[4];
  byte trade_price[8];
  byte combination_trade_id[8];
  byte counter_party_id[3]
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
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.tradeable_instrument_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.combination_trade_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 3 -> order_executed_message_record.counter_party_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.tradeable_instrument_id[order_executed_message_at] = (order_executed_message_base + 6 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = (order_executed_message_base + 10 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 11 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = (order_executed_message_base + 19 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = (order_executed_message_base + 23 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = (order_executed_message_base + 24 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 32 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_price[order_executed_message_at] = (order_executed_message_base + 36 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.combination_trade_id[order_executed_message_at] = (order_executed_message_base + 44 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 3 -> order_executed_message_record.counter_party_id[order_executed_message_at] = (order_executed_message_base + 52 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 55 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.trade_date[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.tradeable_instrument_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.side; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.quantity_remaining[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.trade_type; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.trade_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.trade_price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.combination_trade_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 3 -> wire[at] = order_executed_message_record.counter_party_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 55 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.tradeable_instrument_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.trade_price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.combination_trade_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 3 -> order_executed_message_record.counter_party_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.trade_date[order_executed_message_at] == order_executed_message_written.trade_date[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.tradeable_instrument_id[order_executed_message_at] == order_executed_message_written.tradeable_instrument_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.side == order_executed_message_written.side);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.quantity_remaining[order_executed_message_at] == order_executed_message_written.quantity_remaining[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.trade_type == order_executed_message_written.trade_type);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.trade_id[order_executed_message_at] == order_executed_message_written.trade_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.trade_price[order_executed_message_at] == order_executed_message_written.trade_price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.combination_trade_id[order_executed_message_at] == order_executed_message_written.combination_trade_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 3 -> assert(order_executed_message_read.counter_party_id[order_executed_message_at] == order_executed_message_written.counter_party_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Order Executed Message: 52 bytes -------------------------------- */

/* This message is sent when orders are executed in the auction at the open of the market */
typedef AuctionOrderExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte trade_id[8];
  byte executed_quantity[4];
  byte trade_price[8];
  byte opposite_order_id[8]
};

int auction_order_executed_message_at;

/* every byte of Auction Order Executed Message set to one value */
inline fill_auction_order_executed_message(auction_order_executed_message_record, auction_order_executed_message_value) {
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.nanoseconds[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 2 -> auction_order_executed_message_record.trade_date[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.tradeable_instrument_id[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.side = auction_order_executed_message_value;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.order_id[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.quantity_remaining[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.trade_type = auction_order_executed_message_value;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_id[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.executed_quantity[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_price[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.opposite_order_id[auction_order_executed_message_at] = auction_order_executed_message_value; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_auction_order_executed_message(auction_order_executed_message_record, auction_order_executed_message_base) {
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.nanoseconds[auction_order_executed_message_at] = (auction_order_executed_message_base + 0 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 2 -> auction_order_executed_message_record.trade_date[auction_order_executed_message_at] = (auction_order_executed_message_base + 4 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.tradeable_instrument_id[auction_order_executed_message_at] = (auction_order_executed_message_base + 6 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.side = (auction_order_executed_message_base + 10 + 1) % 256;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.order_id[auction_order_executed_message_at] = (auction_order_executed_message_base + 11 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.quantity_remaining[auction_order_executed_message_at] = (auction_order_executed_message_base + 19 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.trade_type = (auction_order_executed_message_base + 23 + 1) % 256;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_id[auction_order_executed_message_at] = (auction_order_executed_message_base + 24 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.executed_quantity[auction_order_executed_message_at] = (auction_order_executed_message_base + 32 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_price[auction_order_executed_message_at] = (auction_order_executed_message_base + 36 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.opposite_order_id[auction_order_executed_message_at] = (auction_order_executed_message_base + 44 + auction_order_executed_message_at + 1) % 256; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Order Executed Message to the wire, 52 bytes from where the cursor stands */
inline encode_auction_order_executed_message(auction_order_executed_message_record) {
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> wire[at] = auction_order_executed_message_record.nanoseconds[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 2 -> wire[at] = auction_order_executed_message_record.trade_date[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> wire[at] = auction_order_executed_message_record.tradeable_instrument_id[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_order_executed_message_record.side; at = at + 1;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> wire[at] = auction_order_executed_message_record.order_id[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> wire[at] = auction_order_executed_message_record.quantity_remaining[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_order_executed_message_record.trade_type; at = at + 1;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> wire[at] = auction_order_executed_message_record.trade_id[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> wire[at] = auction_order_executed_message_record.executed_quantity[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> wire[at] = auction_order_executed_message_record.trade_price[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> wire[at] = auction_order_executed_message_record.opposite_order_id[auction_order_executed_message_at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Order Executed Message off the wire, 52 bytes from where the cursor stands */
inline decode_auction_order_executed_message(auction_order_executed_message_record) {
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.nanoseconds[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 2 -> auction_order_executed_message_record.trade_date[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.tradeable_instrument_id[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.side = wire[at]; at = at + 1;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.order_id[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.quantity_remaining[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_record.trade_type = wire[at]; at = at + 1;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_id[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> auction_order_executed_message_record.executed_quantity[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.trade_price[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> auction_order_executed_message_record.opposite_order_id[auction_order_executed_message_at] = wire[at]; at = at + 1; auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Order Executed Message is what was written, byte for byte */
inline equal_auction_order_executed_message(auction_order_executed_message_read, auction_order_executed_message_written) {
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> assert(auction_order_executed_message_read.nanoseconds[auction_order_executed_message_at] == auction_order_executed_message_written.nanoseconds[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 2 -> assert(auction_order_executed_message_read.trade_date[auction_order_executed_message_at] == auction_order_executed_message_written.trade_date[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> assert(auction_order_executed_message_read.tradeable_instrument_id[auction_order_executed_message_at] == auction_order_executed_message_written.tradeable_instrument_id[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  assert(auction_order_executed_message_read.side == auction_order_executed_message_written.side);
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> assert(auction_order_executed_message_read.order_id[auction_order_executed_message_at] == auction_order_executed_message_written.order_id[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> assert(auction_order_executed_message_read.quantity_remaining[auction_order_executed_message_at] == auction_order_executed_message_written.quantity_remaining[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  assert(auction_order_executed_message_read.trade_type == auction_order_executed_message_written.trade_type);
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> assert(auction_order_executed_message_read.trade_id[auction_order_executed_message_at] == auction_order_executed_message_written.trade_id[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 4 -> assert(auction_order_executed_message_read.executed_quantity[auction_order_executed_message_at] == auction_order_executed_message_written.executed_quantity[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> assert(auction_order_executed_message_read.trade_price[auction_order_executed_message_at] == auction_order_executed_message_written.trade_price[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  auction_order_executed_message_at = 0;
  do
  :: auction_order_executed_message_at < 8 -> assert(auction_order_executed_message_read.opposite_order_id[auction_order_executed_message_at] == auction_order_executed_message_written.opposite_order_id[auction_order_executed_message_at]); auction_order_executed_message_at = auction_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Order Executed Message: 65 bytes ---------------------------- */

/* This message is sent whenever a resting order is matched with an open leg of a resting combination order in whole or in part */
typedef CombinationOrderExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte trade_id[8];
  byte executed_quantity[4];
  byte trade_price[8];
  byte opposite_tradeable_instrument_id[4];
  byte opposite_side;
  byte opposite_order_id[8];
  byte combination_trade_id[8]
};

int combination_order_executed_message_at;

/* every byte of Combination Order Executed Message set to one value */
inline fill_combination_order_executed_message(combination_order_executed_message_record, combination_order_executed_message_value) {
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.nanoseconds[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 2 -> combination_order_executed_message_record.trade_date[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.tradeable_instrument_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.side = combination_order_executed_message_value;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.order_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.quantity_remaining[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.trade_type = combination_order_executed_message_value;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.executed_quantity[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_price[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.opposite_tradeable_instrument_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.opposite_side = combination_order_executed_message_value;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.opposite_order_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.combination_trade_id[combination_order_executed_message_at] = combination_order_executed_message_value; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_combination_order_executed_message(combination_order_executed_message_record, combination_order_executed_message_base) {
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.nanoseconds[combination_order_executed_message_at] = (combination_order_executed_message_base + 0 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 2 -> combination_order_executed_message_record.trade_date[combination_order_executed_message_at] = (combination_order_executed_message_base + 4 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.tradeable_instrument_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 6 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.side = (combination_order_executed_message_base + 10 + 1) % 256;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.order_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 11 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.quantity_remaining[combination_order_executed_message_at] = (combination_order_executed_message_base + 19 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.trade_type = (combination_order_executed_message_base + 23 + 1) % 256;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 24 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.executed_quantity[combination_order_executed_message_at] = (combination_order_executed_message_base + 32 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_price[combination_order_executed_message_at] = (combination_order_executed_message_base + 36 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.opposite_tradeable_instrument_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 44 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.opposite_side = (combination_order_executed_message_base + 48 + 1) % 256;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.opposite_order_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 49 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.combination_trade_id[combination_order_executed_message_at] = (combination_order_executed_message_base + 57 + combination_order_executed_message_at + 1) % 256; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Executed Message to the wire, 65 bytes from where the cursor stands */
inline encode_combination_order_executed_message(combination_order_executed_message_record) {
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> wire[at] = combination_order_executed_message_record.nanoseconds[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 2 -> wire[at] = combination_order_executed_message_record.trade_date[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> wire[at] = combination_order_executed_message_record.tradeable_instrument_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_executed_message_record.side; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> wire[at] = combination_order_executed_message_record.order_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> wire[at] = combination_order_executed_message_record.quantity_remaining[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_executed_message_record.trade_type; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> wire[at] = combination_order_executed_message_record.trade_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> wire[at] = combination_order_executed_message_record.executed_quantity[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> wire[at] = combination_order_executed_message_record.trade_price[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> wire[at] = combination_order_executed_message_record.opposite_tradeable_instrument_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_order_executed_message_record.opposite_side; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> wire[at] = combination_order_executed_message_record.opposite_order_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> wire[at] = combination_order_executed_message_record.combination_trade_id[combination_order_executed_message_at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Order Executed Message off the wire, 65 bytes from where the cursor stands */
inline decode_combination_order_executed_message(combination_order_executed_message_record) {
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.nanoseconds[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 2 -> combination_order_executed_message_record.trade_date[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.tradeable_instrument_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.side = wire[at]; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.order_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.quantity_remaining[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.trade_type = wire[at]; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.executed_quantity[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.trade_price[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> combination_order_executed_message_record.opposite_tradeable_instrument_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_record.opposite_side = wire[at]; at = at + 1;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.opposite_order_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> combination_order_executed_message_record.combination_trade_id[combination_order_executed_message_at] = wire[at]; at = at + 1; combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Order Executed Message is what was written, byte for byte */
inline equal_combination_order_executed_message(combination_order_executed_message_read, combination_order_executed_message_written) {
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> assert(combination_order_executed_message_read.nanoseconds[combination_order_executed_message_at] == combination_order_executed_message_written.nanoseconds[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 2 -> assert(combination_order_executed_message_read.trade_date[combination_order_executed_message_at] == combination_order_executed_message_written.trade_date[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> assert(combination_order_executed_message_read.tradeable_instrument_id[combination_order_executed_message_at] == combination_order_executed_message_written.tradeable_instrument_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_order_executed_message_read.side == combination_order_executed_message_written.side);
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> assert(combination_order_executed_message_read.order_id[combination_order_executed_message_at] == combination_order_executed_message_written.order_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> assert(combination_order_executed_message_read.quantity_remaining[combination_order_executed_message_at] == combination_order_executed_message_written.quantity_remaining[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_order_executed_message_read.trade_type == combination_order_executed_message_written.trade_type);
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> assert(combination_order_executed_message_read.trade_id[combination_order_executed_message_at] == combination_order_executed_message_written.trade_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> assert(combination_order_executed_message_read.executed_quantity[combination_order_executed_message_at] == combination_order_executed_message_written.executed_quantity[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> assert(combination_order_executed_message_read.trade_price[combination_order_executed_message_at] == combination_order_executed_message_written.trade_price[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 4 -> assert(combination_order_executed_message_read.opposite_tradeable_instrument_id[combination_order_executed_message_at] == combination_order_executed_message_written.opposite_tradeable_instrument_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_order_executed_message_read.opposite_side == combination_order_executed_message_written.opposite_side);
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> assert(combination_order_executed_message_read.opposite_order_id[combination_order_executed_message_at] == combination_order_executed_message_written.opposite_order_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  combination_order_executed_message_at = 0;
  do
  :: combination_order_executed_message_at < 8 -> assert(combination_order_executed_message_read.combination_trade_id[combination_order_executed_message_at] == combination_order_executed_message_written.combination_trade_id[combination_order_executed_message_at]); combination_order_executed_message_at = combination_order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Added Message: 39 bytes ----------------------------------- */

/* This message is a similar format to the Order Added message, except the nature of this order is it has an implied price, implied volume and a priority that is derived from two or more “real” orders deriving the implied price */
typedef ImpliedOrderAddedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte order_book_priority[8];
  byte quantity[4];
  byte price[8]
};

int implied_order_added_message_at;

/* every byte of Implied Order Added Message set to one value */
inline fill_implied_order_added_message(implied_order_added_message_record, implied_order_added_message_value) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.tradeable_instrument_id[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = implied_order_added_message_value;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_id[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.price[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Added Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_added_message(implied_order_added_message_record, implied_order_added_message_base) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = (implied_order_added_message_base + 0 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = (implied_order_added_message_base + 4 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.tradeable_instrument_id[implied_order_added_message_at] = (implied_order_added_message_base + 6 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = (implied_order_added_message_base + 10 + 1) % 256;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_id[implied_order_added_message_at] = (implied_order_added_message_base + 11 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = (implied_order_added_message_base + 19 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = (implied_order_added_message_base + 27 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.price[implied_order_added_message_at] = (implied_order_added_message_base + 31 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Added Message to the wire, 39 bytes from where the cursor stands */
inline encode_implied_order_added_message(implied_order_added_message_record) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.nanoseconds[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> wire[at] = implied_order_added_message_record.trade_date[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.tradeable_instrument_id[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_added_message_record.side; at = at + 1;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> wire[at] = implied_order_added_message_record.order_id[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> wire[at] = implied_order_added_message_record.order_book_priority[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.quantity[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> wire[at] = implied_order_added_message_record.price[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Added Message off the wire, 39 bytes from where the cursor stands */
inline decode_implied_order_added_message(implied_order_added_message_record) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.tradeable_instrument_id[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = wire[at]; at = at + 1;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_id[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.price[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Added Message is what was written, byte for byte */
inline equal_implied_order_added_message(implied_order_added_message_read, implied_order_added_message_written) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.nanoseconds[implied_order_added_message_at] == implied_order_added_message_written.nanoseconds[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> assert(implied_order_added_message_read.trade_date[implied_order_added_message_at] == implied_order_added_message_written.trade_date[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.tradeable_instrument_id[implied_order_added_message_at] == implied_order_added_message_written.tradeable_instrument_id[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  assert(implied_order_added_message_read.side == implied_order_added_message_written.side);
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> assert(implied_order_added_message_read.order_id[implied_order_added_message_at] == implied_order_added_message_written.order_id[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> assert(implied_order_added_message_read.order_book_priority[implied_order_added_message_at] == implied_order_added_message_written.order_book_priority[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.quantity[implied_order_added_message_at] == implied_order_added_message_written.quantity[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> assert(implied_order_added_message_read.price[implied_order_added_message_at] == implied_order_added_message_written.price[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Replaced Message: 39 bytes -------------------------------- */

/* This message notifies the subscriber that an existing implied order is to be replaced when the implied price, volume or priority has changed due to a price or volume movement of “real” orders for a side of a single Tradeable Instrument Id */
typedef ImpliedOrderReplacedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8];
  byte order_book_priority[8];
  byte quantity[4];
  byte price[8]
};

int implied_order_replaced_message_at;

/* every byte of Implied Order Replaced Message set to one value */
inline fill_implied_order_replaced_message(implied_order_replaced_message_record, implied_order_replaced_message_value) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.tradeable_instrument_id[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = implied_order_replaced_message_value;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_id[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_replaced_message(implied_order_replaced_message_record, implied_order_replaced_message_base) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 0 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 4 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.tradeable_instrument_id[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 6 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = (implied_order_replaced_message_base + 10 + 1) % 256;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_id[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 11 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 19 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 27 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 31 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Replaced Message to the wire, 39 bytes from where the cursor stands */
inline encode_implied_order_replaced_message(implied_order_replaced_message_record) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> wire[at] = implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.tradeable_instrument_id[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_replaced_message_record.side; at = at + 1;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> wire[at] = implied_order_replaced_message_record.order_id[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> wire[at] = implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.quantity[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> wire[at] = implied_order_replaced_message_record.price[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Replaced Message off the wire, 39 bytes from where the cursor stands */
inline decode_implied_order_replaced_message(implied_order_replaced_message_record) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.tradeable_instrument_id[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = wire[at]; at = at + 1;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_id[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Replaced Message is what was written, byte for byte */
inline equal_implied_order_replaced_message(implied_order_replaced_message_read, implied_order_replaced_message_written) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.nanoseconds[implied_order_replaced_message_at] == implied_order_replaced_message_written.nanoseconds[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> assert(implied_order_replaced_message_read.trade_date[implied_order_replaced_message_at] == implied_order_replaced_message_written.trade_date[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.tradeable_instrument_id[implied_order_replaced_message_at] == implied_order_replaced_message_written.tradeable_instrument_id[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(implied_order_replaced_message_read.side == implied_order_replaced_message_written.side);
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> assert(implied_order_replaced_message_read.order_id[implied_order_replaced_message_at] == implied_order_replaced_message_written.order_id[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> assert(implied_order_replaced_message_read.order_book_priority[implied_order_replaced_message_at] == implied_order_replaced_message_written.order_book_priority[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.quantity[implied_order_replaced_message_at] == implied_order_replaced_message_written.quantity[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> assert(implied_order_replaced_message_read.price[implied_order_replaced_message_at] == implied_order_replaced_message_written.price[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Deleted Message: 19 bytes --------------------------------- */

/* This message is sent whenever the implied pricing or volume has changed due to price or volume movement of “real” orders for a side of a single contract number. When received, any implied volume is no longer accessible so the “implied” order of the indicated side must be removed from the book */
typedef ImpliedOrderDeletedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte side;
  byte order_id[8]
};

int implied_order_deleted_message_at;

/* every byte of Implied Order Deleted Message set to one value */
inline fill_implied_order_deleted_message(implied_order_deleted_message_record, implied_order_deleted_message_value) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.tradeable_instrument_id[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = implied_order_deleted_message_value;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_id[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_deleted_message(implied_order_deleted_message_record, implied_order_deleted_message_base) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 0 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 4 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.tradeable_instrument_id[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 6 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = (implied_order_deleted_message_base + 10 + 1) % 256;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_id[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 11 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Deleted Message to the wire, 19 bytes from where the cursor stands */
inline encode_implied_order_deleted_message(implied_order_deleted_message_record) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> wire[at] = implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> wire[at] = implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> wire[at] = implied_order_deleted_message_record.tradeable_instrument_id[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_deleted_message_record.side; at = at + 1;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> wire[at] = implied_order_deleted_message_record.order_id[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Deleted Message off the wire, 19 bytes from where the cursor stands */
inline decode_implied_order_deleted_message(implied_order_deleted_message_record) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.tradeable_instrument_id[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = wire[at]; at = at + 1;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_id[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Deleted Message is what was written, byte for byte */
inline equal_implied_order_deleted_message(implied_order_deleted_message_read, implied_order_deleted_message_written) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> assert(implied_order_deleted_message_read.nanoseconds[implied_order_deleted_message_at] == implied_order_deleted_message_written.nanoseconds[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> assert(implied_order_deleted_message_read.trade_date[implied_order_deleted_message_at] == implied_order_deleted_message_written.trade_date[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> assert(implied_order_deleted_message_read.tradeable_instrument_id[implied_order_deleted_message_at] == implied_order_deleted_message_written.tradeable_instrument_id[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  assert(implied_order_deleted_message_read.side == implied_order_deleted_message_written.side);
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> assert(implied_order_deleted_message_read.order_id[implied_order_deleted_message_at] == implied_order_deleted_message_written.order_id[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Executed Message: 45 bytes ---------------------------------------- */

/* The Trade Message is designed to provide details for executions in combination order books. Trade Executed messages are reported in the same sequence as order execution messages are reported */
typedef TradeExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte trade_type;
  byte trade_id[8];
  byte executed_quantity[4];
  byte trade_price[8];
  byte combination_trade_id[8];
  byte participant_id_buyer[3];
  byte participant_id_seller[3]
};

int trade_executed_message_at;

/* every byte of Trade Executed Message set to one value */
inline fill_trade_executed_message(trade_executed_message_record, trade_executed_message_value) {
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.nanoseconds[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 2 -> trade_executed_message_record.trade_date[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.tradeable_instrument_id[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_record.trade_type = trade_executed_message_value;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_id[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.executed_quantity[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_price[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.combination_trade_id[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_buyer[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_seller[trade_executed_message_at] = trade_executed_message_value; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Executed Message set to where it lies, so a field read out of place says so */
inline ramp_trade_executed_message(trade_executed_message_record, trade_executed_message_base) {
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.nanoseconds[trade_executed_message_at] = (trade_executed_message_base + 0 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 2 -> trade_executed_message_record.trade_date[trade_executed_message_at] = (trade_executed_message_base + 4 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.tradeable_instrument_id[trade_executed_message_at] = (trade_executed_message_base + 6 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_record.trade_type = (trade_executed_message_base + 10 + 1) % 256;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_id[trade_executed_message_at] = (trade_executed_message_base + 11 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.executed_quantity[trade_executed_message_at] = (trade_executed_message_base + 19 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_price[trade_executed_message_at] = (trade_executed_message_base + 23 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.combination_trade_id[trade_executed_message_at] = (trade_executed_message_base + 31 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_buyer[trade_executed_message_at] = (trade_executed_message_base + 39 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_seller[trade_executed_message_at] = (trade_executed_message_base + 42 + trade_executed_message_at + 1) % 256; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Executed Message to the wire, 45 bytes from where the cursor stands */
inline encode_trade_executed_message(trade_executed_message_record) {
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> wire[at] = trade_executed_message_record.nanoseconds[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 2 -> wire[at] = trade_executed_message_record.trade_date[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> wire[at] = trade_executed_message_record.tradeable_instrument_id[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_executed_message_record.trade_type; at = at + 1;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> wire[at] = trade_executed_message_record.trade_id[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> wire[at] = trade_executed_message_record.executed_quantity[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> wire[at] = trade_executed_message_record.trade_price[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> wire[at] = trade_executed_message_record.combination_trade_id[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> wire[at] = trade_executed_message_record.participant_id_buyer[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> wire[at] = trade_executed_message_record.participant_id_seller[trade_executed_message_at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Executed Message off the wire, 45 bytes from where the cursor stands */
inline decode_trade_executed_message(trade_executed_message_record) {
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.nanoseconds[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 2 -> trade_executed_message_record.trade_date[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.tradeable_instrument_id[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_record.trade_type = wire[at]; at = at + 1;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_id[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> trade_executed_message_record.executed_quantity[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.trade_price[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> trade_executed_message_record.combination_trade_id[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_buyer[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> trade_executed_message_record.participant_id_seller[trade_executed_message_at] = wire[at]; at = at + 1; trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Executed Message is what was written, byte for byte */
inline equal_trade_executed_message(trade_executed_message_read, trade_executed_message_written) {
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> assert(trade_executed_message_read.nanoseconds[trade_executed_message_at] == trade_executed_message_written.nanoseconds[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 2 -> assert(trade_executed_message_read.trade_date[trade_executed_message_at] == trade_executed_message_written.trade_date[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> assert(trade_executed_message_read.tradeable_instrument_id[trade_executed_message_at] == trade_executed_message_written.tradeable_instrument_id[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  assert(trade_executed_message_read.trade_type == trade_executed_message_written.trade_type);
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> assert(trade_executed_message_read.trade_id[trade_executed_message_at] == trade_executed_message_written.trade_id[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 4 -> assert(trade_executed_message_read.executed_quantity[trade_executed_message_at] == trade_executed_message_written.executed_quantity[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> assert(trade_executed_message_read.trade_price[trade_executed_message_at] == trade_executed_message_written.trade_price[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 8 -> assert(trade_executed_message_read.combination_trade_id[trade_executed_message_at] == trade_executed_message_written.combination_trade_id[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> assert(trade_executed_message_read.participant_id_buyer[trade_executed_message_at] == trade_executed_message_written.participant_id_buyer[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  trade_executed_message_at = 0;
  do
  :: trade_executed_message_at < 3 -> assert(trade_executed_message_read.participant_id_seller[trade_executed_message_at] == trade_executed_message_written.participant_id_seller[trade_executed_message_at]); trade_executed_message_at = trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Combination Trade Executed Message: 79 bytes ---------------------------- */

/* The Combination Trade Executed Message is designed to provide details for executions where one or both orders are resting from a different order book id from the order book id of the trade */
typedef CombinationTradeExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte trade_type;
  byte trade_id[8];
  byte executed_quantity[4];
  byte trade_price[8];
  byte buyer_tradeable_instrument_id[4];
  byte buyer_side;
  byte buyer_order_id[8];
  byte buyer_combination_trade_id[8];
  byte buyer_participant_id[3];
  byte seller_tradeable_instrument_id[4];
  byte seller_side;
  byte seller_order_id[8];
  byte seller_combination_trade_id[8];
  byte seller_participant_id[3]
};

int combination_trade_executed_message_at;

/* every byte of Combination Trade Executed Message set to one value */
inline fill_combination_trade_executed_message(combination_trade_executed_message_record, combination_trade_executed_message_value) {
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.nanoseconds[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 2 -> combination_trade_executed_message_record.trade_date[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.tradeable_instrument_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.trade_type = combination_trade_executed_message_value;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.executed_quantity[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_price[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.buyer_tradeable_instrument_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.buyer_side = combination_trade_executed_message_value;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_order_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_combination_trade_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.buyer_participant_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.seller_tradeable_instrument_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.seller_side = combination_trade_executed_message_value;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_order_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_combination_trade_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.seller_participant_id[combination_trade_executed_message_at] = combination_trade_executed_message_value; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Combination Trade Executed Message set to where it lies, so a field read out of place says so */
inline ramp_combination_trade_executed_message(combination_trade_executed_message_record, combination_trade_executed_message_base) {
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.nanoseconds[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 0 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 2 -> combination_trade_executed_message_record.trade_date[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 4 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.tradeable_instrument_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 6 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.trade_type = (combination_trade_executed_message_base + 10 + 1) % 256;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 11 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.executed_quantity[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 19 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_price[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 23 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.buyer_tradeable_instrument_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 31 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.buyer_side = (combination_trade_executed_message_base + 35 + 1) % 256;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_order_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 36 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_combination_trade_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 44 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.buyer_participant_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 52 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.seller_tradeable_instrument_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 55 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.seller_side = (combination_trade_executed_message_base + 59 + 1) % 256;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_order_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 60 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_combination_trade_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 68 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.seller_participant_id[combination_trade_executed_message_at] = (combination_trade_executed_message_base + 76 + combination_trade_executed_message_at + 1) % 256; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Trade Executed Message to the wire, 79 bytes from where the cursor stands */
inline encode_combination_trade_executed_message(combination_trade_executed_message_record) {
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> wire[at] = combination_trade_executed_message_record.nanoseconds[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 2 -> wire[at] = combination_trade_executed_message_record.trade_date[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> wire[at] = combination_trade_executed_message_record.tradeable_instrument_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_trade_executed_message_record.trade_type; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.trade_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> wire[at] = combination_trade_executed_message_record.executed_quantity[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.trade_price[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> wire[at] = combination_trade_executed_message_record.buyer_tradeable_instrument_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_trade_executed_message_record.buyer_side; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.buyer_order_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.buyer_combination_trade_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> wire[at] = combination_trade_executed_message_record.buyer_participant_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> wire[at] = combination_trade_executed_message_record.seller_tradeable_instrument_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = combination_trade_executed_message_record.seller_side; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.seller_order_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> wire[at] = combination_trade_executed_message_record.seller_combination_trade_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> wire[at] = combination_trade_executed_message_record.seller_participant_id[combination_trade_executed_message_at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Combination Trade Executed Message off the wire, 79 bytes from where the cursor stands */
inline decode_combination_trade_executed_message(combination_trade_executed_message_record) {
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.nanoseconds[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 2 -> combination_trade_executed_message_record.trade_date[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.tradeable_instrument_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.trade_type = wire[at]; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.executed_quantity[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.trade_price[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.buyer_tradeable_instrument_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.buyer_side = wire[at]; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_order_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.buyer_combination_trade_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.buyer_participant_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> combination_trade_executed_message_record.seller_tradeable_instrument_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_record.seller_side = wire[at]; at = at + 1;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_order_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> combination_trade_executed_message_record.seller_combination_trade_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> combination_trade_executed_message_record.seller_participant_id[combination_trade_executed_message_at] = wire[at]; at = at + 1; combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Combination Trade Executed Message is what was written, byte for byte */
inline equal_combination_trade_executed_message(combination_trade_executed_message_read, combination_trade_executed_message_written) {
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> assert(combination_trade_executed_message_read.nanoseconds[combination_trade_executed_message_at] == combination_trade_executed_message_written.nanoseconds[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 2 -> assert(combination_trade_executed_message_read.trade_date[combination_trade_executed_message_at] == combination_trade_executed_message_written.trade_date[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> assert(combination_trade_executed_message_read.tradeable_instrument_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.tradeable_instrument_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_trade_executed_message_read.trade_type == combination_trade_executed_message_written.trade_type);
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.trade_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.trade_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> assert(combination_trade_executed_message_read.executed_quantity[combination_trade_executed_message_at] == combination_trade_executed_message_written.executed_quantity[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.trade_price[combination_trade_executed_message_at] == combination_trade_executed_message_written.trade_price[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> assert(combination_trade_executed_message_read.buyer_tradeable_instrument_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.buyer_tradeable_instrument_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_trade_executed_message_read.buyer_side == combination_trade_executed_message_written.buyer_side);
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.buyer_order_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.buyer_order_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.buyer_combination_trade_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.buyer_combination_trade_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> assert(combination_trade_executed_message_read.buyer_participant_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.buyer_participant_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 4 -> assert(combination_trade_executed_message_read.seller_tradeable_instrument_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.seller_tradeable_instrument_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  assert(combination_trade_executed_message_read.seller_side == combination_trade_executed_message_written.seller_side);
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.seller_order_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.seller_order_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 8 -> assert(combination_trade_executed_message_read.seller_combination_trade_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.seller_combination_trade_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  combination_trade_executed_message_at = 0;
  do
  :: combination_trade_executed_message_at < 3 -> assert(combination_trade_executed_message_read.seller_participant_id[combination_trade_executed_message_at] == combination_trade_executed_message_written.seller_participant_id[combination_trade_executed_message_at]); combination_trade_executed_message_at = combination_trade_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancellation Message: 18 bytes ------------------------------------ */

/* This message is sent whenever a trade is cancelled by ASX */
typedef TradeCancellationMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte trade_id[8]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.tradeable_instrument_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_id[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = (trade_cancellation_message_base + 4 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.tradeable_instrument_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 6 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_id[trade_cancellation_message_at] = (trade_cancellation_message_base + 10 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 18 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> wire[at] = trade_cancellation_message_record.trade_date[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.tradeable_instrument_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> wire[at] = trade_cancellation_message_record.trade_id[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 18 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.tradeable_instrument_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> trade_cancellation_message_record.trade_id[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.nanoseconds[trade_cancellation_message_at] == trade_cancellation_message_written.nanoseconds[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> assert(trade_cancellation_message_read.trade_date[trade_cancellation_message_at] == trade_cancellation_message_written.trade_date[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.tradeable_instrument_id[trade_cancellation_message_at] == trade_cancellation_message_written.tradeable_instrument_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 8 -> assert(trade_cancellation_message_read.trade_id[trade_cancellation_message_at] == trade_cancellation_message_written.trade_id[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equilibrium Price Message: 42 bytes ------------------------------------- */

/* This message is disseminated in response to changes in the equilibrium price for an order book during a pre-open period */
typedef EquilibriumPriceMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte equilibrium_price[8];
  byte matched_quantity[8];
  byte bid_quantity[8];
  byte ask_quantity[8]
};

int equilibrium_price_message_at;

/* every byte of Equilibrium Price Message set to one value */
inline fill_equilibrium_price_message(equilibrium_price_message_record, equilibrium_price_message_value) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.nanoseconds[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 2 -> equilibrium_price_message_record.trade_date[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.tradeable_instrument_id[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.matched_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.bid_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.ask_quantity[equilibrium_price_message_at] = equilibrium_price_message_value; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equilibrium Price Message set to where it lies, so a field read out of place says so */
inline ramp_equilibrium_price_message(equilibrium_price_message_record, equilibrium_price_message_base) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.nanoseconds[equilibrium_price_message_at] = (equilibrium_price_message_base + 0 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 2 -> equilibrium_price_message_record.trade_date[equilibrium_price_message_at] = (equilibrium_price_message_base + 4 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.tradeable_instrument_id[equilibrium_price_message_at] = (equilibrium_price_message_base + 6 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = (equilibrium_price_message_base + 10 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.matched_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 18 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.bid_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 26 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.ask_quantity[equilibrium_price_message_at] = (equilibrium_price_message_base + 34 + equilibrium_price_message_at + 1) % 256; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Message to the wire, 42 bytes from where the cursor stands */
inline encode_equilibrium_price_message(equilibrium_price_message_record) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> wire[at] = equilibrium_price_message_record.nanoseconds[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 2 -> wire[at] = equilibrium_price_message_record.trade_date[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> wire[at] = equilibrium_price_message_record.tradeable_instrument_id[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.matched_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.bid_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> wire[at] = equilibrium_price_message_record.ask_quantity[equilibrium_price_message_at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Message off the wire, 42 bytes from where the cursor stands */
inline decode_equilibrium_price_message(equilibrium_price_message_record) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.nanoseconds[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 2 -> equilibrium_price_message_record.trade_date[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> equilibrium_price_message_record.tradeable_instrument_id[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.equilibrium_price[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.matched_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.bid_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> equilibrium_price_message_record.ask_quantity[equilibrium_price_message_at] = wire[at]; at = at + 1; equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equilibrium Price Message is what was written, byte for byte */
inline equal_equilibrium_price_message(equilibrium_price_message_read, equilibrium_price_message_written) {
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> assert(equilibrium_price_message_read.nanoseconds[equilibrium_price_message_at] == equilibrium_price_message_written.nanoseconds[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 2 -> assert(equilibrium_price_message_read.trade_date[equilibrium_price_message_at] == equilibrium_price_message_written.trade_date[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 4 -> assert(equilibrium_price_message_read.tradeable_instrument_id[equilibrium_price_message_at] == equilibrium_price_message_written.tradeable_instrument_id[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.equilibrium_price[equilibrium_price_message_at] == equilibrium_price_message_written.equilibrium_price[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.matched_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.matched_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.bid_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.bid_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  equilibrium_price_message_at = 0;
  do
  :: equilibrium_price_message_at < 8 -> assert(equilibrium_price_message_read.ask_quantity[equilibrium_price_message_at] == equilibrium_price_message_written.ask_quantity[equilibrium_price_message_at]); equilibrium_price_message_at = equilibrium_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open High Low Last Trade Adjustment Message: 54 bytes ------------------- */

/* Market trade price adjustments are sent resulting from modifications of Open, High, Low, Last and volume statistics due to market operations, prior to the instrument moving to the next session within the trade date, or at the close of instrument */
typedef OpenHighLowLastTradeAdjustmentMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte opening_trade[8];
  byte highest_trade[8];
  byte lowest_trade[8];
  byte last_trade[8];
  byte last_volume[4];
  byte total_traded_volume[8]
};

int open_high_low_last_trade_adjustment_message_at;

/* every byte of Open High Low Last Trade Adjustment Message set to one value */
inline fill_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_record, open_high_low_last_trade_adjustment_message_value) {
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.nanoseconds[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 2 -> open_high_low_last_trade_adjustment_message_record.trade_date[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.opening_trade[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.highest_trade[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.lowest_trade[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.last_trade[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.last_volume[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.total_traded_volume[open_high_low_last_trade_adjustment_message_at] = open_high_low_last_trade_adjustment_message_value; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open High Low Last Trade Adjustment Message set to where it lies, so a field read out of place says so */
inline ramp_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_record, open_high_low_last_trade_adjustment_message_base) {
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.nanoseconds[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 0 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 2 -> open_high_low_last_trade_adjustment_message_record.trade_date[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 4 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 6 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.opening_trade[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 10 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.highest_trade[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 18 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.lowest_trade[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 26 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.last_trade[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 34 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.last_volume[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 42 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.total_traded_volume[open_high_low_last_trade_adjustment_message_at] = (open_high_low_last_trade_adjustment_message_base + 46 + open_high_low_last_trade_adjustment_message_at + 1) % 256; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open High Low Last Trade Adjustment Message to the wire, 54 bytes from where the cursor stands */
inline encode_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_record) {
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> wire[at] = open_high_low_last_trade_adjustment_message_record.nanoseconds[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 2 -> wire[at] = open_high_low_last_trade_adjustment_message_record.trade_date[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> wire[at] = open_high_low_last_trade_adjustment_message_record.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> wire[at] = open_high_low_last_trade_adjustment_message_record.opening_trade[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> wire[at] = open_high_low_last_trade_adjustment_message_record.highest_trade[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> wire[at] = open_high_low_last_trade_adjustment_message_record.lowest_trade[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> wire[at] = open_high_low_last_trade_adjustment_message_record.last_trade[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> wire[at] = open_high_low_last_trade_adjustment_message_record.last_volume[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> wire[at] = open_high_low_last_trade_adjustment_message_record.total_traded_volume[open_high_low_last_trade_adjustment_message_at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open High Low Last Trade Adjustment Message off the wire, 54 bytes from where the cursor stands */
inline decode_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_record) {
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.nanoseconds[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 2 -> open_high_low_last_trade_adjustment_message_record.trade_date[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.opening_trade[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.highest_trade[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.lowest_trade[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.last_trade[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> open_high_low_last_trade_adjustment_message_record.last_volume[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> open_high_low_last_trade_adjustment_message_record.total_traded_volume[open_high_low_last_trade_adjustment_message_at] = wire[at]; at = at + 1; open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open High Low Last Trade Adjustment Message is what was written, byte for byte */
inline equal_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_read, open_high_low_last_trade_adjustment_message_written) {
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> assert(open_high_low_last_trade_adjustment_message_read.nanoseconds[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.nanoseconds[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 2 -> assert(open_high_low_last_trade_adjustment_message_read.trade_date[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.trade_date[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> assert(open_high_low_last_trade_adjustment_message_read.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.tradeable_instrument_id[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> assert(open_high_low_last_trade_adjustment_message_read.opening_trade[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.opening_trade[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> assert(open_high_low_last_trade_adjustment_message_read.highest_trade[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.highest_trade[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> assert(open_high_low_last_trade_adjustment_message_read.lowest_trade[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.lowest_trade[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> assert(open_high_low_last_trade_adjustment_message_read.last_trade[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.last_trade[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 4 -> assert(open_high_low_last_trade_adjustment_message_read.last_volume[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.last_volume[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  open_high_low_last_trade_adjustment_message_at = 0;
  do
  :: open_high_low_last_trade_adjustment_message_at < 8 -> assert(open_high_low_last_trade_adjustment_message_read.total_traded_volume[open_high_low_last_trade_adjustment_message_at] == open_high_low_last_trade_adjustment_message_written.total_traded_volume[open_high_low_last_trade_adjustment_message_at]); open_high_low_last_trade_adjustment_message_at = open_high_low_last_trade_adjustment_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Settlement Message: 54 bytes ------------------------------------- */

/* This message disseminates the final settlement price of a future or option contracts order book for the trade date it pertains to */
typedef MarketSettlementMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte opening_trade[8];
  byte highest_trade[8];
  byte lowest_trade[8];
  byte last_trade[8];
  byte last_volume[4];
  byte total_traded_volume[8]
};

int market_settlement_message_at;

/* every byte of Market Settlement Message set to one value */
inline fill_market_settlement_message(market_settlement_message_record, market_settlement_message_value) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.tradeable_instrument_id[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.opening_trade[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.highest_trade[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.lowest_trade[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.last_trade[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.last_volume[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.total_traded_volume[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_market_settlement_message(market_settlement_message_record, market_settlement_message_base) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = (market_settlement_message_base + 0 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = (market_settlement_message_base + 4 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.tradeable_instrument_id[market_settlement_message_at] = (market_settlement_message_base + 6 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.opening_trade[market_settlement_message_at] = (market_settlement_message_base + 10 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.highest_trade[market_settlement_message_at] = (market_settlement_message_base + 18 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.lowest_trade[market_settlement_message_at] = (market_settlement_message_base + 26 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.last_trade[market_settlement_message_at] = (market_settlement_message_base + 34 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.last_volume[market_settlement_message_at] = (market_settlement_message_base + 42 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.total_traded_volume[market_settlement_message_at] = (market_settlement_message_base + 46 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Settlement Message to the wire, 54 bytes from where the cursor stands */
inline encode_market_settlement_message(market_settlement_message_record) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.nanoseconds[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> wire[at] = market_settlement_message_record.trade_date[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.tradeable_instrument_id[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> wire[at] = market_settlement_message_record.opening_trade[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> wire[at] = market_settlement_message_record.highest_trade[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> wire[at] = market_settlement_message_record.lowest_trade[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> wire[at] = market_settlement_message_record.last_trade[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.last_volume[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> wire[at] = market_settlement_message_record.total_traded_volume[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Settlement Message off the wire, 54 bytes from where the cursor stands */
inline decode_market_settlement_message(market_settlement_message_record) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.tradeable_instrument_id[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.opening_trade[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.highest_trade[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.lowest_trade[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.last_trade[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.last_volume[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> market_settlement_message_record.total_traded_volume[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Settlement Message is what was written, byte for byte */
inline equal_market_settlement_message(market_settlement_message_read, market_settlement_message_written) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.nanoseconds[market_settlement_message_at] == market_settlement_message_written.nanoseconds[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> assert(market_settlement_message_read.trade_date[market_settlement_message_at] == market_settlement_message_written.trade_date[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.tradeable_instrument_id[market_settlement_message_at] == market_settlement_message_written.tradeable_instrument_id[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> assert(market_settlement_message_read.opening_trade[market_settlement_message_at] == market_settlement_message_written.opening_trade[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> assert(market_settlement_message_read.highest_trade[market_settlement_message_at] == market_settlement_message_written.highest_trade[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> assert(market_settlement_message_read.lowest_trade[market_settlement_message_at] == market_settlement_message_written.lowest_trade[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> assert(market_settlement_message_read.last_trade[market_settlement_message_at] == market_settlement_message_written.last_trade[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.last_volume[market_settlement_message_at] == market_settlement_message_written.last_volume[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 8 -> assert(market_settlement_message_read.total_traded_volume[market_settlement_message_at] == market_settlement_message_written.total_traded_volume[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Text Message: 112 bytes ------------------------------------------------- */

/* This message disseminates free text information describing ad-hoc market events */
typedef TextMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte source_id[6];
  byte text[100]
};

int text_message_at;

/* every byte of Text Message set to one value */
inline fill_text_message(text_message_record, text_message_value) {
  text_message_at = 0;
  do
  :: text_message_at < 4 -> text_message_record.nanoseconds[text_message_at] = text_message_value; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 2 -> text_message_record.trade_date[text_message_at] = text_message_value; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 6 -> text_message_record.source_id[text_message_at] = text_message_value; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 100 -> text_message_record.text[text_message_at] = text_message_value; text_message_at = text_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Text Message set to where it lies, so a field read out of place says so */
inline ramp_text_message(text_message_record, text_message_base) {
  text_message_at = 0;
  do
  :: text_message_at < 4 -> text_message_record.nanoseconds[text_message_at] = (text_message_base + 0 + text_message_at + 1) % 256; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 2 -> text_message_record.trade_date[text_message_at] = (text_message_base + 4 + text_message_at + 1) % 256; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 6 -> text_message_record.source_id[text_message_at] = (text_message_base + 6 + text_message_at + 1) % 256; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 100 -> text_message_record.text[text_message_at] = (text_message_base + 12 + text_message_at + 1) % 256; text_message_at = text_message_at + 1
  :: else -> break
  od;
  skip
}

/* Text Message to the wire, 112 bytes from where the cursor stands */
inline encode_text_message(text_message_record) {
  text_message_at = 0;
  do
  :: text_message_at < 4 -> wire[at] = text_message_record.nanoseconds[text_message_at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 2 -> wire[at] = text_message_record.trade_date[text_message_at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 6 -> wire[at] = text_message_record.source_id[text_message_at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 100 -> wire[at] = text_message_record.text[text_message_at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  skip
}

/* Text Message off the wire, 112 bytes from where the cursor stands */
inline decode_text_message(text_message_record) {
  text_message_at = 0;
  do
  :: text_message_at < 4 -> text_message_record.nanoseconds[text_message_at] = wire[at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 2 -> text_message_record.trade_date[text_message_at] = wire[at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 6 -> text_message_record.source_id[text_message_at] = wire[at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 100 -> text_message_record.text[text_message_at] = wire[at]; at = at + 1; text_message_at = text_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Text Message is what was written, byte for byte */
inline equal_text_message(text_message_read, text_message_written) {
  text_message_at = 0;
  do
  :: text_message_at < 4 -> assert(text_message_read.nanoseconds[text_message_at] == text_message_written.nanoseconds[text_message_at]); text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 2 -> assert(text_message_read.trade_date[text_message_at] == text_message_written.trade_date[text_message_at]); text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 6 -> assert(text_message_read.source_id[text_message_at] == text_message_written.source_id[text_message_at]); text_message_at = text_message_at + 1
  :: else -> break
  od;
  text_message_at = 0;
  do
  :: text_message_at < 100 -> assert(text_message_read.text[text_message_at] == text_message_written.text[text_message_at]); text_message_at = text_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request For Quote Message: 15 bytes ------------------------------------- */

/* This message is disseminated for anonymous Request for Quotes (RFQs) from the market */
typedef RequestForQuoteMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte rfq_side;
  byte quantity[4]
};

int request_for_quote_message_at;

/* every byte of Request For Quote Message set to one value */
inline fill_request_for_quote_message(request_for_quote_message_record, request_for_quote_message_value) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.tradeable_instrument_id[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_record.rfq_side = request_for_quote_message_value;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request For Quote Message set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote_message(request_for_quote_message_record, request_for_quote_message_base) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = (request_for_quote_message_base + 0 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = (request_for_quote_message_base + 4 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.tradeable_instrument_id[request_for_quote_message_at] = (request_for_quote_message_base + 6 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_record.rfq_side = (request_for_quote_message_base + 10 + 1) % 256;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = (request_for_quote_message_base + 11 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote Message to the wire, 15 bytes from where the cursor stands */
inline encode_request_for_quote_message(request_for_quote_message_record) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.nanoseconds[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> wire[at] = request_for_quote_message_record.trade_date[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.tradeable_instrument_id[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = request_for_quote_message_record.rfq_side; at = at + 1;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.quantity[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote Message off the wire, 15 bytes from where the cursor stands */
inline decode_request_for_quote_message(request_for_quote_message_record) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.tradeable_instrument_id[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_record.rfq_side = wire[at]; at = at + 1;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request For Quote Message is what was written, byte for byte */
inline equal_request_for_quote_message(request_for_quote_message_read, request_for_quote_message_written) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.nanoseconds[request_for_quote_message_at] == request_for_quote_message_written.nanoseconds[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> assert(request_for_quote_message_read.trade_date[request_for_quote_message_at] == request_for_quote_message_written.trade_date[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.tradeable_instrument_id[request_for_quote_message_at] == request_for_quote_message_written.tradeable_instrument_id[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  assert(request_for_quote_message_read.rfq_side == request_for_quote_message_written.rfq_side);
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.quantity[request_for_quote_message_at] == request_for_quote_message_written.quantity[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Anomalous Order Threshold Publish Message: 58 bytes --------------------- */

/* This message disseminates price band information to the market advising the setting, zeroing or adjusting of the Extreme Trade Range price, the Anomalous Order Threshold price and the associated ranges for a contract that requires Market Integrity Rules enforcement */
typedef AnomalousOrderThresholdPublishMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte aot_price[8];
  byte aot_upper_price[8];
  byte aot_lower_price[8];
  byte etr_price[8];
  byte etr_upper_price[8];
  byte etr_lower_price[8]
};

int anomalous_order_threshold_publish_message_at;

/* every byte of Anomalous Order Threshold Publish Message set to one value */
inline fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record, anomalous_order_threshold_publish_message_value) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.tradeable_instrument_id[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Anomalous Order Threshold Publish Message set to where it lies, so a field read out of place says so */
inline ramp_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record, anomalous_order_threshold_publish_message_base) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 0 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 4 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.tradeable_instrument_id[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 6 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 10 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 18 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 26 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 34 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 42 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 50 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Anomalous Order Threshold Publish Message to the wire, 58 bytes from where the cursor stands */
inline encode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> wire[at] = anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.tradeable_instrument_id[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Anomalous Order Threshold Publish Message off the wire, 58 bytes from where the cursor stands */
inline decode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.tradeable_instrument_id[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Anomalous Order Threshold Publish Message is what was written, byte for byte */
inline equal_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_read, anomalous_order_threshold_publish_message_written) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.nanoseconds[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.nanoseconds[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> assert(anomalous_order_threshold_publish_message_read.trade_date[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.trade_date[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.tradeable_instrument_id[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.tradeable_instrument_id[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.aot_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.aot_upper_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_upper_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.aot_lower_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_lower_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.etr_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.etr_upper_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_upper_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 8 -> assert(anomalous_order_threshold_publish_message_read.etr_lower_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_lower_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Volume And Open Interest Message: 28 bytes ------------------------------ */

/* This message disseminates Volume and Open Interest (VOI) information for each trade date */
typedef VolumeAndOpenInterestMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte tradeable_instrument_id[4];
  byte cumulative_volume[8];
  byte open_interest[8];
  byte voi_trade_date[2]
};

int volume_and_open_interest_message_at;

/* every byte of Volume And Open Interest Message set to one value */
inline fill_volume_and_open_interest_message(volume_and_open_interest_message_record, volume_and_open_interest_message_value) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.tradeable_instrument_id[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Volume And Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_volume_and_open_interest_message(volume_and_open_interest_message_record, volume_and_open_interest_message_base) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 0 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 4 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.tradeable_instrument_id[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 6 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 10 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 18 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 26 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Volume And Open Interest Message to the wire, 28 bytes from where the cursor stands */
inline encode_volume_and_open_interest_message(volume_and_open_interest_message_record) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> wire[at] = volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.tradeable_instrument_id[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> wire[at] = volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> wire[at] = volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> wire[at] = volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Volume And Open Interest Message off the wire, 28 bytes from where the cursor stands */
inline decode_volume_and_open_interest_message(volume_and_open_interest_message_record) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.tradeable_instrument_id[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Volume And Open Interest Message is what was written, byte for byte */
inline equal_volume_and_open_interest_message(volume_and_open_interest_message_read, volume_and_open_interest_message_written) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.nanoseconds[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.nanoseconds[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> assert(volume_and_open_interest_message_read.trade_date[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.trade_date[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.tradeable_instrument_id[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.tradeable_instrument_id[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> assert(volume_and_open_interest_message_read.cumulative_volume[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.cumulative_volume[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 8 -> assert(volume_and_open_interest_message_read.open_interest[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.open_interest[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> assert(volume_and_open_interest_message_read.voi_trade_date[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.voi_trade_date[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
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

/* End Of Business Trade Date Message: encoded, read back, and compared */
proctype check_end_of_business_trade_date_message() {
  EndOfBusinessTradeDateMessage end_of_business_trade_date_message_sent;
  EndOfBusinessTradeDateMessage end_of_business_trade_date_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_business_trade_date_message(end_of_business_trade_date_message_sent, 0)
  :: pattern == 1 -> fill_end_of_business_trade_date_message(end_of_business_trade_date_message_sent, 32)
  :: pattern == 2 -> fill_end_of_business_trade_date_message(end_of_business_trade_date_message_sent, 255)
  :: else -> ramp_end_of_business_trade_date_message(end_of_business_trade_date_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_business_trade_date_message(end_of_business_trade_date_message_sent);
    assert(at == 7);
    at = 0;
    decode_end_of_business_trade_date_message(end_of_business_trade_date_message_got);
    assert(at == 7);
    equal_end_of_business_trade_date_message(end_of_business_trade_date_message_got, end_of_business_trade_date_message_sent)
  }
}

/* Future Symbol Directory Message: encoded, read back, and compared */
proctype check_future_symbol_directory_message() {
  FutureSymbolDirectoryMessage future_symbol_directory_message_sent;
  FutureSymbolDirectoryMessage future_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 255)
  :: else -> ramp_future_symbol_directory_message(future_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_future_symbol_directory_message(future_symbol_directory_message_sent);
    assert(at == 179);
    at = 0;
    decode_future_symbol_directory_message(future_symbol_directory_message_got);
    assert(at == 179);
    equal_future_symbol_directory_message(future_symbol_directory_message_got, future_symbol_directory_message_sent)
  }
}

/* Options Symbol Directory Message: encoded, read back, and compared */
proctype check_options_symbol_directory_message() {
  OptionsSymbolDirectoryMessage options_symbol_directory_message_sent;
  OptionsSymbolDirectoryMessage options_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_symbol_directory_message(options_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_options_symbol_directory_message(options_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_options_symbol_directory_message(options_symbol_directory_message_sent, 255)
  :: else -> ramp_options_symbol_directory_message(options_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_symbol_directory_message(options_symbol_directory_message_sent);
    assert(at == 219);
    at = 0;
    decode_options_symbol_directory_message(options_symbol_directory_message_got);
    assert(at == 219);
    equal_options_symbol_directory_message(options_symbol_directory_message_got, options_symbol_directory_message_sent)
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
    assert(at == 11);
    at = 0;
    decode_order_book_state_message(order_book_state_message_got);
    assert(at == 11);
    equal_order_book_state_message(order_book_state_message_got, order_book_state_message_sent)
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
    assert(at == 39);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 39);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Order Volume Cancelled Message: encoded, read back, and compared */
proctype check_order_volume_cancelled_message() {
  OrderVolumeCancelledMessage order_volume_cancelled_message_sent;
  OrderVolumeCancelledMessage order_volume_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 255)
  :: else -> ramp_order_volume_cancelled_message(order_volume_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_volume_cancelled_message(order_volume_cancelled_message_sent);
    assert(at == 23);
    at = 0;
    decode_order_volume_cancelled_message(order_volume_cancelled_message_got);
    assert(at == 23);
    equal_order_volume_cancelled_message(order_volume_cancelled_message_got, order_volume_cancelled_message_sent)
  }
}

/* Order Deleted Message: encoded, read back, and compared */
proctype check_order_deleted_message() {
  OrderDeletedMessage order_deleted_message_sent;
  OrderDeletedMessage order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_deleted_message(order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_order_deleted_message(order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_order_deleted_message(order_deleted_message_sent, 255)
  :: else -> ramp_order_deleted_message(order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_deleted_message(order_deleted_message_sent);
    assert(at == 19);
    at = 0;
    decode_order_deleted_message(order_deleted_message_got);
    assert(at == 19);
    equal_order_deleted_message(order_deleted_message_got, order_deleted_message_sent)
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
    assert(at == 55);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 55);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Auction Order Executed Message: encoded, read back, and compared */
proctype check_auction_order_executed_message() {
  AuctionOrderExecutedMessage auction_order_executed_message_sent;
  AuctionOrderExecutedMessage auction_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_order_executed_message(auction_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_auction_order_executed_message(auction_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_auction_order_executed_message(auction_order_executed_message_sent, 255)
  :: else -> ramp_auction_order_executed_message(auction_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_order_executed_message(auction_order_executed_message_sent);
    assert(at == 52);
    at = 0;
    decode_auction_order_executed_message(auction_order_executed_message_got);
    assert(at == 52);
    equal_auction_order_executed_message(auction_order_executed_message_got, auction_order_executed_message_sent)
  }
}

/* Combination Order Executed Message: encoded, read back, and compared */
proctype check_combination_order_executed_message() {
  CombinationOrderExecutedMessage combination_order_executed_message_sent;
  CombinationOrderExecutedMessage combination_order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_order_executed_message(combination_order_executed_message_sent, 0)
  :: pattern == 1 -> fill_combination_order_executed_message(combination_order_executed_message_sent, 32)
  :: pattern == 2 -> fill_combination_order_executed_message(combination_order_executed_message_sent, 255)
  :: else -> ramp_combination_order_executed_message(combination_order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_order_executed_message(combination_order_executed_message_sent);
    assert(at == 65);
    at = 0;
    decode_combination_order_executed_message(combination_order_executed_message_got);
    assert(at == 65);
    equal_combination_order_executed_message(combination_order_executed_message_got, combination_order_executed_message_sent)
  }
}

/* Implied Order Added Message: encoded, read back, and compared */
proctype check_implied_order_added_message() {
  ImpliedOrderAddedMessage implied_order_added_message_sent;
  ImpliedOrderAddedMessage implied_order_added_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_added_message(implied_order_added_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_added_message(implied_order_added_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_added_message(implied_order_added_message_sent, 255)
  :: else -> ramp_implied_order_added_message(implied_order_added_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_added_message(implied_order_added_message_sent);
    assert(at == 39);
    at = 0;
    decode_implied_order_added_message(implied_order_added_message_got);
    assert(at == 39);
    equal_implied_order_added_message(implied_order_added_message_got, implied_order_added_message_sent)
  }
}

/* Implied Order Replaced Message: encoded, read back, and compared */
proctype check_implied_order_replaced_message() {
  ImpliedOrderReplacedMessage implied_order_replaced_message_sent;
  ImpliedOrderReplacedMessage implied_order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 255)
  :: else -> ramp_implied_order_replaced_message(implied_order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_replaced_message(implied_order_replaced_message_sent);
    assert(at == 39);
    at = 0;
    decode_implied_order_replaced_message(implied_order_replaced_message_got);
    assert(at == 39);
    equal_implied_order_replaced_message(implied_order_replaced_message_got, implied_order_replaced_message_sent)
  }
}

/* Implied Order Deleted Message: encoded, read back, and compared */
proctype check_implied_order_deleted_message() {
  ImpliedOrderDeletedMessage implied_order_deleted_message_sent;
  ImpliedOrderDeletedMessage implied_order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 255)
  :: else -> ramp_implied_order_deleted_message(implied_order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_deleted_message(implied_order_deleted_message_sent);
    assert(at == 19);
    at = 0;
    decode_implied_order_deleted_message(implied_order_deleted_message_got);
    assert(at == 19);
    equal_implied_order_deleted_message(implied_order_deleted_message_got, implied_order_deleted_message_sent)
  }
}

/* Trade Executed Message: encoded, read back, and compared */
proctype check_trade_executed_message() {
  TradeExecutedMessage trade_executed_message_sent;
  TradeExecutedMessage trade_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_executed_message(trade_executed_message_sent, 0)
  :: pattern == 1 -> fill_trade_executed_message(trade_executed_message_sent, 32)
  :: pattern == 2 -> fill_trade_executed_message(trade_executed_message_sent, 255)
  :: else -> ramp_trade_executed_message(trade_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_executed_message(trade_executed_message_sent);
    assert(at == 45);
    at = 0;
    decode_trade_executed_message(trade_executed_message_got);
    assert(at == 45);
    equal_trade_executed_message(trade_executed_message_got, trade_executed_message_sent)
  }
}

/* Combination Trade Executed Message: encoded, read back, and compared */
proctype check_combination_trade_executed_message() {
  CombinationTradeExecutedMessage combination_trade_executed_message_sent;
  CombinationTradeExecutedMessage combination_trade_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_combination_trade_executed_message(combination_trade_executed_message_sent, 0)
  :: pattern == 1 -> fill_combination_trade_executed_message(combination_trade_executed_message_sent, 32)
  :: pattern == 2 -> fill_combination_trade_executed_message(combination_trade_executed_message_sent, 255)
  :: else -> ramp_combination_trade_executed_message(combination_trade_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_combination_trade_executed_message(combination_trade_executed_message_sent);
    assert(at == 79);
    at = 0;
    decode_combination_trade_executed_message(combination_trade_executed_message_got);
    assert(at == 79);
    equal_combination_trade_executed_message(combination_trade_executed_message_got, combination_trade_executed_message_sent)
  }
}

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 18);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 18);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Equilibrium Price Message: encoded, read back, and compared */
proctype check_equilibrium_price_message() {
  EquilibriumPriceMessage equilibrium_price_message_sent;
  EquilibriumPriceMessage equilibrium_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 0)
  :: pattern == 1 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 32)
  :: pattern == 2 -> fill_equilibrium_price_message(equilibrium_price_message_sent, 255)
  :: else -> ramp_equilibrium_price_message(equilibrium_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equilibrium_price_message(equilibrium_price_message_sent);
    assert(at == 42);
    at = 0;
    decode_equilibrium_price_message(equilibrium_price_message_got);
    assert(at == 42);
    equal_equilibrium_price_message(equilibrium_price_message_got, equilibrium_price_message_sent)
  }
}

/* Open High Low Last Trade Adjustment Message: encoded, read back, and compared */
proctype check_open_high_low_last_trade_adjustment_message() {
  OpenHighLowLastTradeAdjustmentMessage open_high_low_last_trade_adjustment_message_sent;
  OpenHighLowLastTradeAdjustmentMessage open_high_low_last_trade_adjustment_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_sent, 0)
  :: pattern == 1 -> fill_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_sent, 32)
  :: pattern == 2 -> fill_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_sent, 255)
  :: else -> ramp_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_sent);
    assert(at == 54);
    at = 0;
    decode_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_got);
    assert(at == 54);
    equal_open_high_low_last_trade_adjustment_message(open_high_low_last_trade_adjustment_message_got, open_high_low_last_trade_adjustment_message_sent)
  }
}

/* Market Settlement Message: encoded, read back, and compared */
proctype check_market_settlement_message() {
  MarketSettlementMessage market_settlement_message_sent;
  MarketSettlementMessage market_settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_settlement_message(market_settlement_message_sent, 0)
  :: pattern == 1 -> fill_market_settlement_message(market_settlement_message_sent, 32)
  :: pattern == 2 -> fill_market_settlement_message(market_settlement_message_sent, 255)
  :: else -> ramp_market_settlement_message(market_settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_settlement_message(market_settlement_message_sent);
    assert(at == 54);
    at = 0;
    decode_market_settlement_message(market_settlement_message_got);
    assert(at == 54);
    equal_market_settlement_message(market_settlement_message_got, market_settlement_message_sent)
  }
}

/* Text Message: encoded, read back, and compared */
proctype check_text_message() {
  TextMessage text_message_sent;
  TextMessage text_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_text_message(text_message_sent, 0)
  :: pattern == 1 -> fill_text_message(text_message_sent, 32)
  :: pattern == 2 -> fill_text_message(text_message_sent, 255)
  :: else -> ramp_text_message(text_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_text_message(text_message_sent);
    assert(at == 112);
    at = 0;
    decode_text_message(text_message_got);
    assert(at == 112);
    equal_text_message(text_message_got, text_message_sent)
  }
}

/* Request For Quote Message: encoded, read back, and compared */
proctype check_request_for_quote_message() {
  RequestForQuoteMessage request_for_quote_message_sent;
  RequestForQuoteMessage request_for_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_quote_message(request_for_quote_message_sent, 0)
  :: pattern == 1 -> fill_request_for_quote_message(request_for_quote_message_sent, 32)
  :: pattern == 2 -> fill_request_for_quote_message(request_for_quote_message_sent, 255)
  :: else -> ramp_request_for_quote_message(request_for_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_quote_message(request_for_quote_message_sent);
    assert(at == 15);
    at = 0;
    decode_request_for_quote_message(request_for_quote_message_got);
    assert(at == 15);
    equal_request_for_quote_message(request_for_quote_message_got, request_for_quote_message_sent)
  }
}

/* Anomalous Order Threshold Publish Message: encoded, read back, and compared */
proctype check_anomalous_order_threshold_publish_message() {
  AnomalousOrderThresholdPublishMessage anomalous_order_threshold_publish_message_sent;
  AnomalousOrderThresholdPublishMessage anomalous_order_threshold_publish_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 0)
  :: pattern == 1 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 32)
  :: pattern == 2 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 255)
  :: else -> ramp_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent);
    assert(at == 58);
    at = 0;
    decode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_got);
    assert(at == 58);
    equal_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_got, anomalous_order_threshold_publish_message_sent)
  }
}

/* Volume And Open Interest Message: encoded, read back, and compared */
proctype check_volume_and_open_interest_message() {
  VolumeAndOpenInterestMessage volume_and_open_interest_message_sent;
  VolumeAndOpenInterestMessage volume_and_open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 0)
  :: pattern == 1 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 32)
  :: pattern == 2 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 255)
  :: else -> ramp_volume_and_open_interest_message(volume_and_open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_volume_and_open_interest_message(volume_and_open_interest_message_sent);
    assert(at == 28);
    at = 0;
    decode_volume_and_open_interest_message(volume_and_open_interest_message_got);
    assert(at == 28);
    equal_volume_and_open_interest_message(volume_and_open_interest_message_got, volume_and_open_interest_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_seconds_message()
  :: run check_end_of_business_trade_date_message()
  :: run check_future_symbol_directory_message()
  :: run check_options_symbol_directory_message()
  :: run check_order_book_state_message()
  :: run check_add_order_message()
  :: run check_order_volume_cancelled_message()
  :: run check_order_deleted_message()
  :: run check_order_executed_message()
  :: run check_auction_order_executed_message()
  :: run check_combination_order_executed_message()
  :: run check_implied_order_added_message()
  :: run check_implied_order_replaced_message()
  :: run check_implied_order_deleted_message()
  :: run check_trade_executed_message()
  :: run check_combination_trade_executed_message()
  :: run check_trade_cancellation_message()
  :: run check_equilibrium_price_message()
  :: run check_open_high_low_last_trade_adjustment_message()
  :: run check_market_settlement_message()
  :: run check_text_message()
  :: run check_request_for_quote_message()
  :: run check_anomalous_order_threshold_publish_message()
  :: run check_volume_and_open_interest_message()
  fi
}
