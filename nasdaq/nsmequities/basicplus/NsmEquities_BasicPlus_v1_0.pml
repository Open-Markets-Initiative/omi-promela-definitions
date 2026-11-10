/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Basic Plus
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
#define WIRE 42

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

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* System Event Messages is used to signal key market or data feed control events. */
typedef SystemEventMessage {
  byte timestamp[8];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Consolidated Quotation Message: 42 bytes -------------------------------- */

/* Consolidated BBO will broadcast a real-time update every time the Consolidated BBO across Nasdaq owned and operated exchanges is updated throughout the trading day. */
typedef ConsolidatedQuotationMessage {
  byte timestamp[8];
  byte stock[8];
  byte best_bid_price[8];
  byte best_bid_size[4];
  byte best_offer_price[8];
  byte best_offer_size[4];
  byte best_bid_exchanges;
  byte best_offer_exchanges
};

int consolidated_quotation_message_at;

/* every byte of Consolidated Quotation Message set to one value */
inline fill_consolidated_quotation_message(consolidated_quotation_message_record, consolidated_quotation_message_value) {
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.timestamp[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.stock[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_bid_price[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_bid_size[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_offer_price[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_offer_size[consolidated_quotation_message_at] = consolidated_quotation_message_value; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_record.best_bid_exchanges = consolidated_quotation_message_value;
  consolidated_quotation_message_record.best_offer_exchanges = consolidated_quotation_message_value;
  skip
}

/* each byte of Consolidated Quotation Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_quotation_message(consolidated_quotation_message_record, consolidated_quotation_message_base) {
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.timestamp[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 0 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.stock[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 8 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_bid_price[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 16 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_bid_size[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 24 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_offer_price[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 28 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_offer_size[consolidated_quotation_message_at] = (consolidated_quotation_message_base + 36 + consolidated_quotation_message_at + 1) % 256; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_record.best_bid_exchanges = (consolidated_quotation_message_base + 40 + 1) % 256;
  consolidated_quotation_message_record.best_offer_exchanges = (consolidated_quotation_message_base + 41 + 1) % 256;
  skip
}

/* Consolidated Quotation Message to the wire, 42 bytes from where the cursor stands */
inline encode_consolidated_quotation_message(consolidated_quotation_message_record) {
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> wire[at] = consolidated_quotation_message_record.timestamp[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> wire[at] = consolidated_quotation_message_record.stock[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> wire[at] = consolidated_quotation_message_record.best_bid_price[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> wire[at] = consolidated_quotation_message_record.best_bid_size[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> wire[at] = consolidated_quotation_message_record.best_offer_price[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> wire[at] = consolidated_quotation_message_record.best_offer_size[consolidated_quotation_message_at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_quotation_message_record.best_bid_exchanges; at = at + 1;
  wire[at] = consolidated_quotation_message_record.best_offer_exchanges; at = at + 1;
  skip
}

/* Consolidated Quotation Message off the wire, 42 bytes from where the cursor stands */
inline decode_consolidated_quotation_message(consolidated_quotation_message_record) {
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.timestamp[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.stock[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_bid_price[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_bid_size[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> consolidated_quotation_message_record.best_offer_price[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> consolidated_quotation_message_record.best_offer_size[consolidated_quotation_message_at] = wire[at]; at = at + 1; consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_record.best_bid_exchanges = wire[at]; at = at + 1;
  consolidated_quotation_message_record.best_offer_exchanges = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Quotation Message is what was written, byte for byte */
inline equal_consolidated_quotation_message(consolidated_quotation_message_read, consolidated_quotation_message_written) {
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> assert(consolidated_quotation_message_read.timestamp[consolidated_quotation_message_at] == consolidated_quotation_message_written.timestamp[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> assert(consolidated_quotation_message_read.stock[consolidated_quotation_message_at] == consolidated_quotation_message_written.stock[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> assert(consolidated_quotation_message_read.best_bid_price[consolidated_quotation_message_at] == consolidated_quotation_message_written.best_bid_price[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> assert(consolidated_quotation_message_read.best_bid_size[consolidated_quotation_message_at] == consolidated_quotation_message_written.best_bid_size[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 8 -> assert(consolidated_quotation_message_read.best_offer_price[consolidated_quotation_message_at] == consolidated_quotation_message_written.best_offer_price[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  consolidated_quotation_message_at = 0;
  do
  :: consolidated_quotation_message_at < 4 -> assert(consolidated_quotation_message_read.best_offer_size[consolidated_quotation_message_at] == consolidated_quotation_message_written.best_offer_size[consolidated_quotation_message_at]); consolidated_quotation_message_at = consolidated_quotation_message_at + 1
  :: else -> break
  od;
  assert(consolidated_quotation_message_read.best_bid_exchanges == consolidated_quotation_message_written.best_bid_exchanges);
  assert(consolidated_quotation_message_read.best_offer_exchanges == consolidated_quotation_message_written.best_offer_exchanges);
  skip
}

/* ---- Retail Price Improvement Message: 18 bytes ------------------------------ */

/* Indicates a retail interest indication of the Bid, Ask or both the Bid and Ask for Nasdaq-listed securities. Populated for the Nasdaq Texas market only. */
typedef RetailPriceImprovementMessage {
  byte timestamp[8];
  byte stock[8];
  byte buy_side_rpi_exchanges;
  byte sell_side_rpi_exchanges
};

int retail_price_improvement_message_at;

/* every byte of Retail Price Improvement Message set to one value */
inline fill_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_value) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.timestamp[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.buy_side_rpi_exchanges = retail_price_improvement_message_value;
  retail_price_improvement_message_record.sell_side_rpi_exchanges = retail_price_improvement_message_value;
  skip
}

/* each byte of Retail Price Improvement Message set to where it lies, so a field read out of place says so */
inline ramp_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_base) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.timestamp[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 0 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 8 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.buy_side_rpi_exchanges = (retail_price_improvement_message_base + 16 + 1) % 256;
  retail_price_improvement_message_record.sell_side_rpi_exchanges = (retail_price_improvement_message_base + 17 + 1) % 256;
  skip
}

/* Retail Price Improvement Message to the wire, 18 bytes from where the cursor stands */
inline encode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> wire[at] = retail_price_improvement_message_record.timestamp[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> wire[at] = retail_price_improvement_message_record.stock[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_price_improvement_message_record.buy_side_rpi_exchanges; at = at + 1;
  wire[at] = retail_price_improvement_message_record.sell_side_rpi_exchanges; at = at + 1;
  skip
}

/* Retail Price Improvement Message off the wire, 18 bytes from where the cursor stands */
inline decode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.timestamp[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.buy_side_rpi_exchanges = wire[at]; at = at + 1;
  retail_price_improvement_message_record.sell_side_rpi_exchanges = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Price Improvement Message is what was written, byte for byte */
inline equal_retail_price_improvement_message(retail_price_improvement_message_read, retail_price_improvement_message_written) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> assert(retail_price_improvement_message_read.timestamp[retail_price_improvement_message_at] == retail_price_improvement_message_written.timestamp[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> assert(retail_price_improvement_message_read.stock[retail_price_improvement_message_at] == retail_price_improvement_message_written.stock[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  assert(retail_price_improvement_message_read.buy_side_rpi_exchanges == retail_price_improvement_message_written.buy_side_rpi_exchanges);
  assert(retail_price_improvement_message_read.sell_side_rpi_exchanges == retail_price_improvement_message_written.sell_side_rpi_exchanges);
  skip
}

/* ---- Trading Action Message: 21 bytes ---------------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of a security to the trading community. The message originates from the Nasdaq market center system. */
typedef TradingActionMessage {
  byte timestamp[8];
  byte stock[8];
  byte trading_state;
  byte reason_code[4]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.stock[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = trading_action_message_value;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.reason_code[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.stock[trading_action_message_at] = (trading_action_message_base + 8 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = (trading_action_message_base + 16 + 1) % 256;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.reason_code[trading_action_message_at] = (trading_action_message_base + 17 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 21 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.timestamp[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.stock[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.trading_state; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.reason_code[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 21 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.timestamp[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.stock[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.trading_state = wire[at]; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.reason_code[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.timestamp[trading_action_message_at] == trading_action_message_written.timestamp[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.stock[trading_action_message_at] == trading_action_message_written.stock[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.trading_state == trading_action_message_written.trading_state);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.reason_code[trading_action_message_at] == trading_action_message_written.reason_code[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Restriction Message: 17 bytes ----------------------------------- */

/* Reg SHO Short Sale Price Test Restricted Indicator. Sends updates for the Nasdaq market only. */
typedef RegShoRestrictionMessage {
  byte timestamp[8];
  byte stock[8];
  byte reg_sho_action
};

int reg_sho_restriction_message_at;

/* every byte of Reg Sho Restriction Message set to one value */
inline fill_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_value) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = reg_sho_restriction_message_value; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = reg_sho_restriction_message_value;
  skip
}

/* each byte of Reg Sho Restriction Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_restriction_message(reg_sho_restriction_message_record, reg_sho_restriction_message_base) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 0 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = (reg_sho_restriction_message_base + 8 + reg_sho_restriction_message_at + 1) % 256; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = (reg_sho_restriction_message_base + 16 + 1) % 256;
  skip
}

/* Reg Sho Restriction Message to the wire, 17 bytes from where the cursor stands */
inline encode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> wire[at] = reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> wire[at] = reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_restriction_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Restriction Message off the wire, 17 bytes from where the cursor stands */
inline decode_reg_sho_restriction_message(reg_sho_restriction_message_record) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.timestamp[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> reg_sho_restriction_message_record.stock[reg_sho_restriction_message_at] = wire[at]; at = at + 1; reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Restriction Message is what was written, byte for byte */
inline equal_reg_sho_restriction_message(reg_sho_restriction_message_read, reg_sho_restriction_message_written) {
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> assert(reg_sho_restriction_message_read.timestamp[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.timestamp[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  reg_sho_restriction_message_at = 0;
  do
  :: reg_sho_restriction_message_at < 8 -> assert(reg_sho_restriction_message_read.stock[reg_sho_restriction_message_at] == reg_sho_restriction_message_written.stock[reg_sho_restriction_message_at]); reg_sho_restriction_message_at = reg_sho_restriction_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_restriction_message_read.reg_sho_action == reg_sho_restriction_message_written.reg_sho_action);
  skip
}

/* ---- Stock Directory Message: 36 bytes --------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates stock directory messages for all active Nasdaq and non Nasdaq listed security symbols. The Stock Directory can be sent again during the trading day if any value changes. */
typedef StockDirectoryMessage {
  byte timestamp[8];
  byte stock[8];
  byte market_category;
  byte financial_status_indicator;
  byte round_lot_size[4];
  byte round_lots_only;
  byte issue_classification;
  byte issue_sub_type[2];
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte ipo_flag;
  byte luld_reference_price_tier;
  byte etp_flag;
  byte etp_leverage_factor[4];
  byte inverse_indicator
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = stock_directory_message_value;
  stock_directory_message_record.financial_status_indicator = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = stock_directory_message_value;
  stock_directory_message_record.issue_classification = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = stock_directory_message_value;
  stock_directory_message_record.short_sale_threshold_indicator = stock_directory_message_value;
  stock_directory_message_record.ipo_flag = stock_directory_message_value;
  stock_directory_message_record.luld_reference_price_tier = stock_directory_message_value;
  stock_directory_message_record.etp_flag = stock_directory_message_value;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 8 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 16 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 17 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 18 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 22 + 1) % 256;
  stock_directory_message_record.issue_classification = (stock_directory_message_base + 23 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = (stock_directory_message_base + 24 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = (stock_directory_message_base + 26 + 1) % 256;
  stock_directory_message_record.short_sale_threshold_indicator = (stock_directory_message_base + 27 + 1) % 256;
  stock_directory_message_record.ipo_flag = (stock_directory_message_base + 28 + 1) % 256;
  stock_directory_message_record.luld_reference_price_tier = (stock_directory_message_base + 29 + 1) % 256;
  stock_directory_message_record.etp_flag = (stock_directory_message_base + 30 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = (stock_directory_message_base + 31 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = (stock_directory_message_base + 35 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 36 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.timestamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.market_category; at = at + 1;
  wire[at] = stock_directory_message_record.financial_status_indicator; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.round_lot_size[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.round_lots_only; at = at + 1;
  wire[at] = stock_directory_message_record.issue_classification; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.issue_sub_type[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.authenticity; at = at + 1;
  wire[at] = stock_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  wire[at] = stock_directory_message_record.ipo_flag; at = at + 1;
  wire[at] = stock_directory_message_record.luld_reference_price_tier; at = at + 1;
  wire[at] = stock_directory_message_record.etp_flag; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.etp_leverage_factor[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_message_record.inverse_indicator; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 36 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.timestamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = wire[at]; at = at + 1;
  stock_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = wire[at]; at = at + 1;
  stock_directory_message_record.issue_classification = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = wire[at]; at = at + 1;
  stock_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  stock_directory_message_record.ipo_flag = wire[at]; at = at + 1;
  stock_directory_message_record.luld_reference_price_tier = wire[at]; at = at + 1;
  stock_directory_message_record.etp_flag = wire[at]; at = at + 1;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.timestamp[stock_directory_message_at] == stock_directory_message_written.timestamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.market_category == stock_directory_message_written.market_category);
  assert(stock_directory_message_read.financial_status_indicator == stock_directory_message_written.financial_status_indicator);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.round_lot_size[stock_directory_message_at] == stock_directory_message_written.round_lot_size[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.round_lots_only == stock_directory_message_written.round_lots_only);
  assert(stock_directory_message_read.issue_classification == stock_directory_message_written.issue_classification);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.issue_sub_type[stock_directory_message_at] == stock_directory_message_written.issue_sub_type[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.authenticity == stock_directory_message_written.authenticity);
  assert(stock_directory_message_read.short_sale_threshold_indicator == stock_directory_message_written.short_sale_threshold_indicator);
  assert(stock_directory_message_read.ipo_flag == stock_directory_message_written.ipo_flag);
  assert(stock_directory_message_read.luld_reference_price_tier == stock_directory_message_written.luld_reference_price_tier);
  assert(stock_directory_message_read.etp_flag == stock_directory_message_written.etp_flag);
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.etp_leverage_factor[stock_directory_message_at] == stock_directory_message_written.etp_leverage_factor[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  assert(stock_directory_message_read.inverse_indicator == stock_directory_message_written.inverse_indicator);
  skip
}

/* ---- Mwcb Decline Level Message: 32 bytes ------------------------------------ */

/* Informs data recipients what the daily MWCB breach points are set to for the current trading day. */
typedef MwcbDeclineLevelMessage {
  byte timestamp[8];
  byte level_1[8];
  byte level_2[8];
  byte level_3[8]
};

int mwcb_decline_level_message_at;

/* every byte of Mwcb Decline Level Message set to one value */
inline fill_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_value) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mwcb Decline Level Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_base) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 0 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 8 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 16 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 24 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message to the wire, 32 bytes from where the cursor stands */
inline encode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> wire[at] = mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message off the wire, 32 bytes from where the cursor stands */
inline decode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mwcb Decline Level Message is what was written, byte for byte */
inline equal_mwcb_decline_level_message(mwcb_decline_level_message_read, mwcb_decline_level_message_written) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.timestamp[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.timestamp[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_1[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_1[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_2[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_2[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> assert(mwcb_decline_level_message_read.level_3[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.level_3[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mwcb Status Message: 9 bytes -------------------------------------------- */

/* Informs data recipients when a MWCB has breached one of the established levels. */
typedef MwcbStatusMessage {
  byte timestamp[8];
  byte breached_level
};

int mwcb_status_message_at;

/* every byte of Mwcb Status Message set to one value */
inline fill_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_value) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 8 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = mwcb_status_message_value; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = mwcb_status_message_value;
  skip
}

/* each byte of Mwcb Status Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_base) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 8 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = (mwcb_status_message_base + 0 + mwcb_status_message_at + 1) % 256; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = (mwcb_status_message_base + 8 + 1) % 256;
  skip
}

/* Mwcb Status Message to the wire, 9 bytes from where the cursor stands */
inline encode_mwcb_status_message(mwcb_status_message_record) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 8 -> wire[at] = mwcb_status_message_record.timestamp[mwcb_status_message_at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  wire[at] = mwcb_status_message_record.breached_level; at = at + 1;
  skip
}

/* Mwcb Status Message off the wire, 9 bytes from where the cursor stands */
inline decode_mwcb_status_message(mwcb_status_message_record) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 8 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = wire[at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Mwcb Status Message is what was written, byte for byte */
inline equal_mwcb_status_message(mwcb_status_message_read, mwcb_status_message_written) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 8 -> assert(mwcb_status_message_read.timestamp[mwcb_status_message_at] == mwcb_status_message_written.timestamp[mwcb_status_message_at]); mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  assert(mwcb_status_message_read.breached_level == mwcb_status_message_written.breached_level);
  skip
}

/* ---- Ipo Quoting Period Update: 29 bytes ------------------------------------- */

/* Indicates the anticipated IPO quotation release time of a security. Populated for the Nasdaq market only. */
typedef IpoQuotingPeriodUpdate {
  byte timestamp[8];
  byte stock[8];
  byte ipo_quotation_release_time[4];
  byte ipo_quotation_release_qualifier;
  byte ipo_price[8]
};

int ipo_quoting_period_update_at;

/* every byte of Ipo Quoting Period Update set to one value */
inline fill_ipo_quoting_period_update(ipo_quoting_period_update_record, ipo_quoting_period_update_value) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.stock[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_quotation_release_time[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_record.ipo_quotation_release_qualifier = ipo_quoting_period_update_value;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ipo Quoting Period Update set to where it lies, so a field read out of place says so */
inline ramp_ipo_quoting_period_update(ipo_quoting_period_update_record, ipo_quoting_period_update_base) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 0 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.stock[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 8 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_quotation_release_time[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 16 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_record.ipo_quotation_release_qualifier = (ipo_quoting_period_update_base + 20 + 1) % 256;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 21 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update to the wire, 29 bytes from where the cursor stands */
inline encode_ipo_quoting_period_update(ipo_quoting_period_update_record) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> wire[at] = ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> wire[at] = ipo_quoting_period_update_record.stock[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> wire[at] = ipo_quoting_period_update_record.ipo_quotation_release_time[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  wire[at] = ipo_quoting_period_update_record.ipo_quotation_release_qualifier; at = at + 1;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> wire[at] = ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update off the wire, 29 bytes from where the cursor stands */
inline decode_ipo_quoting_period_update(ipo_quoting_period_update_record) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.stock[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_quotation_release_time[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_record.ipo_quotation_release_qualifier = wire[at]; at = at + 1;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ipo Quoting Period Update is what was written, byte for byte */
inline equal_ipo_quoting_period_update(ipo_quoting_period_update_read, ipo_quoting_period_update_written) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> assert(ipo_quoting_period_update_read.timestamp[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.timestamp[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> assert(ipo_quoting_period_update_read.stock[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.stock[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> assert(ipo_quoting_period_update_read.ipo_quotation_release_time[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.ipo_quotation_release_time[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  assert(ipo_quoting_period_update_read.ipo_quotation_release_qualifier == ipo_quoting_period_update_written.ipo_quotation_release_qualifier);
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> assert(ipo_quoting_period_update_read.ipo_price[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.ipo_price[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Operational Halt Message: 18 bytes -------------------------------------- */

/* The Exchange uses this message to indicate the current Operational Status of a security to the trading community, for the three market centers operated by Nasdaq. */
typedef OperationalHaltMessage {
  byte timestamp[8];
  byte stock[8];
  byte market_code;
  byte operational_halt_action
};

int operational_halt_message_at;

/* every byte of Operational Halt Message set to one value */
inline fill_operational_halt_message(operational_halt_message_record, operational_halt_message_value) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.timestamp[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = operational_halt_message_value;
  operational_halt_message_record.operational_halt_action = operational_halt_message_value;
  skip
}

/* each byte of Operational Halt Message set to where it lies, so a field read out of place says so */
inline ramp_operational_halt_message(operational_halt_message_record, operational_halt_message_base) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.timestamp[operational_halt_message_at] = (operational_halt_message_base + 0 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = (operational_halt_message_base + 8 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = (operational_halt_message_base + 16 + 1) % 256;
  operational_halt_message_record.operational_halt_action = (operational_halt_message_base + 17 + 1) % 256;
  skip
}

/* Operational Halt Message to the wire, 18 bytes from where the cursor stands */
inline encode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> wire[at] = operational_halt_message_record.timestamp[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> wire[at] = operational_halt_message_record.stock[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  wire[at] = operational_halt_message_record.market_code; at = at + 1;
  wire[at] = operational_halt_message_record.operational_halt_action; at = at + 1;
  skip
}

/* Operational Halt Message off the wire, 18 bytes from where the cursor stands */
inline decode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.timestamp[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = wire[at]; at = at + 1;
  operational_halt_message_record.operational_halt_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Operational Halt Message is what was written, byte for byte */
inline equal_operational_halt_message(operational_halt_message_read, operational_halt_message_written) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> assert(operational_halt_message_read.timestamp[operational_halt_message_at] == operational_halt_message_written.timestamp[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> assert(operational_halt_message_read.stock[operational_halt_message_at] == operational_halt_message_written.stock[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  assert(operational_halt_message_read.market_code == operational_halt_message_written.market_code);
  assert(operational_halt_message_read.operational_halt_action == operational_halt_message_written.operational_halt_action);
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Consolidated Quotation Message: encoded, read back, and compared */
proctype check_consolidated_quotation_message() {
  ConsolidatedQuotationMessage consolidated_quotation_message_sent;
  ConsolidatedQuotationMessage consolidated_quotation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_quotation_message(consolidated_quotation_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_quotation_message(consolidated_quotation_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_quotation_message(consolidated_quotation_message_sent, 255)
  :: else -> ramp_consolidated_quotation_message(consolidated_quotation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_quotation_message(consolidated_quotation_message_sent);
    assert(at == 42);
    at = 0;
    decode_consolidated_quotation_message(consolidated_quotation_message_got);
    assert(at == 42);
    equal_consolidated_quotation_message(consolidated_quotation_message_got, consolidated_quotation_message_sent)
  }
}

/* Retail Price Improvement Message: encoded, read back, and compared */
proctype check_retail_price_improvement_message() {
  RetailPriceImprovementMessage retail_price_improvement_message_sent;
  RetailPriceImprovementMessage retail_price_improvement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  :: pattern == 1 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 32)
  :: pattern == 2 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 255)
  :: else -> ramp_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_price_improvement_message(retail_price_improvement_message_sent);
    assert(at == 18);
    at = 0;
    decode_retail_price_improvement_message(retail_price_improvement_message_got);
    assert(at == 18);
    equal_retail_price_improvement_message(retail_price_improvement_message_got, retail_price_improvement_message_sent)
  }
}

/* Trading Action Message: encoded, read back, and compared */
proctype check_trading_action_message() {
  TradingActionMessage trading_action_message_sent;
  TradingActionMessage trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_action_message(trading_action_message_sent, 0)
  :: pattern == 1 -> fill_trading_action_message(trading_action_message_sent, 32)
  :: pattern == 2 -> fill_trading_action_message(trading_action_message_sent, 255)
  :: else -> ramp_trading_action_message(trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_action_message(trading_action_message_sent);
    assert(at == 21);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 21);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
  }
}

/* Reg Sho Restriction Message: encoded, read back, and compared */
proctype check_reg_sho_restriction_message() {
  RegShoRestrictionMessage reg_sho_restriction_message_sent;
  RegShoRestrictionMessage reg_sho_restriction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_restriction_message(reg_sho_restriction_message_sent, 255)
  :: else -> ramp_reg_sho_restriction_message(reg_sho_restriction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_restriction_message(reg_sho_restriction_message_sent);
    assert(at == 17);
    at = 0;
    decode_reg_sho_restriction_message(reg_sho_restriction_message_got);
    assert(at == 17);
    equal_reg_sho_restriction_message(reg_sho_restriction_message_got, reg_sho_restriction_message_sent)
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
    assert(at == 36);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 36);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Mwcb Decline Level Message: encoded, read back, and compared */
proctype check_mwcb_decline_level_message() {
  MwcbDeclineLevelMessage mwcb_decline_level_message_sent;
  MwcbDeclineLevelMessage mwcb_decline_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_decline_level_message(mwcb_decline_level_message_sent, 255)
  :: else -> ramp_mwcb_decline_level_message(mwcb_decline_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_decline_level_message(mwcb_decline_level_message_sent);
    assert(at == 32);
    at = 0;
    decode_mwcb_decline_level_message(mwcb_decline_level_message_got);
    assert(at == 32);
    equal_mwcb_decline_level_message(mwcb_decline_level_message_got, mwcb_decline_level_message_sent)
  }
}

/* Mwcb Status Message: encoded, read back, and compared */
proctype check_mwcb_status_message() {
  MwcbStatusMessage mwcb_status_message_sent;
  MwcbStatusMessage mwcb_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_status_message(mwcb_status_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_status_message(mwcb_status_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_status_message(mwcb_status_message_sent, 255)
  :: else -> ramp_mwcb_status_message(mwcb_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_status_message(mwcb_status_message_sent);
    assert(at == 9);
    at = 0;
    decode_mwcb_status_message(mwcb_status_message_got);
    assert(at == 9);
    equal_mwcb_status_message(mwcb_status_message_got, mwcb_status_message_sent)
  }
}

/* Ipo Quoting Period Update: encoded, read back, and compared */
proctype check_ipo_quoting_period_update() {
  IpoQuotingPeriodUpdate ipo_quoting_period_update_sent;
  IpoQuotingPeriodUpdate ipo_quoting_period_update_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ipo_quoting_period_update(ipo_quoting_period_update_sent, 0)
  :: pattern == 1 -> fill_ipo_quoting_period_update(ipo_quoting_period_update_sent, 32)
  :: pattern == 2 -> fill_ipo_quoting_period_update(ipo_quoting_period_update_sent, 255)
  :: else -> ramp_ipo_quoting_period_update(ipo_quoting_period_update_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ipo_quoting_period_update(ipo_quoting_period_update_sent);
    assert(at == 29);
    at = 0;
    decode_ipo_quoting_period_update(ipo_quoting_period_update_got);
    assert(at == 29);
    equal_ipo_quoting_period_update(ipo_quoting_period_update_got, ipo_quoting_period_update_sent)
  }
}

/* Operational Halt Message: encoded, read back, and compared */
proctype check_operational_halt_message() {
  OperationalHaltMessage operational_halt_message_sent;
  OperationalHaltMessage operational_halt_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_operational_halt_message(operational_halt_message_sent, 0)
  :: pattern == 1 -> fill_operational_halt_message(operational_halt_message_sent, 32)
  :: pattern == 2 -> fill_operational_halt_message(operational_halt_message_sent, 255)
  :: else -> ramp_operational_halt_message(operational_halt_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_operational_halt_message(operational_halt_message_sent);
    assert(at == 18);
    at = 0;
    decode_operational_halt_message(operational_halt_message_got);
    assert(at == 18);
    equal_operational_halt_message(operational_halt_message_got, operational_halt_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_consolidated_quotation_message()
  :: run check_retail_price_improvement_message()
  :: run check_trading_action_message()
  :: run check_reg_sho_restriction_message()
  :: run check_stock_directory_message()
  :: run check_mwcb_decline_level_message()
  :: run check_mwcb_status_message()
  :: run check_ipo_quoting_period_update()
  :: run check_operational_halt_message()
  fi
}
