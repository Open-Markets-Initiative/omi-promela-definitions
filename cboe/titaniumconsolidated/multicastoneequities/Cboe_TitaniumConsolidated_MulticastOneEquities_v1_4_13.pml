/*
 * Chicago Board Options Exchange Multicast One Equities
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
 *   - a run filling what frames it
 *   - a field read in bits
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

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Clear Quote Message: 17 bytes ------------------------------------------- */

/* The Clear Quote message instructs feed recipients to clear all quotes and Summary and/or ADAP information for the specified symbol on the specified market(s). */
typedef ClearQuoteMessage {
  byte last_update_timestamp[8];
  byte symbol_short[8];
  byte market_center
};

int clear_quote_message_at;

/* every byte of Clear Quote Message set to one value */
inline fill_clear_quote_message(clear_quote_message_record, clear_quote_message_value) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = clear_quote_message_value; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol_short[clear_quote_message_at] = clear_quote_message_value; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = clear_quote_message_value;
  skip
}

/* each byte of Clear Quote Message set to where it lies, so a field read out of place says so */
inline ramp_clear_quote_message(clear_quote_message_record, clear_quote_message_base) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = (clear_quote_message_base + 0 + clear_quote_message_at + 1) % 256; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol_short[clear_quote_message_at] = (clear_quote_message_base + 8 + clear_quote_message_at + 1) % 256; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = (clear_quote_message_base + 16 + 1) % 256;
  skip
}

