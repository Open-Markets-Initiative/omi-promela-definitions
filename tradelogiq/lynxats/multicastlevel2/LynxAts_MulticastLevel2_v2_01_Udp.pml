/*
 * Tradelogiq Markets Inc. Lynx Multicast Level 2
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
#define WIRE 71

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Tradelogiq Qtp Downstream Packet Header */
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

/* Tradelogiq Qtp Message Block Header */
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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte event_code;
  byte reserved_2[2];
  byte timestamp[8]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = (system_event_message_base + 1 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 3 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.reserved_2[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.reserved_2[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.reserved_2[system_event_message_at] == system_event_message_written.reserved_2[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Directory Message: 39 bytes --------------------------------------- */

/* At the start of each trading day, Tradelogiq disseminates stock directory messages for all supported securities. */
typedef StockDirectoryMessage {
  byte market;
  byte stock[10];
  byte timestamp[8];
  byte board_lot_size[4];
  byte instrument_id[2];
  byte shortable;
  byte dividend_indicator;
  byte reserved_9[9];
  byte currency[3]
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_record.market = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = stock_directory_message_value;
  stock_directory_message_record.dividend_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_record.market = (stock_directory_message_base + 0 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 1 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 11 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = (stock_directory_message_base + 19 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = (stock_directory_message_base + 23 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = (stock_directory_message_base + 25 + 1) % 256;
  stock_directory_message_record.dividend_indicator = (stock_directory_message_base + 26 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = (stock_directory_message_base + 27 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = (stock_directory_message_base + 36 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message to the wire, 39 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  wire[at] = stock_directory_message_record.market; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.timestamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.board_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.instrument_id[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.shortable; at = at + 1;
  wire[at] = stock_directory_message_record.dividend_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> wire[at] = stock_directory_message_record.reserved_9[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> wire[at] = stock_directory_message_record.currency[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message off the wire, 39 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_record.market = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.board_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.instrument_id[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.shortable = wire[at]; at = at + 1;
  stock_directory_message_record.dividend_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> stock_directory_message_record.reserved_9[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> stock_directory_message_record.currency[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  assert(stock_directory_message_read.market == stock_directory_message_written.market);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 10 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.timestamp[stock_directory_message_at] == stock_directory_message_written.timestamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.board_lot_size[stock_directory_message_at] == stock_directory_message_written.board_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.instrument_id[stock_directory_message_at] == stock_directory_message_written.instrument_id[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.shortable == stock_directory_message_written.shortable);
  assert(stock_directory_message_read.dividend_indicator == stock_directory_message_written.dividend_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 9 -> assert(stock_directory_message_read.reserved_9[stock_directory_message_at] == stock_directory_message_written.reserved_9[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 3 -> assert(stock_directory_message_read.currency[stock_directory_message_at] == stock_directory_message_written.currency[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Stock Directory Message: 71 bytes ------------------------------ */

/* Extended Stock Directory messages carry the additional reference data of bonds, debentures, rights, notes and warrants. */
typedef ExtendedStockDirectoryMessage {
  byte market;
  byte stock[10];
  byte timestamp[8];
  byte board_lot_size[4];
  byte instrument_id[2];
  byte shortable;
  byte frequency;
  byte reserved_9[9];
  byte currency[3];
  byte security_type;
  byte expiry_date[8];
  byte description[20];
  byte reserved_3[3]
};

int extended_stock_directory_message_at;

/* every byte of Extended Stock Directory Message set to one value */
inline fill_extended_stock_directory_message(extended_stock_directory_message_record, extended_stock_directory_message_value) {
  extended_stock_directory_message_record.market = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = extended_stock_directory_message_value;
  extended_stock_directory_message_record.frequency = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = extended_stock_directory_message_value;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = extended_stock_directory_message_value; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_extended_stock_directory_message(extended_stock_directory_message_record, extended_stock_directory_message_base) {
  extended_stock_directory_message_record.market = (extended_stock_directory_message_base + 0 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 1 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 11 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 19 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 23 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = (extended_stock_directory_message_base + 25 + 1) % 256;
  extended_stock_directory_message_record.frequency = (extended_stock_directory_message_base + 26 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 27 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 36 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = (extended_stock_directory_message_base + 39 + 1) % 256;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 40 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 48 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = (extended_stock_directory_message_base + 68 + extended_stock_directory_message_at + 1) % 256; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Stock Directory Message to the wire, 71 bytes from where the cursor stands */
inline encode_extended_stock_directory_message(extended_stock_directory_message_record) {
  wire[at] = extended_stock_directory_message_record.market; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> wire[at] = extended_stock_directory_message_record.stock[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> wire[at] = extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> wire[at] = extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> wire[at] = extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_stock_directory_message_record.shortable; at = at + 1;
  wire[at] = extended_stock_directory_message_record.frequency; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> wire[at] = extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> wire[at] = extended_stock_directory_message_record.currency[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_stock_directory_message_record.security_type; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> wire[at] = extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> wire[at] = extended_stock_directory_message_record.description[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> wire[at] = extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Stock Directory Message off the wire, 71 bytes from where the cursor stands */
inline decode_extended_stock_directory_message(extended_stock_directory_message_record) {
  extended_stock_directory_message_record.market = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> extended_stock_directory_message_record.stock[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.timestamp[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> extended_stock_directory_message_record.board_lot_size[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> extended_stock_directory_message_record.instrument_id[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.shortable = wire[at]; at = at + 1;
  extended_stock_directory_message_record.frequency = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> extended_stock_directory_message_record.reserved_9[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.currency[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_record.security_type = wire[at]; at = at + 1;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> extended_stock_directory_message_record.expiry_date[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> extended_stock_directory_message_record.description[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> extended_stock_directory_message_record.reserved_3[extended_stock_directory_message_at] = wire[at]; at = at + 1; extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Stock Directory Message is what was written, byte for byte */
inline equal_extended_stock_directory_message(extended_stock_directory_message_read, extended_stock_directory_message_written) {
  assert(extended_stock_directory_message_read.market == extended_stock_directory_message_written.market);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 10 -> assert(extended_stock_directory_message_read.stock[extended_stock_directory_message_at] == extended_stock_directory_message_written.stock[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> assert(extended_stock_directory_message_read.timestamp[extended_stock_directory_message_at] == extended_stock_directory_message_written.timestamp[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 4 -> assert(extended_stock_directory_message_read.board_lot_size[extended_stock_directory_message_at] == extended_stock_directory_message_written.board_lot_size[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 2 -> assert(extended_stock_directory_message_read.instrument_id[extended_stock_directory_message_at] == extended_stock_directory_message_written.instrument_id[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  assert(extended_stock_directory_message_read.shortable == extended_stock_directory_message_written.shortable);
  assert(extended_stock_directory_message_read.frequency == extended_stock_directory_message_written.frequency);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 9 -> assert(extended_stock_directory_message_read.reserved_9[extended_stock_directory_message_at] == extended_stock_directory_message_written.reserved_9[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> assert(extended_stock_directory_message_read.currency[extended_stock_directory_message_at] == extended_stock_directory_message_written.currency[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  assert(extended_stock_directory_message_read.security_type == extended_stock_directory_message_written.security_type);
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 8 -> assert(extended_stock_directory_message_read.expiry_date[extended_stock_directory_message_at] == extended_stock_directory_message_written.expiry_date[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 20 -> assert(extended_stock_directory_message_read.description[extended_stock_directory_message_at] == extended_stock_directory_message_written.description[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  extended_stock_directory_message_at = 0;
  do
  :: extended_stock_directory_message_at < 3 -> assert(extended_stock_directory_message_read.reserved_3[extended_stock_directory_message_at] == extended_stock_directory_message_written.reserved_3[extended_stock_directory_message_at]); extended_stock_directory_message_at = extended_stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Trading Action Message: 15 bytes ---------------------------------- */

/* Tradelogiq uses this administrative message to indicate the current trading status of a security. */
typedef StockTradingActionMessage {
  byte trading_state;
  byte instrument_id[2];
  byte timestamp[8];
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_record.trading_state = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.instrument_id[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_record.trading_state = (stock_trading_action_message_base + 0 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.instrument_id[stock_trading_action_message_at] = (stock_trading_action_message_base + 1 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = (stock_trading_action_message_base + 3 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 11 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 15 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  wire[at] = stock_trading_action_message_record.trading_state; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> wire[at] = stock_trading_action_message_record.instrument_id[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.timestamp[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 15 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.instrument_id[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  assert(stock_trading_action_message_read.trading_state == stock_trading_action_message_written.trading_state);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> assert(stock_trading_action_message_read.instrument_id[stock_trading_action_message_at] == stock_trading_action_message_written.instrument_id[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.timestamp[stock_trading_action_message_at] == stock_trading_action_message_written.timestamp[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 27 bytes --------------------------------------------- */

/* An Add Order Message indicates that a new order has been accepted by Omega ATS or Lynx ATS and was added to the visible order book. */
typedef AddOrderMessage {
  byte buy_sell_indicator;
  byte instrument_id[2];
  byte timestamp[8];
  byte order_reference_number[4];
  byte shares[4];
  byte price[4];
  byte exec_broker_id[2];
  byte reserved_2[2]
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_record.buy_sell_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.instrument_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.exec_broker_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.reserved_2[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_record.buy_sell_indicator = (add_order_message_base + 0 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.instrument_id[add_order_message_at] = (add_order_message_base + 1 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = (add_order_message_base + 3 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = (add_order_message_base + 11 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = (add_order_message_base + 15 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 19 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.exec_broker_id[add_order_message_at] = (add_order_message_base + 23 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.reserved_2[add_order_message_at] = (add_order_message_base + 25 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message to the wire, 27 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  wire[at] = add_order_message_record.buy_sell_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.instrument_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.timestamp[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.order_reference_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.shares[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.exec_broker_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> wire[at] = add_order_message_record.reserved_2[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Message off the wire, 27 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.instrument_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.timestamp[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.order_reference_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.exec_broker_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> add_order_message_record.reserved_2[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  assert(add_order_message_read.buy_sell_indicator == add_order_message_written.buy_sell_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.instrument_id[add_order_message_at] == add_order_message_written.instrument_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> assert(add_order_message_read.timestamp[add_order_message_at] == add_order_message_written.timestamp[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.order_reference_number[add_order_message_at] == add_order_message_written.order_reference_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.shares[add_order_message_at] == add_order_message_written.shares[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.exec_broker_id[add_order_message_at] == add_order_message_written.exec_broker_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 2 -> assert(add_order_message_read.reserved_2[add_order_message_at] == add_order_message_written.reserved_2[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 27 bytes ---------------------------------------- */

/* This message is sent whenever an order on the book is executed in whole or in part. */
typedef OrderExecutedMessage {
  byte marker;
  byte instrument_id[2];
  byte timestamp[8];
  byte order_reference_number[4];
  byte executed_shares[4];
  byte match_number[4];
  byte contra_broker_id[2];
  byte reserved_2[2]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_record.marker = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.instrument_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_reference_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.contra_broker_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.reserved_2[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_record.marker = (order_executed_message_base + 0 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.instrument_id[order_executed_message_at] = (order_executed_message_base + 1 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 3 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_reference_number[order_executed_message_at] = (order_executed_message_base + 11 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = (order_executed_message_base + 15 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 19 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.contra_broker_id[order_executed_message_at] = (order_executed_message_base + 23 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.reserved_2[order_executed_message_at] = (order_executed_message_base + 25 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 27 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  wire[at] = order_executed_message_record.marker; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.instrument_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.order_reference_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_shares[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.contra_broker_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.reserved_2[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 27 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_record.marker = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.instrument_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.order_reference_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.contra_broker_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.reserved_2[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  assert(order_executed_message_read.marker == order_executed_message_written.marker);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.instrument_id[order_executed_message_at] == order_executed_message_written.instrument_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.order_reference_number[order_executed_message_at] == order_executed_message_written.order_reference_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_shares[order_executed_message_at] == order_executed_message_written.executed_shares[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.contra_broker_id[order_executed_message_at] == order_executed_message_written.contra_broker_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.reserved_2[order_executed_message_at] == order_executed_message_written.reserved_2[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 31 bytes ----------------------------- */

/* This message is sent whenever an order on the book is executed at a display price different from the original. */
typedef OrderExecutedWithPriceMessage {
  byte marker;
  byte instrument_id[2];
  byte timestamp[8];
  byte order_reference_number[4];
  byte executed_shares[4];
  byte execution_price[4];
  byte match_number[4];
  byte contra_broker_id[2];
  byte reserved_2[2]
};

int order_executed_with_price_message_at;

/* every byte of Order Executed With Price Message set to one value */
inline fill_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_value) {
  order_executed_with_price_message_record.marker = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.instrument_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.contra_broker_id[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.reserved_2[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_with_price_message(order_executed_with_price_message_record, order_executed_with_price_message_base) {
  order_executed_with_price_message_record.marker = (order_executed_with_price_message_base + 0 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.instrument_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 1 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 3 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 11 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 15 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 19 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 23 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.contra_broker_id[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 27 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.reserved_2[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 29 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 31 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  wire[at] = order_executed_with_price_message_record.marker; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.instrument_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.contra_broker_id[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.reserved_2[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 31 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_record.marker = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.instrument_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.contra_broker_id[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.reserved_2[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed With Price Message is what was written, byte for byte */
inline equal_order_executed_with_price_message(order_executed_with_price_message_read, order_executed_with_price_message_written) {
  assert(order_executed_with_price_message_read.marker == order_executed_with_price_message_written.marker);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.instrument_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.instrument_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.timestamp[order_executed_with_price_message_at] == order_executed_with_price_message_written.timestamp[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.order_reference_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_reference_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.executed_shares[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_shares[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.contra_broker_id[order_executed_with_price_message_at] == order_executed_with_price_message_written.contra_broker_id[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.reserved_2[order_executed_with_price_message_at] == order_executed_with_price_message_written.reserved_2[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 15 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is being cancelled. */
typedef OrderDeleteMessage {
  byte reserved_1;
  byte instrument_id[2];
  byte timestamp[8];
  byte order_reference_number[4]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_record.reserved_1 = order_delete_message_value;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.instrument_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_reference_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_record.reserved_1 = (order_delete_message_base + 0 + 1) % 256;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.instrument_id[order_delete_message_at] = (order_delete_message_base + 1 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = (order_delete_message_base + 3 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_reference_number[order_delete_message_at] = (order_delete_message_base + 11 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 15 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  wire[at] = order_delete_message_record.reserved_1; at = at + 1;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> wire[at] = order_delete_message_record.instrument_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.order_reference_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 15 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_record.reserved_1 = wire[at]; at = at + 1;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.instrument_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.order_reference_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  assert(order_delete_message_read.reserved_1 == order_delete_message_written.reserved_1);
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> assert(order_delete_message_read.instrument_id[order_delete_message_at] == order_delete_message_written.instrument_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.timestamp[order_delete_message_at] == order_delete_message_written.timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.order_reference_number[order_delete_message_at] == order_delete_message_written.order_reference_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 27 bytes ----------------------------------------- */

/* This message is sent whenever an order on the book has been cancelled and replaced. */
typedef OrderReplaceMessage {
  byte reserved_1;
  byte instrument_id[2];
  byte timestamp[8];
  byte original_order_reference_number[4];
  byte new_order_reference_number[4];
  byte shares[4];
  byte price[4]
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_record.reserved_1 = order_replace_message_value;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.instrument_id[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.shares[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_record.reserved_1 = (order_replace_message_base + 0 + 1) % 256;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.instrument_id[order_replace_message_at] = (order_replace_message_base + 1 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = (order_replace_message_base + 3 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = (order_replace_message_base + 11 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = (order_replace_message_base + 15 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.shares[order_replace_message_at] = (order_replace_message_base + 19 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 23 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message to the wire, 27 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  wire[at] = order_replace_message_record.reserved_1; at = at + 1;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> wire[at] = order_replace_message_record.instrument_id[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.timestamp[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.original_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.new_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.shares[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.price[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replace Message off the wire, 27 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_record.reserved_1 = wire[at]; at = at + 1;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.instrument_id[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.timestamp[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.shares[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  assert(order_replace_message_read.reserved_1 == order_replace_message_written.reserved_1);
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> assert(order_replace_message_read.instrument_id[order_replace_message_at] == order_replace_message_written.instrument_id[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.timestamp[order_replace_message_at] == order_replace_message_written.timestamp[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.original_order_reference_number[order_replace_message_at] == order_replace_message_written.original_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.new_order_reference_number[order_replace_message_at] == order_replace_message_written.new_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.shares[order_replace_message_at] == order_replace_message_written.shares[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.price[order_replace_message_at] == order_replace_message_written.price[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 19 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is modified as a result of a partial cancellation. */
typedef OrderCancelMessage {
  byte reserved_1;
  byte instrument_id[2];
  byte timestamp[8];
  byte order_reference_number[4];
  byte cancelled_shares[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_record.reserved_1 = order_cancel_message_value;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_shares[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_record.reserved_1 = (order_cancel_message_base + 0 + 1) % 256;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = (order_cancel_message_base + 1 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 3 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 11 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_shares[order_cancel_message_at] = (order_cancel_message_base + 15 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  wire[at] = order_cancel_message_record.reserved_1; at = at + 1;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.instrument_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.order_reference_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.cancelled_shares[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_record.reserved_1 = wire[at]; at = at + 1;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.instrument_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.cancelled_shares[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  assert(order_cancel_message_read.reserved_1 == order_cancel_message_written.reserved_1);
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.instrument_id[order_cancel_message_at] == order_cancel_message_written.instrument_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.order_reference_number[order_cancel_message_at] == order_cancel_message_written.order_reference_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.cancelled_shares[order_cancel_message_at] == order_cancel_message_written.cancelled_shares[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 31 bytes ------------------------------------------------- */

/* The Trade Message is designed to provide execution details for normal match events involving non-displayed order types. */
typedef TradeMessage {
  byte side;
  byte instrument_id[2];
  byte timestamp[8];
  byte midpoint_book_trade[4];
  byte shares[4];
  byte price[4];
  byte match_number[4];
  byte buy_broker_id[2];
  byte sell_broker_id[2]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_record.side = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.instrument_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.midpoint_book_trade[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.buy_broker_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.sell_broker_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_record.side = (trade_message_base + 0 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.instrument_id[trade_message_at] = (trade_message_base + 1 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = (trade_message_base + 3 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.midpoint_book_trade[trade_message_at] = (trade_message_base + 11 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = (trade_message_base + 15 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 19 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.buy_broker_id[trade_message_at] = (trade_message_base + 27 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.sell_broker_id[trade_message_at] = (trade_message_base + 29 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  wire[at] = trade_message_record.side; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.instrument_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.timestamp[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.midpoint_book_trade[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.shares[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.buy_broker_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> wire[at] = trade_message_record.sell_broker_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_record.side = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.instrument_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.timestamp[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.midpoint_book_trade[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.buy_broker_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> trade_message_record.sell_broker_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  assert(trade_message_read.side == trade_message_written.side);
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.instrument_id[trade_message_at] == trade_message_written.instrument_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.timestamp[trade_message_at] == trade_message_written.timestamp[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.midpoint_book_trade[trade_message_at] == trade_message_written.midpoint_book_trade[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.shares[trade_message_at] == trade_message_written.shares[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.buy_broker_id[trade_message_at] == trade_message_written.buy_broker_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 2 -> assert(trade_message_read.sell_broker_id[trade_message_at] == trade_message_written.sell_broker_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Trade Message: 31 bytes ------------------------------------------- */

/* Cross trades are only accepted on Omega ATS. */
typedef CrossTradeMessage {
  byte cross_type;
  byte instrument_id[2];
  byte timestamp[8];
  byte shares[4];
  byte price[4];
  byte match_number[4];
  byte buy_broker_id[2];
  byte sell_broker_id[2];
  byte bypass;
  byte settlement_type;
  byte reserved_2[2]
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_record.cross_type = cross_trade_message_value;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.instrument_id[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.shares[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.buy_broker_id[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.sell_broker_id[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.bypass = cross_trade_message_value;
  cross_trade_message_record.settlement_type = cross_trade_message_value;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.reserved_2[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cross_trade_message(cross_trade_message_record, cross_trade_message_base) {
  cross_trade_message_record.cross_type = (cross_trade_message_base + 0 + 1) % 256;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.instrument_id[cross_trade_message_at] = (cross_trade_message_base + 1 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = (cross_trade_message_base + 3 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.shares[cross_trade_message_at] = (cross_trade_message_base + 11 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = (cross_trade_message_base + 15 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = (cross_trade_message_base + 19 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.buy_broker_id[cross_trade_message_at] = (cross_trade_message_base + 23 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.sell_broker_id[cross_trade_message_at] = (cross_trade_message_base + 25 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.bypass = (cross_trade_message_base + 27 + 1) % 256;
  cross_trade_message_record.settlement_type = (cross_trade_message_base + 28 + 1) % 256;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.reserved_2[cross_trade_message_at] = (cross_trade_message_base + 29 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  wire[at] = cross_trade_message_record.cross_type; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.instrument_id[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.timestamp[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.shares[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.price[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.match_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.buy_broker_id[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.sell_broker_id[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_trade_message_record.bypass; at = at + 1;
  wire[at] = cross_trade_message_record.settlement_type; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.reserved_2[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.instrument_id[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.timestamp[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.shares[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.price[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.match_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.buy_broker_id[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.sell_broker_id[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.bypass = wire[at]; at = at + 1;
  cross_trade_message_record.settlement_type = wire[at]; at = at + 1;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.reserved_2[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Trade Message is what was written, byte for byte */
inline equal_cross_trade_message(cross_trade_message_read, cross_trade_message_written) {
  assert(cross_trade_message_read.cross_type == cross_trade_message_written.cross_type);
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.instrument_id[cross_trade_message_at] == cross_trade_message_written.instrument_id[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.timestamp[cross_trade_message_at] == cross_trade_message_written.timestamp[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.shares[cross_trade_message_at] == cross_trade_message_written.shares[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.price[cross_trade_message_at] == cross_trade_message_written.price[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.match_number[cross_trade_message_at] == cross_trade_message_written.match_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.buy_broker_id[cross_trade_message_at] == cross_trade_message_written.buy_broker_id[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.sell_broker_id[cross_trade_message_at] == cross_trade_message_written.sell_broker_id[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  assert(cross_trade_message_read.bypass == cross_trade_message_written.bypass);
  assert(cross_trade_message_read.settlement_type == cross_trade_message_written.settlement_type);
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.reserved_2[cross_trade_message_at] == cross_trade_message_written.reserved_2[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Bust Message: 15 bytes -------------------------------------------- */

/* The Trade Bust message is sent whenever an execution on Omega ATS or Lynx ATS is cancelled. */
typedef TradeBustMessage {
  byte reserved_1;
  byte instrument_id[2];
  byte timestamp[8];
  byte match_number[4]
};

int trade_bust_message_at;

/* every byte of Trade Bust Message set to one value */
inline fill_trade_bust_message(trade_bust_message_record, trade_bust_message_value) {
  trade_bust_message_record.reserved_1 = trade_bust_message_value;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 2 -> trade_bust_message_record.instrument_id[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.match_number[trade_bust_message_at] = trade_bust_message_value; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Bust Message set to where it lies, so a field read out of place says so */
inline ramp_trade_bust_message(trade_bust_message_record, trade_bust_message_base) {
  trade_bust_message_record.reserved_1 = (trade_bust_message_base + 0 + 1) % 256;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 2 -> trade_bust_message_record.instrument_id[trade_bust_message_at] = (trade_bust_message_base + 1 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = (trade_bust_message_base + 3 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.match_number[trade_bust_message_at] = (trade_bust_message_base + 11 + trade_bust_message_at + 1) % 256; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message to the wire, 15 bytes from where the cursor stands */
inline encode_trade_bust_message(trade_bust_message_record) {
  wire[at] = trade_bust_message_record.reserved_1; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 2 -> wire[at] = trade_bust_message_record.instrument_id[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> wire[at] = trade_bust_message_record.timestamp[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> wire[at] = trade_bust_message_record.match_number[trade_bust_message_at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Bust Message off the wire, 15 bytes from where the cursor stands */
inline decode_trade_bust_message(trade_bust_message_record) {
  trade_bust_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 2 -> trade_bust_message_record.instrument_id[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> trade_bust_message_record.timestamp[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> trade_bust_message_record.match_number[trade_bust_message_at] = wire[at]; at = at + 1; trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Bust Message is what was written, byte for byte */
inline equal_trade_bust_message(trade_bust_message_read, trade_bust_message_written) {
  assert(trade_bust_message_read.reserved_1 == trade_bust_message_written.reserved_1);
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 2 -> assert(trade_bust_message_read.instrument_id[trade_bust_message_at] == trade_bust_message_written.instrument_id[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 8 -> assert(trade_bust_message_read.timestamp[trade_bust_message_at] == trade_bust_message_written.timestamp[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  trade_bust_message_at = 0;
  do
  :: trade_bust_message_at < 4 -> assert(trade_bust_message_read.match_number[trade_bust_message_at] == trade_bust_message_written.match_number[trade_bust_message_at]); trade_bust_message_at = trade_bust_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Amend Message: 39 bytes ------------------------------------------- */

/* The Trade Amend/Correction message is sent whenever an execution on Omega ATS or Lynx ATS is amended. */
typedef TradeAmendMessage {
  byte reserved_1;
  byte instrument_id[2];
  byte timestamp[8];
  byte original_trade_id[4];
  byte original_trade_price[8];
  byte original_trade_size[4];
  byte corrected_trade_price[8];
  byte corrected_trade_size[4]
};

int trade_amend_message_at;

/* every byte of Trade Amend Message set to one value */
inline fill_trade_amend_message(trade_amend_message_record, trade_amend_message_value) {
  trade_amend_message_record.reserved_1 = trade_amend_message_value;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 2 -> trade_amend_message_record.instrument_id[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.timestamp[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_id[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.original_trade_price[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_size[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.corrected_trade_price[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.corrected_trade_size[trade_amend_message_at] = trade_amend_message_value; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Amend Message set to where it lies, so a field read out of place says so */
inline ramp_trade_amend_message(trade_amend_message_record, trade_amend_message_base) {
  trade_amend_message_record.reserved_1 = (trade_amend_message_base + 0 + 1) % 256;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 2 -> trade_amend_message_record.instrument_id[trade_amend_message_at] = (trade_amend_message_base + 1 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.timestamp[trade_amend_message_at] = (trade_amend_message_base + 3 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_id[trade_amend_message_at] = (trade_amend_message_base + 11 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.original_trade_price[trade_amend_message_at] = (trade_amend_message_base + 15 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_size[trade_amend_message_at] = (trade_amend_message_base + 23 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.corrected_trade_price[trade_amend_message_at] = (trade_amend_message_base + 27 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.corrected_trade_size[trade_amend_message_at] = (trade_amend_message_base + 35 + trade_amend_message_at + 1) % 256; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amend Message to the wire, 39 bytes from where the cursor stands */
inline encode_trade_amend_message(trade_amend_message_record) {
  wire[at] = trade_amend_message_record.reserved_1; at = at + 1;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 2 -> wire[at] = trade_amend_message_record.instrument_id[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.timestamp[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> wire[at] = trade_amend_message_record.original_trade_id[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.original_trade_price[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> wire[at] = trade_amend_message_record.original_trade_size[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> wire[at] = trade_amend_message_record.corrected_trade_price[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> wire[at] = trade_amend_message_record.corrected_trade_size[trade_amend_message_at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Amend Message off the wire, 39 bytes from where the cursor stands */
inline decode_trade_amend_message(trade_amend_message_record) {
  trade_amend_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 2 -> trade_amend_message_record.instrument_id[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.timestamp[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_id[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.original_trade_price[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.original_trade_size[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> trade_amend_message_record.corrected_trade_price[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> trade_amend_message_record.corrected_trade_size[trade_amend_message_at] = wire[at]; at = at + 1; trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Amend Message is what was written, byte for byte */
inline equal_trade_amend_message(trade_amend_message_read, trade_amend_message_written) {
  assert(trade_amend_message_read.reserved_1 == trade_amend_message_written.reserved_1);
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 2 -> assert(trade_amend_message_read.instrument_id[trade_amend_message_at] == trade_amend_message_written.instrument_id[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.timestamp[trade_amend_message_at] == trade_amend_message_written.timestamp[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> assert(trade_amend_message_read.original_trade_id[trade_amend_message_at] == trade_amend_message_written.original_trade_id[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.original_trade_price[trade_amend_message_at] == trade_amend_message_written.original_trade_price[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> assert(trade_amend_message_read.original_trade_size[trade_amend_message_at] == trade_amend_message_written.original_trade_size[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 8 -> assert(trade_amend_message_read.corrected_trade_price[trade_amend_message_at] == trade_amend_message_written.corrected_trade_price[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
  :: else -> break
  od;
  trade_amend_message_at = 0;
  do
  :: trade_amend_message_at < 4 -> assert(trade_amend_message_read.corrected_trade_size[trade_amend_message_at] == trade_amend_message_written.corrected_trade_size[trade_amend_message_at]); trade_amend_message_at = trade_amend_message_at + 1
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
    assert(at == 11);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 11);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Stock Directory Message: encoded, read back, and compared */
proctype check_stock_directory_message() {
  StockDirectoryMessage stock_directory_message_sent;
  StockDirectoryMessage stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_directory_message(stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_stock_directory_message(stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_stock_directory_message(stock_directory_message_sent, 255)
  :: else -> ramp_stock_directory_message(stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_directory_message(stock_directory_message_sent);
    assert(at == 39);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 39);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Extended Stock Directory Message: encoded, read back, and compared */
proctype check_extended_stock_directory_message() {
  ExtendedStockDirectoryMessage extended_stock_directory_message_sent;
  ExtendedStockDirectoryMessage extended_stock_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 0)
  :: pattern == 1 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 32)
  :: pattern == 2 -> fill_extended_stock_directory_message(extended_stock_directory_message_sent, 255)
  :: else -> ramp_extended_stock_directory_message(extended_stock_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_stock_directory_message(extended_stock_directory_message_sent);
    assert(at == 71);
    at = 0;
    decode_extended_stock_directory_message(extended_stock_directory_message_got);
    assert(at == 71);
    equal_extended_stock_directory_message(extended_stock_directory_message_got, extended_stock_directory_message_sent)
  }
}

/* Stock Trading Action Message: encoded, read back, and compared */
proctype check_stock_trading_action_message() {
  StockTradingActionMessage stock_trading_action_message_sent;
  StockTradingActionMessage stock_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_stock_trading_action_message(stock_trading_action_message_sent, 255)
  :: else -> ramp_stock_trading_action_message(stock_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_trading_action_message(stock_trading_action_message_sent);
    assert(at == 15);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 15);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 27);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 27);
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
    assert(at == 31);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 31);
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
    assert(at == 15);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 15);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Replace Message: encoded, read back, and compared */
proctype check_order_replace_message() {
  OrderReplaceMessage order_replace_message_sent;
  OrderReplaceMessage order_replace_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replace_message(order_replace_message_sent, 0)
  :: pattern == 1 -> fill_order_replace_message(order_replace_message_sent, 32)
  :: pattern == 2 -> fill_order_replace_message(order_replace_message_sent, 255)
  :: else -> ramp_order_replace_message(order_replace_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replace_message(order_replace_message_sent);
    assert(at == 27);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 27);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 19);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 19);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
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
    assert(at == 31);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 31);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Cross Trade Message: encoded, read back, and compared */
proctype check_cross_trade_message() {
  CrossTradeMessage cross_trade_message_sent;
  CrossTradeMessage cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_trade_message(cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_cross_trade_message(cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_cross_trade_message(cross_trade_message_sent, 255)
  :: else -> ramp_cross_trade_message(cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_trade_message(cross_trade_message_sent);
    assert(at == 31);
    at = 0;
    decode_cross_trade_message(cross_trade_message_got);
    assert(at == 31);
    equal_cross_trade_message(cross_trade_message_got, cross_trade_message_sent)
  }
}

/* Trade Bust Message: encoded, read back, and compared */
proctype check_trade_bust_message() {
  TradeBustMessage trade_bust_message_sent;
  TradeBustMessage trade_bust_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_bust_message(trade_bust_message_sent, 0)
  :: pattern == 1 -> fill_trade_bust_message(trade_bust_message_sent, 32)
  :: pattern == 2 -> fill_trade_bust_message(trade_bust_message_sent, 255)
  :: else -> ramp_trade_bust_message(trade_bust_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_bust_message(trade_bust_message_sent);
    assert(at == 15);
    at = 0;
    decode_trade_bust_message(trade_bust_message_got);
    assert(at == 15);
    equal_trade_bust_message(trade_bust_message_got, trade_bust_message_sent)
  }
}

/* Trade Amend Message: encoded, read back, and compared */
proctype check_trade_amend_message() {
  TradeAmendMessage trade_amend_message_sent;
  TradeAmendMessage trade_amend_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_amend_message(trade_amend_message_sent, 0)
  :: pattern == 1 -> fill_trade_amend_message(trade_amend_message_sent, 32)
  :: pattern == 2 -> fill_trade_amend_message(trade_amend_message_sent, 255)
  :: else -> ramp_trade_amend_message(trade_amend_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_amend_message(trade_amend_message_sent);
    assert(at == 39);
    at = 0;
    decode_trade_amend_message(trade_amend_message_got);
    assert(at == 39);
    equal_trade_amend_message(trade_amend_message_got, trade_amend_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_extended_stock_directory_message()
  :: run check_stock_trading_action_message()
  :: run check_add_order_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_order_cancel_message()
  :: run check_trade_message()
  :: run check_cross_trade_message()
  :: run check_trade_bust_message()
  :: run check_trade_amend_message()
  fi
}
