/*
 * Imperative Execution Depth Of Book
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
#define WIRE 50

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte market_day_identifier[9];
  byte feed_identifier;
  byte sequence[8];
  byte count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 9 -> packet_header_record.market_day_identifier[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.feed_identifier = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 9 -> packet_header_record.market_day_identifier[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.feed_identifier = (packet_header_base + 9 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = (packet_header_base + 18 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 20 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 9 -> wire[at] = packet_header_record.market_day_identifier[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.feed_identifier; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 20 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 9 -> packet_header_record.market_day_identifier[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.feed_identifier = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 9 -> assert(packet_header_read.market_day_identifier[packet_header_at] == packet_header_written.market_day_identifier[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.feed_identifier == packet_header_written.feed_identifier);
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.count[packet_header_at] == packet_header_written.count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* Length of the message */
typedef MessageHeader {
  byte length[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.length[message_header_at] == message_header_written.length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Market Event Message: 11 bytes ------------------------------------------ */

/* This message appears on all quote channels and indicates the beginning of a spin message cycle */
typedef MarketEventMessage {
  byte reserved_2[2];
  byte timestamp[8];
  byte event
};

int market_event_message_at;

/* every byte of Market Event Message set to one value */
inline fill_market_event_message(market_event_message_record, market_event_message_value) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 2 -> market_event_message_record.reserved_2[market_event_message_at] = market_event_message_value; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.timestamp[market_event_message_at] = market_event_message_value; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event = market_event_message_value;
  skip
}

/* each byte of Market Event Message set to where it lies, so a field read out of place says so */
inline ramp_market_event_message(market_event_message_record, market_event_message_base) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 2 -> market_event_message_record.reserved_2[market_event_message_at] = (market_event_message_base + 0 + market_event_message_at + 1) % 256; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.timestamp[market_event_message_at] = (market_event_message_base + 2 + market_event_message_at + 1) % 256; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event = (market_event_message_base + 10 + 1) % 256;
  skip
}

/* Market Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_market_event_message(market_event_message_record) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 2 -> wire[at] = market_event_message_record.reserved_2[market_event_message_at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> wire[at] = market_event_message_record.timestamp[market_event_message_at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  wire[at] = market_event_message_record.event; at = at + 1;
  skip
}

/* Market Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_market_event_message(market_event_message_record) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 2 -> market_event_message_record.reserved_2[market_event_message_at] = wire[at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.timestamp[market_event_message_at] = wire[at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Event Message is what was written, byte for byte */
inline equal_market_event_message(market_event_message_read, market_event_message_written) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 2 -> assert(market_event_message_read.reserved_2[market_event_message_at] == market_event_message_written.reserved_2[market_event_message_at]); market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> assert(market_event_message_read.timestamp[market_event_message_at] == market_event_message_written.timestamp[market_event_message_at]); market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  assert(market_event_message_read.event == market_event_message_written.event);
  skip
}

/* ---- Symbol Information Message: 27 bytes ------------------------------------ */

/* Symbol Information */
typedef SymbolInformationMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte symbol[11];
  byte listing_market;
  byte reserved_1;
  byte round_lot_size[4]
};

int symbol_information_message_at;