/* Clear Quote Message to the wire, 17 bytes from where the cursor stands */
inline encode_clear_quote_message(clear_quote_message_record) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> wire[at] = clear_quote_message_record.last_update_timestamp[clear_quote_message_at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> wire[at] = clear_quote_message_record.symbol_short[clear_quote_message_at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = clear_quote_message_record.market_center; at = at + 1;
  skip
}

/* Clear Quote Message off the wire, 17 bytes from where the cursor stands */
inline decode_clear_quote_message(clear_quote_message_record) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.last_update_timestamp[clear_quote_message_at] = wire[at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol_short[clear_quote_message_at] = wire[at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.market_center = wire[at]; at = at + 1;
  skip
}

/* what was read of Clear Quote Message is what was written, byte for byte */
inline equal_clear_quote_message(clear_quote_message_read, clear_quote_message_written) {
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> assert(clear_quote_message_read.last_update_timestamp[clear_quote_message_at] == clear_quote_message_written.last_update_timestamp[clear_quote_message_at]); clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_at = 0;
  do
  :: clear_quote_message_at < 8 -> assert(clear_quote_message_read.symbol_short[clear_quote_message_at] == clear_quote_message_written.symbol_short[clear_quote_message_at]); clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  assert(clear_quote_message_read.market_center == clear_quote_message_written.market_center);
  skip
}

/* ---- Expanded Clear Quote Message: 23 bytes ---------------------------------- */

/* The Expanded Clear Quote message instructs feed recipients to clear all quotes and Summary and/or ADAP information for the specified symbol on the specified market(s). Used when the symbol exceeds eight characters. */
typedef ExpandedClearQuoteMessage {
  byte last_update_timestamp[8];
  byte symbol_long[14];
  byte market_center
};

int expanded_clear_quote_message_at;

/* every byte of Expanded Clear Quote Message set to one value */
inline fill_expanded_clear_quote_message(expanded_clear_quote_message_record, expanded_clear_quote_message_value) {
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 8 -> expanded_clear_quote_message_record.last_update_timestamp[expanded_clear_quote_message_at] = expanded_clear_quote_message_value; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 14 -> expanded_clear_quote_message_record.symbol_long[expanded_clear_quote_message_at] = expanded_clear_quote_message_value; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_record.market_center = expanded_clear_quote_message_value;
  skip
}

/* each byte of Expanded Clear Quote Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_clear_quote_message(expanded_clear_quote_message_record, expanded_clear_quote_message_base) {
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 8 -> expanded_clear_quote_message_record.last_update_timestamp[expanded_clear_quote_message_at] = (expanded_clear_quote_message_base + 0 + expanded_clear_quote_message_at + 1) % 256; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 14 -> expanded_clear_quote_message_record.symbol_long[expanded_clear_quote_message_at] = (expanded_clear_quote_message_base + 8 + expanded_clear_quote_message_at + 1) % 256; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_record.market_center = (expanded_clear_quote_message_base + 22 + 1) % 256;
  skip
}

/* Expanded Clear Quote Message to the wire, 23 bytes from where the cursor stands */
inline encode_expanded_clear_quote_message(expanded_clear_quote_message_record) {
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 8 -> wire[at] = expanded_clear_quote_message_record.last_update_timestamp[expanded_clear_quote_message_at]; at = at + 1; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 14 -> wire[at] = expanded_clear_quote_message_record.symbol_long[expanded_clear_quote_message_at]; at = at + 1; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_clear_quote_message_record.market_center; at = at + 1;
  skip
}

/* Expanded Clear Quote Message off the wire, 23 bytes from where the cursor stands */
inline decode_expanded_clear_quote_message(expanded_clear_quote_message_record) {
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 8 -> expanded_clear_quote_message_record.last_update_timestamp[expanded_clear_quote_message_at] = wire[at]; at = at + 1; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 14 -> expanded_clear_quote_message_record.symbol_long[expanded_clear_quote_message_at] = wire[at]; at = at + 1; expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_record.market_center = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Clear Quote Message is what was written, byte for byte */
inline equal_expanded_clear_quote_message(expanded_clear_quote_message_read, expanded_clear_quote_message_written) {
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 8 -> assert(expanded_clear_quote_message_read.last_update_timestamp[expanded_clear_quote_message_at] == expanded_clear_quote_message_written.last_update_timestamp[expanded_clear_quote_message_at]); expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  expanded_clear_quote_message_at = 0;
  do
  :: expanded_clear_quote_message_at < 14 -> assert(expanded_clear_quote_message_read.symbol_long[expanded_clear_quote_message_at] == expanded_clear_quote_message_written.symbol_long[expanded_clear_quote_message_at]); expanded_clear_quote_message_at = expanded_clear_quote_message_at + 1
  :: else -> break
  od;
  assert(expanded_clear_quote_message_read.market_center == expanded_clear_quote_message_written.market_center);
  skip
}

/* ---- Expanded Fractional Symbol Summary Message: 71 bytes -------------------- */

/* The Expanded Fractional Symbol Summary message delivers the Cboe consolidated best bid/offer and total executed volume across all applicable Cboe One Canada books. Used when the symbol exceeds eight characters. */
typedef ExpandedFractionalSymbolSummaryMessage {
  byte last_update_timestamp[8];
  byte symbol_long[14];
  byte cboe_cumulative_executed_volume[8];
  byte consolidated_best_bid_price[8];
  byte consolidated_best_bid_quantity[8];
  byte consolidated_best_ask_price[8];
  byte consolidated_best_ask_quantity[8];
  byte national_cumulative_volume[8];
  byte reserved_1
};

int expanded_fractional_symbol_summary_message_at;

/* every byte of Expanded Fractional Symbol Summary Message set to one value */
inline fill_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_record, expanded_fractional_symbol_summary_message_value) {
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.last_update_timestamp[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 14 -> expanded_fractional_symbol_summary_message_record.symbol_long[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.national_cumulative_volume[expanded_fractional_symbol_summary_message_at] = expanded_fractional_symbol_summary_message_value; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_record.reserved_1 = expanded_fractional_symbol_summary_message_value;
  skip
}

/* each byte of Expanded Fractional Symbol Summary Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_record, expanded_fractional_symbol_summary_message_base) {
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.last_update_timestamp[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 0 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 14 -> expanded_fractional_symbol_summary_message_record.symbol_long[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 8 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 22 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 30 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 38 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 46 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 54 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.national_cumulative_volume[expanded_fractional_symbol_summary_message_at] = (expanded_fractional_symbol_summary_message_base + 62 + expanded_fractional_symbol_summary_message_at + 1) % 256; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_record.reserved_1 = (expanded_fractional_symbol_summary_message_base + 70 + 1) % 256;
  skip
}

/* Expanded Fractional Symbol Summary Message to the wire, 71 bytes from where the cursor stands */
inline encode_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_record) {
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.last_update_timestamp[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 14 -> wire[at] = expanded_fractional_symbol_summary_message_record.symbol_long[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> wire[at] = expanded_fractional_symbol_summary_message_record.national_cumulative_volume[expanded_fractional_symbol_summary_message_at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_symbol_summary_message_record.reserved_1; at = at + 1;
  skip
}

/* Expanded Fractional Symbol Summary Message off the wire, 71 bytes from where the cursor stands */
inline decode_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_record) {
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.last_update_timestamp[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 14 -> expanded_fractional_symbol_summary_message_record.symbol_long[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> expanded_fractional_symbol_summary_message_record.national_cumulative_volume[expanded_fractional_symbol_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Fractional Symbol Summary Message is what was written, byte for byte */
inline equal_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_read, expanded_fractional_symbol_summary_message_written) {
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.last_update_timestamp[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.last_update_timestamp[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 14 -> assert(expanded_fractional_symbol_summary_message_read.symbol_long[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.symbol_long[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.cboe_cumulative_executed_volume[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.consolidated_best_bid_price[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.consolidated_best_bid_quantity[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.consolidated_best_ask_price[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.consolidated_best_ask_quantity[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_symbol_summary_message_at = 0;
  do
  :: expanded_fractional_symbol_summary_message_at < 8 -> assert(expanded_fractional_symbol_summary_message_read.national_cumulative_volume[expanded_fractional_symbol_summary_message_at] == expanded_fractional_symbol_summary_message_written.national_cumulative_volume[expanded_fractional_symbol_summary_message_at]); expanded_fractional_symbol_summary_message_at = expanded_fractional_symbol_summary_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_symbol_summary_message_read.reserved_1 == expanded_fractional_symbol_summary_message_written.reserved_1);
  skip
}

/* ---- Best Quote Update Message: 33 bytes ------------------------------------- */

/* The Best Quote Update message is used to update one side of the Cboe consolidated quote information for a symbol. */
typedef BestQuoteUpdateMessage {
  byte last_update_timestamp[8];
  byte symbol_short[8];
  byte side_indicator;
  byte consolidated_best_quote_price[8];
  byte consolidated_quote_quantity[8]
};

int best_quote_update_message_at;

/* every byte of Best Quote Update Message set to one value */
inline fill_best_quote_update_message(best_quote_update_message_record, best_quote_update_message_value) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol_short[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = best_quote_update_message_value;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = best_quote_update_message_value; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Quote Update Message set to where it lies, so a field read out of place says so */
inline ramp_best_quote_update_message(best_quote_update_message_record, best_quote_update_message_base) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = (best_quote_update_message_base + 0 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol_short[best_quote_update_message_at] = (best_quote_update_message_base + 8 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = (best_quote_update_message_base + 16 + 1) % 256;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = (best_quote_update_message_base + 17 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = (best_quote_update_message_base + 25 + best_quote_update_message_at + 1) % 256; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Quote Update Message to the wire, 33 bytes from where the cursor stands */
inline encode_best_quote_update_message(best_quote_update_message_record) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.symbol_short[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  wire[at] = best_quote_update_message_record.side_indicator; at = at + 1;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> wire[at] = best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Quote Update Message off the wire, 33 bytes from where the cursor stands */
inline decode_best_quote_update_message(best_quote_update_message_record) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.last_update_timestamp[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.symbol_short[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_record.side_indicator = wire[at]; at = at + 1;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_best_quote_price[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> best_quote_update_message_record.consolidated_quote_quantity[best_quote_update_message_at] = wire[at]; at = at + 1; best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Quote Update Message is what was written, byte for byte */
inline equal_best_quote_update_message(best_quote_update_message_read, best_quote_update_message_written) {
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.last_update_timestamp[best_quote_update_message_at] == best_quote_update_message_written.last_update_timestamp[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.symbol_short[best_quote_update_message_at] == best_quote_update_message_written.symbol_short[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  assert(best_quote_update_message_read.side_indicator == best_quote_update_message_written.side_indicator);
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.consolidated_best_quote_price[best_quote_update_message_at] == best_quote_update_message_written.consolidated_best_quote_price[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  best_quote_update_message_at = 0;
  do
  :: best_quote_update_message_at < 8 -> assert(best_quote_update_message_read.consolidated_quote_quantity[best_quote_update_message_at] == best_quote_update_message_written.consolidated_quote_quantity[best_quote_update_message_at]); best_quote_update_message_at = best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Best Quote Update Message: 39 bytes ---------------------------- */

/* The Expanded Best Quote Update message is used to update one side of the Cboe consolidated quote information for a symbol. Used when the symbol exceeds eight characters. */
typedef ExpandedBestQuoteUpdateMessage {
  byte last_update_timestamp[8];
  byte symbol_long[14];
  byte side_indicator;
  byte consolidated_best_quote_price[8];
  byte consolidated_quote_quantity[8]
};

int expanded_best_quote_update_message_at;

/* every byte of Expanded Best Quote Update Message set to one value */
inline fill_expanded_best_quote_update_message(expanded_best_quote_update_message_record, expanded_best_quote_update_message_value) {
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.last_update_timestamp[expanded_best_quote_update_message_at] = expanded_best_quote_update_message_value; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 14 -> expanded_best_quote_update_message_record.symbol_long[expanded_best_quote_update_message_at] = expanded_best_quote_update_message_value; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_record.side_indicator = expanded_best_quote_update_message_value;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_best_quote_price[expanded_best_quote_update_message_at] = expanded_best_quote_update_message_value; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_quote_quantity[expanded_best_quote_update_message_at] = expanded_best_quote_update_message_value; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Best Quote Update Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_best_quote_update_message(expanded_best_quote_update_message_record, expanded_best_quote_update_message_base) {
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.last_update_timestamp[expanded_best_quote_update_message_at] = (expanded_best_quote_update_message_base + 0 + expanded_best_quote_update_message_at + 1) % 256; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 14 -> expanded_best_quote_update_message_record.symbol_long[expanded_best_quote_update_message_at] = (expanded_best_quote_update_message_base + 8 + expanded_best_quote_update_message_at + 1) % 256; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_record.side_indicator = (expanded_best_quote_update_message_base + 22 + 1) % 256;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_best_quote_price[expanded_best_quote_update_message_at] = (expanded_best_quote_update_message_base + 23 + expanded_best_quote_update_message_at + 1) % 256; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_quote_quantity[expanded_best_quote_update_message_at] = (expanded_best_quote_update_message_base + 31 + expanded_best_quote_update_message_at + 1) % 256; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Best Quote Update Message to the wire, 39 bytes from where the cursor stands */
inline encode_expanded_best_quote_update_message(expanded_best_quote_update_message_record) {
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> wire[at] = expanded_best_quote_update_message_record.last_update_timestamp[expanded_best_quote_update_message_at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 14 -> wire[at] = expanded_best_quote_update_message_record.symbol_long[expanded_best_quote_update_message_at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_best_quote_update_message_record.side_indicator; at = at + 1;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> wire[at] = expanded_best_quote_update_message_record.consolidated_best_quote_price[expanded_best_quote_update_message_at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> wire[at] = expanded_best_quote_update_message_record.consolidated_quote_quantity[expanded_best_quote_update_message_at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Best Quote Update Message off the wire, 39 bytes from where the cursor stands */
inline decode_expanded_best_quote_update_message(expanded_best_quote_update_message_record) {
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.last_update_timestamp[expanded_best_quote_update_message_at] = wire[at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 14 -> expanded_best_quote_update_message_record.symbol_long[expanded_best_quote_update_message_at] = wire[at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_record.side_indicator = wire[at]; at = at + 1;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_best_quote_price[expanded_best_quote_update_message_at] = wire[at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> expanded_best_quote_update_message_record.consolidated_quote_quantity[expanded_best_quote_update_message_at] = wire[at]; at = at + 1; expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Best Quote Update Message is what was written, byte for byte */
inline equal_expanded_best_quote_update_message(expanded_best_quote_update_message_read, expanded_best_quote_update_message_written) {
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> assert(expanded_best_quote_update_message_read.last_update_timestamp[expanded_best_quote_update_message_at] == expanded_best_quote_update_message_written.last_update_timestamp[expanded_best_quote_update_message_at]); expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 14 -> assert(expanded_best_quote_update_message_read.symbol_long[expanded_best_quote_update_message_at] == expanded_best_quote_update_message_written.symbol_long[expanded_best_quote_update_message_at]); expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  assert(expanded_best_quote_update_message_read.side_indicator == expanded_best_quote_update_message_written.side_indicator);
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> assert(expanded_best_quote_update_message_read.consolidated_best_quote_price[expanded_best_quote_update_message_at] == expanded_best_quote_update_message_written.consolidated_best_quote_price[expanded_best_quote_update_message_at]); expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  expanded_best_quote_update_message_at = 0;
  do
  :: expanded_best_quote_update_message_at < 8 -> assert(expanded_best_quote_update_message_read.consolidated_quote_quantity[expanded_best_quote_update_message_at] == expanded_best_quote_update_message_written.consolidated_quote_quantity[expanded_best_quote_update_message_at]); expanded_best_quote_update_message_at = expanded_best_quote_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cboe Market Status Message: 11 bytes ------------------------------------ */

/* The Cboe Market Status message is disseminated to reflect a change in the status of a market. */
typedef CboeMarketStatusMessage {
  byte timestamp[8];
  byte market_center;
  byte market_status;
  byte session_indicator
};

int cboe_market_status_message_at;

/* every byte of Cboe Market Status Message set to one value */
inline fill_cboe_market_status_message(cboe_market_status_message_record, cboe_market_status_message_value) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = cboe_market_status_message_value; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = cboe_market_status_message_value;
  cboe_market_status_message_record.market_status = cboe_market_status_message_value;
  cboe_market_status_message_record.session_indicator = cboe_market_status_message_value;
  skip
}

/* each byte of Cboe Market Status Message set to where it lies, so a field read out of place says so */
inline ramp_cboe_market_status_message(cboe_market_status_message_record, cboe_market_status_message_base) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = (cboe_market_status_message_base + 0 + cboe_market_status_message_at + 1) % 256; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = (cboe_market_status_message_base + 8 + 1) % 256;
  cboe_market_status_message_record.market_status = (cboe_market_status_message_base + 9 + 1) % 256;
  cboe_market_status_message_record.session_indicator = (cboe_market_status_message_base + 10 + 1) % 256;
  skip
}

/* Cboe Market Status Message to the wire, 11 bytes from where the cursor stands */
inline encode_cboe_market_status_message(cboe_market_status_message_record) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> wire[at] = cboe_market_status_message_record.timestamp[cboe_market_status_message_at]; at = at + 1; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  wire[at] = cboe_market_status_message_record.market_center; at = at + 1;
  wire[at] = cboe_market_status_message_record.market_status; at = at + 1;
  wire[at] = cboe_market_status_message_record.session_indicator; at = at + 1;
  skip
}

/* Cboe Market Status Message off the wire, 11 bytes from where the cursor stands */
inline decode_cboe_market_status_message(cboe_market_status_message_record) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> cboe_market_status_message_record.timestamp[cboe_market_status_message_at] = wire[at]; at = at + 1; cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  cboe_market_status_message_record.market_center = wire[at]; at = at + 1;
  cboe_market_status_message_record.market_status = wire[at]; at = at + 1;
  cboe_market_status_message_record.session_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Cboe Market Status Message is what was written, byte for byte */
inline equal_cboe_market_status_message(cboe_market_status_message_read, cboe_market_status_message_written) {
  cboe_market_status_message_at = 0;
  do
  :: cboe_market_status_message_at < 8 -> assert(cboe_market_status_message_read.timestamp[cboe_market_status_message_at] == cboe_market_status_message_written.timestamp[cboe_market_status_message_at]); cboe_market_status_message_at = cboe_market_status_message_at + 1
  :: else -> break
  od;
  assert(cboe_market_status_message_read.market_center == cboe_market_status_message_written.market_center);
  assert(cboe_market_status_message_read.market_status == cboe_market_status_message_written.market_status);
  assert(cboe_market_status_message_read.session_indicator == cboe_market_status_message_written.session_indicator);
  skip
}

/* ---- Short Update Adap Block: 10 bytes --------------------------------------- */

/* Short Update ADAP Block */
typedef ShortUpdateAdapBlock {
  byte market_center;
  byte side;
  byte price_short[4];
  byte quantity_short[4]
};

int short_update_adap_block_at;

/* every byte of Short Update Adap Block set to one value */
inline fill_short_update_adap_block(short_update_adap_block_record, short_update_adap_block_value) {
  short_update_adap_block_record.market_center = short_update_adap_block_value;
  short_update_adap_block_record.side = short_update_adap_block_value;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = short_update_adap_block_value; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = short_update_adap_block_value; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Update Adap Block set to where it lies, so a field read out of place says so */
inline ramp_short_update_adap_block(short_update_adap_block_record, short_update_adap_block_base) {
  short_update_adap_block_record.market_center = (short_update_adap_block_base + 0 + 1) % 256;
  short_update_adap_block_record.side = (short_update_adap_block_base + 1 + 1) % 256;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = (short_update_adap_block_base + 2 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = (short_update_adap_block_base + 6 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Short Update Adap Block to the wire, 10 bytes from where the cursor stands */
inline encode_short_update_adap_block(short_update_adap_block_record) {
  wire[at] = short_update_adap_block_record.market_center; at = at + 1;
  wire[at] = short_update_adap_block_record.side; at = at + 1;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> wire[at] = short_update_adap_block_record.price_short[short_update_adap_block_at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> wire[at] = short_update_adap_block_record.quantity_short[short_update_adap_block_at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Short Update Adap Block off the wire, 10 bytes from where the cursor stands */
inline decode_short_update_adap_block(short_update_adap_block_record) {
  short_update_adap_block_record.market_center = wire[at]; at = at + 1;
  short_update_adap_block_record.side = wire[at]; at = at + 1;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = wire[at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = wire[at]; at = at + 1; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Update Adap Block is what was written, byte for byte */
inline equal_short_update_adap_block(short_update_adap_block_read, short_update_adap_block_written) {
  assert(short_update_adap_block_read.market_center == short_update_adap_block_written.market_center);
  assert(short_update_adap_block_read.side == short_update_adap_block_written.side);
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> assert(short_update_adap_block_read.price_short[short_update_adap_block_at] == short_update_adap_block_written.price_short[short_update_adap_block_at]); short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> assert(short_update_adap_block_read.quantity_short[short_update_adap_block_at] == short_update_adap_block_written.quantity_short[short_update_adap_block_at]); short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Update Adap Block: 18 bytes ---------------------------------------- */

/* Long Update ADAP Block */
typedef LongUpdateAdapBlock {
  byte market_center;
  byte side;
  byte price_long[8];
  byte quantity_long[8]
};

int long_update_adap_block_at;

/* every byte of Long Update Adap Block set to one value */
inline fill_long_update_adap_block(long_update_adap_block_record, long_update_adap_block_value) {
  long_update_adap_block_record.market_center = long_update_adap_block_value;
  long_update_adap_block_record.side = long_update_adap_block_value;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = long_update_adap_block_value; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = long_update_adap_block_value; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Update Adap Block set to where it lies, so a field read out of place says so */
inline ramp_long_update_adap_block(long_update_adap_block_record, long_update_adap_block_base) {
  long_update_adap_block_record.market_center = (long_update_adap_block_base + 0 + 1) % 256;
  long_update_adap_block_record.side = (long_update_adap_block_base + 1 + 1) % 256;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = (long_update_adap_block_base + 2 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = (long_update_adap_block_base + 10 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Long Update Adap Block to the wire, 18 bytes from where the cursor stands */
inline encode_long_update_adap_block(long_update_adap_block_record) {
  wire[at] = long_update_adap_block_record.market_center; at = at + 1;
  wire[at] = long_update_adap_block_record.side; at = at + 1;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> wire[at] = long_update_adap_block_record.price_long[long_update_adap_block_at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> wire[at] = long_update_adap_block_record.quantity_long[long_update_adap_block_at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Long Update Adap Block off the wire, 18 bytes from where the cursor stands */
inline decode_long_update_adap_block(long_update_adap_block_record) {
  long_update_adap_block_record.market_center = wire[at]; at = at + 1;
  long_update_adap_block_record.side = wire[at]; at = at + 1;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = wire[at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = wire[at]; at = at + 1; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Update Adap Block is what was written, byte for byte */
inline equal_long_update_adap_block(long_update_adap_block_read, long_update_adap_block_written) {
  assert(long_update_adap_block_read.market_center == long_update_adap_block_written.market_center);
  assert(long_update_adap_block_read.side == long_update_adap_block_written.side);
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> assert(long_update_adap_block_read.price_long[long_update_adap_block_at] == long_update_adap_block_written.price_long[long_update_adap_block_at]); long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> assert(long_update_adap_block_read.quantity_long[long_update_adap_block_at] == long_update_adap_block_written.quantity_long[long_update_adap_block_at]); long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Rpi Message: 18 bytes --------------------------------------------------- */

/* The Retail Price Improvement (RPI) message is a retail liquidity indicator that includes symbol and side, but not price and size. US Only. */
typedef RpiMessage {
  byte timestamp[8];
  byte symbol_short[8];
  byte market_center;
  byte retail_price_improvement
};

int rpi_message_at;

/* every byte of Rpi Message set to one value */
inline fill_rpi_message(rpi_message_record, rpi_message_value) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = rpi_message_value; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol_short[rpi_message_at] = rpi_message_value; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = rpi_message_value;
  rpi_message_record.retail_price_improvement = rpi_message_value;
  skip
}

/* each byte of Rpi Message set to where it lies, so a field read out of place says so */
inline ramp_rpi_message(rpi_message_record, rpi_message_base) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = (rpi_message_base + 0 + rpi_message_at + 1) % 256; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol_short[rpi_message_at] = (rpi_message_base + 8 + rpi_message_at + 1) % 256; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = (rpi_message_base + 16 + 1) % 256;
  rpi_message_record.retail_price_improvement = (rpi_message_base + 17 + 1) % 256;
  skip
}

/* Rpi Message to the wire, 18 bytes from where the cursor stands */
inline encode_rpi_message(rpi_message_record) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> wire[at] = rpi_message_record.timestamp[rpi_message_at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> wire[at] = rpi_message_record.symbol_short[rpi_message_at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  wire[at] = rpi_message_record.market_center; at = at + 1;
  wire[at] = rpi_message_record.retail_price_improvement; at = at + 1;
  skip
}

/* Rpi Message off the wire, 18 bytes from where the cursor stands */
inline decode_rpi_message(rpi_message_record) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.timestamp[rpi_message_at] = wire[at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> rpi_message_record.symbol_short[rpi_message_at] = wire[at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.market_center = wire[at]; at = at + 1;
  rpi_message_record.retail_price_improvement = wire[at]; at = at + 1;
  skip
}

/* what was read of Rpi Message is what was written, byte for byte */
inline equal_rpi_message(rpi_message_read, rpi_message_written) {
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> assert(rpi_message_read.timestamp[rpi_message_at] == rpi_message_written.timestamp[rpi_message_at]); rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_at = 0;
  do
  :: rpi_message_at < 8 -> assert(rpi_message_read.symbol_short[rpi_message_at] == rpi_message_written.symbol_short[rpi_message_at]); rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  assert(rpi_message_read.market_center == rpi_message_written.market_center);
  assert(rpi_message_read.retail_price_improvement == rpi_message_written.retail_price_improvement);
  skip
}

/* ---- Expanded Fractional Trade Message: 64 bytes ----------------------------- */

/* The Expanded Fractional Trade message is identical to the Fractional Trade message described previously, except for the length of the Symbol field which is expanded from 8 to 14. */
typedef ExpandedFractionalTradeMessage {
  byte transaction_time[8];
  byte symbol_long[14];
  byte market_center;
  byte market_center_execution_id[8];
  byte last_price[8];
  byte last_quantity[8];
  byte cboe_cumulative_executed_volume[8];
  byte national_cumulative_volume[8];
  byte reserved_1
};

int expanded_fractional_trade_message_at;

/* every byte of Expanded Fractional Trade Message set to one value */
inline fill_expanded_fractional_trade_message(expanded_fractional_trade_message_record, expanded_fractional_trade_message_value) {
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.transaction_time[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 14 -> expanded_fractional_trade_message_record.symbol_long[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.market_center = expanded_fractional_trade_message_value;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.market_center_execution_id[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_price[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_quantity[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.national_cumulative_volume[expanded_fractional_trade_message_at] = expanded_fractional_trade_message_value; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.reserved_1 = expanded_fractional_trade_message_value;
  skip
}

/* each byte of Expanded Fractional Trade Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_fractional_trade_message(expanded_fractional_trade_message_record, expanded_fractional_trade_message_base) {
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.transaction_time[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 0 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 14 -> expanded_fractional_trade_message_record.symbol_long[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 8 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.market_center = (expanded_fractional_trade_message_base + 22 + 1) % 256;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.market_center_execution_id[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 23 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_price[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 31 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_quantity[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 39 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 47 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.national_cumulative_volume[expanded_fractional_trade_message_at] = (expanded_fractional_trade_message_base + 55 + expanded_fractional_trade_message_at + 1) % 256; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.reserved_1 = (expanded_fractional_trade_message_base + 63 + 1) % 256;
  skip
}

/* Expanded Fractional Trade Message to the wire, 64 bytes from where the cursor stands */
inline encode_expanded_fractional_trade_message(expanded_fractional_trade_message_record) {
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.transaction_time[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 14 -> wire[at] = expanded_fractional_trade_message_record.symbol_long[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_trade_message_record.market_center; at = at + 1;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.market_center_execution_id[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.last_price[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.last_quantity[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> wire[at] = expanded_fractional_trade_message_record.national_cumulative_volume[expanded_fractional_trade_message_at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_trade_message_record.reserved_1; at = at + 1;
  skip
}

/* Expanded Fractional Trade Message off the wire, 64 bytes from where the cursor stands */
inline decode_expanded_fractional_trade_message(expanded_fractional_trade_message_record) {
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.transaction_time[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 14 -> expanded_fractional_trade_message_record.symbol_long[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.market_center = wire[at]; at = at + 1;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.market_center_execution_id[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_price[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.last_quantity[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> expanded_fractional_trade_message_record.national_cumulative_volume[expanded_fractional_trade_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Fractional Trade Message is what was written, byte for byte */
inline equal_expanded_fractional_trade_message(expanded_fractional_trade_message_read, expanded_fractional_trade_message_written) {
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.transaction_time[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.transaction_time[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 14 -> assert(expanded_fractional_trade_message_read.symbol_long[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.symbol_long[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_trade_message_read.market_center == expanded_fractional_trade_message_written.market_center);
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.market_center_execution_id[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.market_center_execution_id[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.last_price[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.last_price[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.last_quantity[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.last_quantity[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.cboe_cumulative_executed_volume[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_message_at = 0;
  do
  :: expanded_fractional_trade_message_at < 8 -> assert(expanded_fractional_trade_message_read.national_cumulative_volume[expanded_fractional_trade_message_at] == expanded_fractional_trade_message_written.national_cumulative_volume[expanded_fractional_trade_message_at]); expanded_fractional_trade_message_at = expanded_fractional_trade_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_trade_message_read.reserved_1 == expanded_fractional_trade_message_written.reserved_1);
  skip
}

/* ---- Expanded Fractional Trade Break Message: 48 bytes ----------------------- */

/* The Expanded Fractional Trade Break message is sent whenever an execution on a Cboe exchange is broken. Used when the symbol exceeds eight characters. */
typedef ExpandedFractionalTradeBreakMessage {
  byte transaction_time[8];
  byte symbol_long[14];
  byte market_center;
  byte market_center_execution_id[8];
  byte cboe_cumulative_executed_volume[8];
  byte national_cumulative_volume[8];
  byte reserved_1
};

int expanded_fractional_trade_break_message_at;

/* every byte of Expanded Fractional Trade Break Message set to one value */
inline fill_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_record, expanded_fractional_trade_break_message_value) {
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.transaction_time[expanded_fractional_trade_break_message_at] = expanded_fractional_trade_break_message_value; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 14 -> expanded_fractional_trade_break_message_record.symbol_long[expanded_fractional_trade_break_message_at] = expanded_fractional_trade_break_message_value; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.market_center = expanded_fractional_trade_break_message_value;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.market_center_execution_id[expanded_fractional_trade_break_message_at] = expanded_fractional_trade_break_message_value; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at] = expanded_fractional_trade_break_message_value; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.national_cumulative_volume[expanded_fractional_trade_break_message_at] = expanded_fractional_trade_break_message_value; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.reserved_1 = expanded_fractional_trade_break_message_value;
  skip
}

/* each byte of Expanded Fractional Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_record, expanded_fractional_trade_break_message_base) {
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.transaction_time[expanded_fractional_trade_break_message_at] = (expanded_fractional_trade_break_message_base + 0 + expanded_fractional_trade_break_message_at + 1) % 256; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 14 -> expanded_fractional_trade_break_message_record.symbol_long[expanded_fractional_trade_break_message_at] = (expanded_fractional_trade_break_message_base + 8 + expanded_fractional_trade_break_message_at + 1) % 256; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.market_center = (expanded_fractional_trade_break_message_base + 22 + 1) % 256;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.market_center_execution_id[expanded_fractional_trade_break_message_at] = (expanded_fractional_trade_break_message_base + 23 + expanded_fractional_trade_break_message_at + 1) % 256; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at] = (expanded_fractional_trade_break_message_base + 31 + expanded_fractional_trade_break_message_at + 1) % 256; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.national_cumulative_volume[expanded_fractional_trade_break_message_at] = (expanded_fractional_trade_break_message_base + 39 + expanded_fractional_trade_break_message_at + 1) % 256; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.reserved_1 = (expanded_fractional_trade_break_message_base + 47 + 1) % 256;
  skip
}

/* Expanded Fractional Trade Break Message to the wire, 48 bytes from where the cursor stands */
inline encode_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_record) {
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> wire[at] = expanded_fractional_trade_break_message_record.transaction_time[expanded_fractional_trade_break_message_at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 14 -> wire[at] = expanded_fractional_trade_break_message_record.symbol_long[expanded_fractional_trade_break_message_at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_trade_break_message_record.market_center; at = at + 1;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> wire[at] = expanded_fractional_trade_break_message_record.market_center_execution_id[expanded_fractional_trade_break_message_at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> wire[at] = expanded_fractional_trade_break_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> wire[at] = expanded_fractional_trade_break_message_record.national_cumulative_volume[expanded_fractional_trade_break_message_at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_trade_break_message_record.reserved_1; at = at + 1;
  skip
}

/* Expanded Fractional Trade Break Message off the wire, 48 bytes from where the cursor stands */
inline decode_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_record) {
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.transaction_time[expanded_fractional_trade_break_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 14 -> expanded_fractional_trade_break_message_record.symbol_long[expanded_fractional_trade_break_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.market_center = wire[at]; at = at + 1;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.market_center_execution_id[expanded_fractional_trade_break_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> expanded_fractional_trade_break_message_record.national_cumulative_volume[expanded_fractional_trade_break_message_at] = wire[at]; at = at + 1; expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Fractional Trade Break Message is what was written, byte for byte */
inline equal_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_read, expanded_fractional_trade_break_message_written) {
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> assert(expanded_fractional_trade_break_message_read.transaction_time[expanded_fractional_trade_break_message_at] == expanded_fractional_trade_break_message_written.transaction_time[expanded_fractional_trade_break_message_at]); expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 14 -> assert(expanded_fractional_trade_break_message_read.symbol_long[expanded_fractional_trade_break_message_at] == expanded_fractional_trade_break_message_written.symbol_long[expanded_fractional_trade_break_message_at]); expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_trade_break_message_read.market_center == expanded_fractional_trade_break_message_written.market_center);
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> assert(expanded_fractional_trade_break_message_read.market_center_execution_id[expanded_fractional_trade_break_message_at] == expanded_fractional_trade_break_message_written.market_center_execution_id[expanded_fractional_trade_break_message_at]); expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> assert(expanded_fractional_trade_break_message_read.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at] == expanded_fractional_trade_break_message_written.cboe_cumulative_executed_volume[expanded_fractional_trade_break_message_at]); expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  expanded_fractional_trade_break_message_at = 0;
  do
  :: expanded_fractional_trade_break_message_at < 8 -> assert(expanded_fractional_trade_break_message_read.national_cumulative_volume[expanded_fractional_trade_break_message_at] == expanded_fractional_trade_break_message_written.national_cumulative_volume[expanded_fractional_trade_break_message_at]); expanded_fractional_trade_break_message_at = expanded_fractional_trade_break_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_trade_break_message_read.reserved_1 == expanded_fractional_trade_break_message_written.reserved_1);
  skip
}

/* ---- Trading Status Message: 19 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a security on a Cboe exchange. */
typedef TradingStatusMessage {
  byte timestamp[8];
  byte symbol_short[8];
  byte market_center;
  byte trading_status;
  byte reg_sho_action
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = trading_status_message_value;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_record.reg_sho_action = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = (trading_status_message_base + 16 + 1) % 256;
  trading_status_message_record.trading_status = (trading_status_message_base + 17 + 1) % 256;
  trading_status_message_record.reg_sho_action = (trading_status_message_base + 18 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 19 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.timestamp[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol_short[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.market_center; at = at + 1;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  wire[at] = trading_status_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 19 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_short[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.market_center = wire[at]; at = at + 1;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.timestamp[trading_status_message_at] == trading_status_message_written.timestamp[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol_short[trading_status_message_at] == trading_status_message_written.symbol_short[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.market_center == trading_status_message_written.market_center);
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  assert(trading_status_message_read.reg_sho_action == trading_status_message_written.reg_sho_action);
  skip
}

/* ---- Expanded Trading Status Message: 25 bytes ------------------------------- */

/* The Expanded Trading Status message is identical to the Trading Status message described previously, except for the length of the Symbol field which is expanded from 8 to 14. Canada Only. */
typedef ExpandedTradingStatusMessage {
  byte timestamp[8];
  byte symbol_long[14];
  byte market_center;
  byte trading_status;
  byte reg_sho_action
};

int expanded_trading_status_message_at;

/* every byte of Expanded Trading Status Message set to one value */
inline fill_expanded_trading_status_message(expanded_trading_status_message_record, expanded_trading_status_message_value) {
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 8 -> expanded_trading_status_message_record.timestamp[expanded_trading_status_message_at] = expanded_trading_status_message_value; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 14 -> expanded_trading_status_message_record.symbol_long[expanded_trading_status_message_at] = expanded_trading_status_message_value; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_record.market_center = expanded_trading_status_message_value;
  expanded_trading_status_message_record.trading_status = expanded_trading_status_message_value;
  expanded_trading_status_message_record.reg_sho_action = expanded_trading_status_message_value;
  skip
}

/* each byte of Expanded Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_trading_status_message(expanded_trading_status_message_record, expanded_trading_status_message_base) {
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 8 -> expanded_trading_status_message_record.timestamp[expanded_trading_status_message_at] = (expanded_trading_status_message_base + 0 + expanded_trading_status_message_at + 1) % 256; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 14 -> expanded_trading_status_message_record.symbol_long[expanded_trading_status_message_at] = (expanded_trading_status_message_base + 8 + expanded_trading_status_message_at + 1) % 256; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_record.market_center = (expanded_trading_status_message_base + 22 + 1) % 256;
  expanded_trading_status_message_record.trading_status = (expanded_trading_status_message_base + 23 + 1) % 256;
  expanded_trading_status_message_record.reg_sho_action = (expanded_trading_status_message_base + 24 + 1) % 256;
  skip
}

/* Expanded Trading Status Message to the wire, 25 bytes from where the cursor stands */
inline encode_expanded_trading_status_message(expanded_trading_status_message_record) {
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 8 -> wire[at] = expanded_trading_status_message_record.timestamp[expanded_trading_status_message_at]; at = at + 1; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 14 -> wire[at] = expanded_trading_status_message_record.symbol_long[expanded_trading_status_message_at]; at = at + 1; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_trading_status_message_record.market_center; at = at + 1;
  wire[at] = expanded_trading_status_message_record.trading_status; at = at + 1;
  wire[at] = expanded_trading_status_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Expanded Trading Status Message off the wire, 25 bytes from where the cursor stands */
inline decode_expanded_trading_status_message(expanded_trading_status_message_record) {
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 8 -> expanded_trading_status_message_record.timestamp[expanded_trading_status_message_at] = wire[at]; at = at + 1; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 14 -> expanded_trading_status_message_record.symbol_long[expanded_trading_status_message_at] = wire[at]; at = at + 1; expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_record.market_center = wire[at]; at = at + 1;
  expanded_trading_status_message_record.trading_status = wire[at]; at = at + 1;
  expanded_trading_status_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Trading Status Message is what was written, byte for byte */
inline equal_expanded_trading_status_message(expanded_trading_status_message_read, expanded_trading_status_message_written) {
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 8 -> assert(expanded_trading_status_message_read.timestamp[expanded_trading_status_message_at] == expanded_trading_status_message_written.timestamp[expanded_trading_status_message_at]); expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  expanded_trading_status_message_at = 0;
  do
  :: expanded_trading_status_message_at < 14 -> assert(expanded_trading_status_message_read.symbol_long[expanded_trading_status_message_at] == expanded_trading_status_message_written.symbol_long[expanded_trading_status_message_at]); expanded_trading_status_message_at = expanded_trading_status_message_at + 1
  :: else -> break
  od;
  assert(expanded_trading_status_message_read.market_center == expanded_trading_status_message_written.market_center);
  assert(expanded_trading_status_message_read.trading_status == expanded_trading_status_message_written.trading_status);
  assert(expanded_trading_status_message_read.reg_sho_action == expanded_trading_status_message_written.reg_sho_action);
  skip
}

/* ---- Opening Closing Price Message: 26 bytes --------------------------------- */

/* The Opening/Closing Price message is used to indicate the Opening or Closing price of a security on any of the Cboe markets and the primary listing market. */
typedef OpeningClosingPriceMessage {
  byte timestamp[8];
  byte symbol_short[8];
  byte market_center;
  byte open_close_indicator;
  byte price_long[8]
};

int opening_closing_price_message_at;

/* every byte of Opening Closing Price Message set to one value */
inline fill_opening_closing_price_message(opening_closing_price_message_record, opening_closing_price_message_value) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol_short[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = opening_closing_price_message_value;
  opening_closing_price_message_record.open_close_indicator = opening_closing_price_message_value;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = opening_closing_price_message_value; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Opening Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_opening_closing_price_message(opening_closing_price_message_record, opening_closing_price_message_base) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = (opening_closing_price_message_base + 0 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol_short[opening_closing_price_message_at] = (opening_closing_price_message_base + 8 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = (opening_closing_price_message_base + 16 + 1) % 256;
  opening_closing_price_message_record.open_close_indicator = (opening_closing_price_message_base + 17 + 1) % 256;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = (opening_closing_price_message_base + 18 + opening_closing_price_message_at + 1) % 256; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Closing Price Message to the wire, 26 bytes from where the cursor stands */
inline encode_opening_closing_price_message(opening_closing_price_message_record) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.timestamp[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.symbol_short[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = opening_closing_price_message_record.market_center; at = at + 1;
  wire[at] = opening_closing_price_message_record.open_close_indicator; at = at + 1;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> wire[at] = opening_closing_price_message_record.price_long[opening_closing_price_message_at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Opening Closing Price Message off the wire, 26 bytes from where the cursor stands */
inline decode_opening_closing_price_message(opening_closing_price_message_record) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.timestamp[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.symbol_short[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_record.market_center = wire[at]; at = at + 1;
  opening_closing_price_message_record.open_close_indicator = wire[at]; at = at + 1;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> opening_closing_price_message_record.price_long[opening_closing_price_message_at] = wire[at]; at = at + 1; opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Opening Closing Price Message is what was written, byte for byte */
inline equal_opening_closing_price_message(opening_closing_price_message_read, opening_closing_price_message_written) {
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.timestamp[opening_closing_price_message_at] == opening_closing_price_message_written.timestamp[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.symbol_short[opening_closing_price_message_at] == opening_closing_price_message_written.symbol_short[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  assert(opening_closing_price_message_read.market_center == opening_closing_price_message_written.market_center);
  assert(opening_closing_price_message_read.open_close_indicator == opening_closing_price_message_written.open_close_indicator);
  opening_closing_price_message_at = 0;
  do
  :: opening_closing_price_message_at < 8 -> assert(opening_closing_price_message_read.price_long[opening_closing_price_message_at] == opening_closing_price_message_written.price_long[opening_closing_price_message_at]); opening_closing_price_message_at = opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Opening Closing Price Message: 32 bytes ------------------------ */

/* The Expanded Opening/Closing Price message is identical to the Opening/Closing Price message described previously, except for the length of the Symbol field which is expanded from 8 to 14. Canada Only. */
typedef ExpandedOpeningClosingPriceMessage {
  byte timestamp[8];
  byte symbol_long[14];
  byte market_center;
  byte open_close_indicator;
  byte price_long[8]
};

int expanded_opening_closing_price_message_at;

/* every byte of Expanded Opening Closing Price Message set to one value */
inline fill_expanded_opening_closing_price_message(expanded_opening_closing_price_message_record, expanded_opening_closing_price_message_value) {
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.timestamp[expanded_opening_closing_price_message_at] = expanded_opening_closing_price_message_value; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 14 -> expanded_opening_closing_price_message_record.symbol_long[expanded_opening_closing_price_message_at] = expanded_opening_closing_price_message_value; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_record.market_center = expanded_opening_closing_price_message_value;
  expanded_opening_closing_price_message_record.open_close_indicator = expanded_opening_closing_price_message_value;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.price_long[expanded_opening_closing_price_message_at] = expanded_opening_closing_price_message_value; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Opening Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_opening_closing_price_message(expanded_opening_closing_price_message_record, expanded_opening_closing_price_message_base) {
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.timestamp[expanded_opening_closing_price_message_at] = (expanded_opening_closing_price_message_base + 0 + expanded_opening_closing_price_message_at + 1) % 256; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 14 -> expanded_opening_closing_price_message_record.symbol_long[expanded_opening_closing_price_message_at] = (expanded_opening_closing_price_message_base + 8 + expanded_opening_closing_price_message_at + 1) % 256; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_record.market_center = (expanded_opening_closing_price_message_base + 22 + 1) % 256;
  expanded_opening_closing_price_message_record.open_close_indicator = (expanded_opening_closing_price_message_base + 23 + 1) % 256;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.price_long[expanded_opening_closing_price_message_at] = (expanded_opening_closing_price_message_base + 24 + expanded_opening_closing_price_message_at + 1) % 256; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Opening Closing Price Message to the wire, 32 bytes from where the cursor stands */
inline encode_expanded_opening_closing_price_message(expanded_opening_closing_price_message_record) {
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> wire[at] = expanded_opening_closing_price_message_record.timestamp[expanded_opening_closing_price_message_at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 14 -> wire[at] = expanded_opening_closing_price_message_record.symbol_long[expanded_opening_closing_price_message_at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_opening_closing_price_message_record.market_center; at = at + 1;
  wire[at] = expanded_opening_closing_price_message_record.open_close_indicator; at = at + 1;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> wire[at] = expanded_opening_closing_price_message_record.price_long[expanded_opening_closing_price_message_at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Opening Closing Price Message off the wire, 32 bytes from where the cursor stands */
inline decode_expanded_opening_closing_price_message(expanded_opening_closing_price_message_record) {
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.timestamp[expanded_opening_closing_price_message_at] = wire[at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 14 -> expanded_opening_closing_price_message_record.symbol_long[expanded_opening_closing_price_message_at] = wire[at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_record.market_center = wire[at]; at = at + 1;
  expanded_opening_closing_price_message_record.open_close_indicator = wire[at]; at = at + 1;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> expanded_opening_closing_price_message_record.price_long[expanded_opening_closing_price_message_at] = wire[at]; at = at + 1; expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Opening Closing Price Message is what was written, byte for byte */
inline equal_expanded_opening_closing_price_message(expanded_opening_closing_price_message_read, expanded_opening_closing_price_message_written) {
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> assert(expanded_opening_closing_price_message_read.timestamp[expanded_opening_closing_price_message_at] == expanded_opening_closing_price_message_written.timestamp[expanded_opening_closing_price_message_at]); expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 14 -> assert(expanded_opening_closing_price_message_read.symbol_long[expanded_opening_closing_price_message_at] == expanded_opening_closing_price_message_written.symbol_long[expanded_opening_closing_price_message_at]); expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  assert(expanded_opening_closing_price_message_read.market_center == expanded_opening_closing_price_message_written.market_center);
  assert(expanded_opening_closing_price_message_read.open_close_indicator == expanded_opening_closing_price_message_written.open_close_indicator);
  expanded_opening_closing_price_message_at = 0;
  do
  :: expanded_opening_closing_price_message_at < 8 -> assert(expanded_opening_closing_price_message_read.price_long[expanded_opening_closing_price_message_at] == expanded_opening_closing_price_message_written.price_long[expanded_opening_closing_price_message_at]); expanded_opening_closing_price_message_at = expanded_opening_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Fractional End Of Day Summary Message: 57 bytes ------------------------- */

/* The Fractional End of Day Summary message is used to give a consolidated, high-level overview of a security for the day. */
typedef FractionalEndOfDaySummaryMessage {
  byte timestamp[8];
  byte symbol_short[8];
  byte data_source;
  byte opening_price[8];
  byte closing_price[8];
  byte high_price[8];
  byte low_price[8];
  byte national_cumulative_volume[8]
};

int fractional_end_of_day_summary_message_at;

/* every byte of Fractional End Of Day Summary Message set to one value */
inline fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record, fractional_end_of_day_summary_message_value) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol_short[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = fractional_end_of_day_summary_message_value;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = fractional_end_of_day_summary_message_value; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Fractional End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record, fractional_end_of_day_summary_message_base) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 0 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol_short[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 8 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = (fractional_end_of_day_summary_message_base + 16 + 1) % 256;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 17 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 25 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 33 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 41 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = (fractional_end_of_day_summary_message_base + 49 + fractional_end_of_day_summary_message_at + 1) % 256; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional End Of Day Summary Message to the wire, 57 bytes from where the cursor stands */
inline encode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.symbol_short[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = fractional_end_of_day_summary_message_record.data_source; at = at + 1;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> wire[at] = fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Fractional End Of Day Summary Message off the wire, 57 bytes from where the cursor stands */
inline decode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_record) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.timestamp[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.symbol_short[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_record.data_source = wire[at]; at = at + 1;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.opening_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.closing_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.high_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.low_price[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> fractional_end_of_day_summary_message_record.national_cumulative_volume[fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Fractional End Of Day Summary Message is what was written, byte for byte */
inline equal_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_read, fractional_end_of_day_summary_message_written) {
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.timestamp[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.timestamp[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.symbol_short[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.symbol_short[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(fractional_end_of_day_summary_message_read.data_source == fractional_end_of_day_summary_message_written.data_source);
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.opening_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.opening_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.closing_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.closing_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.high_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.high_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.low_price[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.low_price[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  fractional_end_of_day_summary_message_at = 0;
  do
  :: fractional_end_of_day_summary_message_at < 8 -> assert(fractional_end_of_day_summary_message_read.national_cumulative_volume[fractional_end_of_day_summary_message_at] == fractional_end_of_day_summary_message_written.national_cumulative_volume[fractional_end_of_day_summary_message_at]); fractional_end_of_day_summary_message_at = fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Fractional End Of Day Summary Message: 63 bytes ---------------- */

/* The Expanded Fractional End of Day Summary message is identical to the Fractional End of Day Summary message described previously, except for the length of the Symbol field which is expanded from 8 to 14. Canada Only. */
typedef ExpandedFractionalEndOfDaySummaryMessage {
  byte timestamp[8];
  byte symbol_long[14];
  byte data_source;
  byte opening_price[8];
  byte closing_price[8];
  byte high_price[8];
  byte low_price[8];
  byte national_cumulative_volume[8]
};

int expanded_fractional_end_of_day_summary_message_at;

/* every byte of Expanded Fractional End Of Day Summary Message set to one value */
inline fill_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_record, expanded_fractional_end_of_day_summary_message_value) {
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.timestamp[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 14 -> expanded_fractional_end_of_day_summary_message_record.symbol_long[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_record.data_source = expanded_fractional_end_of_day_summary_message_value;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.opening_price[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.closing_price[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.high_price[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.low_price[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at] = expanded_fractional_end_of_day_summary_message_value; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Fractional End Of Day Summary Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_record, expanded_fractional_end_of_day_summary_message_base) {
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.timestamp[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 0 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 14 -> expanded_fractional_end_of_day_summary_message_record.symbol_long[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 8 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_record.data_source = (expanded_fractional_end_of_day_summary_message_base + 22 + 1) % 256;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.opening_price[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 23 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.closing_price[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 31 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.high_price[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 39 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.low_price[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 47 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at] = (expanded_fractional_end_of_day_summary_message_base + 55 + expanded_fractional_end_of_day_summary_message_at + 1) % 256; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Fractional End Of Day Summary Message to the wire, 63 bytes from where the cursor stands */
inline encode_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_record) {
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.timestamp[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 14 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.symbol_long[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_fractional_end_of_day_summary_message_record.data_source; at = at + 1;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.opening_price[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.closing_price[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.high_price[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.low_price[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> wire[at] = expanded_fractional_end_of_day_summary_message_record.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Fractional End Of Day Summary Message off the wire, 63 bytes from where the cursor stands */
inline decode_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_record) {
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.timestamp[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 14 -> expanded_fractional_end_of_day_summary_message_record.symbol_long[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_record.data_source = wire[at]; at = at + 1;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.opening_price[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.closing_price[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.high_price[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.low_price[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> expanded_fractional_end_of_day_summary_message_record.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at] = wire[at]; at = at + 1; expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Fractional End Of Day Summary Message is what was written, byte for byte */
inline equal_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_read, expanded_fractional_end_of_day_summary_message_written) {
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.timestamp[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.timestamp[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 14 -> assert(expanded_fractional_end_of_day_summary_message_read.symbol_long[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.symbol_long[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  assert(expanded_fractional_end_of_day_summary_message_read.data_source == expanded_fractional_end_of_day_summary_message_written.data_source);
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.opening_price[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.opening_price[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.closing_price[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.closing_price[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.high_price[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.high_price[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.low_price[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.low_price[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
  :: else -> break
  od;
  expanded_fractional_end_of_day_summary_message_at = 0;
  do
  :: expanded_fractional_end_of_day_summary_message_at < 8 -> assert(expanded_fractional_end_of_day_summary_message_read.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at] == expanded_fractional_end_of_day_summary_message_written.national_cumulative_volume[expanded_fractional_end_of_day_summary_message_at]); expanded_fractional_end_of_day_summary_message_at = expanded_fractional_end_of_day_summary_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Clear Quote Message: encoded, read back, and compared */
proctype check_clear_quote_message() {
  ClearQuoteMessage clear_quote_message_sent;
  ClearQuoteMessage clear_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_clear_quote_message(clear_quote_message_sent, 0)
  :: pattern == 1 -> fill_clear_quote_message(clear_quote_message_sent, 32)
  :: pattern == 2 -> fill_clear_quote_message(clear_quote_message_sent, 255)
  :: else -> ramp_clear_quote_message(clear_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_clear_quote_message(clear_quote_message_sent);
    assert(at == 17);
    at = 0;
    decode_clear_quote_message(clear_quote_message_got);
    assert(at == 17);
    equal_clear_quote_message(clear_quote_message_got, clear_quote_message_sent)
  }
}

/* Expanded Clear Quote Message: encoded, read back, and compared */
proctype check_expanded_clear_quote_message() {
  ExpandedClearQuoteMessage expanded_clear_quote_message_sent;
  ExpandedClearQuoteMessage expanded_clear_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_clear_quote_message(expanded_clear_quote_message_sent, 0)
  :: pattern == 1 -> fill_expanded_clear_quote_message(expanded_clear_quote_message_sent, 32)
  :: pattern == 2 -> fill_expanded_clear_quote_message(expanded_clear_quote_message_sent, 255)
  :: else -> ramp_expanded_clear_quote_message(expanded_clear_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_clear_quote_message(expanded_clear_quote_message_sent);
    assert(at == 23);
    at = 0;
    decode_expanded_clear_quote_message(expanded_clear_quote_message_got);
    assert(at == 23);
    equal_expanded_clear_quote_message(expanded_clear_quote_message_got, expanded_clear_quote_message_sent)
  }
}

/* Expanded Fractional Symbol Summary Message: encoded, read back, and compared */
proctype check_expanded_fractional_symbol_summary_message() {
  ExpandedFractionalSymbolSummaryMessage expanded_fractional_symbol_summary_message_sent;
  ExpandedFractionalSymbolSummaryMessage expanded_fractional_symbol_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_sent, 0)
  :: pattern == 1 -> fill_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_sent, 32)
  :: pattern == 2 -> fill_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_sent, 255)
  :: else -> ramp_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_sent);
    assert(at == 71);
    at = 0;
    decode_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_got);
    assert(at == 71);
    equal_expanded_fractional_symbol_summary_message(expanded_fractional_symbol_summary_message_got, expanded_fractional_symbol_summary_message_sent)
  }
}

/* Best Quote Update Message: encoded, read back, and compared */
proctype check_best_quote_update_message() {
  BestQuoteUpdateMessage best_quote_update_message_sent;
  BestQuoteUpdateMessage best_quote_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_quote_update_message(best_quote_update_message_sent, 0)
  :: pattern == 1 -> fill_best_quote_update_message(best_quote_update_message_sent, 32)
  :: pattern == 2 -> fill_best_quote_update_message(best_quote_update_message_sent, 255)
  :: else -> ramp_best_quote_update_message(best_quote_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_quote_update_message(best_quote_update_message_sent);
    assert(at == 33);
    at = 0;
    decode_best_quote_update_message(best_quote_update_message_got);
    assert(at == 33);
    equal_best_quote_update_message(best_quote_update_message_got, best_quote_update_message_sent)
  }
}

/* Expanded Best Quote Update Message: encoded, read back, and compared */
proctype check_expanded_best_quote_update_message() {
  ExpandedBestQuoteUpdateMessage expanded_best_quote_update_message_sent;
  ExpandedBestQuoteUpdateMessage expanded_best_quote_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_best_quote_update_message(expanded_best_quote_update_message_sent, 0)
  :: pattern == 1 -> fill_expanded_best_quote_update_message(expanded_best_quote_update_message_sent, 32)
  :: pattern == 2 -> fill_expanded_best_quote_update_message(expanded_best_quote_update_message_sent, 255)
  :: else -> ramp_expanded_best_quote_update_message(expanded_best_quote_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_best_quote_update_message(expanded_best_quote_update_message_sent);
    assert(at == 39);
    at = 0;
    decode_expanded_best_quote_update_message(expanded_best_quote_update_message_got);
    assert(at == 39);
    equal_expanded_best_quote_update_message(expanded_best_quote_update_message_got, expanded_best_quote_update_message_sent)
  }
}

/* Cboe Market Status Message: encoded, read back, and compared */
proctype check_cboe_market_status_message() {
  CboeMarketStatusMessage cboe_market_status_message_sent;
  CboeMarketStatusMessage cboe_market_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 0)
  :: pattern == 1 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 32)
  :: pattern == 2 -> fill_cboe_market_status_message(cboe_market_status_message_sent, 255)
  :: else -> ramp_cboe_market_status_message(cboe_market_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cboe_market_status_message(cboe_market_status_message_sent);
    assert(at == 11);
    at = 0;
    decode_cboe_market_status_message(cboe_market_status_message_got);
    assert(at == 11);
    equal_cboe_market_status_message(cboe_market_status_message_got, cboe_market_status_message_sent)
  }
}

/* Short Update Adap Block: encoded, read back, and compared */
proctype check_short_update_adap_block() {
  ShortUpdateAdapBlock short_update_adap_block_sent;
  ShortUpdateAdapBlock short_update_adap_block_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_update_adap_block(short_update_adap_block_sent, 0)
  :: pattern == 1 -> fill_short_update_adap_block(short_update_adap_block_sent, 32)
  :: pattern == 2 -> fill_short_update_adap_block(short_update_adap_block_sent, 255)
  :: else -> ramp_short_update_adap_block(short_update_adap_block_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_update_adap_block(short_update_adap_block_sent);
    assert(at == 10);
    at = 0;
    decode_short_update_adap_block(short_update_adap_block_got);
    assert(at == 10);
    equal_short_update_adap_block(short_update_adap_block_got, short_update_adap_block_sent)
  }
}

/* Long Update Adap Block: encoded, read back, and compared */
proctype check_long_update_adap_block() {
  LongUpdateAdapBlock long_update_adap_block_sent;
  LongUpdateAdapBlock long_update_adap_block_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_update_adap_block(long_update_adap_block_sent, 0)
  :: pattern == 1 -> fill_long_update_adap_block(long_update_adap_block_sent, 32)
  :: pattern == 2 -> fill_long_update_adap_block(long_update_adap_block_sent, 255)
  :: else -> ramp_long_update_adap_block(long_update_adap_block_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_update_adap_block(long_update_adap_block_sent);
    assert(at == 18);
    at = 0;
    decode_long_update_adap_block(long_update_adap_block_got);
    assert(at == 18);
    equal_long_update_adap_block(long_update_adap_block_got, long_update_adap_block_sent)
  }
}

/* Rpi Message: encoded, read back, and compared */
proctype check_rpi_message() {
  RpiMessage rpi_message_sent;
  RpiMessage rpi_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rpi_message(rpi_message_sent, 0)
  :: pattern == 1 -> fill_rpi_message(rpi_message_sent, 32)
  :: pattern == 2 -> fill_rpi_message(rpi_message_sent, 255)
  :: else -> ramp_rpi_message(rpi_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rpi_message(rpi_message_sent);
    assert(at == 18);
    at = 0;
    decode_rpi_message(rpi_message_got);
    assert(at == 18);
    equal_rpi_message(rpi_message_got, rpi_message_sent)
  }
}

/* Expanded Fractional Trade Message: encoded, read back, and compared */
proctype check_expanded_fractional_trade_message() {
  ExpandedFractionalTradeMessage expanded_fractional_trade_message_sent;
  ExpandedFractionalTradeMessage expanded_fractional_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_fractional_trade_message(expanded_fractional_trade_message_sent, 0)
  :: pattern == 1 -> fill_expanded_fractional_trade_message(expanded_fractional_trade_message_sent, 32)
  :: pattern == 2 -> fill_expanded_fractional_trade_message(expanded_fractional_trade_message_sent, 255)
  :: else -> ramp_expanded_fractional_trade_message(expanded_fractional_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_fractional_trade_message(expanded_fractional_trade_message_sent);
    assert(at == 64);
    at = 0;
    decode_expanded_fractional_trade_message(expanded_fractional_trade_message_got);
    assert(at == 64);
    equal_expanded_fractional_trade_message(expanded_fractional_trade_message_got, expanded_fractional_trade_message_sent)
  }
}

/* Expanded Fractional Trade Break Message: encoded, read back, and compared */
proctype check_expanded_fractional_trade_break_message() {
  ExpandedFractionalTradeBreakMessage expanded_fractional_trade_break_message_sent;
  ExpandedFractionalTradeBreakMessage expanded_fractional_trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_sent, 0)
  :: pattern == 1 -> fill_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_sent, 32)
  :: pattern == 2 -> fill_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_sent, 255)
  :: else -> ramp_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_sent);
    assert(at == 48);
    at = 0;
    decode_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_got);
    assert(at == 48);
    equal_expanded_fractional_trade_break_message(expanded_fractional_trade_break_message_got, expanded_fractional_trade_break_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 19);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 19);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Expanded Trading Status Message: encoded, read back, and compared */
proctype check_expanded_trading_status_message() {
  ExpandedTradingStatusMessage expanded_trading_status_message_sent;
  ExpandedTradingStatusMessage expanded_trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_trading_status_message(expanded_trading_status_message_sent, 0)
  :: pattern == 1 -> fill_expanded_trading_status_message(expanded_trading_status_message_sent, 32)
  :: pattern == 2 -> fill_expanded_trading_status_message(expanded_trading_status_message_sent, 255)
  :: else -> ramp_expanded_trading_status_message(expanded_trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_trading_status_message(expanded_trading_status_message_sent);
    assert(at == 25);
    at = 0;
    decode_expanded_trading_status_message(expanded_trading_status_message_got);
    assert(at == 25);
    equal_expanded_trading_status_message(expanded_trading_status_message_got, expanded_trading_status_message_sent)
  }
}

/* Opening Closing Price Message: encoded, read back, and compared */
proctype check_opening_closing_price_message() {
  OpeningClosingPriceMessage opening_closing_price_message_sent;
  OpeningClosingPriceMessage opening_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_opening_closing_price_message(opening_closing_price_message_sent, 255)
  :: else -> ramp_opening_closing_price_message(opening_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_opening_closing_price_message(opening_closing_price_message_sent);
    assert(at == 26);
    at = 0;
    decode_opening_closing_price_message(opening_closing_price_message_got);
    assert(at == 26);
    equal_opening_closing_price_message(opening_closing_price_message_got, opening_closing_price_message_sent)
  }
}

/* Expanded Opening Closing Price Message: encoded, read back, and compared */
proctype check_expanded_opening_closing_price_message() {
  ExpandedOpeningClosingPriceMessage expanded_opening_closing_price_message_sent;
  ExpandedOpeningClosingPriceMessage expanded_opening_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_opening_closing_price_message(expanded_opening_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_expanded_opening_closing_price_message(expanded_opening_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_expanded_opening_closing_price_message(expanded_opening_closing_price_message_sent, 255)
  :: else -> ramp_expanded_opening_closing_price_message(expanded_opening_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_opening_closing_price_message(expanded_opening_closing_price_message_sent);
    assert(at == 32);
    at = 0;
    decode_expanded_opening_closing_price_message(expanded_opening_closing_price_message_got);
    assert(at == 32);
    equal_expanded_opening_closing_price_message(expanded_opening_closing_price_message_got, expanded_opening_closing_price_message_sent)
  }
}

/* Fractional End Of Day Summary Message: encoded, read back, and compared */
proctype check_fractional_end_of_day_summary_message() {
  FractionalEndOfDaySummaryMessage fractional_end_of_day_summary_message_sent;
  FractionalEndOfDaySummaryMessage fractional_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 255)
  :: else -> ramp_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_sent);
    assert(at == 57);
    at = 0;
    decode_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_got);
    assert(at == 57);
    equal_fractional_end_of_day_summary_message(fractional_end_of_day_summary_message_got, fractional_end_of_day_summary_message_sent)
  }
}

/* Expanded Fractional End Of Day Summary Message: encoded, read back, and compared */
proctype check_expanded_fractional_end_of_day_summary_message() {
  ExpandedFractionalEndOfDaySummaryMessage expanded_fractional_end_of_day_summary_message_sent;
  ExpandedFractionalEndOfDaySummaryMessage expanded_fractional_end_of_day_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_sent, 0)
  :: pattern == 1 -> fill_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_sent, 32)
  :: pattern == 2 -> fill_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_sent, 255)
  :: else -> ramp_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_sent);
    assert(at == 63);
    at = 0;
    decode_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_got);
    assert(at == 63);
    equal_expanded_fractional_end_of_day_summary_message(expanded_fractional_end_of_day_summary_message_got, expanded_fractional_end_of_day_summary_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_clear_quote_message()
  :: run check_expanded_clear_quote_message()
  :: run check_expanded_fractional_symbol_summary_message()
  :: run check_best_quote_update_message()
  :: run check_expanded_best_quote_update_message()
  :: run check_cboe_market_status_message()
  :: run check_short_update_adap_block()
  :: run check_long_update_adap_block()
  :: run check_rpi_message()
  :: run check_expanded_fractional_trade_message()
  :: run check_expanded_fractional_trade_break_message()
  :: run check_trading_status_message()
  :: run check_expanded_trading_status_message()
  :: run check_opening_closing_price_message()
  :: run check_expanded_opening_closing_price_message()
  :: run check_fractional_end_of_day_summary_message()
  :: run check_expanded_fractional_end_of_day_summary_message()
  fi
}
