/*
 * Chicago Board Options Exchange Summary Depth
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
#define WIRE 42

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

/* The Clear Quote message instructs feed recipients to clear all quotes and ADAP information for the specified symbol */
typedef ClearQuoteMessage {
  byte last_update_timestamp[8];
  byte symbol[8];
  byte reserved_1
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
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = clear_quote_message_value; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.reserved_1 = clear_quote_message_value;
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
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = (clear_quote_message_base + 8 + clear_quote_message_at + 1) % 256; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.reserved_1 = (clear_quote_message_base + 16 + 1) % 256;
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
  :: clear_quote_message_at < 8 -> wire[at] = clear_quote_message_record.symbol[clear_quote_message_at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = clear_quote_message_record.reserved_1; at = at + 1;
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
  :: clear_quote_message_at < 8 -> clear_quote_message_record.symbol[clear_quote_message_at] = wire[at]; at = at + 1; clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  clear_quote_message_record.reserved_1 = wire[at]; at = at + 1;
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
  :: clear_quote_message_at < 8 -> assert(clear_quote_message_read.symbol[clear_quote_message_at] == clear_quote_message_written.symbol[clear_quote_message_at]); clear_quote_message_at = clear_quote_message_at + 1
  :: else -> break
  od;
  assert(clear_quote_message_read.reserved_1 == clear_quote_message_written.reserved_1);
  skip
}

/* ---- Cboe Market Status Message: 11 bytes ------------------------------------ */

/* The Cboe Market Status message is disseminated to reflect a change in the status of the market */
typedef CboeMarketStatusMessage {
  byte timestamp[8];
  byte reserved_1;
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
  cboe_market_status_message_record.reserved_1 = cboe_market_status_message_value;
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
  cboe_market_status_message_record.reserved_1 = (cboe_market_status_message_base + 8 + 1) % 256;
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
  wire[at] = cboe_market_status_message_record.reserved_1; at = at + 1;
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
  cboe_market_status_message_record.reserved_1 = wire[at]; at = at + 1;
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
  assert(cboe_market_status_message_read.reserved_1 == cboe_market_status_message_written.reserved_1);
  assert(cboe_market_status_message_read.market_status == cboe_market_status_message_written.market_status);
  assert(cboe_market_status_message_read.session_indicator == cboe_market_status_message_written.session_indicator);
  skip
}

/* ---- Short Update Adap Block: 9 bytes ---------------------------------------- */

/* Short Update ADAP Block */
typedef ShortUpdateAdapBlock {
  byte side;
  byte price_short[4];
  byte quantity_short[4]
};

int short_update_adap_block_at;

/* every byte of Short Update Adap Block set to one value */
inline fill_short_update_adap_block(short_update_adap_block_record, short_update_adap_block_value) {
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
  short_update_adap_block_record.side = (short_update_adap_block_base + 0 + 1) % 256;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.price_short[short_update_adap_block_at] = (short_update_adap_block_base + 1 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  short_update_adap_block_at = 0;
  do
  :: short_update_adap_block_at < 4 -> short_update_adap_block_record.quantity_short[short_update_adap_block_at] = (short_update_adap_block_base + 5 + short_update_adap_block_at + 1) % 256; short_update_adap_block_at = short_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Short Update Adap Block to the wire, 9 bytes from where the cursor stands */
inline encode_short_update_adap_block(short_update_adap_block_record) {
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

/* Short Update Adap Block off the wire, 9 bytes from where the cursor stands */
inline decode_short_update_adap_block(short_update_adap_block_record) {
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

/* ---- Long Update Adap Block: 17 bytes ---------------------------------------- */

/* Long Update ADAP Block */
typedef LongUpdateAdapBlock {
  byte side;
  byte price_long[8];
  byte quantity_long[8]
};

int long_update_adap_block_at;

/* every byte of Long Update Adap Block set to one value */
inline fill_long_update_adap_block(long_update_adap_block_record, long_update_adap_block_value) {
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
  long_update_adap_block_record.side = (long_update_adap_block_base + 0 + 1) % 256;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.price_long[long_update_adap_block_at] = (long_update_adap_block_base + 1 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  long_update_adap_block_at = 0;
  do
  :: long_update_adap_block_at < 8 -> long_update_adap_block_record.quantity_long[long_update_adap_block_at] = (long_update_adap_block_base + 9 + long_update_adap_block_at + 1) % 256; long_update_adap_block_at = long_update_adap_block_at + 1
  :: else -> break
  od;
  skip
}

/* Long Update Adap Block to the wire, 17 bytes from where the cursor stands */
inline encode_long_update_adap_block(long_update_adap_block_record) {
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

/* Long Update Adap Block off the wire, 17 bytes from where the cursor stands */
inline decode_long_update_adap_block(long_update_adap_block_record) {
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

/* RPI Message */
typedef RpiMessage {
  byte timestamp[8];
  byte symbol[8];
  byte reserved_1;
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
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = rpi_message_value; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.reserved_1 = rpi_message_value;
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
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = (rpi_message_base + 8 + rpi_message_at + 1) % 256; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.reserved_1 = (rpi_message_base + 16 + 1) % 256;
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
  :: rpi_message_at < 8 -> wire[at] = rpi_message_record.symbol[rpi_message_at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  wire[at] = rpi_message_record.reserved_1; at = at + 1;
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
  :: rpi_message_at < 8 -> rpi_message_record.symbol[rpi_message_at] = wire[at]; at = at + 1; rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  rpi_message_record.reserved_1 = wire[at]; at = at + 1;
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
  :: rpi_message_at < 8 -> assert(rpi_message_read.symbol[rpi_message_at] == rpi_message_written.symbol[rpi_message_at]); rpi_message_at = rpi_message_at + 1
  :: else -> break
  od;
  assert(rpi_message_read.reserved_1 == rpi_message_written.reserved_1);
  assert(rpi_message_read.retail_price_improvement == rpi_message_written.retail_price_improvement);
  skip
}

/* ---- Trade Break Message: 42 bytes ------------------------------------------- */

/* Trade Break Message */
typedef TradeBreakMessage {
  byte transaction_time[8];
  byte symbol[8];
  byte reserved_1;
  byte execution_id[8];
  byte cboe_cumulative_executed_volume[8];
  byte reserved_8[8];
  byte trade_break_flags
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.transaction_time[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.symbol[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.reserved_1 = trade_break_message_value;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.cboe_cumulative_executed_volume[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.reserved_8[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_break_flags = trade_break_message_value;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.transaction_time[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.symbol[trade_break_message_at] = (trade_break_message_base + 8 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.reserved_1 = (trade_break_message_base + 16 + 1) % 256;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 17 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.cboe_cumulative_executed_volume[trade_break_message_at] = (trade_break_message_base + 25 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.reserved_8[trade_break_message_at] = (trade_break_message_base + 33 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_break_flags = (trade_break_message_base + 41 + 1) % 256;
  skip
}

/* Trade Break Message to the wire, 42 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.transaction_time[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.symbol[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_break_message_record.reserved_1; at = at + 1;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.cboe_cumulative_executed_volume[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> wire[at] = trade_break_message_record.reserved_8[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_break_message_record.trade_break_flags; at = at + 1;
  skip
}

/* Trade Break Message off the wire, 42 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.transaction_time[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.symbol[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.reserved_1 = wire[at]; at = at + 1;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.cboe_cumulative_executed_volume[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> trade_break_message_record.reserved_8[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_record.trade_break_flags = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.transaction_time[trade_break_message_at] == trade_break_message_written.transaction_time[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.symbol[trade_break_message_at] == trade_break_message_written.symbol[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  assert(trade_break_message_read.reserved_1 == trade_break_message_written.reserved_1);
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.cboe_cumulative_executed_volume[trade_break_message_at] == trade_break_message_written.cboe_cumulative_executed_volume[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 8 -> assert(trade_break_message_read.reserved_8[trade_break_message_at] == trade_break_message_written.reserved_8[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  assert(trade_break_message_read.trade_break_flags == trade_break_message_written.trade_break_flags);
  skip
}

/* ---- Trading Status Message: 19 bytes ---------------------------------------- */

/* Trading Status Message */
typedef TradingStatusMessage {
  byte timestamp[8];
  byte symbol[8];
  byte reserved_1;
  byte halt_status;
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  trading_status_message_record.halt_status = trading_status_message_value;
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 8 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 16 + 1) % 256;
  trading_status_message_record.halt_status = (trading_status_message_base + 17 + 1) % 256;
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
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = trading_status_message_record.halt_status; at = at + 1;
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
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  trading_status_message_record.halt_status = wire[at]; at = at + 1;
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
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  assert(trading_status_message_read.halt_status == trading_status_message_written.halt_status);
  assert(trading_status_message_read.reg_sho_action == trading_status_message_written.reg_sho_action);
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
    assert(at == 9);
    at = 0;
    decode_short_update_adap_block(short_update_adap_block_got);
    assert(at == 9);
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
    assert(at == 17);
    at = 0;
    decode_long_update_adap_block(long_update_adap_block_got);
    assert(at == 17);
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
    assert(at == 42);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 42);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_clear_quote_message()
  :: run check_cboe_market_status_message()
  :: run check_short_update_adap_block()
  :: run check_long_update_adap_block()
  :: run check_rpi_message()
  :: run check_trade_break_message()
  :: run check_trading_status_message()
  fi
}