/* every byte of Symbol Information Message set to one value */
inline fill_symbol_information_message(symbol_information_message_record, symbol_information_message_value) {
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 2 -> symbol_information_message_record.symbol_id[symbol_information_message_at] = symbol_information_message_value; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 8 -> symbol_information_message_record.timestamp[symbol_information_message_at] = symbol_information_message_value; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 11 -> symbol_information_message_record.symbol[symbol_information_message_at] = symbol_information_message_value; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_record.listing_market = symbol_information_message_value;
  symbol_information_message_record.reserved_1 = symbol_information_message_value;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 4 -> symbol_information_message_record.round_lot_size[symbol_information_message_at] = symbol_information_message_value; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Information Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_information_message(symbol_information_message_record, symbol_information_message_base) {
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 2 -> symbol_information_message_record.symbol_id[symbol_information_message_at] = (symbol_information_message_base + 0 + symbol_information_message_at + 1) % 256; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 8 -> symbol_information_message_record.timestamp[symbol_information_message_at] = (symbol_information_message_base + 2 + symbol_information_message_at + 1) % 256; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 11 -> symbol_information_message_record.symbol[symbol_information_message_at] = (symbol_information_message_base + 10 + symbol_information_message_at + 1) % 256; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_record.listing_market = (symbol_information_message_base + 21 + 1) % 256;
  symbol_information_message_record.reserved_1 = (symbol_information_message_base + 22 + 1) % 256;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 4 -> symbol_information_message_record.round_lot_size[symbol_information_message_at] = (symbol_information_message_base + 23 + symbol_information_message_at + 1) % 256; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Information Message to the wire, 27 bytes from where the cursor stands */
inline encode_symbol_information_message(symbol_information_message_record) {
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 2 -> wire[at] = symbol_information_message_record.symbol_id[symbol_information_message_at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 8 -> wire[at] = symbol_information_message_record.timestamp[symbol_information_message_at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 11 -> wire[at] = symbol_information_message_record.symbol[symbol_information_message_at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_information_message_record.listing_market; at = at + 1;
  wire[at] = symbol_information_message_record.reserved_1; at = at + 1;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 4 -> wire[at] = symbol_information_message_record.round_lot_size[symbol_information_message_at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Information Message off the wire, 27 bytes from where the cursor stands */
inline decode_symbol_information_message(symbol_information_message_record) {
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 2 -> symbol_information_message_record.symbol_id[symbol_information_message_at] = wire[at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 8 -> symbol_information_message_record.timestamp[symbol_information_message_at] = wire[at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 11 -> symbol_information_message_record.symbol[symbol_information_message_at] = wire[at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_record.listing_market = wire[at]; at = at + 1;
  symbol_information_message_record.reserved_1 = wire[at]; at = at + 1;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 4 -> symbol_information_message_record.round_lot_size[symbol_information_message_at] = wire[at]; at = at + 1; symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Information Message is what was written, byte for byte */
inline equal_symbol_information_message(symbol_information_message_read, symbol_information_message_written) {
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 2 -> assert(symbol_information_message_read.symbol_id[symbol_information_message_at] == symbol_information_message_written.symbol_id[symbol_information_message_at]); symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 8 -> assert(symbol_information_message_read.timestamp[symbol_information_message_at] == symbol_information_message_written.timestamp[symbol_information_message_at]); symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 11 -> assert(symbol_information_message_read.symbol[symbol_information_message_at] == symbol_information_message_written.symbol[symbol_information_message_at]); symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  assert(symbol_information_message_read.listing_market == symbol_information_message_written.listing_market);
  assert(symbol_information_message_read.reserved_1 == symbol_information_message_written.reserved_1);
  symbol_information_message_at = 0;
  do
  :: symbol_information_message_at < 4 -> assert(symbol_information_message_read.round_lot_size[symbol_information_message_at] == symbol_information_message_written.round_lot_size[symbol_information_message_at]); symbol_information_message_at = symbol_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol State Message: 27 bytes ------------------------------------------ */

/* Symbol State */
typedef SymbolStateMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte symbol[11];
  byte state;
  byte reserved_1;
  byte info[4]
};

int symbol_state_message_at;

/* every byte of Symbol State Message set to one value */
inline fill_symbol_state_message(symbol_state_message_record, symbol_state_message_value) {
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 2 -> symbol_state_message_record.symbol_id[symbol_state_message_at] = symbol_state_message_value; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 8 -> symbol_state_message_record.timestamp[symbol_state_message_at] = symbol_state_message_value; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 11 -> symbol_state_message_record.symbol[symbol_state_message_at] = symbol_state_message_value; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_record.state = symbol_state_message_value;
  symbol_state_message_record.reserved_1 = symbol_state_message_value;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 4 -> symbol_state_message_record.info[symbol_state_message_at] = symbol_state_message_value; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol State Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_state_message(symbol_state_message_record, symbol_state_message_base) {
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 2 -> symbol_state_message_record.symbol_id[symbol_state_message_at] = (symbol_state_message_base + 0 + symbol_state_message_at + 1) % 256; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 8 -> symbol_state_message_record.timestamp[symbol_state_message_at] = (symbol_state_message_base + 2 + symbol_state_message_at + 1) % 256; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 11 -> symbol_state_message_record.symbol[symbol_state_message_at] = (symbol_state_message_base + 10 + symbol_state_message_at + 1) % 256; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_record.state = (symbol_state_message_base + 21 + 1) % 256;
  symbol_state_message_record.reserved_1 = (symbol_state_message_base + 22 + 1) % 256;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 4 -> symbol_state_message_record.info[symbol_state_message_at] = (symbol_state_message_base + 23 + symbol_state_message_at + 1) % 256; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol State Message to the wire, 27 bytes from where the cursor stands */
inline encode_symbol_state_message(symbol_state_message_record) {
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 2 -> wire[at] = symbol_state_message_record.symbol_id[symbol_state_message_at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 8 -> wire[at] = symbol_state_message_record.timestamp[symbol_state_message_at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 11 -> wire[at] = symbol_state_message_record.symbol[symbol_state_message_at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_state_message_record.state; at = at + 1;
  wire[at] = symbol_state_message_record.reserved_1; at = at + 1;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 4 -> wire[at] = symbol_state_message_record.info[symbol_state_message_at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol State Message off the wire, 27 bytes from where the cursor stands */
inline decode_symbol_state_message(symbol_state_message_record) {
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 2 -> symbol_state_message_record.symbol_id[symbol_state_message_at] = wire[at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 8 -> symbol_state_message_record.timestamp[symbol_state_message_at] = wire[at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 11 -> symbol_state_message_record.symbol[symbol_state_message_at] = wire[at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_record.state = wire[at]; at = at + 1;
  symbol_state_message_record.reserved_1 = wire[at]; at = at + 1;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 4 -> symbol_state_message_record.info[symbol_state_message_at] = wire[at]; at = at + 1; symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol State Message is what was written, byte for byte */
inline equal_symbol_state_message(symbol_state_message_read, symbol_state_message_written) {
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 2 -> assert(symbol_state_message_read.symbol_id[symbol_state_message_at] == symbol_state_message_written.symbol_id[symbol_state_message_at]); symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 8 -> assert(symbol_state_message_read.timestamp[symbol_state_message_at] == symbol_state_message_written.timestamp[symbol_state_message_at]); symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 11 -> assert(symbol_state_message_read.symbol[symbol_state_message_at] == symbol_state_message_written.symbol[symbol_state_message_at]); symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  assert(symbol_state_message_read.state == symbol_state_message_written.state);
  assert(symbol_state_message_read.reserved_1 == symbol_state_message_written.reserved_1);
  symbol_state_message_at = 0;
  do
  :: symbol_state_message_at < 4 -> assert(symbol_state_message_read.info[symbol_state_message_at] == symbol_state_message_written.info[symbol_state_message_at]); symbol_state_message_at = symbol_state_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Order Add Message: 46 bytes ----------------------------------------- */

/* New Order Add */
typedef NewOrderAddMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte order_id[8];
  byte side;
  byte shares[4];
  byte symbol[11];
  byte price[8];
  byte reserved_4[4]
};

int new_order_add_message_at;

/* every byte of New Order Add Message set to one value */
inline fill_new_order_add_message(new_order_add_message_record, new_order_add_message_value) {
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 2 -> new_order_add_message_record.symbol_id[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.timestamp[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.order_id[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_record.side = new_order_add_message_value;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.shares[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 11 -> new_order_add_message_record.symbol[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.price[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.reserved_4[new_order_add_message_at] = new_order_add_message_value; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_new_order_add_message(new_order_add_message_record, new_order_add_message_base) {
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 2 -> new_order_add_message_record.symbol_id[new_order_add_message_at] = (new_order_add_message_base + 0 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.timestamp[new_order_add_message_at] = (new_order_add_message_base + 2 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.order_id[new_order_add_message_at] = (new_order_add_message_base + 10 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_record.side = (new_order_add_message_base + 18 + 1) % 256;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.shares[new_order_add_message_at] = (new_order_add_message_base + 19 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 11 -> new_order_add_message_record.symbol[new_order_add_message_at] = (new_order_add_message_base + 23 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.price[new_order_add_message_at] = (new_order_add_message_base + 34 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.reserved_4[new_order_add_message_at] = (new_order_add_message_base + 42 + new_order_add_message_at + 1) % 256; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Add Message to the wire, 46 bytes from where the cursor stands */
inline encode_new_order_add_message(new_order_add_message_record) {
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 2 -> wire[at] = new_order_add_message_record.symbol_id[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> wire[at] = new_order_add_message_record.timestamp[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> wire[at] = new_order_add_message_record.order_id[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = new_order_add_message_record.side; at = at + 1;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> wire[at] = new_order_add_message_record.shares[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 11 -> wire[at] = new_order_add_message_record.symbol[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> wire[at] = new_order_add_message_record.price[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> wire[at] = new_order_add_message_record.reserved_4[new_order_add_message_at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Order Add Message off the wire, 46 bytes from where the cursor stands */
inline decode_new_order_add_message(new_order_add_message_record) {
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 2 -> new_order_add_message_record.symbol_id[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.timestamp[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.order_id[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_record.side = wire[at]; at = at + 1;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.shares[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 11 -> new_order_add_message_record.symbol[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> new_order_add_message_record.price[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> new_order_add_message_record.reserved_4[new_order_add_message_at] = wire[at]; at = at + 1; new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Order Add Message is what was written, byte for byte */
inline equal_new_order_add_message(new_order_add_message_read, new_order_add_message_written) {
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 2 -> assert(new_order_add_message_read.symbol_id[new_order_add_message_at] == new_order_add_message_written.symbol_id[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> assert(new_order_add_message_read.timestamp[new_order_add_message_at] == new_order_add_message_written.timestamp[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> assert(new_order_add_message_read.order_id[new_order_add_message_at] == new_order_add_message_written.order_id[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  assert(new_order_add_message_read.side == new_order_add_message_written.side);
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> assert(new_order_add_message_read.shares[new_order_add_message_at] == new_order_add_message_written.shares[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 11 -> assert(new_order_add_message_read.symbol[new_order_add_message_at] == new_order_add_message_written.symbol[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 8 -> assert(new_order_add_message_read.price[new_order_add_message_at] == new_order_add_message_written.price[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  new_order_add_message_at = 0;
  do
  :: new_order_add_message_at < 4 -> assert(new_order_add_message_read.reserved_4[new_order_add_message_at] == new_order_add_message_written.reserved_4[new_order_add_message_at]); new_order_add_message_at = new_order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Partial Cancel Message: 22 bytes ---------------------------------- */

/* Order Partial Cancel */
typedef OrderPartialCancelMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte order_id[8];
  byte shares_canceled[4]
};

int order_partial_cancel_message_at;

/* every byte of Order Partial Cancel Message set to one value */
inline fill_order_partial_cancel_message(order_partial_cancel_message_record, order_partial_cancel_message_value) {
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 2 -> order_partial_cancel_message_record.symbol_id[order_partial_cancel_message_at] = order_partial_cancel_message_value; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.timestamp[order_partial_cancel_message_at] = order_partial_cancel_message_value; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.order_id[order_partial_cancel_message_at] = order_partial_cancel_message_value; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 4 -> order_partial_cancel_message_record.shares_canceled[order_partial_cancel_message_at] = order_partial_cancel_message_value; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Partial Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_partial_cancel_message(order_partial_cancel_message_record, order_partial_cancel_message_base) {
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 2 -> order_partial_cancel_message_record.symbol_id[order_partial_cancel_message_at] = (order_partial_cancel_message_base + 0 + order_partial_cancel_message_at + 1) % 256; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.timestamp[order_partial_cancel_message_at] = (order_partial_cancel_message_base + 2 + order_partial_cancel_message_at + 1) % 256; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.order_id[order_partial_cancel_message_at] = (order_partial_cancel_message_base + 10 + order_partial_cancel_message_at + 1) % 256; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 4 -> order_partial_cancel_message_record.shares_canceled[order_partial_cancel_message_at] = (order_partial_cancel_message_base + 18 + order_partial_cancel_message_at + 1) % 256; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Partial Cancel Message to the wire, 22 bytes from where the cursor stands */
inline encode_order_partial_cancel_message(order_partial_cancel_message_record) {
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 2 -> wire[at] = order_partial_cancel_message_record.symbol_id[order_partial_cancel_message_at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> wire[at] = order_partial_cancel_message_record.timestamp[order_partial_cancel_message_at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> wire[at] = order_partial_cancel_message_record.order_id[order_partial_cancel_message_at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 4 -> wire[at] = order_partial_cancel_message_record.shares_canceled[order_partial_cancel_message_at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Partial Cancel Message off the wire, 22 bytes from where the cursor stands */
inline decode_order_partial_cancel_message(order_partial_cancel_message_record) {
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 2 -> order_partial_cancel_message_record.symbol_id[order_partial_cancel_message_at] = wire[at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.timestamp[order_partial_cancel_message_at] = wire[at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> order_partial_cancel_message_record.order_id[order_partial_cancel_message_at] = wire[at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 4 -> order_partial_cancel_message_record.shares_canceled[order_partial_cancel_message_at] = wire[at]; at = at + 1; order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Partial Cancel Message is what was written, byte for byte */
inline equal_order_partial_cancel_message(order_partial_cancel_message_read, order_partial_cancel_message_written) {
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 2 -> assert(order_partial_cancel_message_read.symbol_id[order_partial_cancel_message_at] == order_partial_cancel_message_written.symbol_id[order_partial_cancel_message_at]); order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> assert(order_partial_cancel_message_read.timestamp[order_partial_cancel_message_at] == order_partial_cancel_message_written.timestamp[order_partial_cancel_message_at]); order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 8 -> assert(order_partial_cancel_message_read.order_id[order_partial_cancel_message_at] == order_partial_cancel_message_written.order_id[order_partial_cancel_message_at]); order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  order_partial_cancel_message_at = 0;
  do
  :: order_partial_cancel_message_at < 4 -> assert(order_partial_cancel_message_read.shares_canceled[order_partial_cancel_message_at] == order_partial_cancel_message_written.shares_canceled[order_partial_cancel_message_at]); order_partial_cancel_message_at = order_partial_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel All Message: 18 bytes -------------------------------------- */

/* Order Cancel All */
typedef OrderCancelAllMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte order_id[8]
};

int order_cancel_all_message_at;

/* every byte of Order Cancel All Message set to one value */
inline fill_order_cancel_all_message(order_cancel_all_message_record, order_cancel_all_message_value) {
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 2 -> order_cancel_all_message_record.symbol_id[order_cancel_all_message_at] = order_cancel_all_message_value; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.timestamp[order_cancel_all_message_at] = order_cancel_all_message_value; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.order_id[order_cancel_all_message_at] = order_cancel_all_message_value; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel All Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_all_message(order_cancel_all_message_record, order_cancel_all_message_base) {
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 2 -> order_cancel_all_message_record.symbol_id[order_cancel_all_message_at] = (order_cancel_all_message_base + 0 + order_cancel_all_message_at + 1) % 256; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.timestamp[order_cancel_all_message_at] = (order_cancel_all_message_base + 2 + order_cancel_all_message_at + 1) % 256; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.order_id[order_cancel_all_message_at] = (order_cancel_all_message_base + 10 + order_cancel_all_message_at + 1) % 256; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel All Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_cancel_all_message(order_cancel_all_message_record) {
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 2 -> wire[at] = order_cancel_all_message_record.symbol_id[order_cancel_all_message_at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> wire[at] = order_cancel_all_message_record.timestamp[order_cancel_all_message_at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> wire[at] = order_cancel_all_message_record.order_id[order_cancel_all_message_at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel All Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_cancel_all_message(order_cancel_all_message_record) {
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 2 -> order_cancel_all_message_record.symbol_id[order_cancel_all_message_at] = wire[at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.timestamp[order_cancel_all_message_at] = wire[at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> order_cancel_all_message_record.order_id[order_cancel_all_message_at] = wire[at]; at = at + 1; order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel All Message is what was written, byte for byte */
inline equal_order_cancel_all_message(order_cancel_all_message_read, order_cancel_all_message_written) {
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 2 -> assert(order_cancel_all_message_read.symbol_id[order_cancel_all_message_at] == order_cancel_all_message_written.symbol_id[order_cancel_all_message_at]); order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> assert(order_cancel_all_message_read.timestamp[order_cancel_all_message_at] == order_cancel_all_message_written.timestamp[order_cancel_all_message_at]); order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  order_cancel_all_message_at = 0;
  do
  :: order_cancel_all_message_at < 8 -> assert(order_cancel_all_message_read.order_id[order_cancel_all_message_at] == order_cancel_all_message_written.order_id[order_cancel_all_message_at]); order_cancel_all_message_at = order_cancel_all_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Updated Message: 30 bytes ----------------------------------------- */

/* Order Updated */
typedef OrderUpdatedMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte order_id[8];
  byte shares[4];
  byte price[8]
};

int order_updated_message_at;

/* every byte of Order Updated Message set to one value */
inline fill_order_updated_message(order_updated_message_record, order_updated_message_value) {
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 2 -> order_updated_message_record.symbol_id[order_updated_message_at] = order_updated_message_value; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.timestamp[order_updated_message_at] = order_updated_message_value; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.order_id[order_updated_message_at] = order_updated_message_value; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 4 -> order_updated_message_record.shares[order_updated_message_at] = order_updated_message_value; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.price[order_updated_message_at] = order_updated_message_value; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Updated Message set to where it lies, so a field read out of place says so */
inline ramp_order_updated_message(order_updated_message_record, order_updated_message_base) {
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 2 -> order_updated_message_record.symbol_id[order_updated_message_at] = (order_updated_message_base + 0 + order_updated_message_at + 1) % 256; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.timestamp[order_updated_message_at] = (order_updated_message_base + 2 + order_updated_message_at + 1) % 256; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.order_id[order_updated_message_at] = (order_updated_message_base + 10 + order_updated_message_at + 1) % 256; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 4 -> order_updated_message_record.shares[order_updated_message_at] = (order_updated_message_base + 18 + order_updated_message_at + 1) % 256; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.price[order_updated_message_at] = (order_updated_message_base + 22 + order_updated_message_at + 1) % 256; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Updated Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_updated_message(order_updated_message_record) {
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 2 -> wire[at] = order_updated_message_record.symbol_id[order_updated_message_at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> wire[at] = order_updated_message_record.timestamp[order_updated_message_at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> wire[at] = order_updated_message_record.order_id[order_updated_message_at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 4 -> wire[at] = order_updated_message_record.shares[order_updated_message_at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> wire[at] = order_updated_message_record.price[order_updated_message_at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Updated Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_updated_message(order_updated_message_record) {
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 2 -> order_updated_message_record.symbol_id[order_updated_message_at] = wire[at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.timestamp[order_updated_message_at] = wire[at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.order_id[order_updated_message_at] = wire[at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 4 -> order_updated_message_record.shares[order_updated_message_at] = wire[at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> order_updated_message_record.price[order_updated_message_at] = wire[at]; at = at + 1; order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Updated Message is what was written, byte for byte */
inline equal_order_updated_message(order_updated_message_read, order_updated_message_written) {
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 2 -> assert(order_updated_message_read.symbol_id[order_updated_message_at] == order_updated_message_written.symbol_id[order_updated_message_at]); order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> assert(order_updated_message_read.timestamp[order_updated_message_at] == order_updated_message_written.timestamp[order_updated_message_at]); order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> assert(order_updated_message_read.order_id[order_updated_message_at] == order_updated_message_written.order_id[order_updated_message_at]); order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 4 -> assert(order_updated_message_read.shares[order_updated_message_at] == order_updated_message_written.shares[order_updated_message_at]); order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  order_updated_message_at = 0;
  do
  :: order_updated_message_at < 8 -> assert(order_updated_message_read.price[order_updated_message_at] == order_updated_message_written.price[order_updated_message_at]); order_updated_message_at = order_updated_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 39 bytes ---------------------------------------- */

/* Sent when a visible order is executed */
typedef OrderExecutedMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte order_id[8];
  byte shares[4];
  byte execution_id[8];
  byte reserved_1;
  byte price[8]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.symbol_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.shares[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.symbol_id[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 2 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 10 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.shares[order_executed_message_at] = (order_executed_message_base + 18 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 22 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = (order_executed_message_base + 30 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = (order_executed_message_base + 31 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 39 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.symbol_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.shares[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.reserved_1; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 39 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.symbol_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.shares[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.reserved_1 = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.symbol_id[order_executed_message_at] == order_executed_message_written.symbol_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.shares[order_executed_message_at] == order_executed_message_written.shares[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.reserved_1 == order_executed_message_written.reserved_1);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.price[order_executed_message_at] == order_executed_message_written.price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 50 bytes ------------------------------------------------- */

/* Sent when a hidden order is executed */
typedef TradeMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte reserved_8[8];
  byte reserved_1;
  byte shares[4];
  byte symbol[11];
  byte price[8];
  byte execution_id[8]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 2 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = (trade_message_base + 10 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = (trade_message_base + 18 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = (trade_message_base + 19 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 34 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = (trade_message_base + 42 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 50 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.symbol_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.reserved_8[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.reserved_1; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.shares[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.execution_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 50 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.symbol_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_8[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.symbol_id[trade_message_at] == trade_message_written.symbol_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.reserved_8[trade_message_at] == trade_message_written.reserved_8[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.reserved_1 == trade_message_written.reserved_1);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.shares[trade_message_at] == trade_message_written.shares[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 11 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.execution_id[trade_message_at] == trade_message_written.execution_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Break Message: 18 bytes ------------------------------------------- */

/* Trade Break */
typedef TradeBreakMessage {
  byte symbol_id[2];
  byte timestamp[8];
  byte execution_id[8]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 2 -> trade_break_message_record.symbol_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 2 -> trade_break_message_record.symbol_id[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = (trade_break_message_base + 2 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 10 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 18 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 2 -> wire[at] = trade_break_message_record.symbol_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.timestamp[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 18 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 2 -> trade_break_message_record.symbol_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.timestamp[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 2 -> assert(trade_break_message_read.symbol_id[trade_break_message_at] == trade_break_message_written.symbol_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.timestamp[trade_break_message_at] == trade_break_message_written.timestamp[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
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

/* Market Event Message: encoded, read back, and compared */
proctype check_market_event_message() {
  MarketEventMessage market_event_message_sent;
  MarketEventMessage market_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_event_message(market_event_message_sent, 0)
  :: pattern == 1 -> fill_market_event_message(market_event_message_sent, 32)
  :: pattern == 2 -> fill_market_event_message(market_event_message_sent, 255)
  :: else -> ramp_market_event_message(market_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_event_message(market_event_message_sent);
    assert(at == 11);
    at = 0;
    decode_market_event_message(market_event_message_got);
    assert(at == 11);
    equal_market_event_message(market_event_message_got, market_event_message_sent)
  }
}

/* Symbol Information Message: encoded, read back, and compared */
proctype check_symbol_information_message() {
  SymbolInformationMessage symbol_information_message_sent;
  SymbolInformationMessage symbol_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_information_message(symbol_information_message_sent, 0)
  :: pattern == 1 -> fill_symbol_information_message(symbol_information_message_sent, 32)
  :: pattern == 2 -> fill_symbol_information_message(symbol_information_message_sent, 255)
  :: else -> ramp_symbol_information_message(symbol_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_information_message(symbol_information_message_sent);
    assert(at == 27);
    at = 0;
    decode_symbol_information_message(symbol_information_message_got);
    assert(at == 27);
    equal_symbol_information_message(symbol_information_message_got, symbol_information_message_sent)
  }
}

/* Symbol State Message: encoded, read back, and compared */
proctype check_symbol_state_message() {
  SymbolStateMessage symbol_state_message_sent;
  SymbolStateMessage symbol_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_state_message(symbol_state_message_sent, 0)
  :: pattern == 1 -> fill_symbol_state_message(symbol_state_message_sent, 32)
  :: pattern == 2 -> fill_symbol_state_message(symbol_state_message_sent, 255)
  :: else -> ramp_symbol_state_message(symbol_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_state_message(symbol_state_message_sent);
    assert(at == 27);
    at = 0;
    decode_symbol_state_message(symbol_state_message_got);
    assert(at == 27);
    equal_symbol_state_message(symbol_state_message_got, symbol_state_message_sent)
  }
}

/* New Order Add Message: encoded, read back, and compared */
proctype check_new_order_add_message() {
  NewOrderAddMessage new_order_add_message_sent;
  NewOrderAddMessage new_order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_order_add_message(new_order_add_message_sent, 0)
  :: pattern == 1 -> fill_new_order_add_message(new_order_add_message_sent, 32)
  :: pattern == 2 -> fill_new_order_add_message(new_order_add_message_sent, 255)
  :: else -> ramp_new_order_add_message(new_order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_order_add_message(new_order_add_message_sent);
    assert(at == 46);
    at = 0;
    decode_new_order_add_message(new_order_add_message_got);
    assert(at == 46);
    equal_new_order_add_message(new_order_add_message_got, new_order_add_message_sent)
  }
}

/* Order Partial Cancel Message: encoded, read back, and compared */
proctype check_order_partial_cancel_message() {
  OrderPartialCancelMessage order_partial_cancel_message_sent;
  OrderPartialCancelMessage order_partial_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_partial_cancel_message(order_partial_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_partial_cancel_message(order_partial_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_partial_cancel_message(order_partial_cancel_message_sent, 255)
  :: else -> ramp_order_partial_cancel_message(order_partial_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_partial_cancel_message(order_partial_cancel_message_sent);
    assert(at == 22);
    at = 0;
    decode_order_partial_cancel_message(order_partial_cancel_message_got);
    assert(at == 22);
    equal_order_partial_cancel_message(order_partial_cancel_message_got, order_partial_cancel_message_sent)
  }
}

/* Order Cancel All Message: encoded, read back, and compared */
proctype check_order_cancel_all_message() {
  OrderCancelAllMessage order_cancel_all_message_sent;
  OrderCancelAllMessage order_cancel_all_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_all_message(order_cancel_all_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_all_message(order_cancel_all_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_all_message(order_cancel_all_message_sent, 255)
  :: else -> ramp_order_cancel_all_message(order_cancel_all_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_all_message(order_cancel_all_message_sent);
    assert(at == 18);
    at = 0;
    decode_order_cancel_all_message(order_cancel_all_message_got);
    assert(at == 18);
    equal_order_cancel_all_message(order_cancel_all_message_got, order_cancel_all_message_sent)
  }
}

/* Order Updated Message: encoded, read back, and compared */
proctype check_order_updated_message() {
  OrderUpdatedMessage order_updated_message_sent;
  OrderUpdatedMessage order_updated_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_updated_message(order_updated_message_sent, 0)
  :: pattern == 1 -> fill_order_updated_message(order_updated_message_sent, 32)
  :: pattern == 2 -> fill_order_updated_message(order_updated_message_sent, 255)
  :: else -> ramp_order_updated_message(order_updated_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_updated_message(order_updated_message_sent);
    assert(at == 30);
    at = 0;
    decode_order_updated_message(order_updated_message_got);
    assert(at == 30);
    equal_order_updated_message(order_updated_message_got, order_updated_message_sent)
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
    assert(at == 39);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 39);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
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
    assert(at == 50);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 50);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 18);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 18);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_market_event_message()
  :: run check_symbol_information_message()
  :: run check_symbol_state_message()
  :: run check_new_order_add_message()
  :: run check_order_partial_cancel_message()
  :: run check_order_cancel_all_message()
  :: run check_order_updated_message()
  :: run check_order_executed_message()
  :: run check_trade_message()
  :: run check_trade_break_message()
  fi
}
