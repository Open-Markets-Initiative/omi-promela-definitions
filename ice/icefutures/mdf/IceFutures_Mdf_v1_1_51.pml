/*
 * Intercontinental Exchange Multicast Data Feed
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
 *   - a field read in bits
 *   - a field of no fixed width
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 1008

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* iMpact Upd market data packet header */
typedef PacketHeader {
  byte session[2];
  byte sequence[4];
  byte number_of_msgs[2];
  byte sent_date_time[8]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.number_of_msgs[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sent_date_time[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 2 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.number_of_msgs[packet_header_at] = (packet_header_base + 6 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sent_date_time[packet_header_at] = (packet_header_base + 8 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.number_of_msgs[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> wire[at] = packet_header_record.sent_date_time[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.number_of_msgs[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> packet_header_record.sent_date_time[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.number_of_msgs[packet_header_at] == packet_header_written.number_of_msgs[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 8 -> assert(packet_header_read.sent_date_time[packet_header_at] == packet_header_written.sent_date_time[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* iMpact message header */
typedef MessageHeader {
  byte message_type;
  byte length[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_type = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_type = (message_header_base + 0 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = (message_header_base + 1 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_type; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_type = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_type == message_header_written.message_type);
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.length[message_header_at] == message_header_written.length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Snapshot Message: 133 bytes -------------------------------------- */

/* The market snapshot message is the same for full order depth and price level snapshot channel. */
typedef MarketSnapshotMessage {
  byte market_id[4];
  byte market_type[2];
  byte trading_status;
  byte volume[4];
  byte block_volume[4];
  byte efs_volume[4];
  byte efp_volume[4];
  byte open_interest[4];
  byte opening_price[8];
  byte settlement_price_with_deal_price_precision[8];
  byte high[8];
  byte low[8];
  byte vwap[8];
  byte num_of_book_entries[4];
  byte last_trade_price[8];
  byte last_trade_quantity[4];
  byte last_trade_date_time[8];
  byte settle_price_date_time[8];
  byte last_message_sequence_id[4];
  byte reserved_2[2];
  byte open_interest_date[10];
  byte is_settle_price_official;
  byte settlement_price[8];
  byte has_previous_day_settlement_price;
  byte previous_day_settlement_price[8]
};

int market_snapshot_message_at;

/* every byte of Market Snapshot Message set to one value */
inline fill_market_snapshot_message(market_snapshot_message_record, market_snapshot_message_value) {
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.market_id[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.market_type[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.trading_status = market_snapshot_message_value;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.volume[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.block_volume[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efs_volume[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efp_volume[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.open_interest[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.opening_price[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price_with_deal_price_precision[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.high[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.low[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.vwap[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.num_of_book_entries[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_price[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_trade_quantity[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_date_time[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settle_price_date_time[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_message_sequence_id[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.reserved_2[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 10 -> market_snapshot_message_record.open_interest_date[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.is_settle_price_official = market_snapshot_message_value;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.has_previous_day_settlement_price = market_snapshot_message_value;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.previous_day_settlement_price[market_snapshot_message_at] = market_snapshot_message_value; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_market_snapshot_message(market_snapshot_message_record, market_snapshot_message_base) {
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.market_id[market_snapshot_message_at] = (market_snapshot_message_base + 0 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.market_type[market_snapshot_message_at] = (market_snapshot_message_base + 4 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.trading_status = (market_snapshot_message_base + 6 + 1) % 256;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.volume[market_snapshot_message_at] = (market_snapshot_message_base + 7 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.block_volume[market_snapshot_message_at] = (market_snapshot_message_base + 11 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efs_volume[market_snapshot_message_at] = (market_snapshot_message_base + 15 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efp_volume[market_snapshot_message_at] = (market_snapshot_message_base + 19 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.open_interest[market_snapshot_message_at] = (market_snapshot_message_base + 23 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.opening_price[market_snapshot_message_at] = (market_snapshot_message_base + 27 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price_with_deal_price_precision[market_snapshot_message_at] = (market_snapshot_message_base + 35 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.high[market_snapshot_message_at] = (market_snapshot_message_base + 43 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.low[market_snapshot_message_at] = (market_snapshot_message_base + 51 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.vwap[market_snapshot_message_at] = (market_snapshot_message_base + 59 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.num_of_book_entries[market_snapshot_message_at] = (market_snapshot_message_base + 67 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_price[market_snapshot_message_at] = (market_snapshot_message_base + 71 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_trade_quantity[market_snapshot_message_at] = (market_snapshot_message_base + 79 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_date_time[market_snapshot_message_at] = (market_snapshot_message_base + 83 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settle_price_date_time[market_snapshot_message_at] = (market_snapshot_message_base + 91 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_message_sequence_id[market_snapshot_message_at] = (market_snapshot_message_base + 99 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.reserved_2[market_snapshot_message_at] = (market_snapshot_message_base + 103 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 10 -> market_snapshot_message_record.open_interest_date[market_snapshot_message_at] = (market_snapshot_message_base + 105 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.is_settle_price_official = (market_snapshot_message_base + 115 + 1) % 256;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price[market_snapshot_message_at] = (market_snapshot_message_base + 116 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.has_previous_day_settlement_price = (market_snapshot_message_base + 124 + 1) % 256;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.previous_day_settlement_price[market_snapshot_message_at] = (market_snapshot_message_base + 125 + market_snapshot_message_at + 1) % 256; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Message to the wire, 133 bytes from where the cursor stands */
inline encode_market_snapshot_message(market_snapshot_message_record) {
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.market_id[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> wire[at] = market_snapshot_message_record.market_type[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_message_record.trading_status; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.volume[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.block_volume[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.efs_volume[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.efp_volume[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.open_interest[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.opening_price[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.settlement_price_with_deal_price_precision[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.high[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.low[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.vwap[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.num_of_book_entries[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.last_trade_price[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.last_trade_quantity[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.last_trade_date_time[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.settle_price_date_time[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> wire[at] = market_snapshot_message_record.last_message_sequence_id[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> wire[at] = market_snapshot_message_record.reserved_2[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 10 -> wire[at] = market_snapshot_message_record.open_interest_date[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_message_record.is_settle_price_official; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.settlement_price[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_message_record.has_previous_day_settlement_price; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> wire[at] = market_snapshot_message_record.previous_day_settlement_price[market_snapshot_message_at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Message off the wire, 133 bytes from where the cursor stands */
inline decode_market_snapshot_message(market_snapshot_message_record) {
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.market_id[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.market_type[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.trading_status = wire[at]; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.volume[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.block_volume[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efs_volume[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.efp_volume[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.open_interest[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.opening_price[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price_with_deal_price_precision[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.high[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.low[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.vwap[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.num_of_book_entries[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_price[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_trade_quantity[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.last_trade_date_time[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settle_price_date_time[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> market_snapshot_message_record.last_message_sequence_id[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> market_snapshot_message_record.reserved_2[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 10 -> market_snapshot_message_record.open_interest_date[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.is_settle_price_official = wire[at]; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.settlement_price[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_record.has_previous_day_settlement_price = wire[at]; at = at + 1;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> market_snapshot_message_record.previous_day_settlement_price[market_snapshot_message_at] = wire[at]; at = at + 1; market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Snapshot Message is what was written, byte for byte */
inline equal_market_snapshot_message(market_snapshot_message_read, market_snapshot_message_written) {
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.market_id[market_snapshot_message_at] == market_snapshot_message_written.market_id[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> assert(market_snapshot_message_read.market_type[market_snapshot_message_at] == market_snapshot_message_written.market_type[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_message_read.trading_status == market_snapshot_message_written.trading_status);
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.volume[market_snapshot_message_at] == market_snapshot_message_written.volume[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.block_volume[market_snapshot_message_at] == market_snapshot_message_written.block_volume[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.efs_volume[market_snapshot_message_at] == market_snapshot_message_written.efs_volume[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.efp_volume[market_snapshot_message_at] == market_snapshot_message_written.efp_volume[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.open_interest[market_snapshot_message_at] == market_snapshot_message_written.open_interest[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.opening_price[market_snapshot_message_at] == market_snapshot_message_written.opening_price[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.settlement_price_with_deal_price_precision[market_snapshot_message_at] == market_snapshot_message_written.settlement_price_with_deal_price_precision[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.high[market_snapshot_message_at] == market_snapshot_message_written.high[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.low[market_snapshot_message_at] == market_snapshot_message_written.low[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.vwap[market_snapshot_message_at] == market_snapshot_message_written.vwap[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.num_of_book_entries[market_snapshot_message_at] == market_snapshot_message_written.num_of_book_entries[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.last_trade_price[market_snapshot_message_at] == market_snapshot_message_written.last_trade_price[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.last_trade_quantity[market_snapshot_message_at] == market_snapshot_message_written.last_trade_quantity[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.last_trade_date_time[market_snapshot_message_at] == market_snapshot_message_written.last_trade_date_time[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.settle_price_date_time[market_snapshot_message_at] == market_snapshot_message_written.settle_price_date_time[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 4 -> assert(market_snapshot_message_read.last_message_sequence_id[market_snapshot_message_at] == market_snapshot_message_written.last_message_sequence_id[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 2 -> assert(market_snapshot_message_read.reserved_2[market_snapshot_message_at] == market_snapshot_message_written.reserved_2[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 10 -> assert(market_snapshot_message_read.open_interest_date[market_snapshot_message_at] == market_snapshot_message_written.open_interest_date[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_message_read.is_settle_price_official == market_snapshot_message_written.is_settle_price_official);
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.settlement_price[market_snapshot_message_at] == market_snapshot_message_written.settlement_price[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_message_read.has_previous_day_settlement_price == market_snapshot_message_written.has_previous_day_settlement_price);
  market_snapshot_message_at = 0;
  do
  :: market_snapshot_message_at < 8 -> assert(market_snapshot_message_read.previous_day_settlement_price[market_snapshot_message_at] == market_snapshot_message_written.previous_day_settlement_price[market_snapshot_message_at]); market_snapshot_message_at = market_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spot Market Trade Message: 50 bytes ------------------------------------- */

/* This message will be sent only upon trade in spot markets and it will be rendered on spot market channels. */
typedef SpotMarketTradeMessage {
  byte market_id[4];
  byte trade_id[8];
  byte price[8];
  byte quantity[4];
  byte transact_date_time[8];
  byte extra_flags;
  byte delivery_begin_date_time[8];
  byte delivery_end_date_time[8];
  byte is_system_priced_leg
};

int spot_market_trade_message_at;

/* every byte of Spot Market Trade Message set to one value */
inline fill_spot_market_trade_message(spot_market_trade_message_record, spot_market_trade_message_value) {
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.market_id[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.trade_id[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.price[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.quantity[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.transact_date_time[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.extra_flags = spot_market_trade_message_value;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_begin_date_time[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_end_date_time[spot_market_trade_message_at] = spot_market_trade_message_value; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.is_system_priced_leg = spot_market_trade_message_value;
  skip
}

/* each byte of Spot Market Trade Message set to where it lies, so a field read out of place says so */
inline ramp_spot_market_trade_message(spot_market_trade_message_record, spot_market_trade_message_base) {
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.market_id[spot_market_trade_message_at] = (spot_market_trade_message_base + 0 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.trade_id[spot_market_trade_message_at] = (spot_market_trade_message_base + 4 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.price[spot_market_trade_message_at] = (spot_market_trade_message_base + 12 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.quantity[spot_market_trade_message_at] = (spot_market_trade_message_base + 20 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.transact_date_time[spot_market_trade_message_at] = (spot_market_trade_message_base + 24 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.extra_flags = (spot_market_trade_message_base + 32 + 1) % 256;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_begin_date_time[spot_market_trade_message_at] = (spot_market_trade_message_base + 33 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_end_date_time[spot_market_trade_message_at] = (spot_market_trade_message_base + 41 + spot_market_trade_message_at + 1) % 256; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.is_system_priced_leg = (spot_market_trade_message_base + 49 + 1) % 256;
  skip
}

/* Spot Market Trade Message to the wire, 50 bytes from where the cursor stands */
inline encode_spot_market_trade_message(spot_market_trade_message_record) {
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> wire[at] = spot_market_trade_message_record.market_id[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> wire[at] = spot_market_trade_message_record.trade_id[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> wire[at] = spot_market_trade_message_record.price[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> wire[at] = spot_market_trade_message_record.quantity[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> wire[at] = spot_market_trade_message_record.transact_date_time[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = spot_market_trade_message_record.extra_flags; at = at + 1;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> wire[at] = spot_market_trade_message_record.delivery_begin_date_time[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> wire[at] = spot_market_trade_message_record.delivery_end_date_time[spot_market_trade_message_at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = spot_market_trade_message_record.is_system_priced_leg; at = at + 1;
  skip
}

/* Spot Market Trade Message off the wire, 50 bytes from where the cursor stands */
inline decode_spot_market_trade_message(spot_market_trade_message_record) {
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.market_id[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.trade_id[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.price[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> spot_market_trade_message_record.quantity[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.transact_date_time[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.extra_flags = wire[at]; at = at + 1;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_begin_date_time[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> spot_market_trade_message_record.delivery_end_date_time[spot_market_trade_message_at] = wire[at]; at = at + 1; spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_record.is_system_priced_leg = wire[at]; at = at + 1;
  skip
}

/* what was read of Spot Market Trade Message is what was written, byte for byte */
inline equal_spot_market_trade_message(spot_market_trade_message_read, spot_market_trade_message_written) {
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> assert(spot_market_trade_message_read.market_id[spot_market_trade_message_at] == spot_market_trade_message_written.market_id[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> assert(spot_market_trade_message_read.trade_id[spot_market_trade_message_at] == spot_market_trade_message_written.trade_id[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> assert(spot_market_trade_message_read.price[spot_market_trade_message_at] == spot_market_trade_message_written.price[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 4 -> assert(spot_market_trade_message_read.quantity[spot_market_trade_message_at] == spot_market_trade_message_written.quantity[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> assert(spot_market_trade_message_read.transact_date_time[spot_market_trade_message_at] == spot_market_trade_message_written.transact_date_time[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  assert(spot_market_trade_message_read.extra_flags == spot_market_trade_message_written.extra_flags);
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> assert(spot_market_trade_message_read.delivery_begin_date_time[spot_market_trade_message_at] == spot_market_trade_message_written.delivery_begin_date_time[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  spot_market_trade_message_at = 0;
  do
  :: spot_market_trade_message_at < 8 -> assert(spot_market_trade_message_read.delivery_end_date_time[spot_market_trade_message_at] == spot_market_trade_message_written.delivery_end_date_time[spot_market_trade_message_at]); spot_market_trade_message_at = spot_market_trade_message_at + 1
  :: else -> break
  od;
  assert(spot_market_trade_message_read.is_system_priced_leg == spot_market_trade_message_written.is_system_priced_leg);
  skip
}

/* ---- Investigated Trade Message: 37 bytes ------------------------------------ */

/* This message is sent when a trade is put under investigation or the investigation is completed. Client can use the market ID and order ID to find and flag the original trade if needed. */
typedef InvestigatedTradeMessage {
  byte market_id[4];
  byte trade_id[8];
  byte price[8];
  byte quantity[4];
  byte old_off_market_trade_type;
  byte message_date_time[8];
  byte investigation_status;
  byte off_market_trade_type[3]
};

int investigated_trade_message_at;

/* every byte of Investigated Trade Message set to one value */
inline fill_investigated_trade_message(investigated_trade_message_record, investigated_trade_message_value) {
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.market_id[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.trade_id[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.price[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.quantity[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.old_off_market_trade_type = investigated_trade_message_value;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.message_date_time[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.investigation_status = investigated_trade_message_value;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 3 -> investigated_trade_message_record.off_market_trade_type[investigated_trade_message_at] = investigated_trade_message_value; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Investigated Trade Message set to where it lies, so a field read out of place says so */
inline ramp_investigated_trade_message(investigated_trade_message_record, investigated_trade_message_base) {
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.market_id[investigated_trade_message_at] = (investigated_trade_message_base + 0 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.trade_id[investigated_trade_message_at] = (investigated_trade_message_base + 4 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.price[investigated_trade_message_at] = (investigated_trade_message_base + 12 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.quantity[investigated_trade_message_at] = (investigated_trade_message_base + 20 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.old_off_market_trade_type = (investigated_trade_message_base + 24 + 1) % 256;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.message_date_time[investigated_trade_message_at] = (investigated_trade_message_base + 25 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.investigation_status = (investigated_trade_message_base + 33 + 1) % 256;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 3 -> investigated_trade_message_record.off_market_trade_type[investigated_trade_message_at] = (investigated_trade_message_base + 34 + investigated_trade_message_at + 1) % 256; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investigated Trade Message to the wire, 37 bytes from where the cursor stands */
inline encode_investigated_trade_message(investigated_trade_message_record) {
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> wire[at] = investigated_trade_message_record.market_id[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> wire[at] = investigated_trade_message_record.trade_id[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> wire[at] = investigated_trade_message_record.price[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> wire[at] = investigated_trade_message_record.quantity[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = investigated_trade_message_record.old_off_market_trade_type; at = at + 1;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> wire[at] = investigated_trade_message_record.message_date_time[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = investigated_trade_message_record.investigation_status; at = at + 1;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 3 -> wire[at] = investigated_trade_message_record.off_market_trade_type[investigated_trade_message_at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Investigated Trade Message off the wire, 37 bytes from where the cursor stands */
inline decode_investigated_trade_message(investigated_trade_message_record) {
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.market_id[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.trade_id[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.price[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> investigated_trade_message_record.quantity[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.old_off_market_trade_type = wire[at]; at = at + 1;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> investigated_trade_message_record.message_date_time[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_record.investigation_status = wire[at]; at = at + 1;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 3 -> investigated_trade_message_record.off_market_trade_type[investigated_trade_message_at] = wire[at]; at = at + 1; investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Investigated Trade Message is what was written, byte for byte */
inline equal_investigated_trade_message(investigated_trade_message_read, investigated_trade_message_written) {
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> assert(investigated_trade_message_read.market_id[investigated_trade_message_at] == investigated_trade_message_written.market_id[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> assert(investigated_trade_message_read.trade_id[investigated_trade_message_at] == investigated_trade_message_written.trade_id[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> assert(investigated_trade_message_read.price[investigated_trade_message_at] == investigated_trade_message_written.price[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 4 -> assert(investigated_trade_message_read.quantity[investigated_trade_message_at] == investigated_trade_message_written.quantity[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  assert(investigated_trade_message_read.old_off_market_trade_type == investigated_trade_message_written.old_off_market_trade_type);
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 8 -> assert(investigated_trade_message_read.message_date_time[investigated_trade_message_at] == investigated_trade_message_written.message_date_time[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  assert(investigated_trade_message_read.investigation_status == investigated_trade_message_written.investigation_status);
  investigated_trade_message_at = 0;
  do
  :: investigated_trade_message_at < 3 -> assert(investigated_trade_message_read.off_market_trade_type[investigated_trade_message_at] == investigated_trade_message_written.off_market_trade_type[investigated_trade_message_at]); investigated_trade_message_at = investigated_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancelled Trade Message: 36 bytes --------------------------------------- */

/* This message is sent when a trade is cancelled. */
typedef CancelledTradeMessage {
  byte market_id[4];
  byte trade_id[8];
  byte price[8];
  byte quantity[4];
  byte old_off_market_trade_type;
  byte message_date_time[8];
  byte off_market_trade_type[3]
};

int cancelled_trade_message_at;

/* every byte of Cancelled Trade Message set to one value */
inline fill_cancelled_trade_message(cancelled_trade_message_record, cancelled_trade_message_value) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.market_id[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.trade_id[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.price[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.quantity[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.old_off_market_trade_type = cancelled_trade_message_value;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.message_date_time[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 3 -> cancelled_trade_message_record.off_market_trade_type[cancelled_trade_message_at] = cancelled_trade_message_value; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancelled Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cancelled_trade_message(cancelled_trade_message_record, cancelled_trade_message_base) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.market_id[cancelled_trade_message_at] = (cancelled_trade_message_base + 0 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.trade_id[cancelled_trade_message_at] = (cancelled_trade_message_base + 4 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.price[cancelled_trade_message_at] = (cancelled_trade_message_base + 12 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.quantity[cancelled_trade_message_at] = (cancelled_trade_message_base + 20 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.old_off_market_trade_type = (cancelled_trade_message_base + 24 + 1) % 256;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.message_date_time[cancelled_trade_message_at] = (cancelled_trade_message_base + 25 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 3 -> cancelled_trade_message_record.off_market_trade_type[cancelled_trade_message_at] = (cancelled_trade_message_base + 33 + cancelled_trade_message_at + 1) % 256; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Trade Message to the wire, 36 bytes from where the cursor stands */
inline encode_cancelled_trade_message(cancelled_trade_message_record) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> wire[at] = cancelled_trade_message_record.market_id[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.trade_id[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.price[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> wire[at] = cancelled_trade_message_record.quantity[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cancelled_trade_message_record.old_off_market_trade_type; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> wire[at] = cancelled_trade_message_record.message_date_time[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 3 -> wire[at] = cancelled_trade_message_record.off_market_trade_type[cancelled_trade_message_at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancelled Trade Message off the wire, 36 bytes from where the cursor stands */
inline decode_cancelled_trade_message(cancelled_trade_message_record) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.market_id[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.trade_id[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.price[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> cancelled_trade_message_record.quantity[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_record.old_off_market_trade_type = wire[at]; at = at + 1;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> cancelled_trade_message_record.message_date_time[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 3 -> cancelled_trade_message_record.off_market_trade_type[cancelled_trade_message_at] = wire[at]; at = at + 1; cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancelled Trade Message is what was written, byte for byte */
inline equal_cancelled_trade_message(cancelled_trade_message_read, cancelled_trade_message_written) {
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> assert(cancelled_trade_message_read.market_id[cancelled_trade_message_at] == cancelled_trade_message_written.market_id[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.trade_id[cancelled_trade_message_at] == cancelled_trade_message_written.trade_id[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.price[cancelled_trade_message_at] == cancelled_trade_message_written.price[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 4 -> assert(cancelled_trade_message_read.quantity[cancelled_trade_message_at] == cancelled_trade_message_written.quantity[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  assert(cancelled_trade_message_read.old_off_market_trade_type == cancelled_trade_message_written.old_off_market_trade_type);
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 8 -> assert(cancelled_trade_message_read.message_date_time[cancelled_trade_message_at] == cancelled_trade_message_written.message_date_time[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  cancelled_trade_message_at = 0;
  do
  :: cancelled_trade_message_at < 3 -> assert(cancelled_trade_message_read.off_market_trade_type[cancelled_trade_message_at] == cancelled_trade_message_written.off_market_trade_type[cancelled_trade_message_at]); cancelled_trade_message_at = cancelled_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Statistics Message: 52 bytes ------------------------------------- */

/* This is usually sent after a trade or cancelled trade message. */
typedef MarketStatisticsMessage {
  byte market_id[4];
  byte volume[4];
  byte block_volume[4];
  byte efs_volume[4];
  byte efp_volume[4];
  byte high[8];
  byte low[8];
  byte vwap[8];
  byte message_date_time[8]
};

int market_statistics_message_at;

/* every byte of Market Statistics Message set to one value */
inline fill_market_statistics_message(market_statistics_message_record, market_statistics_message_value) {
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.market_id[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.volume[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.block_volume[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efs_volume[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efp_volume[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.high[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.low[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.vwap[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.message_date_time[market_statistics_message_at] = market_statistics_message_value; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_market_statistics_message(market_statistics_message_record, market_statistics_message_base) {
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.market_id[market_statistics_message_at] = (market_statistics_message_base + 0 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.volume[market_statistics_message_at] = (market_statistics_message_base + 4 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.block_volume[market_statistics_message_at] = (market_statistics_message_base + 8 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efs_volume[market_statistics_message_at] = (market_statistics_message_base + 12 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efp_volume[market_statistics_message_at] = (market_statistics_message_base + 16 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.high[market_statistics_message_at] = (market_statistics_message_base + 20 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.low[market_statistics_message_at] = (market_statistics_message_base + 28 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.vwap[market_statistics_message_at] = (market_statistics_message_base + 36 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.message_date_time[market_statistics_message_at] = (market_statistics_message_base + 44 + market_statistics_message_at + 1) % 256; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Statistics Message to the wire, 52 bytes from where the cursor stands */
inline encode_market_statistics_message(market_statistics_message_record) {
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> wire[at] = market_statistics_message_record.market_id[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> wire[at] = market_statistics_message_record.volume[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> wire[at] = market_statistics_message_record.block_volume[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> wire[at] = market_statistics_message_record.efs_volume[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> wire[at] = market_statistics_message_record.efp_volume[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> wire[at] = market_statistics_message_record.high[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> wire[at] = market_statistics_message_record.low[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> wire[at] = market_statistics_message_record.vwap[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> wire[at] = market_statistics_message_record.message_date_time[market_statistics_message_at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Statistics Message off the wire, 52 bytes from where the cursor stands */
inline decode_market_statistics_message(market_statistics_message_record) {
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.market_id[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.volume[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.block_volume[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efs_volume[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> market_statistics_message_record.efp_volume[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.high[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.low[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.vwap[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> market_statistics_message_record.message_date_time[market_statistics_message_at] = wire[at]; at = at + 1; market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Statistics Message is what was written, byte for byte */
inline equal_market_statistics_message(market_statistics_message_read, market_statistics_message_written) {
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> assert(market_statistics_message_read.market_id[market_statistics_message_at] == market_statistics_message_written.market_id[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> assert(market_statistics_message_read.volume[market_statistics_message_at] == market_statistics_message_written.volume[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> assert(market_statistics_message_read.block_volume[market_statistics_message_at] == market_statistics_message_written.block_volume[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> assert(market_statistics_message_read.efs_volume[market_statistics_message_at] == market_statistics_message_written.efs_volume[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 4 -> assert(market_statistics_message_read.efp_volume[market_statistics_message_at] == market_statistics_message_written.efp_volume[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> assert(market_statistics_message_read.high[market_statistics_message_at] == market_statistics_message_written.high[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> assert(market_statistics_message_read.low[market_statistics_message_at] == market_statistics_message_written.low[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> assert(market_statistics_message_read.vwap[market_statistics_message_at] == market_statistics_message_written.vwap[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  market_statistics_message_at = 0;
  do
  :: market_statistics_message_at < 8 -> assert(market_statistics_message_read.message_date_time[market_statistics_message_at] == market_statistics_message_written.message_date_time[market_statistics_message_at]); market_statistics_message_at = market_statistics_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market State Change Message: 13 bytes ----------------------------------- */

/* Market State Change Message */
typedef MarketStateChangeMessage {
  byte market_id[4];
  byte trading_status;
  byte message_date_time[8]
};

int market_state_change_message_at;

/* every byte of Market State Change Message set to one value */
inline fill_market_state_change_message(market_state_change_message_record, market_state_change_message_value) {
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 4 -> market_state_change_message_record.market_id[market_state_change_message_at] = market_state_change_message_value; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  market_state_change_message_record.trading_status = market_state_change_message_value;
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 8 -> market_state_change_message_record.message_date_time[market_state_change_message_at] = market_state_change_message_value; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market State Change Message set to where it lies, so a field read out of place says so */
inline ramp_market_state_change_message(market_state_change_message_record, market_state_change_message_base) {
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 4 -> market_state_change_message_record.market_id[market_state_change_message_at] = (market_state_change_message_base + 0 + market_state_change_message_at + 1) % 256; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  market_state_change_message_record.trading_status = (market_state_change_message_base + 4 + 1) % 256;
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 8 -> market_state_change_message_record.message_date_time[market_state_change_message_at] = (market_state_change_message_base + 5 + market_state_change_message_at + 1) % 256; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Change Message to the wire, 13 bytes from where the cursor stands */
inline encode_market_state_change_message(market_state_change_message_record) {
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 4 -> wire[at] = market_state_change_message_record.market_id[market_state_change_message_at]; at = at + 1; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  wire[at] = market_state_change_message_record.trading_status; at = at + 1;
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 8 -> wire[at] = market_state_change_message_record.message_date_time[market_state_change_message_at]; at = at + 1; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market State Change Message off the wire, 13 bytes from where the cursor stands */
inline decode_market_state_change_message(market_state_change_message_record) {
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 4 -> market_state_change_message_record.market_id[market_state_change_message_at] = wire[at]; at = at + 1; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  market_state_change_message_record.trading_status = wire[at]; at = at + 1;
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 8 -> market_state_change_message_record.message_date_time[market_state_change_message_at] = wire[at]; at = at + 1; market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market State Change Message is what was written, byte for byte */
inline equal_market_state_change_message(market_state_change_message_read, market_state_change_message_written) {
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 4 -> assert(market_state_change_message_read.market_id[market_state_change_message_at] == market_state_change_message_written.market_id[market_state_change_message_at]); market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  assert(market_state_change_message_read.trading_status == market_state_change_message_written.trading_status);
  market_state_change_message_at = 0;
  do
  :: market_state_change_message_at < 8 -> assert(market_state_change_message_read.message_date_time[market_state_change_message_at] == market_state_change_message_written.message_date_time[market_state_change_message_at]); market_state_change_message_at = market_state_change_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Text Message: 1008 bytes ----------------------------------------- */

/* System Text Message */
typedef SystemTextMessage {
  byte text_message[200];
  byte message_date_time[8];
  byte text_message_extra_fld[800]
};

int system_text_message_at;

/* every byte of System Text Message set to one value */
inline fill_system_text_message(system_text_message_record, system_text_message_value) {
  system_text_message_at = 0;
  do
  :: system_text_message_at < 200 -> system_text_message_record.text_message[system_text_message_at] = system_text_message_value; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 8 -> system_text_message_record.message_date_time[system_text_message_at] = system_text_message_value; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 800 -> system_text_message_record.text_message_extra_fld[system_text_message_at] = system_text_message_value; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Text Message set to where it lies, so a field read out of place says so */
inline ramp_system_text_message(system_text_message_record, system_text_message_base) {
  system_text_message_at = 0;
  do
  :: system_text_message_at < 200 -> system_text_message_record.text_message[system_text_message_at] = (system_text_message_base + 0 + system_text_message_at + 1) % 256; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 8 -> system_text_message_record.message_date_time[system_text_message_at] = (system_text_message_base + 200 + system_text_message_at + 1) % 256; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 800 -> system_text_message_record.text_message_extra_fld[system_text_message_at] = (system_text_message_base + 208 + system_text_message_at + 1) % 256; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Text Message to the wire, 1008 bytes from where the cursor stands */
inline encode_system_text_message(system_text_message_record) {
  system_text_message_at = 0;
  do
  :: system_text_message_at < 200 -> wire[at] = system_text_message_record.text_message[system_text_message_at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 8 -> wire[at] = system_text_message_record.message_date_time[system_text_message_at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 800 -> wire[at] = system_text_message_record.text_message_extra_fld[system_text_message_at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Text Message off the wire, 1008 bytes from where the cursor stands */
inline decode_system_text_message(system_text_message_record) {
  system_text_message_at = 0;
  do
  :: system_text_message_at < 200 -> system_text_message_record.text_message[system_text_message_at] = wire[at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 8 -> system_text_message_record.message_date_time[system_text_message_at] = wire[at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 800 -> system_text_message_record.text_message_extra_fld[system_text_message_at] = wire[at]; at = at + 1; system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Text Message is what was written, byte for byte */
inline equal_system_text_message(system_text_message_read, system_text_message_written) {
  system_text_message_at = 0;
  do
  :: system_text_message_at < 200 -> assert(system_text_message_read.text_message[system_text_message_at] == system_text_message_written.text_message[system_text_message_at]); system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 8 -> assert(system_text_message_read.message_date_time[system_text_message_at] == system_text_message_written.message_date_time[system_text_message_at]); system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  system_text_message_at = 0;
  do
  :: system_text_message_at < 800 -> assert(system_text_message_read.text_message_extra_fld[system_text_message_at] == system_text_message_written.text_message_extra_fld[system_text_message_at]); system_text_message_at = system_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 30 bytes ----------------------------------------- */

/* Open Interest Message */
typedef OpenInterestMessage {
  byte market_id[4];
  byte open_interest[4];
  byte open_interest_change[4];
  byte message_date_time[8];
  byte open_interest_date[10]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.market_id[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest_change[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.message_date_time[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 10 -> open_interest_message_record.open_interest_date[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.market_id[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest_change[open_interest_message_at] = (open_interest_message_base + 8 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.message_date_time[open_interest_message_at] = (open_interest_message_base + 12 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 10 -> open_interest_message_record.open_interest_date[open_interest_message_at] = (open_interest_message_base + 20 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 30 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.market_id[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest_change[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> wire[at] = open_interest_message_record.message_date_time[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 10 -> wire[at] = open_interest_message_record.open_interest_date[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 30 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.market_id[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest_change[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> open_interest_message_record.message_date_time[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 10 -> open_interest_message_record.open_interest_date[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.market_id[open_interest_message_at] == open_interest_message_written.market_id[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest_change[open_interest_message_at] == open_interest_message_written.open_interest_change[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 8 -> assert(open_interest_message_read.message_date_time[open_interest_message_at] == open_interest_message_written.message_date_time[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 10 -> assert(open_interest_message_read.open_interest_date[open_interest_message_at] == open_interest_message_written.open_interest_date[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Price Message: 20 bytes -------------------------------------------- */

/* Open Price Message */
typedef OpenPriceMessage {
  byte market_id[4];
  byte open_price[8];
  byte message_date_time[8]
};

int open_price_message_at;

/* every byte of Open Price Message set to one value */
inline fill_open_price_message(open_price_message_record, open_price_message_value) {
  open_price_message_at = 0;
  do
  :: open_price_message_at < 4 -> open_price_message_record.market_id[open_price_message_at] = open_price_message_value; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.open_price[open_price_message_at] = open_price_message_value; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.message_date_time[open_price_message_at] = open_price_message_value; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Price Message set to where it lies, so a field read out of place says so */
inline ramp_open_price_message(open_price_message_record, open_price_message_base) {
  open_price_message_at = 0;
  do
  :: open_price_message_at < 4 -> open_price_message_record.market_id[open_price_message_at] = (open_price_message_base + 0 + open_price_message_at + 1) % 256; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.open_price[open_price_message_at] = (open_price_message_base + 4 + open_price_message_at + 1) % 256; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.message_date_time[open_price_message_at] = (open_price_message_base + 12 + open_price_message_at + 1) % 256; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Price Message to the wire, 20 bytes from where the cursor stands */
inline encode_open_price_message(open_price_message_record) {
  open_price_message_at = 0;
  do
  :: open_price_message_at < 4 -> wire[at] = open_price_message_record.market_id[open_price_message_at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> wire[at] = open_price_message_record.open_price[open_price_message_at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> wire[at] = open_price_message_record.message_date_time[open_price_message_at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Price Message off the wire, 20 bytes from where the cursor stands */
inline decode_open_price_message(open_price_message_record) {
  open_price_message_at = 0;
  do
  :: open_price_message_at < 4 -> open_price_message_record.market_id[open_price_message_at] = wire[at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.open_price[open_price_message_at] = wire[at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> open_price_message_record.message_date_time[open_price_message_at] = wire[at]; at = at + 1; open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Price Message is what was written, byte for byte */
inline equal_open_price_message(open_price_message_read, open_price_message_written) {
  open_price_message_at = 0;
  do
  :: open_price_message_at < 4 -> assert(open_price_message_read.market_id[open_price_message_at] == open_price_message_written.market_id[open_price_message_at]); open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> assert(open_price_message_read.open_price[open_price_message_at] == open_price_message_written.open_price[open_price_message_at]); open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  open_price_message_at = 0;
  do
  :: open_price_message_at < 8 -> assert(open_price_message_read.message_date_time[open_price_message_at] == open_price_message_written.message_date_time[open_price_message_at]); open_price_message_at = open_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Close Price Message: 20 bytes ------------------------------------------- */

/* Close Price Message */
typedef ClosePriceMessage {
  byte market_id[4];
  byte close_price[8];
  byte message_date_time[8]
};

int close_price_message_at;

/* every byte of Close Price Message set to one value */
inline fill_close_price_message(close_price_message_record, close_price_message_value) {
  close_price_message_at = 0;
  do
  :: close_price_message_at < 4 -> close_price_message_record.market_id[close_price_message_at] = close_price_message_value; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.close_price[close_price_message_at] = close_price_message_value; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.message_date_time[close_price_message_at] = close_price_message_value; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Close Price Message set to where it lies, so a field read out of place says so */
inline ramp_close_price_message(close_price_message_record, close_price_message_base) {
  close_price_message_at = 0;
  do
  :: close_price_message_at < 4 -> close_price_message_record.market_id[close_price_message_at] = (close_price_message_base + 0 + close_price_message_at + 1) % 256; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.close_price[close_price_message_at] = (close_price_message_base + 4 + close_price_message_at + 1) % 256; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.message_date_time[close_price_message_at] = (close_price_message_base + 12 + close_price_message_at + 1) % 256; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Close Price Message to the wire, 20 bytes from where the cursor stands */
inline encode_close_price_message(close_price_message_record) {
  close_price_message_at = 0;
  do
  :: close_price_message_at < 4 -> wire[at] = close_price_message_record.market_id[close_price_message_at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> wire[at] = close_price_message_record.close_price[close_price_message_at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> wire[at] = close_price_message_record.message_date_time[close_price_message_at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Close Price Message off the wire, 20 bytes from where the cursor stands */
inline decode_close_price_message(close_price_message_record) {
  close_price_message_at = 0;
  do
  :: close_price_message_at < 4 -> close_price_message_record.market_id[close_price_message_at] = wire[at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.close_price[close_price_message_at] = wire[at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> close_price_message_record.message_date_time[close_price_message_at] = wire[at]; at = at + 1; close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Close Price Message is what was written, byte for byte */
inline equal_close_price_message(close_price_message_read, close_price_message_written) {
  close_price_message_at = 0;
  do
  :: close_price_message_at < 4 -> assert(close_price_message_read.market_id[close_price_message_at] == close_price_message_written.market_id[close_price_message_at]); close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> assert(close_price_message_read.close_price[close_price_message_at] == close_price_message_written.close_price[close_price_message_at]); close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  close_price_message_at = 0;
  do
  :: close_price_message_at < 8 -> assert(close_price_message_read.message_date_time[close_price_message_at] == close_price_message_written.message_date_time[close_price_message_at]); close_price_message_at = close_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Settlement Price Message: 37 bytes -------------------------------------- */

/* Settlement prices could be official or unofficial. For a given market, the exchange usually sends out unofficial price before the official one. */
typedef SettlementPriceMessage {
  byte market_id[4];
  byte settlement_price_with_deal_price_precision[8];
  byte message_date_time[8];
  byte is_official;
  byte valuation_date_time[8];
  byte settlement_price[8]
};

int settlement_price_message_at;

/* every byte of Settlement Price Message set to one value */
inline fill_settlement_price_message(settlement_price_message_record, settlement_price_message_value) {
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 4 -> settlement_price_message_record.market_id[settlement_price_message_at] = settlement_price_message_value; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price_with_deal_price_precision[settlement_price_message_at] = settlement_price_message_value; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.message_date_time[settlement_price_message_at] = settlement_price_message_value; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_record.is_official = settlement_price_message_value;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.valuation_date_time[settlement_price_message_at] = settlement_price_message_value; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price[settlement_price_message_at] = settlement_price_message_value; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Settlement Price Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_price_message(settlement_price_message_record, settlement_price_message_base) {
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 4 -> settlement_price_message_record.market_id[settlement_price_message_at] = (settlement_price_message_base + 0 + settlement_price_message_at + 1) % 256; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price_with_deal_price_precision[settlement_price_message_at] = (settlement_price_message_base + 4 + settlement_price_message_at + 1) % 256; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.message_date_time[settlement_price_message_at] = (settlement_price_message_base + 12 + settlement_price_message_at + 1) % 256; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_record.is_official = (settlement_price_message_base + 20 + 1) % 256;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.valuation_date_time[settlement_price_message_at] = (settlement_price_message_base + 21 + settlement_price_message_at + 1) % 256; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price[settlement_price_message_at] = (settlement_price_message_base + 29 + settlement_price_message_at + 1) % 256; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Price Message to the wire, 37 bytes from where the cursor stands */
inline encode_settlement_price_message(settlement_price_message_record) {
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 4 -> wire[at] = settlement_price_message_record.market_id[settlement_price_message_at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> wire[at] = settlement_price_message_record.settlement_price_with_deal_price_precision[settlement_price_message_at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> wire[at] = settlement_price_message_record.message_date_time[settlement_price_message_at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_price_message_record.is_official; at = at + 1;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> wire[at] = settlement_price_message_record.valuation_date_time[settlement_price_message_at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> wire[at] = settlement_price_message_record.settlement_price[settlement_price_message_at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Settlement Price Message off the wire, 37 bytes from where the cursor stands */
inline decode_settlement_price_message(settlement_price_message_record) {
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 4 -> settlement_price_message_record.market_id[settlement_price_message_at] = wire[at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price_with_deal_price_precision[settlement_price_message_at] = wire[at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.message_date_time[settlement_price_message_at] = wire[at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_record.is_official = wire[at]; at = at + 1;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.valuation_date_time[settlement_price_message_at] = wire[at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> settlement_price_message_record.settlement_price[settlement_price_message_at] = wire[at]; at = at + 1; settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Settlement Price Message is what was written, byte for byte */
inline equal_settlement_price_message(settlement_price_message_read, settlement_price_message_written) {
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 4 -> assert(settlement_price_message_read.market_id[settlement_price_message_at] == settlement_price_message_written.market_id[settlement_price_message_at]); settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> assert(settlement_price_message_read.settlement_price_with_deal_price_precision[settlement_price_message_at] == settlement_price_message_written.settlement_price_with_deal_price_precision[settlement_price_message_at]); settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> assert(settlement_price_message_read.message_date_time[settlement_price_message_at] == settlement_price_message_written.message_date_time[settlement_price_message_at]); settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  assert(settlement_price_message_read.is_official == settlement_price_message_written.is_official);
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> assert(settlement_price_message_read.valuation_date_time[settlement_price_message_at] == settlement_price_message_written.valuation_date_time[settlement_price_message_at]); settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  settlement_price_message_at = 0;
  do
  :: settlement_price_message_at < 8 -> assert(settlement_price_message_read.settlement_price[settlement_price_message_at] == settlement_price_message_written.settlement_price[settlement_price_message_at]); settlement_price_message_at = settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Prices Message: 66 bytes ------------------------------------------ */

/* The exchange sends out Marker/Index Prices when there is an update */
typedef IndexPricesMessage {
  byte market_id[4];
  byte price[8];
  byte short_name[30];
  byte published_date_time[8];
  byte valuation_date_applying_date[10];
  byte endex_status;
  byte alt_market_id[4];
  byte index_price_denominator
};

int index_prices_message_at;

/* every byte of Index Prices Message set to one value */
inline fill_index_prices_message(index_prices_message_record, index_prices_message_value) {
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.market_id[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.price[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 30 -> index_prices_message_record.short_name[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.published_date_time[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 10 -> index_prices_message_record.valuation_date_applying_date[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.endex_status = index_prices_message_value;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.alt_market_id[index_prices_message_at] = index_prices_message_value; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.index_price_denominator = index_prices_message_value;
  skip
}

/* each byte of Index Prices Message set to where it lies, so a field read out of place says so */
inline ramp_index_prices_message(index_prices_message_record, index_prices_message_base) {
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.market_id[index_prices_message_at] = (index_prices_message_base + 0 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.price[index_prices_message_at] = (index_prices_message_base + 4 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 30 -> index_prices_message_record.short_name[index_prices_message_at] = (index_prices_message_base + 12 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.published_date_time[index_prices_message_at] = (index_prices_message_base + 42 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 10 -> index_prices_message_record.valuation_date_applying_date[index_prices_message_at] = (index_prices_message_base + 50 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.endex_status = (index_prices_message_base + 60 + 1) % 256;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.alt_market_id[index_prices_message_at] = (index_prices_message_base + 61 + index_prices_message_at + 1) % 256; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.index_price_denominator = (index_prices_message_base + 65 + 1) % 256;
  skip
}

/* Index Prices Message to the wire, 66 bytes from where the cursor stands */
inline encode_index_prices_message(index_prices_message_record) {
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> wire[at] = index_prices_message_record.market_id[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> wire[at] = index_prices_message_record.price[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 30 -> wire[at] = index_prices_message_record.short_name[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> wire[at] = index_prices_message_record.published_date_time[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 10 -> wire[at] = index_prices_message_record.valuation_date_applying_date[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  wire[at] = index_prices_message_record.endex_status; at = at + 1;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> wire[at] = index_prices_message_record.alt_market_id[index_prices_message_at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  wire[at] = index_prices_message_record.index_price_denominator; at = at + 1;
  skip
}

/* Index Prices Message off the wire, 66 bytes from where the cursor stands */
inline decode_index_prices_message(index_prices_message_record) {
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.market_id[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.price[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 30 -> index_prices_message_record.short_name[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> index_prices_message_record.published_date_time[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 10 -> index_prices_message_record.valuation_date_applying_date[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.endex_status = wire[at]; at = at + 1;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> index_prices_message_record.alt_market_id[index_prices_message_at] = wire[at]; at = at + 1; index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_record.index_price_denominator = wire[at]; at = at + 1;
  skip
}

/* what was read of Index Prices Message is what was written, byte for byte */
inline equal_index_prices_message(index_prices_message_read, index_prices_message_written) {
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> assert(index_prices_message_read.market_id[index_prices_message_at] == index_prices_message_written.market_id[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> assert(index_prices_message_read.price[index_prices_message_at] == index_prices_message_written.price[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 30 -> assert(index_prices_message_read.short_name[index_prices_message_at] == index_prices_message_written.short_name[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 8 -> assert(index_prices_message_read.published_date_time[index_prices_message_at] == index_prices_message_written.published_date_time[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 10 -> assert(index_prices_message_read.valuation_date_applying_date[index_prices_message_at] == index_prices_message_written.valuation_date_applying_date[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  assert(index_prices_message_read.endex_status == index_prices_message_written.endex_status);
  index_prices_message_at = 0;
  do
  :: index_prices_message_at < 4 -> assert(index_prices_message_read.alt_market_id[index_prices_message_at] == index_prices_message_written.alt_market_id[index_prices_message_at]); index_prices_message_at = index_prices_message_at + 1
  :: else -> break
  od;
  assert(index_prices_message_read.index_price_denominator == index_prices_message_written.index_price_denominator);
  skip
}

/* ---- End Of Day Market Summary Message: 80 bytes ----------------------------- */

/* The message is streamed to client when market is closed and settlement price is available for the current trading day. */
typedef EndOfDayMarketSummaryMessage {
  byte market_id[4];
  byte volume[4];
  byte block_volume[4];
  byte efs_volume[4];
  byte efp_volume[4];
  byte opening_price[8];
  byte high[8];
  byte low[8];
  byte vwap[8];
  byte settlement_price_with_deal_price_precision[8];
  byte open_interest[4];
  byte message_date_time[8];
  byte settlement_price[8]
};

int end_of_day_market_summary_message_at;

/* every byte of End Of Day Market Summary Message set to one value */
inline fill_end_of_day_market_summary_message(end_of_day_market_summary_message_record, end_of_day_market_summary_message_value) {
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.market_id[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.volume[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.block_volume[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efs_volume[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efp_volume[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.opening_price[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.high[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.low[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.vwap[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.open_interest[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.message_date_time[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price[end_of_day_market_summary_message_at] = end_of_day_market_summary_message_value; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Market Summary Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_market_summary_message(end_of_day_market_summary_message_record, end_of_day_market_summary_message_base) {
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.market_id[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 0 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.volume[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 4 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.block_volume[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 8 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efs_volume[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 12 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efp_volume[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 16 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.opening_price[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 20 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.high[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 28 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.low[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 36 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.vwap[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 44 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 52 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.open_interest[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 60 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.message_date_time[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 64 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price[end_of_day_market_summary_message_at] = (end_of_day_market_summary_message_base + 72 + end_of_day_market_summary_message_at + 1) % 256; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Market Summary Message to the wire, 80 bytes from where the cursor stands */
inline encode_end_of_day_market_summary_message(end_of_day_market_summary_message_record) {
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.market_id[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.volume[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.block_volume[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.efs_volume[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.efp_volume[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.opening_price[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.high[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.low[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.vwap[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> wire[at] = end_of_day_market_summary_message_record.open_interest[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.message_date_time[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> wire[at] = end_of_day_market_summary_message_record.settlement_price[end_of_day_market_summary_message_at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Market Summary Message off the wire, 80 bytes from where the cursor stands */
inline decode_end_of_day_market_summary_message(end_of_day_market_summary_message_record) {
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.market_id[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.volume[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.block_volume[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efs_volume[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.efp_volume[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.opening_price[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.high[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.low[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.vwap[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> end_of_day_market_summary_message_record.open_interest[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.message_date_time[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> end_of_day_market_summary_message_record.settlement_price[end_of_day_market_summary_message_at] = wire[at]; at = at + 1; end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Market Summary Message is what was written, byte for byte */
inline equal_end_of_day_market_summary_message(end_of_day_market_summary_message_read, end_of_day_market_summary_message_written) {
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.market_id[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.market_id[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.volume[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.volume[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.block_volume[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.block_volume[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.efs_volume[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.efs_volume[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.efp_volume[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.efp_volume[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.opening_price[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.opening_price[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.high[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.high[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.low[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.low[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.vwap[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.vwap[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.settlement_price_with_deal_price_precision[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 4 -> assert(end_of_day_market_summary_message_read.open_interest[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.open_interest[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.message_date_time[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.message_date_time[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  end_of_day_market_summary_message_at = 0;
  do
  :: end_of_day_market_summary_message_at < 8 -> assert(end_of_day_market_summary_message_read.settlement_price[end_of_day_market_summary_message_at] == end_of_day_market_summary_message_written.settlement_price[end_of_day_market_summary_message_at]); end_of_day_market_summary_message_at = end_of_day_market_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Event Message: 13 bytes ------------------------------------------ */

/* End of Day Market Summary Message */
typedef MarketEventMessage {
  byte market_id[4];
  byte event_type;
  byte message_date_time[8]
};

int market_event_message_at;

/* every byte of Market Event Message set to one value */
inline fill_market_event_message(market_event_message_record, market_event_message_value) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 4 -> market_event_message_record.market_id[market_event_message_at] = market_event_message_value; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event_type = market_event_message_value;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.message_date_time[market_event_message_at] = market_event_message_value; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Event Message set to where it lies, so a field read out of place says so */
inline ramp_market_event_message(market_event_message_record, market_event_message_base) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 4 -> market_event_message_record.market_id[market_event_message_at] = (market_event_message_base + 0 + market_event_message_at + 1) % 256; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event_type = (market_event_message_base + 4 + 1) % 256;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.message_date_time[market_event_message_at] = (market_event_message_base + 5 + market_event_message_at + 1) % 256; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Event Message to the wire, 13 bytes from where the cursor stands */
inline encode_market_event_message(market_event_message_record) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 4 -> wire[at] = market_event_message_record.market_id[market_event_message_at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  wire[at] = market_event_message_record.event_type; at = at + 1;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> wire[at] = market_event_message_record.message_date_time[market_event_message_at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Event Message off the wire, 13 bytes from where the cursor stands */
inline decode_market_event_message(market_event_message_record) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 4 -> market_event_message_record.market_id[market_event_message_at] = wire[at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  market_event_message_record.event_type = wire[at]; at = at + 1;
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> market_event_message_record.message_date_time[market_event_message_at] = wire[at]; at = at + 1; market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Event Message is what was written, byte for byte */
inline equal_market_event_message(market_event_message_read, market_event_message_written) {
  market_event_message_at = 0;
  do
  :: market_event_message_at < 4 -> assert(market_event_message_read.market_id[market_event_message_at] == market_event_message_written.market_id[market_event_message_at]); market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  assert(market_event_message_read.event_type == market_event_message_written.event_type);
  market_event_message_at = 0;
  do
  :: market_event_message_at < 8 -> assert(market_event_message_read.message_date_time[market_event_message_at] == market_event_message_written.message_date_time[market_event_message_at]); market_event_message_at = market_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Pre Open Price Indicator Message: 25 bytes ------------------------------ */

/* This message contains the estimate of what the opening price could be, based on the orders in the market or previous settlement price. */
typedef PreOpenPriceIndicatorMessage {
  byte market_id[4];
  byte pre_open_price[8];
  byte message_date_time[8];
  byte has_pre_open_volume;
  byte pre_open_volume[4]
};

int pre_open_price_indicator_message_at;

/* every byte of Pre Open Price Indicator Message set to one value */
inline fill_pre_open_price_indicator_message(pre_open_price_indicator_message_record, pre_open_price_indicator_message_value) {
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.market_id[pre_open_price_indicator_message_at] = pre_open_price_indicator_message_value; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.pre_open_price[pre_open_price_indicator_message_at] = pre_open_price_indicator_message_value; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.message_date_time[pre_open_price_indicator_message_at] = pre_open_price_indicator_message_value; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_record.has_pre_open_volume = pre_open_price_indicator_message_value;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.pre_open_volume[pre_open_price_indicator_message_at] = pre_open_price_indicator_message_value; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Pre Open Price Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_pre_open_price_indicator_message(pre_open_price_indicator_message_record, pre_open_price_indicator_message_base) {
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.market_id[pre_open_price_indicator_message_at] = (pre_open_price_indicator_message_base + 0 + pre_open_price_indicator_message_at + 1) % 256; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.pre_open_price[pre_open_price_indicator_message_at] = (pre_open_price_indicator_message_base + 4 + pre_open_price_indicator_message_at + 1) % 256; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.message_date_time[pre_open_price_indicator_message_at] = (pre_open_price_indicator_message_base + 12 + pre_open_price_indicator_message_at + 1) % 256; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_record.has_pre_open_volume = (pre_open_price_indicator_message_base + 20 + 1) % 256;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.pre_open_volume[pre_open_price_indicator_message_at] = (pre_open_price_indicator_message_base + 21 + pre_open_price_indicator_message_at + 1) % 256; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Pre Open Price Indicator Message to the wire, 25 bytes from where the cursor stands */
inline encode_pre_open_price_indicator_message(pre_open_price_indicator_message_record) {
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> wire[at] = pre_open_price_indicator_message_record.market_id[pre_open_price_indicator_message_at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> wire[at] = pre_open_price_indicator_message_record.pre_open_price[pre_open_price_indicator_message_at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> wire[at] = pre_open_price_indicator_message_record.message_date_time[pre_open_price_indicator_message_at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = pre_open_price_indicator_message_record.has_pre_open_volume; at = at + 1;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> wire[at] = pre_open_price_indicator_message_record.pre_open_volume[pre_open_price_indicator_message_at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Pre Open Price Indicator Message off the wire, 25 bytes from where the cursor stands */
inline decode_pre_open_price_indicator_message(pre_open_price_indicator_message_record) {
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.market_id[pre_open_price_indicator_message_at] = wire[at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.pre_open_price[pre_open_price_indicator_message_at] = wire[at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> pre_open_price_indicator_message_record.message_date_time[pre_open_price_indicator_message_at] = wire[at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_record.has_pre_open_volume = wire[at]; at = at + 1;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> pre_open_price_indicator_message_record.pre_open_volume[pre_open_price_indicator_message_at] = wire[at]; at = at + 1; pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Pre Open Price Indicator Message is what was written, byte for byte */
inline equal_pre_open_price_indicator_message(pre_open_price_indicator_message_read, pre_open_price_indicator_message_written) {
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> assert(pre_open_price_indicator_message_read.market_id[pre_open_price_indicator_message_at] == pre_open_price_indicator_message_written.market_id[pre_open_price_indicator_message_at]); pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> assert(pre_open_price_indicator_message_read.pre_open_price[pre_open_price_indicator_message_at] == pre_open_price_indicator_message_written.pre_open_price[pre_open_price_indicator_message_at]); pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 8 -> assert(pre_open_price_indicator_message_read.message_date_time[pre_open_price_indicator_message_at] == pre_open_price_indicator_message_written.message_date_time[pre_open_price_indicator_message_at]); pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  assert(pre_open_price_indicator_message_read.has_pre_open_volume == pre_open_price_indicator_message_written.has_pre_open_volume);
  pre_open_price_indicator_message_at = 0;
  do
  :: pre_open_price_indicator_message_at < 4 -> assert(pre_open_price_indicator_message_read.pre_open_volume[pre_open_price_indicator_message_at] == pre_open_price_indicator_message_written.pre_open_volume[pre_open_price_indicator_message_at]); pre_open_price_indicator_message_at = pre_open_price_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Strip Info Message: 88 bytes -------------------------------------------- */

/* This message will be sent out if there is strip date change during the trading session. If client does not care about strip date changes, client should ignore these messages. */
typedef StripInfoMessage {
  byte old_strip_id[2];
  byte strip_type[20];
  byte begin_year[2];
  byte begin_month[2];
  byte begin_day[2];
  byte end_year[2];
  byte end_month[2];
  byte end_day[2];
  byte strip_info[50];
  byte strip_id[4]
};

int strip_info_message_at;

/* every byte of Strip Info Message set to one value */
inline fill_strip_info_message(strip_info_message_record, strip_info_message_value) {
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.old_strip_id[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 20 -> strip_info_message_record.strip_type[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_year[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_month[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_day[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_year[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_month[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_day[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 50 -> strip_info_message_record.strip_info[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 4 -> strip_info_message_record.strip_id[strip_info_message_at] = strip_info_message_value; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Strip Info Message set to where it lies, so a field read out of place says so */
inline ramp_strip_info_message(strip_info_message_record, strip_info_message_base) {
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.old_strip_id[strip_info_message_at] = (strip_info_message_base + 0 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 20 -> strip_info_message_record.strip_type[strip_info_message_at] = (strip_info_message_base + 2 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_year[strip_info_message_at] = (strip_info_message_base + 22 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_month[strip_info_message_at] = (strip_info_message_base + 24 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_day[strip_info_message_at] = (strip_info_message_base + 26 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_year[strip_info_message_at] = (strip_info_message_base + 28 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_month[strip_info_message_at] = (strip_info_message_base + 30 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_day[strip_info_message_at] = (strip_info_message_base + 32 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 50 -> strip_info_message_record.strip_info[strip_info_message_at] = (strip_info_message_base + 34 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 4 -> strip_info_message_record.strip_id[strip_info_message_at] = (strip_info_message_base + 84 + strip_info_message_at + 1) % 256; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strip Info Message to the wire, 88 bytes from where the cursor stands */
inline encode_strip_info_message(strip_info_message_record) {
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.old_strip_id[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 20 -> wire[at] = strip_info_message_record.strip_type[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.begin_year[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.begin_month[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.begin_day[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.end_year[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.end_month[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> wire[at] = strip_info_message_record.end_day[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 50 -> wire[at] = strip_info_message_record.strip_info[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 4 -> wire[at] = strip_info_message_record.strip_id[strip_info_message_at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Strip Info Message off the wire, 88 bytes from where the cursor stands */
inline decode_strip_info_message(strip_info_message_record) {
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.old_strip_id[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 20 -> strip_info_message_record.strip_type[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_year[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_month[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.begin_day[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_year[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_month[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> strip_info_message_record.end_day[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 50 -> strip_info_message_record.strip_info[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 4 -> strip_info_message_record.strip_id[strip_info_message_at] = wire[at]; at = at + 1; strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Strip Info Message is what was written, byte for byte */
inline equal_strip_info_message(strip_info_message_read, strip_info_message_written) {
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.old_strip_id[strip_info_message_at] == strip_info_message_written.old_strip_id[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 20 -> assert(strip_info_message_read.strip_type[strip_info_message_at] == strip_info_message_written.strip_type[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.begin_year[strip_info_message_at] == strip_info_message_written.begin_year[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.begin_month[strip_info_message_at] == strip_info_message_written.begin_month[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.begin_day[strip_info_message_at] == strip_info_message_written.begin_day[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.end_year[strip_info_message_at] == strip_info_message_written.end_year[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.end_month[strip_info_message_at] == strip_info_message_written.end_month[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 2 -> assert(strip_info_message_read.end_day[strip_info_message_at] == strip_info_message_written.end_day[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 50 -> assert(strip_info_message_read.strip_info[strip_info_message_at] == strip_info_message_written.strip_info[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  strip_info_message_at = 0;
  do
  :: strip_info_message_at < 4 -> assert(strip_info_message_read.strip_id[strip_info_message_at] == strip_info_message_written.strip_id[strip_info_message_at]); strip_info_message_at = strip_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Interval Price Limit Notification Message: 35 bytes --------------------- */

/* Interval Price Limit (IPL) might be enabled for certain markets. IPL check is to prevent sudden movements (in both directions) in the market during a short period of time. */
typedef IntervalPriceLimitNotificationMessage {
  byte market_id[4];
  byte ipl_tpl_hold_type;
  byte notification_date_time[8];
  byte is_up;
  byte ipl_tpl_hold_duration[4];
  byte ipl_tpl_up[8];
  byte ipl_tpl_down[8];
  byte ipl_tpl_type
};

int interval_price_limit_notification_message_at;

/* every byte of Interval Price Limit Notification Message set to one value */
inline fill_interval_price_limit_notification_message(interval_price_limit_notification_message_record, interval_price_limit_notification_message_value) {
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.market_id[interval_price_limit_notification_message_at] = interval_price_limit_notification_message_value; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_hold_type = interval_price_limit_notification_message_value;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.notification_date_time[interval_price_limit_notification_message_at] = interval_price_limit_notification_message_value; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.is_up = interval_price_limit_notification_message_value;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.ipl_tpl_hold_duration[interval_price_limit_notification_message_at] = interval_price_limit_notification_message_value; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_up[interval_price_limit_notification_message_at] = interval_price_limit_notification_message_value; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_down[interval_price_limit_notification_message_at] = interval_price_limit_notification_message_value; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_type = interval_price_limit_notification_message_value;
  skip
}

/* each byte of Interval Price Limit Notification Message set to where it lies, so a field read out of place says so */
inline ramp_interval_price_limit_notification_message(interval_price_limit_notification_message_record, interval_price_limit_notification_message_base) {
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.market_id[interval_price_limit_notification_message_at] = (interval_price_limit_notification_message_base + 0 + interval_price_limit_notification_message_at + 1) % 256; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_hold_type = (interval_price_limit_notification_message_base + 4 + 1) % 256;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.notification_date_time[interval_price_limit_notification_message_at] = (interval_price_limit_notification_message_base + 5 + interval_price_limit_notification_message_at + 1) % 256; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.is_up = (interval_price_limit_notification_message_base + 13 + 1) % 256;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.ipl_tpl_hold_duration[interval_price_limit_notification_message_at] = (interval_price_limit_notification_message_base + 14 + interval_price_limit_notification_message_at + 1) % 256; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_up[interval_price_limit_notification_message_at] = (interval_price_limit_notification_message_base + 18 + interval_price_limit_notification_message_at + 1) % 256; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_down[interval_price_limit_notification_message_at] = (interval_price_limit_notification_message_base + 26 + interval_price_limit_notification_message_at + 1) % 256; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_type = (interval_price_limit_notification_message_base + 34 + 1) % 256;
  skip
}

/* Interval Price Limit Notification Message to the wire, 35 bytes from where the cursor stands */
inline encode_interval_price_limit_notification_message(interval_price_limit_notification_message_record) {
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> wire[at] = interval_price_limit_notification_message_record.market_id[interval_price_limit_notification_message_at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = interval_price_limit_notification_message_record.ipl_tpl_hold_type; at = at + 1;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> wire[at] = interval_price_limit_notification_message_record.notification_date_time[interval_price_limit_notification_message_at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = interval_price_limit_notification_message_record.is_up; at = at + 1;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> wire[at] = interval_price_limit_notification_message_record.ipl_tpl_hold_duration[interval_price_limit_notification_message_at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> wire[at] = interval_price_limit_notification_message_record.ipl_tpl_up[interval_price_limit_notification_message_at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> wire[at] = interval_price_limit_notification_message_record.ipl_tpl_down[interval_price_limit_notification_message_at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = interval_price_limit_notification_message_record.ipl_tpl_type; at = at + 1;
  skip
}

/* Interval Price Limit Notification Message off the wire, 35 bytes from where the cursor stands */
inline decode_interval_price_limit_notification_message(interval_price_limit_notification_message_record) {
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.market_id[interval_price_limit_notification_message_at] = wire[at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_hold_type = wire[at]; at = at + 1;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.notification_date_time[interval_price_limit_notification_message_at] = wire[at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.is_up = wire[at]; at = at + 1;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> interval_price_limit_notification_message_record.ipl_tpl_hold_duration[interval_price_limit_notification_message_at] = wire[at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_up[interval_price_limit_notification_message_at] = wire[at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> interval_price_limit_notification_message_record.ipl_tpl_down[interval_price_limit_notification_message_at] = wire[at]; at = at + 1; interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_record.ipl_tpl_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Interval Price Limit Notification Message is what was written, byte for byte */
inline equal_interval_price_limit_notification_message(interval_price_limit_notification_message_read, interval_price_limit_notification_message_written) {
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> assert(interval_price_limit_notification_message_read.market_id[interval_price_limit_notification_message_at] == interval_price_limit_notification_message_written.market_id[interval_price_limit_notification_message_at]); interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  assert(interval_price_limit_notification_message_read.ipl_tpl_hold_type == interval_price_limit_notification_message_written.ipl_tpl_hold_type);
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> assert(interval_price_limit_notification_message_read.notification_date_time[interval_price_limit_notification_message_at] == interval_price_limit_notification_message_written.notification_date_time[interval_price_limit_notification_message_at]); interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  assert(interval_price_limit_notification_message_read.is_up == interval_price_limit_notification_message_written.is_up);
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 4 -> assert(interval_price_limit_notification_message_read.ipl_tpl_hold_duration[interval_price_limit_notification_message_at] == interval_price_limit_notification_message_written.ipl_tpl_hold_duration[interval_price_limit_notification_message_at]); interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> assert(interval_price_limit_notification_message_read.ipl_tpl_up[interval_price_limit_notification_message_at] == interval_price_limit_notification_message_written.ipl_tpl_up[interval_price_limit_notification_message_at]); interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  interval_price_limit_notification_message_at = 0;
  do
  :: interval_price_limit_notification_message_at < 8 -> assert(interval_price_limit_notification_message_read.ipl_tpl_down[interval_price_limit_notification_message_at] == interval_price_limit_notification_message_written.ipl_tpl_down[interval_price_limit_notification_message_at]); interval_price_limit_notification_message_at = interval_price_limit_notification_message_at + 1
  :: else -> break
  od;
  assert(interval_price_limit_notification_message_read.ipl_tpl_type == interval_price_limit_notification_message_written.ipl_tpl_type);
  skip
}

/* ---- New Expiry Message: 515 bytes ------------------------------------------- */

/* New Expiry message will be sent out when a new equity market is created during the day. */
typedef NewExpiryMessage {
  byte market_id[4];
  byte market_type_id[2];
  byte order_price_denominator;
  byte increment_price[4];
  byte increment_qty[4];
  byte lot_size[4];
  byte market_desc[120];
  byte maturity_year[2];
  byte maturity_month[2];
  byte maturity_day[2];
  byte deal_price_denominator;
  byte min_qty[4];
  byte unit_quantity[4];
  byte currency[20];
  byte cleared_alias[15];
  byte min_price[8];
  byte max_price[8];
  byte product_id[4];
  byte product_name[62];
  byte hub_id[4];
  byte hub_alias[80];
  byte strip_id[4];
  byte strip_name[39];
  byte settle_price_denominator;
  byte mic_code[4];
  byte unit_qty_denominator;
  byte off_exchange_increment_qty_denominator;
  byte off_exchange_increment_qty[4];
  byte off_exchange_increment_price[4];
  byte off_exchange_increment_option_price[4];
  byte contract_symbol[35];
  byte underlying_isin[12];
  byte num_decimals_options_price;
  byte hedge_market_id[4];
  byte settlement_type;
  byte gt_allowed;
  byte cross_order_supported;
  byte unit_of_measure[30];
  byte mifid_regulated_market;
  byte screen_last_trade_year[2];
  byte screen_last_trade_month[2];
  byte screen_last_trade_day[2];
  byte old_num_of_cycles[2];
  byte num_of_cycles[4]
};

int new_expiry_message_at;

/* every byte of New Expiry Message set to one value */
inline fill_new_expiry_message(new_expiry_message_record, new_expiry_message_value) {
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.market_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.market_type_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.order_price_denominator = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_price[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_qty[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.lot_size[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 120 -> new_expiry_message_record.market_desc[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_year[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_month[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_day[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.deal_price_denominator = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.min_qty[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.unit_quantity[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 20 -> new_expiry_message_record.currency[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 15 -> new_expiry_message_record.cleared_alias[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.min_price[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.max_price[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.product_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 62 -> new_expiry_message_record.product_name[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hub_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 80 -> new_expiry_message_record.hub_alias[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.strip_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 39 -> new_expiry_message_record.strip_name[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settle_price_denominator = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.mic_code[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.unit_qty_denominator = new_expiry_message_value;
  new_expiry_message_record.off_exchange_increment_qty_denominator = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_qty[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_price[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_option_price[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 35 -> new_expiry_message_record.contract_symbol[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 12 -> new_expiry_message_record.underlying_isin[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.num_decimals_options_price = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hedge_market_id[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settlement_type = new_expiry_message_value;
  new_expiry_message_record.gt_allowed = new_expiry_message_value;
  new_expiry_message_record.cross_order_supported = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 30 -> new_expiry_message_record.unit_of_measure[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.mifid_regulated_market = new_expiry_message_value;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_year[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_month[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_day[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.old_num_of_cycles[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.num_of_cycles[new_expiry_message_at] = new_expiry_message_value; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Expiry Message set to where it lies, so a field read out of place says so */
inline ramp_new_expiry_message(new_expiry_message_record, new_expiry_message_base) {
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.market_id[new_expiry_message_at] = (new_expiry_message_base + 0 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.market_type_id[new_expiry_message_at] = (new_expiry_message_base + 4 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.order_price_denominator = (new_expiry_message_base + 6 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_price[new_expiry_message_at] = (new_expiry_message_base + 7 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_qty[new_expiry_message_at] = (new_expiry_message_base + 11 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.lot_size[new_expiry_message_at] = (new_expiry_message_base + 15 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 120 -> new_expiry_message_record.market_desc[new_expiry_message_at] = (new_expiry_message_base + 19 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_year[new_expiry_message_at] = (new_expiry_message_base + 139 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_month[new_expiry_message_at] = (new_expiry_message_base + 141 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_day[new_expiry_message_at] = (new_expiry_message_base + 143 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.deal_price_denominator = (new_expiry_message_base + 145 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.min_qty[new_expiry_message_at] = (new_expiry_message_base + 146 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.unit_quantity[new_expiry_message_at] = (new_expiry_message_base + 150 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 20 -> new_expiry_message_record.currency[new_expiry_message_at] = (new_expiry_message_base + 154 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 15 -> new_expiry_message_record.cleared_alias[new_expiry_message_at] = (new_expiry_message_base + 174 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.min_price[new_expiry_message_at] = (new_expiry_message_base + 189 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.max_price[new_expiry_message_at] = (new_expiry_message_base + 197 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.product_id[new_expiry_message_at] = (new_expiry_message_base + 205 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 62 -> new_expiry_message_record.product_name[new_expiry_message_at] = (new_expiry_message_base + 209 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hub_id[new_expiry_message_at] = (new_expiry_message_base + 271 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 80 -> new_expiry_message_record.hub_alias[new_expiry_message_at] = (new_expiry_message_base + 275 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.strip_id[new_expiry_message_at] = (new_expiry_message_base + 355 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 39 -> new_expiry_message_record.strip_name[new_expiry_message_at] = (new_expiry_message_base + 359 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settle_price_denominator = (new_expiry_message_base + 398 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.mic_code[new_expiry_message_at] = (new_expiry_message_base + 399 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.unit_qty_denominator = (new_expiry_message_base + 403 + 1) % 256;
  new_expiry_message_record.off_exchange_increment_qty_denominator = (new_expiry_message_base + 404 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_qty[new_expiry_message_at] = (new_expiry_message_base + 405 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_price[new_expiry_message_at] = (new_expiry_message_base + 409 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_option_price[new_expiry_message_at] = (new_expiry_message_base + 413 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 35 -> new_expiry_message_record.contract_symbol[new_expiry_message_at] = (new_expiry_message_base + 417 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 12 -> new_expiry_message_record.underlying_isin[new_expiry_message_at] = (new_expiry_message_base + 452 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.num_decimals_options_price = (new_expiry_message_base + 464 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hedge_market_id[new_expiry_message_at] = (new_expiry_message_base + 465 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settlement_type = (new_expiry_message_base + 469 + 1) % 256;
  new_expiry_message_record.gt_allowed = (new_expiry_message_base + 470 + 1) % 256;
  new_expiry_message_record.cross_order_supported = (new_expiry_message_base + 471 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 30 -> new_expiry_message_record.unit_of_measure[new_expiry_message_at] = (new_expiry_message_base + 472 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.mifid_regulated_market = (new_expiry_message_base + 502 + 1) % 256;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_year[new_expiry_message_at] = (new_expiry_message_base + 503 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_month[new_expiry_message_at] = (new_expiry_message_base + 505 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_day[new_expiry_message_at] = (new_expiry_message_base + 507 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.old_num_of_cycles[new_expiry_message_at] = (new_expiry_message_base + 509 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.num_of_cycles[new_expiry_message_at] = (new_expiry_message_base + 511 + new_expiry_message_at + 1) % 256; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Expiry Message to the wire, 515 bytes from where the cursor stands */
inline encode_new_expiry_message(new_expiry_message_record) {
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.market_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.market_type_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.order_price_denominator; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.increment_price[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.increment_qty[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.lot_size[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 120 -> wire[at] = new_expiry_message_record.market_desc[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.maturity_year[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.maturity_month[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.maturity_day[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.deal_price_denominator; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.min_qty[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.unit_quantity[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 20 -> wire[at] = new_expiry_message_record.currency[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 15 -> wire[at] = new_expiry_message_record.cleared_alias[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> wire[at] = new_expiry_message_record.min_price[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> wire[at] = new_expiry_message_record.max_price[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.product_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 62 -> wire[at] = new_expiry_message_record.product_name[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.hub_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 80 -> wire[at] = new_expiry_message_record.hub_alias[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.strip_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 39 -> wire[at] = new_expiry_message_record.strip_name[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.settle_price_denominator; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.mic_code[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.unit_qty_denominator; at = at + 1;
  wire[at] = new_expiry_message_record.off_exchange_increment_qty_denominator; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.off_exchange_increment_qty[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.off_exchange_increment_price[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.off_exchange_increment_option_price[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 35 -> wire[at] = new_expiry_message_record.contract_symbol[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 12 -> wire[at] = new_expiry_message_record.underlying_isin[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.num_decimals_options_price; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.hedge_market_id[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.settlement_type; at = at + 1;
  wire[at] = new_expiry_message_record.gt_allowed; at = at + 1;
  wire[at] = new_expiry_message_record.cross_order_supported; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 30 -> wire[at] = new_expiry_message_record.unit_of_measure[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  wire[at] = new_expiry_message_record.mifid_regulated_market; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.screen_last_trade_year[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.screen_last_trade_month[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.screen_last_trade_day[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> wire[at] = new_expiry_message_record.old_num_of_cycles[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> wire[at] = new_expiry_message_record.num_of_cycles[new_expiry_message_at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Expiry Message off the wire, 515 bytes from where the cursor stands */
inline decode_new_expiry_message(new_expiry_message_record) {
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.market_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.market_type_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.order_price_denominator = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_price[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.increment_qty[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.lot_size[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 120 -> new_expiry_message_record.market_desc[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_year[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_month[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.maturity_day[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.deal_price_denominator = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.min_qty[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.unit_quantity[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 20 -> new_expiry_message_record.currency[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 15 -> new_expiry_message_record.cleared_alias[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.min_price[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> new_expiry_message_record.max_price[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.product_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 62 -> new_expiry_message_record.product_name[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hub_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 80 -> new_expiry_message_record.hub_alias[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.strip_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 39 -> new_expiry_message_record.strip_name[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settle_price_denominator = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.mic_code[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.unit_qty_denominator = wire[at]; at = at + 1;
  new_expiry_message_record.off_exchange_increment_qty_denominator = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_qty[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_price[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.off_exchange_increment_option_price[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 35 -> new_expiry_message_record.contract_symbol[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 12 -> new_expiry_message_record.underlying_isin[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.num_decimals_options_price = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.hedge_market_id[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.settlement_type = wire[at]; at = at + 1;
  new_expiry_message_record.gt_allowed = wire[at]; at = at + 1;
  new_expiry_message_record.cross_order_supported = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 30 -> new_expiry_message_record.unit_of_measure[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_record.mifid_regulated_market = wire[at]; at = at + 1;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_year[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_month[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.screen_last_trade_day[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> new_expiry_message_record.old_num_of_cycles[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> new_expiry_message_record.num_of_cycles[new_expiry_message_at] = wire[at]; at = at + 1; new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Expiry Message is what was written, byte for byte */
inline equal_new_expiry_message(new_expiry_message_read, new_expiry_message_written) {
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.market_id[new_expiry_message_at] == new_expiry_message_written.market_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.market_type_id[new_expiry_message_at] == new_expiry_message_written.market_type_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.order_price_denominator == new_expiry_message_written.order_price_denominator);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.increment_price[new_expiry_message_at] == new_expiry_message_written.increment_price[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.increment_qty[new_expiry_message_at] == new_expiry_message_written.increment_qty[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.lot_size[new_expiry_message_at] == new_expiry_message_written.lot_size[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 120 -> assert(new_expiry_message_read.market_desc[new_expiry_message_at] == new_expiry_message_written.market_desc[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.maturity_year[new_expiry_message_at] == new_expiry_message_written.maturity_year[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.maturity_month[new_expiry_message_at] == new_expiry_message_written.maturity_month[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.maturity_day[new_expiry_message_at] == new_expiry_message_written.maturity_day[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.deal_price_denominator == new_expiry_message_written.deal_price_denominator);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.min_qty[new_expiry_message_at] == new_expiry_message_written.min_qty[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.unit_quantity[new_expiry_message_at] == new_expiry_message_written.unit_quantity[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 20 -> assert(new_expiry_message_read.currency[new_expiry_message_at] == new_expiry_message_written.currency[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 15 -> assert(new_expiry_message_read.cleared_alias[new_expiry_message_at] == new_expiry_message_written.cleared_alias[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> assert(new_expiry_message_read.min_price[new_expiry_message_at] == new_expiry_message_written.min_price[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 8 -> assert(new_expiry_message_read.max_price[new_expiry_message_at] == new_expiry_message_written.max_price[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.product_id[new_expiry_message_at] == new_expiry_message_written.product_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 62 -> assert(new_expiry_message_read.product_name[new_expiry_message_at] == new_expiry_message_written.product_name[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.hub_id[new_expiry_message_at] == new_expiry_message_written.hub_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 80 -> assert(new_expiry_message_read.hub_alias[new_expiry_message_at] == new_expiry_message_written.hub_alias[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.strip_id[new_expiry_message_at] == new_expiry_message_written.strip_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 39 -> assert(new_expiry_message_read.strip_name[new_expiry_message_at] == new_expiry_message_written.strip_name[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.settle_price_denominator == new_expiry_message_written.settle_price_denominator);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.mic_code[new_expiry_message_at] == new_expiry_message_written.mic_code[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.unit_qty_denominator == new_expiry_message_written.unit_qty_denominator);
  assert(new_expiry_message_read.off_exchange_increment_qty_denominator == new_expiry_message_written.off_exchange_increment_qty_denominator);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.off_exchange_increment_qty[new_expiry_message_at] == new_expiry_message_written.off_exchange_increment_qty[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.off_exchange_increment_price[new_expiry_message_at] == new_expiry_message_written.off_exchange_increment_price[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.off_exchange_increment_option_price[new_expiry_message_at] == new_expiry_message_written.off_exchange_increment_option_price[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 35 -> assert(new_expiry_message_read.contract_symbol[new_expiry_message_at] == new_expiry_message_written.contract_symbol[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 12 -> assert(new_expiry_message_read.underlying_isin[new_expiry_message_at] == new_expiry_message_written.underlying_isin[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.num_decimals_options_price == new_expiry_message_written.num_decimals_options_price);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.hedge_market_id[new_expiry_message_at] == new_expiry_message_written.hedge_market_id[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.settlement_type == new_expiry_message_written.settlement_type);
  assert(new_expiry_message_read.gt_allowed == new_expiry_message_written.gt_allowed);
  assert(new_expiry_message_read.cross_order_supported == new_expiry_message_written.cross_order_supported);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 30 -> assert(new_expiry_message_read.unit_of_measure[new_expiry_message_at] == new_expiry_message_written.unit_of_measure[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  assert(new_expiry_message_read.mifid_regulated_market == new_expiry_message_written.mifid_regulated_market);
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.screen_last_trade_year[new_expiry_message_at] == new_expiry_message_written.screen_last_trade_year[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.screen_last_trade_month[new_expiry_message_at] == new_expiry_message_written.screen_last_trade_month[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.screen_last_trade_day[new_expiry_message_at] == new_expiry_message_written.screen_last_trade_day[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 2 -> assert(new_expiry_message_read.old_num_of_cycles[new_expiry_message_at] == new_expiry_message_written.old_num_of_cycles[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  new_expiry_message_at = 0;
  do
  :: new_expiry_message_at < 4 -> assert(new_expiry_message_read.num_of_cycles[new_expiry_message_at] == new_expiry_message_written.num_of_cycles[new_expiry_message_at]); new_expiry_message_at = new_expiry_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- New Options Market Definition Message: 337 bytes ------------------------ */

/* New Options Market Definition messages will be sent out when new options markets are created. */
typedef NewOptionsMarketDefinitionMessage {
  byte market_id[4];
  byte underlying_market_id[4];
  byte futures_contract_symbol[70];
  byte trading_status;
  byte order_price_denominator;
  byte increment_qty[4];
  byte lot_size[4];
  byte market_desc[120];
  byte option_type;
  byte strike_price[8];
  byte deal_price_denominator;
  byte min_qty[4];
  byte currency[20];
  byte num_decimals_strike_price;
  byte min_options_price[8];
  byte max_options_price[8];
  byte increment_premium_price[4];
  byte options_expiration_year[2];
  byte options_expiration_month[2];
  byte options_expiration_day[2];
  byte options_style;
  byte options_expiration_type;
  byte hedge_market_id[4];
  byte settle_price_denominator;
  byte unit_qty_denominator;
  byte tick_value[8];
  byte flex_allowed;
  byte settlement_type;
  byte is_block_only;
  byte gt_allowed;
  byte cross_order_supported;
  byte guaranteed_cross_supported;
  byte unit_of_measure[30];
  byte mifid_regulated_market;
  byte screen_last_trade_year[2];
  byte screen_last_trade_month[2];
  byte screen_last_trade_day[2];
  byte is_tradable;
  byte old_num_of_cycles[2];
  byte market_type_id[2];
  byte num_of_cycles[4]
};

int new_options_market_definition_message_at;

/* every byte of New Options Market Definition Message set to one value */
inline fill_new_options_market_definition_message(new_options_market_definition_message_record, new_options_market_definition_message_value) {
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.market_id[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.underlying_market_id[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 70 -> new_options_market_definition_message_record.futures_contract_symbol[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.trading_status = new_options_market_definition_message_value;
  new_options_market_definition_message_record.order_price_denominator = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_qty[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.lot_size[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 120 -> new_options_market_definition_message_record.market_desc[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.option_type = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.strike_price[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.deal_price_denominator = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.min_qty[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 20 -> new_options_market_definition_message_record.currency[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.num_decimals_strike_price = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.min_options_price[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.max_options_price[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_premium_price[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_year[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_month[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_day[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.options_style = new_options_market_definition_message_value;
  new_options_market_definition_message_record.options_expiration_type = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.hedge_market_id[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.settle_price_denominator = new_options_market_definition_message_value;
  new_options_market_definition_message_record.unit_qty_denominator = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.tick_value[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.flex_allowed = new_options_market_definition_message_value;
  new_options_market_definition_message_record.settlement_type = new_options_market_definition_message_value;
  new_options_market_definition_message_record.is_block_only = new_options_market_definition_message_value;
  new_options_market_definition_message_record.gt_allowed = new_options_market_definition_message_value;
  new_options_market_definition_message_record.cross_order_supported = new_options_market_definition_message_value;
  new_options_market_definition_message_record.guaranteed_cross_supported = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 30 -> new_options_market_definition_message_record.unit_of_measure[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.mifid_regulated_market = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_year[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_month[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_day[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.is_tradable = new_options_market_definition_message_value;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.old_num_of_cycles[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.market_type_id[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.num_of_cycles[new_options_market_definition_message_at] = new_options_market_definition_message_value; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of New Options Market Definition Message set to where it lies, so a field read out of place says so */
inline ramp_new_options_market_definition_message(new_options_market_definition_message_record, new_options_market_definition_message_base) {
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.market_id[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 0 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.underlying_market_id[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 4 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 70 -> new_options_market_definition_message_record.futures_contract_symbol[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 8 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.trading_status = (new_options_market_definition_message_base + 78 + 1) % 256;
  new_options_market_definition_message_record.order_price_denominator = (new_options_market_definition_message_base + 79 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_qty[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 80 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.lot_size[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 84 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 120 -> new_options_market_definition_message_record.market_desc[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 88 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.option_type = (new_options_market_definition_message_base + 208 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.strike_price[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 209 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.deal_price_denominator = (new_options_market_definition_message_base + 217 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.min_qty[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 218 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 20 -> new_options_market_definition_message_record.currency[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 222 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.num_decimals_strike_price = (new_options_market_definition_message_base + 242 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.min_options_price[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 243 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.max_options_price[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 251 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_premium_price[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 259 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_year[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 263 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_month[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 265 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_day[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 267 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.options_style = (new_options_market_definition_message_base + 269 + 1) % 256;
  new_options_market_definition_message_record.options_expiration_type = (new_options_market_definition_message_base + 270 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.hedge_market_id[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 271 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.settle_price_denominator = (new_options_market_definition_message_base + 275 + 1) % 256;
  new_options_market_definition_message_record.unit_qty_denominator = (new_options_market_definition_message_base + 276 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.tick_value[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 277 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.flex_allowed = (new_options_market_definition_message_base + 285 + 1) % 256;
  new_options_market_definition_message_record.settlement_type = (new_options_market_definition_message_base + 286 + 1) % 256;
  new_options_market_definition_message_record.is_block_only = (new_options_market_definition_message_base + 287 + 1) % 256;
  new_options_market_definition_message_record.gt_allowed = (new_options_market_definition_message_base + 288 + 1) % 256;
  new_options_market_definition_message_record.cross_order_supported = (new_options_market_definition_message_base + 289 + 1) % 256;
  new_options_market_definition_message_record.guaranteed_cross_supported = (new_options_market_definition_message_base + 290 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 30 -> new_options_market_definition_message_record.unit_of_measure[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 291 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.mifid_regulated_market = (new_options_market_definition_message_base + 321 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_year[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 322 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_month[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 324 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_day[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 326 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.is_tradable = (new_options_market_definition_message_base + 328 + 1) % 256;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.old_num_of_cycles[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 329 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.market_type_id[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 331 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.num_of_cycles[new_options_market_definition_message_at] = (new_options_market_definition_message_base + 333 + new_options_market_definition_message_at + 1) % 256; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Options Market Definition Message to the wire, 337 bytes from where the cursor stands */
inline encode_new_options_market_definition_message(new_options_market_definition_message_record) {
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.market_id[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.underlying_market_id[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 70 -> wire[at] = new_options_market_definition_message_record.futures_contract_symbol[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.trading_status; at = at + 1;
  wire[at] = new_options_market_definition_message_record.order_price_denominator; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.increment_qty[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.lot_size[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 120 -> wire[at] = new_options_market_definition_message_record.market_desc[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.option_type; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> wire[at] = new_options_market_definition_message_record.strike_price[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.deal_price_denominator; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.min_qty[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 20 -> wire[at] = new_options_market_definition_message_record.currency[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.num_decimals_strike_price; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> wire[at] = new_options_market_definition_message_record.min_options_price[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> wire[at] = new_options_market_definition_message_record.max_options_price[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.increment_premium_price[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.options_expiration_year[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.options_expiration_month[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.options_expiration_day[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.options_style; at = at + 1;
  wire[at] = new_options_market_definition_message_record.options_expiration_type; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.hedge_market_id[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.settle_price_denominator; at = at + 1;
  wire[at] = new_options_market_definition_message_record.unit_qty_denominator; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> wire[at] = new_options_market_definition_message_record.tick_value[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.flex_allowed; at = at + 1;
  wire[at] = new_options_market_definition_message_record.settlement_type; at = at + 1;
  wire[at] = new_options_market_definition_message_record.is_block_only; at = at + 1;
  wire[at] = new_options_market_definition_message_record.gt_allowed; at = at + 1;
  wire[at] = new_options_market_definition_message_record.cross_order_supported; at = at + 1;
  wire[at] = new_options_market_definition_message_record.guaranteed_cross_supported; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 30 -> wire[at] = new_options_market_definition_message_record.unit_of_measure[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.mifid_regulated_market; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.screen_last_trade_year[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.screen_last_trade_month[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.screen_last_trade_day[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = new_options_market_definition_message_record.is_tradable; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.old_num_of_cycles[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> wire[at] = new_options_market_definition_message_record.market_type_id[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> wire[at] = new_options_market_definition_message_record.num_of_cycles[new_options_market_definition_message_at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* New Options Market Definition Message off the wire, 337 bytes from where the cursor stands */
inline decode_new_options_market_definition_message(new_options_market_definition_message_record) {
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.market_id[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.underlying_market_id[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 70 -> new_options_market_definition_message_record.futures_contract_symbol[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.trading_status = wire[at]; at = at + 1;
  new_options_market_definition_message_record.order_price_denominator = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_qty[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.lot_size[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 120 -> new_options_market_definition_message_record.market_desc[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.option_type = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.strike_price[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.deal_price_denominator = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.min_qty[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 20 -> new_options_market_definition_message_record.currency[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.num_decimals_strike_price = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.min_options_price[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.max_options_price[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.increment_premium_price[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_year[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_month[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.options_expiration_day[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.options_style = wire[at]; at = at + 1;
  new_options_market_definition_message_record.options_expiration_type = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.hedge_market_id[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.settle_price_denominator = wire[at]; at = at + 1;
  new_options_market_definition_message_record.unit_qty_denominator = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> new_options_market_definition_message_record.tick_value[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.flex_allowed = wire[at]; at = at + 1;
  new_options_market_definition_message_record.settlement_type = wire[at]; at = at + 1;
  new_options_market_definition_message_record.is_block_only = wire[at]; at = at + 1;
  new_options_market_definition_message_record.gt_allowed = wire[at]; at = at + 1;
  new_options_market_definition_message_record.cross_order_supported = wire[at]; at = at + 1;
  new_options_market_definition_message_record.guaranteed_cross_supported = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 30 -> new_options_market_definition_message_record.unit_of_measure[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.mifid_regulated_market = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_year[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_month[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.screen_last_trade_day[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_record.is_tradable = wire[at]; at = at + 1;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.old_num_of_cycles[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> new_options_market_definition_message_record.market_type_id[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> new_options_market_definition_message_record.num_of_cycles[new_options_market_definition_message_at] = wire[at]; at = at + 1; new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of New Options Market Definition Message is what was written, byte for byte */
inline equal_new_options_market_definition_message(new_options_market_definition_message_read, new_options_market_definition_message_written) {
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.market_id[new_options_market_definition_message_at] == new_options_market_definition_message_written.market_id[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.underlying_market_id[new_options_market_definition_message_at] == new_options_market_definition_message_written.underlying_market_id[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 70 -> assert(new_options_market_definition_message_read.futures_contract_symbol[new_options_market_definition_message_at] == new_options_market_definition_message_written.futures_contract_symbol[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.trading_status == new_options_market_definition_message_written.trading_status);
  assert(new_options_market_definition_message_read.order_price_denominator == new_options_market_definition_message_written.order_price_denominator);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.increment_qty[new_options_market_definition_message_at] == new_options_market_definition_message_written.increment_qty[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.lot_size[new_options_market_definition_message_at] == new_options_market_definition_message_written.lot_size[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 120 -> assert(new_options_market_definition_message_read.market_desc[new_options_market_definition_message_at] == new_options_market_definition_message_written.market_desc[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.option_type == new_options_market_definition_message_written.option_type);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> assert(new_options_market_definition_message_read.strike_price[new_options_market_definition_message_at] == new_options_market_definition_message_written.strike_price[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.deal_price_denominator == new_options_market_definition_message_written.deal_price_denominator);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.min_qty[new_options_market_definition_message_at] == new_options_market_definition_message_written.min_qty[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 20 -> assert(new_options_market_definition_message_read.currency[new_options_market_definition_message_at] == new_options_market_definition_message_written.currency[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.num_decimals_strike_price == new_options_market_definition_message_written.num_decimals_strike_price);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> assert(new_options_market_definition_message_read.min_options_price[new_options_market_definition_message_at] == new_options_market_definition_message_written.min_options_price[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> assert(new_options_market_definition_message_read.max_options_price[new_options_market_definition_message_at] == new_options_market_definition_message_written.max_options_price[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.increment_premium_price[new_options_market_definition_message_at] == new_options_market_definition_message_written.increment_premium_price[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.options_expiration_year[new_options_market_definition_message_at] == new_options_market_definition_message_written.options_expiration_year[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.options_expiration_month[new_options_market_definition_message_at] == new_options_market_definition_message_written.options_expiration_month[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.options_expiration_day[new_options_market_definition_message_at] == new_options_market_definition_message_written.options_expiration_day[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.options_style == new_options_market_definition_message_written.options_style);
  assert(new_options_market_definition_message_read.options_expiration_type == new_options_market_definition_message_written.options_expiration_type);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.hedge_market_id[new_options_market_definition_message_at] == new_options_market_definition_message_written.hedge_market_id[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.settle_price_denominator == new_options_market_definition_message_written.settle_price_denominator);
  assert(new_options_market_definition_message_read.unit_qty_denominator == new_options_market_definition_message_written.unit_qty_denominator);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 8 -> assert(new_options_market_definition_message_read.tick_value[new_options_market_definition_message_at] == new_options_market_definition_message_written.tick_value[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.flex_allowed == new_options_market_definition_message_written.flex_allowed);
  assert(new_options_market_definition_message_read.settlement_type == new_options_market_definition_message_written.settlement_type);
  assert(new_options_market_definition_message_read.is_block_only == new_options_market_definition_message_written.is_block_only);
  assert(new_options_market_definition_message_read.gt_allowed == new_options_market_definition_message_written.gt_allowed);
  assert(new_options_market_definition_message_read.cross_order_supported == new_options_market_definition_message_written.cross_order_supported);
  assert(new_options_market_definition_message_read.guaranteed_cross_supported == new_options_market_definition_message_written.guaranteed_cross_supported);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 30 -> assert(new_options_market_definition_message_read.unit_of_measure[new_options_market_definition_message_at] == new_options_market_definition_message_written.unit_of_measure[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.mifid_regulated_market == new_options_market_definition_message_written.mifid_regulated_market);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.screen_last_trade_year[new_options_market_definition_message_at] == new_options_market_definition_message_written.screen_last_trade_year[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.screen_last_trade_month[new_options_market_definition_message_at] == new_options_market_definition_message_written.screen_last_trade_month[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.screen_last_trade_day[new_options_market_definition_message_at] == new_options_market_definition_message_written.screen_last_trade_day[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  assert(new_options_market_definition_message_read.is_tradable == new_options_market_definition_message_written.is_tradable);
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.old_num_of_cycles[new_options_market_definition_message_at] == new_options_market_definition_message_written.old_num_of_cycles[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 2 -> assert(new_options_market_definition_message_read.market_type_id[new_options_market_definition_message_at] == new_options_market_definition_message_written.market_type_id[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  new_options_market_definition_message_at = 0;
  do
  :: new_options_market_definition_message_at < 4 -> assert(new_options_market_definition_message_read.num_of_cycles[new_options_market_definition_message_at] == new_options_market_definition_message_written.num_of_cycles[new_options_market_definition_message_at]); new_options_market_definition_message_at = new_options_market_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Option Open Interest Message: 26 bytes ---------------------------------- */

/* Option Open Interest Message */
typedef OptionOpenInterestMessage {
  byte market_id[4];
  byte open_interest[4];
  byte message_date_time[8];
  byte open_interest_date[10]
};

int option_open_interest_message_at;

/* every byte of Option Open Interest Message set to one value */
inline fill_option_open_interest_message(option_open_interest_message_record, option_open_interest_message_value) {
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.market_id[option_open_interest_message_at] = option_open_interest_message_value; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.open_interest[option_open_interest_message_at] = option_open_interest_message_value; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 8 -> option_open_interest_message_record.message_date_time[option_open_interest_message_at] = option_open_interest_message_value; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 10 -> option_open_interest_message_record.open_interest_date[option_open_interest_message_at] = option_open_interest_message_value; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Option Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_option_open_interest_message(option_open_interest_message_record, option_open_interest_message_base) {
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.market_id[option_open_interest_message_at] = (option_open_interest_message_base + 0 + option_open_interest_message_at + 1) % 256; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.open_interest[option_open_interest_message_at] = (option_open_interest_message_base + 4 + option_open_interest_message_at + 1) % 256; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 8 -> option_open_interest_message_record.message_date_time[option_open_interest_message_at] = (option_open_interest_message_base + 8 + option_open_interest_message_at + 1) % 256; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 10 -> option_open_interest_message_record.open_interest_date[option_open_interest_message_at] = (option_open_interest_message_base + 16 + option_open_interest_message_at + 1) % 256; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Open Interest Message to the wire, 26 bytes from where the cursor stands */
inline encode_option_open_interest_message(option_open_interest_message_record) {
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> wire[at] = option_open_interest_message_record.market_id[option_open_interest_message_at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> wire[at] = option_open_interest_message_record.open_interest[option_open_interest_message_at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 8 -> wire[at] = option_open_interest_message_record.message_date_time[option_open_interest_message_at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 10 -> wire[at] = option_open_interest_message_record.open_interest_date[option_open_interest_message_at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Open Interest Message off the wire, 26 bytes from where the cursor stands */
inline decode_option_open_interest_message(option_open_interest_message_record) {
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.market_id[option_open_interest_message_at] = wire[at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> option_open_interest_message_record.open_interest[option_open_interest_message_at] = wire[at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 8 -> option_open_interest_message_record.message_date_time[option_open_interest_message_at] = wire[at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 10 -> option_open_interest_message_record.open_interest_date[option_open_interest_message_at] = wire[at]; at = at + 1; option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Option Open Interest Message is what was written, byte for byte */
inline equal_option_open_interest_message(option_open_interest_message_read, option_open_interest_message_written) {
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> assert(option_open_interest_message_read.market_id[option_open_interest_message_at] == option_open_interest_message_written.market_id[option_open_interest_message_at]); option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 4 -> assert(option_open_interest_message_read.open_interest[option_open_interest_message_at] == option_open_interest_message_written.open_interest[option_open_interest_message_at]); option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 8 -> assert(option_open_interest_message_read.message_date_time[option_open_interest_message_at] == option_open_interest_message_written.message_date_time[option_open_interest_message_at]); option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  option_open_interest_message_at = 0;
  do
  :: option_open_interest_message_at < 10 -> assert(option_open_interest_message_read.open_interest_date[option_open_interest_message_at] == option_open_interest_message_written.open_interest_date[option_open_interest_message_at]); option_open_interest_message_at = option_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Option Settlement Price Message: 53 bytes ------------------------------- */

/* Option settlement prices could be official or unofficial. For a given market, the exchange usually sends out unofficial price before the official one. */
typedef OptionSettlementPriceMessage {
  byte market_id[4];
  byte settlement_price_with_deal_price_precision[8];
  byte message_date_time[8];
  byte is_official;
  byte valuation_date_time[8];
  byte volatility[8];
  byte settlement_price[8];
  byte delta[8]
};

int option_settlement_price_message_at;

/* every byte of Option Settlement Price Message set to one value */
inline fill_option_settlement_price_message(option_settlement_price_message_record, option_settlement_price_message_value) {
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 4 -> option_settlement_price_message_record.market_id[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price_with_deal_price_precision[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.message_date_time[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_record.is_official = option_settlement_price_message_value;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.valuation_date_time[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.volatility[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.delta[option_settlement_price_message_at] = option_settlement_price_message_value; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Option Settlement Price Message set to where it lies, so a field read out of place says so */
inline ramp_option_settlement_price_message(option_settlement_price_message_record, option_settlement_price_message_base) {
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 4 -> option_settlement_price_message_record.market_id[option_settlement_price_message_at] = (option_settlement_price_message_base + 0 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price_with_deal_price_precision[option_settlement_price_message_at] = (option_settlement_price_message_base + 4 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.message_date_time[option_settlement_price_message_at] = (option_settlement_price_message_base + 12 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_record.is_official = (option_settlement_price_message_base + 20 + 1) % 256;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.valuation_date_time[option_settlement_price_message_at] = (option_settlement_price_message_base + 21 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.volatility[option_settlement_price_message_at] = (option_settlement_price_message_base + 29 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price[option_settlement_price_message_at] = (option_settlement_price_message_base + 37 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.delta[option_settlement_price_message_at] = (option_settlement_price_message_base + 45 + option_settlement_price_message_at + 1) % 256; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Settlement Price Message to the wire, 53 bytes from where the cursor stands */
inline encode_option_settlement_price_message(option_settlement_price_message_record) {
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 4 -> wire[at] = option_settlement_price_message_record.market_id[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.settlement_price_with_deal_price_precision[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.message_date_time[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  wire[at] = option_settlement_price_message_record.is_official; at = at + 1;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.valuation_date_time[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.volatility[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.settlement_price[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> wire[at] = option_settlement_price_message_record.delta[option_settlement_price_message_at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Option Settlement Price Message off the wire, 53 bytes from where the cursor stands */
inline decode_option_settlement_price_message(option_settlement_price_message_record) {
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 4 -> option_settlement_price_message_record.market_id[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price_with_deal_price_precision[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.message_date_time[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_record.is_official = wire[at]; at = at + 1;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.valuation_date_time[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.volatility[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.settlement_price[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> option_settlement_price_message_record.delta[option_settlement_price_message_at] = wire[at]; at = at + 1; option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Option Settlement Price Message is what was written, byte for byte */
inline equal_option_settlement_price_message(option_settlement_price_message_read, option_settlement_price_message_written) {
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 4 -> assert(option_settlement_price_message_read.market_id[option_settlement_price_message_at] == option_settlement_price_message_written.market_id[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.settlement_price_with_deal_price_precision[option_settlement_price_message_at] == option_settlement_price_message_written.settlement_price_with_deal_price_precision[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.message_date_time[option_settlement_price_message_at] == option_settlement_price_message_written.message_date_time[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  assert(option_settlement_price_message_read.is_official == option_settlement_price_message_written.is_official);
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.valuation_date_time[option_settlement_price_message_at] == option_settlement_price_message_written.valuation_date_time[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.volatility[option_settlement_price_message_at] == option_settlement_price_message_written.volatility[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.settlement_price[option_settlement_price_message_at] == option_settlement_price_message_written.settlement_price[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  option_settlement_price_message_at = 0;
  do
  :: option_settlement_price_message_at < 8 -> assert(option_settlement_price_message_read.delta[option_settlement_price_message_at] == option_settlement_price_message_written.delta[option_settlement_price_message_at]); option_settlement_price_message_at = option_settlement_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Snapshot Order Message: 41 bytes --------------------------------- */

/* This message is for orders in snapshot only. It is different from the order message for incremental updates. */
typedef MarketSnapshotOrderMessage {
  byte market_id[4];
  byte order_id[8];
  byte order_sequence_id[2];
  byte side;
  byte price[8];
  byte quantity[4];
  byte is_implied;
  byte is_rfq;
  byte order_entry_date_time[8];
  byte sequence_within_millis[4]
};

int market_snapshot_order_message_at;

/* every byte of Market Snapshot Order Message set to one value */
inline fill_market_snapshot_order_message(market_snapshot_order_message_record, market_snapshot_order_message_value) {
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.market_id[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_id[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 2 -> market_snapshot_order_message_record.order_sequence_id[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.side = market_snapshot_order_message_value;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.price[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.quantity[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.is_implied = market_snapshot_order_message_value;
  market_snapshot_order_message_record.is_rfq = market_snapshot_order_message_value;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_entry_date_time[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.sequence_within_millis[market_snapshot_order_message_at] = market_snapshot_order_message_value; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Snapshot Order Message set to where it lies, so a field read out of place says so */
inline ramp_market_snapshot_order_message(market_snapshot_order_message_record, market_snapshot_order_message_base) {
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.market_id[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 0 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_id[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 4 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 2 -> market_snapshot_order_message_record.order_sequence_id[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 12 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.side = (market_snapshot_order_message_base + 14 + 1) % 256;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.price[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 15 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.quantity[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 23 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.is_implied = (market_snapshot_order_message_base + 27 + 1) % 256;
  market_snapshot_order_message_record.is_rfq = (market_snapshot_order_message_base + 28 + 1) % 256;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_entry_date_time[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 29 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.sequence_within_millis[market_snapshot_order_message_at] = (market_snapshot_order_message_base + 37 + market_snapshot_order_message_at + 1) % 256; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Order Message to the wire, 41 bytes from where the cursor stands */
inline encode_market_snapshot_order_message(market_snapshot_order_message_record) {
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> wire[at] = market_snapshot_order_message_record.market_id[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> wire[at] = market_snapshot_order_message_record.order_id[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 2 -> wire[at] = market_snapshot_order_message_record.order_sequence_id[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_order_message_record.side; at = at + 1;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> wire[at] = market_snapshot_order_message_record.price[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> wire[at] = market_snapshot_order_message_record.quantity[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_order_message_record.is_implied; at = at + 1;
  wire[at] = market_snapshot_order_message_record.is_rfq; at = at + 1;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> wire[at] = market_snapshot_order_message_record.order_entry_date_time[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> wire[at] = market_snapshot_order_message_record.sequence_within_millis[market_snapshot_order_message_at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Order Message off the wire, 41 bytes from where the cursor stands */
inline decode_market_snapshot_order_message(market_snapshot_order_message_record) {
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.market_id[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_id[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 2 -> market_snapshot_order_message_record.order_sequence_id[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.side = wire[at]; at = at + 1;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.price[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.quantity[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_record.is_implied = wire[at]; at = at + 1;
  market_snapshot_order_message_record.is_rfq = wire[at]; at = at + 1;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> market_snapshot_order_message_record.order_entry_date_time[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> market_snapshot_order_message_record.sequence_within_millis[market_snapshot_order_message_at] = wire[at]; at = at + 1; market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Snapshot Order Message is what was written, byte for byte */
inline equal_market_snapshot_order_message(market_snapshot_order_message_read, market_snapshot_order_message_written) {
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> assert(market_snapshot_order_message_read.market_id[market_snapshot_order_message_at] == market_snapshot_order_message_written.market_id[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> assert(market_snapshot_order_message_read.order_id[market_snapshot_order_message_at] == market_snapshot_order_message_written.order_id[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 2 -> assert(market_snapshot_order_message_read.order_sequence_id[market_snapshot_order_message_at] == market_snapshot_order_message_written.order_sequence_id[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_order_message_read.side == market_snapshot_order_message_written.side);
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> assert(market_snapshot_order_message_read.price[market_snapshot_order_message_at] == market_snapshot_order_message_written.price[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> assert(market_snapshot_order_message_read.quantity[market_snapshot_order_message_at] == market_snapshot_order_message_written.quantity[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_order_message_read.is_implied == market_snapshot_order_message_written.is_implied);
  assert(market_snapshot_order_message_read.is_rfq == market_snapshot_order_message_written.is_rfq);
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 8 -> assert(market_snapshot_order_message_read.order_entry_date_time[market_snapshot_order_message_at] == market_snapshot_order_message_written.order_entry_date_time[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  market_snapshot_order_message_at = 0;
  do
  :: market_snapshot_order_message_at < 4 -> assert(market_snapshot_order_message_read.sequence_within_millis[market_snapshot_order_message_at] == market_snapshot_order_message_written.sequence_within_millis[market_snapshot_order_message_at]); market_snapshot_order_message_at = market_snapshot_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Order Message: 32 bytes ------------------------------------------ */

/* Upon receipt of this message, client should remove the order from its local book. */
typedef DeleteOrderMessage {
  byte market_id[4];
  byte order_id[8];
  byte message_date_time[8];
  byte sequence_within_millis[4];
  byte request_trading_engine_received_timestamp[8]
};

int delete_order_message_at;

/* every byte of Delete Order Message set to one value */
inline fill_delete_order_message(delete_order_message_record, delete_order_message_value) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.market_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.message_date_time[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_within_millis[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.request_trading_engine_received_timestamp[delete_order_message_at] = delete_order_message_value; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Order Message set to where it lies, so a field read out of place says so */
inline ramp_delete_order_message(delete_order_message_record, delete_order_message_base) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.market_id[delete_order_message_at] = (delete_order_message_base + 0 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = (delete_order_message_base + 4 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.message_date_time[delete_order_message_at] = (delete_order_message_base + 12 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_within_millis[delete_order_message_at] = (delete_order_message_base + 20 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.request_trading_engine_received_timestamp[delete_order_message_at] = (delete_order_message_base + 24 + delete_order_message_at + 1) % 256; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message to the wire, 32 bytes from where the cursor stands */
inline encode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.market_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.order_id[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.message_date_time[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> wire[at] = delete_order_message_record.sequence_within_millis[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> wire[at] = delete_order_message_record.request_trading_engine_received_timestamp[delete_order_message_at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Order Message off the wire, 32 bytes from where the cursor stands */
inline decode_delete_order_message(delete_order_message_record) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.market_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.order_id[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.message_date_time[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> delete_order_message_record.sequence_within_millis[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> delete_order_message_record.request_trading_engine_received_timestamp[delete_order_message_at] = wire[at]; at = at + 1; delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Order Message is what was written, byte for byte */
inline equal_delete_order_message(delete_order_message_read, delete_order_message_written) {
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.market_id[delete_order_message_at] == delete_order_message_written.market_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.order_id[delete_order_message_at] == delete_order_message_written.order_id[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.message_date_time[delete_order_message_at] == delete_order_message_written.message_date_time[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 4 -> assert(delete_order_message_read.sequence_within_millis[delete_order_message_at] == delete_order_message_written.sequence_within_millis[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  delete_order_message_at = 0;
  do
  :: delete_order_message_at < 8 -> assert(delete_order_message_read.request_trading_engine_received_timestamp[delete_order_message_at] == delete_order_message_written.request_trading_engine_received_timestamp[delete_order_message_at]); delete_order_message_at = delete_order_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Bundle Marker: 10 bytes ----------------------------------------- */

/* This message indicates where a bundle of messages starts or ends. */
typedef MessageBundleMarker {
  byte start_or_end;
  byte trade_transaction_id[8];
  byte is_transaction_end
};

int message_bundle_marker_at;

/* every byte of Message Bundle Marker set to one value */
inline fill_message_bundle_marker(message_bundle_marker_record, message_bundle_marker_value) {
  message_bundle_marker_record.start_or_end = message_bundle_marker_value;
  message_bundle_marker_at = 0;
  do
  :: message_bundle_marker_at < 8 -> message_bundle_marker_record.trade_transaction_id[message_bundle_marker_at] = message_bundle_marker_value; message_bundle_marker_at = message_bundle_marker_at + 1
  :: else -> break
  od;
  message_bundle_marker_record.is_transaction_end = message_bundle_marker_value;
  skip
}

/* each byte of Message Bundle Marker set to where it lies, so a field read out of place says so */
inline ramp_message_bundle_marker(message_bundle_marker_record, message_bundle_marker_base) {
  message_bundle_marker_record.start_or_end = (message_bundle_marker_base + 0 + 1) % 256;
  message_bundle_marker_at = 0;
  do
  :: message_bundle_marker_at < 8 -> message_bundle_marker_record.trade_transaction_id[message_bundle_marker_at] = (message_bundle_marker_base + 1 + message_bundle_marker_at + 1) % 256; message_bundle_marker_at = message_bundle_marker_at + 1
  :: else -> break
  od;
  message_bundle_marker_record.is_transaction_end = (message_bundle_marker_base + 9 + 1) % 256;
  skip
}

/* Message Bundle Marker to the wire, 10 bytes from where the cursor stands */
inline encode_message_bundle_marker(message_bundle_marker_record) {
  wire[at] = message_bundle_marker_record.start_or_end; at = at + 1;
  message_bundle_marker_at = 0;
  do
  :: message_bundle_marker_at < 8 -> wire[at] = message_bundle_marker_record.trade_transaction_id[message_bundle_marker_at]; at = at + 1; message_bundle_marker_at = message_bundle_marker_at + 1
  :: else -> break
  od;
  wire[at] = message_bundle_marker_record.is_transaction_end; at = at + 1;
  skip
}

/* Message Bundle Marker off the wire, 10 bytes from where the cursor stands */
inline decode_message_bundle_marker(message_bundle_marker_record) {
  message_bundle_marker_record.start_or_end = wire[at]; at = at + 1;
  message_bundle_marker_at = 0;
  do
  :: message_bundle_marker_at < 8 -> message_bundle_marker_record.trade_transaction_id[message_bundle_marker_at] = wire[at]; at = at + 1; message_bundle_marker_at = message_bundle_marker_at + 1
  :: else -> break
  od;
  message_bundle_marker_record.is_transaction_end = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Bundle Marker is what was written, byte for byte */
inline equal_message_bundle_marker(message_bundle_marker_read, message_bundle_marker_written) {
  assert(message_bundle_marker_read.start_or_end == message_bundle_marker_written.start_or_end);
  message_bundle_marker_at = 0;
  do
  :: message_bundle_marker_at < 8 -> assert(message_bundle_marker_read.trade_transaction_id[message_bundle_marker_at] == message_bundle_marker_written.trade_transaction_id[message_bundle_marker_at]); message_bundle_marker_at = message_bundle_marker_at + 1
  :: else -> break
  od;
  assert(message_bundle_marker_read.is_transaction_end == message_bundle_marker_written.is_transaction_end);
  skip
}

/* ---- Fixing Transition Message: 26 bytes ------------------------------------- */

/* This message supports ICE Benchmark Administration’s (IBA) electronic Gold Auction and it is disseminated when there is a transition of the fixing market. */
typedef FixingTransitionMessage {
  byte market_id[4];
  byte fixing_status;
  byte auction_end_time[8];
  byte threshold_imbalance_qty[4];
  byte message_date_time[8];
  byte num_decimals_quantity
};

int fixing_transition_message_at;

/* every byte of Fixing Transition Message set to one value */
inline fill_fixing_transition_message(fixing_transition_message_record, fixing_transition_message_value) {
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.market_id[fixing_transition_message_at] = fixing_transition_message_value; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.fixing_status = fixing_transition_message_value;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.auction_end_time[fixing_transition_message_at] = fixing_transition_message_value; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.threshold_imbalance_qty[fixing_transition_message_at] = fixing_transition_message_value; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.message_date_time[fixing_transition_message_at] = fixing_transition_message_value; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.num_decimals_quantity = fixing_transition_message_value;
  skip
}

/* each byte of Fixing Transition Message set to where it lies, so a field read out of place says so */
inline ramp_fixing_transition_message(fixing_transition_message_record, fixing_transition_message_base) {
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.market_id[fixing_transition_message_at] = (fixing_transition_message_base + 0 + fixing_transition_message_at + 1) % 256; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.fixing_status = (fixing_transition_message_base + 4 + 1) % 256;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.auction_end_time[fixing_transition_message_at] = (fixing_transition_message_base + 5 + fixing_transition_message_at + 1) % 256; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.threshold_imbalance_qty[fixing_transition_message_at] = (fixing_transition_message_base + 13 + fixing_transition_message_at + 1) % 256; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.message_date_time[fixing_transition_message_at] = (fixing_transition_message_base + 17 + fixing_transition_message_at + 1) % 256; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.num_decimals_quantity = (fixing_transition_message_base + 25 + 1) % 256;
  skip
}

/* Fixing Transition Message to the wire, 26 bytes from where the cursor stands */
inline encode_fixing_transition_message(fixing_transition_message_record) {
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> wire[at] = fixing_transition_message_record.market_id[fixing_transition_message_at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  wire[at] = fixing_transition_message_record.fixing_status; at = at + 1;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> wire[at] = fixing_transition_message_record.auction_end_time[fixing_transition_message_at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> wire[at] = fixing_transition_message_record.threshold_imbalance_qty[fixing_transition_message_at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> wire[at] = fixing_transition_message_record.message_date_time[fixing_transition_message_at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  wire[at] = fixing_transition_message_record.num_decimals_quantity; at = at + 1;
  skip
}

/* Fixing Transition Message off the wire, 26 bytes from where the cursor stands */
inline decode_fixing_transition_message(fixing_transition_message_record) {
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.market_id[fixing_transition_message_at] = wire[at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.fixing_status = wire[at]; at = at + 1;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.auction_end_time[fixing_transition_message_at] = wire[at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> fixing_transition_message_record.threshold_imbalance_qty[fixing_transition_message_at] = wire[at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> fixing_transition_message_record.message_date_time[fixing_transition_message_at] = wire[at]; at = at + 1; fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_record.num_decimals_quantity = wire[at]; at = at + 1;
  skip
}

/* what was read of Fixing Transition Message is what was written, byte for byte */
inline equal_fixing_transition_message(fixing_transition_message_read, fixing_transition_message_written) {
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> assert(fixing_transition_message_read.market_id[fixing_transition_message_at] == fixing_transition_message_written.market_id[fixing_transition_message_at]); fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  assert(fixing_transition_message_read.fixing_status == fixing_transition_message_written.fixing_status);
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> assert(fixing_transition_message_read.auction_end_time[fixing_transition_message_at] == fixing_transition_message_written.auction_end_time[fixing_transition_message_at]); fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 4 -> assert(fixing_transition_message_read.threshold_imbalance_qty[fixing_transition_message_at] == fixing_transition_message_written.threshold_imbalance_qty[fixing_transition_message_at]); fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  fixing_transition_message_at = 0;
  do
  :: fixing_transition_message_at < 8 -> assert(fixing_transition_message_read.message_date_time[fixing_transition_message_at] == fixing_transition_message_written.message_date_time[fixing_transition_message_at]); fixing_transition_message_at = fixing_transition_message_at + 1
  :: else -> break
  od;
  assert(fixing_transition_message_read.num_decimals_quantity == fixing_transition_message_written.num_decimals_quantity);
  skip
}

/* ---- Fixing Lockdown Message: 79 bytes --------------------------------------- */

/* This message supports ICE Benchmark Administration’s (IBA) electronic Gold Auction and it is disseminated when there is a transition of the fixing market. */
typedef FixingLockdownMessage {
  byte market_id[4];
  byte auction_date[10];
  byte message_date_time[8];
  byte description[20];
  byte round[2];
  byte agg_bid_qty[4];
  byte agg_offer_qty[4];
  byte usd_price[8];
  byte is_balanced;
  byte is_final;
  byte gbp_price[8];
  byte eur_price[8];
  byte num_decimals_quantity
};

int fixing_lockdown_message_at;

/* every byte of Fixing Lockdown Message set to one value */
inline fill_fixing_lockdown_message(fixing_lockdown_message_record, fixing_lockdown_message_value) {
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.market_id[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 10 -> fixing_lockdown_message_record.auction_date[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.message_date_time[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 20 -> fixing_lockdown_message_record.description[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 2 -> fixing_lockdown_message_record.round[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_bid_qty[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_offer_qty[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.usd_price[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.is_balanced = fixing_lockdown_message_value;
  fixing_lockdown_message_record.is_final = fixing_lockdown_message_value;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.gbp_price[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.eur_price[fixing_lockdown_message_at] = fixing_lockdown_message_value; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.num_decimals_quantity = fixing_lockdown_message_value;
  skip
}

/* each byte of Fixing Lockdown Message set to where it lies, so a field read out of place says so */
inline ramp_fixing_lockdown_message(fixing_lockdown_message_record, fixing_lockdown_message_base) {
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.market_id[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 0 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 10 -> fixing_lockdown_message_record.auction_date[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 4 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.message_date_time[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 14 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 20 -> fixing_lockdown_message_record.description[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 22 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 2 -> fixing_lockdown_message_record.round[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 42 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_bid_qty[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 44 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_offer_qty[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 48 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.usd_price[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 52 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.is_balanced = (fixing_lockdown_message_base + 60 + 1) % 256;
  fixing_lockdown_message_record.is_final = (fixing_lockdown_message_base + 61 + 1) % 256;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.gbp_price[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 62 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.eur_price[fixing_lockdown_message_at] = (fixing_lockdown_message_base + 70 + fixing_lockdown_message_at + 1) % 256; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.num_decimals_quantity = (fixing_lockdown_message_base + 78 + 1) % 256;
  skip
}

/* Fixing Lockdown Message to the wire, 79 bytes from where the cursor stands */
inline encode_fixing_lockdown_message(fixing_lockdown_message_record) {
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> wire[at] = fixing_lockdown_message_record.market_id[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 10 -> wire[at] = fixing_lockdown_message_record.auction_date[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> wire[at] = fixing_lockdown_message_record.message_date_time[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 20 -> wire[at] = fixing_lockdown_message_record.description[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 2 -> wire[at] = fixing_lockdown_message_record.round[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> wire[at] = fixing_lockdown_message_record.agg_bid_qty[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> wire[at] = fixing_lockdown_message_record.agg_offer_qty[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> wire[at] = fixing_lockdown_message_record.usd_price[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  wire[at] = fixing_lockdown_message_record.is_balanced; at = at + 1;
  wire[at] = fixing_lockdown_message_record.is_final; at = at + 1;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> wire[at] = fixing_lockdown_message_record.gbp_price[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> wire[at] = fixing_lockdown_message_record.eur_price[fixing_lockdown_message_at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  wire[at] = fixing_lockdown_message_record.num_decimals_quantity; at = at + 1;
  skip
}

/* Fixing Lockdown Message off the wire, 79 bytes from where the cursor stands */
inline decode_fixing_lockdown_message(fixing_lockdown_message_record) {
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.market_id[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 10 -> fixing_lockdown_message_record.auction_date[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.message_date_time[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 20 -> fixing_lockdown_message_record.description[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 2 -> fixing_lockdown_message_record.round[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_bid_qty[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> fixing_lockdown_message_record.agg_offer_qty[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.usd_price[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.is_balanced = wire[at]; at = at + 1;
  fixing_lockdown_message_record.is_final = wire[at]; at = at + 1;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.gbp_price[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> fixing_lockdown_message_record.eur_price[fixing_lockdown_message_at] = wire[at]; at = at + 1; fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_record.num_decimals_quantity = wire[at]; at = at + 1;
  skip
}

/* what was read of Fixing Lockdown Message is what was written, byte for byte */
inline equal_fixing_lockdown_message(fixing_lockdown_message_read, fixing_lockdown_message_written) {
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> assert(fixing_lockdown_message_read.market_id[fixing_lockdown_message_at] == fixing_lockdown_message_written.market_id[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 10 -> assert(fixing_lockdown_message_read.auction_date[fixing_lockdown_message_at] == fixing_lockdown_message_written.auction_date[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> assert(fixing_lockdown_message_read.message_date_time[fixing_lockdown_message_at] == fixing_lockdown_message_written.message_date_time[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 20 -> assert(fixing_lockdown_message_read.description[fixing_lockdown_message_at] == fixing_lockdown_message_written.description[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 2 -> assert(fixing_lockdown_message_read.round[fixing_lockdown_message_at] == fixing_lockdown_message_written.round[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> assert(fixing_lockdown_message_read.agg_bid_qty[fixing_lockdown_message_at] == fixing_lockdown_message_written.agg_bid_qty[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 4 -> assert(fixing_lockdown_message_read.agg_offer_qty[fixing_lockdown_message_at] == fixing_lockdown_message_written.agg_offer_qty[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> assert(fixing_lockdown_message_read.usd_price[fixing_lockdown_message_at] == fixing_lockdown_message_written.usd_price[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  assert(fixing_lockdown_message_read.is_balanced == fixing_lockdown_message_written.is_balanced);
  assert(fixing_lockdown_message_read.is_final == fixing_lockdown_message_written.is_final);
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> assert(fixing_lockdown_message_read.gbp_price[fixing_lockdown_message_at] == fixing_lockdown_message_written.gbp_price[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  fixing_lockdown_message_at = 0;
  do
  :: fixing_lockdown_message_at < 8 -> assert(fixing_lockdown_message_read.eur_price[fixing_lockdown_message_at] == fixing_lockdown_message_written.eur_price[fixing_lockdown_message_at]); fixing_lockdown_message_at = fixing_lockdown_message_at + 1
  :: else -> break
  od;
  assert(fixing_lockdown_message_read.num_decimals_quantity == fixing_lockdown_message_written.num_decimals_quantity);
  skip
}

/* ---- Fixing Indicative Price Message: 25 bytes ------------------------------- */

/* This message supports ICE Benchmark Administration’s (IBA) electronic Gold and Silver Auction and is disseminated at the end of the final auction when the final price is published */
typedef FixingIndicativePriceMessage {
  byte market_id[4];
  byte iba_currency[3];
  byte price[8];
  byte price_in_gram[8];
  byte num_decimals_price;
  byte num_decimals_price_in_gram
};

int fixing_indicative_price_message_at;

/* every byte of Fixing Indicative Price Message set to one value */
inline fill_fixing_indicative_price_message(fixing_indicative_price_message_record, fixing_indicative_price_message_value) {
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 4 -> fixing_indicative_price_message_record.market_id[fixing_indicative_price_message_at] = fixing_indicative_price_message_value; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 3 -> fixing_indicative_price_message_record.iba_currency[fixing_indicative_price_message_at] = fixing_indicative_price_message_value; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price[fixing_indicative_price_message_at] = fixing_indicative_price_message_value; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price_in_gram[fixing_indicative_price_message_at] = fixing_indicative_price_message_value; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_record.num_decimals_price = fixing_indicative_price_message_value;
  fixing_indicative_price_message_record.num_decimals_price_in_gram = fixing_indicative_price_message_value;
  skip
}

/* each byte of Fixing Indicative Price Message set to where it lies, so a field read out of place says so */
inline ramp_fixing_indicative_price_message(fixing_indicative_price_message_record, fixing_indicative_price_message_base) {
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 4 -> fixing_indicative_price_message_record.market_id[fixing_indicative_price_message_at] = (fixing_indicative_price_message_base + 0 + fixing_indicative_price_message_at + 1) % 256; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 3 -> fixing_indicative_price_message_record.iba_currency[fixing_indicative_price_message_at] = (fixing_indicative_price_message_base + 4 + fixing_indicative_price_message_at + 1) % 256; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price[fixing_indicative_price_message_at] = (fixing_indicative_price_message_base + 7 + fixing_indicative_price_message_at + 1) % 256; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price_in_gram[fixing_indicative_price_message_at] = (fixing_indicative_price_message_base + 15 + fixing_indicative_price_message_at + 1) % 256; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_record.num_decimals_price = (fixing_indicative_price_message_base + 23 + 1) % 256;
  fixing_indicative_price_message_record.num_decimals_price_in_gram = (fixing_indicative_price_message_base + 24 + 1) % 256;
  skip
}

/* Fixing Indicative Price Message to the wire, 25 bytes from where the cursor stands */
inline encode_fixing_indicative_price_message(fixing_indicative_price_message_record) {
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 4 -> wire[at] = fixing_indicative_price_message_record.market_id[fixing_indicative_price_message_at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 3 -> wire[at] = fixing_indicative_price_message_record.iba_currency[fixing_indicative_price_message_at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> wire[at] = fixing_indicative_price_message_record.price[fixing_indicative_price_message_at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> wire[at] = fixing_indicative_price_message_record.price_in_gram[fixing_indicative_price_message_at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  wire[at] = fixing_indicative_price_message_record.num_decimals_price; at = at + 1;
  wire[at] = fixing_indicative_price_message_record.num_decimals_price_in_gram; at = at + 1;
  skip
}

/* Fixing Indicative Price Message off the wire, 25 bytes from where the cursor stands */
inline decode_fixing_indicative_price_message(fixing_indicative_price_message_record) {
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 4 -> fixing_indicative_price_message_record.market_id[fixing_indicative_price_message_at] = wire[at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 3 -> fixing_indicative_price_message_record.iba_currency[fixing_indicative_price_message_at] = wire[at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price[fixing_indicative_price_message_at] = wire[at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> fixing_indicative_price_message_record.price_in_gram[fixing_indicative_price_message_at] = wire[at]; at = at + 1; fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_record.num_decimals_price = wire[at]; at = at + 1;
  fixing_indicative_price_message_record.num_decimals_price_in_gram = wire[at]; at = at + 1;
  skip
}

/* what was read of Fixing Indicative Price Message is what was written, byte for byte */
inline equal_fixing_indicative_price_message(fixing_indicative_price_message_read, fixing_indicative_price_message_written) {
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 4 -> assert(fixing_indicative_price_message_read.market_id[fixing_indicative_price_message_at] == fixing_indicative_price_message_written.market_id[fixing_indicative_price_message_at]); fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 3 -> assert(fixing_indicative_price_message_read.iba_currency[fixing_indicative_price_message_at] == fixing_indicative_price_message_written.iba_currency[fixing_indicative_price_message_at]); fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> assert(fixing_indicative_price_message_read.price[fixing_indicative_price_message_at] == fixing_indicative_price_message_written.price[fixing_indicative_price_message_at]); fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  fixing_indicative_price_message_at = 0;
  do
  :: fixing_indicative_price_message_at < 8 -> assert(fixing_indicative_price_message_read.price_in_gram[fixing_indicative_price_message_at] == fixing_indicative_price_message_written.price_in_gram[fixing_indicative_price_message_at]); fixing_indicative_price_message_at = fixing_indicative_price_message_at + 1
  :: else -> break
  od;
  assert(fixing_indicative_price_message_read.num_decimals_price == fixing_indicative_price_message_written.num_decimals_price);
  assert(fixing_indicative_price_message_read.num_decimals_price_in_gram == fixing_indicative_price_message_written.num_decimals_price_in_gram);
  skip
}

/* ---- Market Snapshot Price Level Message: 26 bytes --------------------------- */

/* This message is for price level in snapshot only. */
typedef MarketSnapshotPriceLevelMessage {
  byte market_id[4];
  byte side;
  byte price_level_position;
  byte price[8];
  byte quantity[4];
  byte order_count[2];
  byte implied_quantity[4];
  byte implied_order_count[2]
};

int market_snapshot_price_level_message_at;

/* every byte of Market Snapshot Price Level Message set to one value */
inline fill_market_snapshot_price_level_message(market_snapshot_price_level_message_record, market_snapshot_price_level_message_value) {
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.market_id[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_record.side = market_snapshot_price_level_message_value;
  market_snapshot_price_level_message_record.price_level_position = market_snapshot_price_level_message_value;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 8 -> market_snapshot_price_level_message_record.price[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.quantity[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.order_count[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.implied_quantity[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.implied_order_count[market_snapshot_price_level_message_at] = market_snapshot_price_level_message_value; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Snapshot Price Level Message set to where it lies, so a field read out of place says so */
inline ramp_market_snapshot_price_level_message(market_snapshot_price_level_message_record, market_snapshot_price_level_message_base) {
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.market_id[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 0 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_record.side = (market_snapshot_price_level_message_base + 4 + 1) % 256;
  market_snapshot_price_level_message_record.price_level_position = (market_snapshot_price_level_message_base + 5 + 1) % 256;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 8 -> market_snapshot_price_level_message_record.price[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 6 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.quantity[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 14 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.order_count[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 18 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.implied_quantity[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 20 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.implied_order_count[market_snapshot_price_level_message_at] = (market_snapshot_price_level_message_base + 24 + market_snapshot_price_level_message_at + 1) % 256; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Price Level Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_snapshot_price_level_message(market_snapshot_price_level_message_record) {
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> wire[at] = market_snapshot_price_level_message_record.market_id[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_price_level_message_record.side; at = at + 1;
  wire[at] = market_snapshot_price_level_message_record.price_level_position; at = at + 1;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 8 -> wire[at] = market_snapshot_price_level_message_record.price[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> wire[at] = market_snapshot_price_level_message_record.quantity[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> wire[at] = market_snapshot_price_level_message_record.order_count[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> wire[at] = market_snapshot_price_level_message_record.implied_quantity[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> wire[at] = market_snapshot_price_level_message_record.implied_order_count[market_snapshot_price_level_message_at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Price Level Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_snapshot_price_level_message(market_snapshot_price_level_message_record) {
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.market_id[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_record.side = wire[at]; at = at + 1;
  market_snapshot_price_level_message_record.price_level_position = wire[at]; at = at + 1;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 8 -> market_snapshot_price_level_message_record.price[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.quantity[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.order_count[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> market_snapshot_price_level_message_record.implied_quantity[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> market_snapshot_price_level_message_record.implied_order_count[market_snapshot_price_level_message_at] = wire[at]; at = at + 1; market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Snapshot Price Level Message is what was written, byte for byte */
inline equal_market_snapshot_price_level_message(market_snapshot_price_level_message_read, market_snapshot_price_level_message_written) {
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> assert(market_snapshot_price_level_message_read.market_id[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.market_id[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_price_level_message_read.side == market_snapshot_price_level_message_written.side);
  assert(market_snapshot_price_level_message_read.price_level_position == market_snapshot_price_level_message_written.price_level_position);
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 8 -> assert(market_snapshot_price_level_message_read.price[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.price[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> assert(market_snapshot_price_level_message_read.quantity[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.quantity[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> assert(market_snapshot_price_level_message_read.order_count[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.order_count[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 4 -> assert(market_snapshot_price_level_message_read.implied_quantity[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.implied_quantity[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  market_snapshot_price_level_message_at = 0;
  do
  :: market_snapshot_price_level_message_at < 2 -> assert(market_snapshot_price_level_message_read.implied_order_count[market_snapshot_price_level_message_at] == market_snapshot_price_level_message_written.implied_order_count[market_snapshot_price_level_message_at]); market_snapshot_price_level_message_at = market_snapshot_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Price Level Message: 34 bytes --------------------------------------- */

/* Upon receipt of this message, client should add/insert a price level at the specified position in the book for the given market, and push down the price levels that were previously at or below that position. */
typedef AddPriceLevelMessage {
  byte market_id[4];
  byte side;
  byte price_level_position;
  byte price[8];
  byte quantity[4];
  byte order_count[2];
  byte implied_quantity[4];
  byte implied_order_count[2];
  byte timestamp[8]
};

int add_price_level_message_at;

/* every byte of Add Price Level Message set to one value */
inline fill_add_price_level_message(add_price_level_message_record, add_price_level_message_value) {
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.market_id[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_record.side = add_price_level_message_value;
  add_price_level_message_record.price_level_position = add_price_level_message_value;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.price[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.quantity[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.order_count[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.implied_quantity[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.implied_order_count[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.timestamp[add_price_level_message_at] = add_price_level_message_value; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Price Level Message set to where it lies, so a field read out of place says so */
inline ramp_add_price_level_message(add_price_level_message_record, add_price_level_message_base) {
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.market_id[add_price_level_message_at] = (add_price_level_message_base + 0 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_record.side = (add_price_level_message_base + 4 + 1) % 256;
  add_price_level_message_record.price_level_position = (add_price_level_message_base + 5 + 1) % 256;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.price[add_price_level_message_at] = (add_price_level_message_base + 6 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.quantity[add_price_level_message_at] = (add_price_level_message_base + 14 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.order_count[add_price_level_message_at] = (add_price_level_message_base + 18 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.implied_quantity[add_price_level_message_at] = (add_price_level_message_base + 20 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.implied_order_count[add_price_level_message_at] = (add_price_level_message_base + 24 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.timestamp[add_price_level_message_at] = (add_price_level_message_base + 26 + add_price_level_message_at + 1) % 256; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Price Level Message to the wire, 34 bytes from where the cursor stands */
inline encode_add_price_level_message(add_price_level_message_record) {
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> wire[at] = add_price_level_message_record.market_id[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  wire[at] = add_price_level_message_record.side; at = at + 1;
  wire[at] = add_price_level_message_record.price_level_position; at = at + 1;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> wire[at] = add_price_level_message_record.price[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> wire[at] = add_price_level_message_record.quantity[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> wire[at] = add_price_level_message_record.order_count[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> wire[at] = add_price_level_message_record.implied_quantity[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> wire[at] = add_price_level_message_record.implied_order_count[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> wire[at] = add_price_level_message_record.timestamp[add_price_level_message_at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Price Level Message off the wire, 34 bytes from where the cursor stands */
inline decode_add_price_level_message(add_price_level_message_record) {
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.market_id[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_record.side = wire[at]; at = at + 1;
  add_price_level_message_record.price_level_position = wire[at]; at = at + 1;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.price[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.quantity[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.order_count[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> add_price_level_message_record.implied_quantity[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> add_price_level_message_record.implied_order_count[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> add_price_level_message_record.timestamp[add_price_level_message_at] = wire[at]; at = at + 1; add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Price Level Message is what was written, byte for byte */
inline equal_add_price_level_message(add_price_level_message_read, add_price_level_message_written) {
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> assert(add_price_level_message_read.market_id[add_price_level_message_at] == add_price_level_message_written.market_id[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  assert(add_price_level_message_read.side == add_price_level_message_written.side);
  assert(add_price_level_message_read.price_level_position == add_price_level_message_written.price_level_position);
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> assert(add_price_level_message_read.price[add_price_level_message_at] == add_price_level_message_written.price[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> assert(add_price_level_message_read.quantity[add_price_level_message_at] == add_price_level_message_written.quantity[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> assert(add_price_level_message_read.order_count[add_price_level_message_at] == add_price_level_message_written.order_count[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 4 -> assert(add_price_level_message_read.implied_quantity[add_price_level_message_at] == add_price_level_message_written.implied_quantity[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 2 -> assert(add_price_level_message_read.implied_order_count[add_price_level_message_at] == add_price_level_message_written.implied_order_count[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  add_price_level_message_at = 0;
  do
  :: add_price_level_message_at < 8 -> assert(add_price_level_message_read.timestamp[add_price_level_message_at] == add_price_level_message_written.timestamp[add_price_level_message_at]); add_price_level_message_at = add_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Change Price Level Message: 34 bytes ------------------------------------ */

/* Upon receipt of this message, client should update the price level at the specified position in its book for the given market. */
typedef ChangePriceLevelMessage {
  byte market_id[4];
  byte side;
  byte price_level_position;
  byte price[8];
  byte quantity[4];
  byte order_count[2];
  byte implied_quantity[4];
  byte implied_order_count[2];
  byte timestamp[8]
};

int change_price_level_message_at;

/* every byte of Change Price Level Message set to one value */
inline fill_change_price_level_message(change_price_level_message_record, change_price_level_message_value) {
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.market_id[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_record.side = change_price_level_message_value;
  change_price_level_message_record.price_level_position = change_price_level_message_value;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.price[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.quantity[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.order_count[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.implied_quantity[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.implied_order_count[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.timestamp[change_price_level_message_at] = change_price_level_message_value; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Change Price Level Message set to where it lies, so a field read out of place says so */
inline ramp_change_price_level_message(change_price_level_message_record, change_price_level_message_base) {
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.market_id[change_price_level_message_at] = (change_price_level_message_base + 0 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_record.side = (change_price_level_message_base + 4 + 1) % 256;
  change_price_level_message_record.price_level_position = (change_price_level_message_base + 5 + 1) % 256;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.price[change_price_level_message_at] = (change_price_level_message_base + 6 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.quantity[change_price_level_message_at] = (change_price_level_message_base + 14 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.order_count[change_price_level_message_at] = (change_price_level_message_base + 18 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.implied_quantity[change_price_level_message_at] = (change_price_level_message_base + 20 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.implied_order_count[change_price_level_message_at] = (change_price_level_message_base + 24 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.timestamp[change_price_level_message_at] = (change_price_level_message_base + 26 + change_price_level_message_at + 1) % 256; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Change Price Level Message to the wire, 34 bytes from where the cursor stands */
inline encode_change_price_level_message(change_price_level_message_record) {
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> wire[at] = change_price_level_message_record.market_id[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  wire[at] = change_price_level_message_record.side; at = at + 1;
  wire[at] = change_price_level_message_record.price_level_position; at = at + 1;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> wire[at] = change_price_level_message_record.price[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> wire[at] = change_price_level_message_record.quantity[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> wire[at] = change_price_level_message_record.order_count[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> wire[at] = change_price_level_message_record.implied_quantity[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> wire[at] = change_price_level_message_record.implied_order_count[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> wire[at] = change_price_level_message_record.timestamp[change_price_level_message_at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Change Price Level Message off the wire, 34 bytes from where the cursor stands */
inline decode_change_price_level_message(change_price_level_message_record) {
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.market_id[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_record.side = wire[at]; at = at + 1;
  change_price_level_message_record.price_level_position = wire[at]; at = at + 1;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.price[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.quantity[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.order_count[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> change_price_level_message_record.implied_quantity[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> change_price_level_message_record.implied_order_count[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> change_price_level_message_record.timestamp[change_price_level_message_at] = wire[at]; at = at + 1; change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Change Price Level Message is what was written, byte for byte */
inline equal_change_price_level_message(change_price_level_message_read, change_price_level_message_written) {
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> assert(change_price_level_message_read.market_id[change_price_level_message_at] == change_price_level_message_written.market_id[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  assert(change_price_level_message_read.side == change_price_level_message_written.side);
  assert(change_price_level_message_read.price_level_position == change_price_level_message_written.price_level_position);
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> assert(change_price_level_message_read.price[change_price_level_message_at] == change_price_level_message_written.price[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> assert(change_price_level_message_read.quantity[change_price_level_message_at] == change_price_level_message_written.quantity[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> assert(change_price_level_message_read.order_count[change_price_level_message_at] == change_price_level_message_written.order_count[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 4 -> assert(change_price_level_message_read.implied_quantity[change_price_level_message_at] == change_price_level_message_written.implied_quantity[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 2 -> assert(change_price_level_message_read.implied_order_count[change_price_level_message_at] == change_price_level_message_written.implied_order_count[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  change_price_level_message_at = 0;
  do
  :: change_price_level_message_at < 8 -> assert(change_price_level_message_read.timestamp[change_price_level_message_at] == change_price_level_message_written.timestamp[change_price_level_message_at]); change_price_level_message_at = change_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Delete Price Level Message: 14 bytes ------------------------------------ */

/* Upon receipt of this message, client should remove the price level at the specified position in its book for the given market. */
typedef DeletePriceLevelMessage {
  byte market_id[4];
  byte side;
  byte price_level_position;
  byte timestamp[8]
};

int delete_price_level_message_at;

/* every byte of Delete Price Level Message set to one value */
inline fill_delete_price_level_message(delete_price_level_message_record, delete_price_level_message_value) {
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 4 -> delete_price_level_message_record.market_id[delete_price_level_message_at] = delete_price_level_message_value; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  delete_price_level_message_record.side = delete_price_level_message_value;
  delete_price_level_message_record.price_level_position = delete_price_level_message_value;
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 8 -> delete_price_level_message_record.timestamp[delete_price_level_message_at] = delete_price_level_message_value; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Delete Price Level Message set to where it lies, so a field read out of place says so */
inline ramp_delete_price_level_message(delete_price_level_message_record, delete_price_level_message_base) {
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 4 -> delete_price_level_message_record.market_id[delete_price_level_message_at] = (delete_price_level_message_base + 0 + delete_price_level_message_at + 1) % 256; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  delete_price_level_message_record.side = (delete_price_level_message_base + 4 + 1) % 256;
  delete_price_level_message_record.price_level_position = (delete_price_level_message_base + 5 + 1) % 256;
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 8 -> delete_price_level_message_record.timestamp[delete_price_level_message_at] = (delete_price_level_message_base + 6 + delete_price_level_message_at + 1) % 256; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Price Level Message to the wire, 14 bytes from where the cursor stands */
inline encode_delete_price_level_message(delete_price_level_message_record) {
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 4 -> wire[at] = delete_price_level_message_record.market_id[delete_price_level_message_at]; at = at + 1; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  wire[at] = delete_price_level_message_record.side; at = at + 1;
  wire[at] = delete_price_level_message_record.price_level_position; at = at + 1;
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 8 -> wire[at] = delete_price_level_message_record.timestamp[delete_price_level_message_at]; at = at + 1; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Delete Price Level Message off the wire, 14 bytes from where the cursor stands */
inline decode_delete_price_level_message(delete_price_level_message_record) {
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 4 -> delete_price_level_message_record.market_id[delete_price_level_message_at] = wire[at]; at = at + 1; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  delete_price_level_message_record.side = wire[at]; at = at + 1;
  delete_price_level_message_record.price_level_position = wire[at]; at = at + 1;
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 8 -> delete_price_level_message_record.timestamp[delete_price_level_message_at] = wire[at]; at = at + 1; delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Delete Price Level Message is what was written, byte for byte */
inline equal_delete_price_level_message(delete_price_level_message_read, delete_price_level_message_written) {
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 4 -> assert(delete_price_level_message_read.market_id[delete_price_level_message_at] == delete_price_level_message_written.market_id[delete_price_level_message_at]); delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  assert(delete_price_level_message_read.side == delete_price_level_message_written.side);
  assert(delete_price_level_message_read.price_level_position == delete_price_level_message_written.price_level_position);
  delete_price_level_message_at = 0;
  do
  :: delete_price_level_message_at < 8 -> assert(delete_price_level_message_read.timestamp[delete_price_level_message_at] == delete_price_level_message_written.timestamp[delete_price_level_message_at]); delete_price_level_message_at = delete_price_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Rfq Message: 31 bytes --------------------------------------------------- */

/* Request for Quote Message. */
typedef RfqMessage {
  byte market_id[4];
  byte message_timestamp[8];
  byte rfq_system_id[8];
  byte market_type_id[2];
  byte underlying_market_id[4];
  byte quantity[4];
  byte side
};

int rfq_message_at;

/* every byte of Rfq Message set to one value */
inline fill_rfq_message(rfq_message_record, rfq_message_value) {
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.market_id[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.message_timestamp[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.rfq_system_id[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 2 -> rfq_message_record.market_type_id[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.underlying_market_id[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.quantity[rfq_message_at] = rfq_message_value; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_record.side = rfq_message_value;
  skip
}

/* each byte of Rfq Message set to where it lies, so a field read out of place says so */
inline ramp_rfq_message(rfq_message_record, rfq_message_base) {
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.market_id[rfq_message_at] = (rfq_message_base + 0 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.message_timestamp[rfq_message_at] = (rfq_message_base + 4 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.rfq_system_id[rfq_message_at] = (rfq_message_base + 12 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 2 -> rfq_message_record.market_type_id[rfq_message_at] = (rfq_message_base + 20 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.underlying_market_id[rfq_message_at] = (rfq_message_base + 22 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.quantity[rfq_message_at] = (rfq_message_base + 26 + rfq_message_at + 1) % 256; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_record.side = (rfq_message_base + 30 + 1) % 256;
  skip
}

/* Rfq Message to the wire, 31 bytes from where the cursor stands */
inline encode_rfq_message(rfq_message_record) {
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> wire[at] = rfq_message_record.market_id[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> wire[at] = rfq_message_record.message_timestamp[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> wire[at] = rfq_message_record.rfq_system_id[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 2 -> wire[at] = rfq_message_record.market_type_id[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> wire[at] = rfq_message_record.underlying_market_id[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> wire[at] = rfq_message_record.quantity[rfq_message_at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  wire[at] = rfq_message_record.side; at = at + 1;
  skip
}

/* Rfq Message off the wire, 31 bytes from where the cursor stands */
inline decode_rfq_message(rfq_message_record) {
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.market_id[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.message_timestamp[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> rfq_message_record.rfq_system_id[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 2 -> rfq_message_record.market_type_id[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.underlying_market_id[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> rfq_message_record.quantity[rfq_message_at] = wire[at]; at = at + 1; rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Rfq Message is what was written, byte for byte */
inline equal_rfq_message(rfq_message_read, rfq_message_written) {
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> assert(rfq_message_read.market_id[rfq_message_at] == rfq_message_written.market_id[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> assert(rfq_message_read.message_timestamp[rfq_message_at] == rfq_message_written.message_timestamp[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 8 -> assert(rfq_message_read.rfq_system_id[rfq_message_at] == rfq_message_written.rfq_system_id[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 2 -> assert(rfq_message_read.market_type_id[rfq_message_at] == rfq_message_written.market_type_id[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> assert(rfq_message_read.underlying_market_id[rfq_message_at] == rfq_message_written.underlying_market_id[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  rfq_message_at = 0;
  do
  :: rfq_message_at < 4 -> assert(rfq_message_read.quantity[rfq_message_at] == rfq_message_written.quantity[rfq_message_at]); rfq_message_at = rfq_message_at + 1
  :: else -> break
  od;
  assert(rfq_message_read.side == rfq_message_written.side);
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
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
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

/* Market Snapshot Message: encoded, read back, and compared */
proctype check_market_snapshot_message() {
  MarketSnapshotMessage market_snapshot_message_sent;
  MarketSnapshotMessage market_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_snapshot_message(market_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_market_snapshot_message(market_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_market_snapshot_message(market_snapshot_message_sent, 255)
  :: else -> ramp_market_snapshot_message(market_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_snapshot_message(market_snapshot_message_sent);
    assert(at == 133);
    at = 0;
    decode_market_snapshot_message(market_snapshot_message_got);
    assert(at == 133);
    equal_market_snapshot_message(market_snapshot_message_got, market_snapshot_message_sent)
  }
}

/* Spot Market Trade Message: encoded, read back, and compared */
proctype check_spot_market_trade_message() {
  SpotMarketTradeMessage spot_market_trade_message_sent;
  SpotMarketTradeMessage spot_market_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spot_market_trade_message(spot_market_trade_message_sent, 0)
  :: pattern == 1 -> fill_spot_market_trade_message(spot_market_trade_message_sent, 32)
  :: pattern == 2 -> fill_spot_market_trade_message(spot_market_trade_message_sent, 255)
  :: else -> ramp_spot_market_trade_message(spot_market_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spot_market_trade_message(spot_market_trade_message_sent);
    assert(at == 50);
    at = 0;
    decode_spot_market_trade_message(spot_market_trade_message_got);
    assert(at == 50);
    equal_spot_market_trade_message(spot_market_trade_message_got, spot_market_trade_message_sent)
  }
}

/* Investigated Trade Message: encoded, read back, and compared */
proctype check_investigated_trade_message() {
  InvestigatedTradeMessage investigated_trade_message_sent;
  InvestigatedTradeMessage investigated_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_investigated_trade_message(investigated_trade_message_sent, 0)
  :: pattern == 1 -> fill_investigated_trade_message(investigated_trade_message_sent, 32)
  :: pattern == 2 -> fill_investigated_trade_message(investigated_trade_message_sent, 255)
  :: else -> ramp_investigated_trade_message(investigated_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_investigated_trade_message(investigated_trade_message_sent);
    assert(at == 37);
    at = 0;
    decode_investigated_trade_message(investigated_trade_message_got);
    assert(at == 37);
    equal_investigated_trade_message(investigated_trade_message_got, investigated_trade_message_sent)
  }
}

/* Cancelled Trade Message: encoded, read back, and compared */
proctype check_cancelled_trade_message() {
  CancelledTradeMessage cancelled_trade_message_sent;
  CancelledTradeMessage cancelled_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 0)
  :: pattern == 1 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 32)
  :: pattern == 2 -> fill_cancelled_trade_message(cancelled_trade_message_sent, 255)
  :: else -> ramp_cancelled_trade_message(cancelled_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancelled_trade_message(cancelled_trade_message_sent);
    assert(at == 36);
    at = 0;
    decode_cancelled_trade_message(cancelled_trade_message_got);
    assert(at == 36);
    equal_cancelled_trade_message(cancelled_trade_message_got, cancelled_trade_message_sent)
  }
}

/* Market Statistics Message: encoded, read back, and compared */
proctype check_market_statistics_message() {
  MarketStatisticsMessage market_statistics_message_sent;
  MarketStatisticsMessage market_statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_statistics_message(market_statistics_message_sent, 0)
  :: pattern == 1 -> fill_market_statistics_message(market_statistics_message_sent, 32)
  :: pattern == 2 -> fill_market_statistics_message(market_statistics_message_sent, 255)
  :: else -> ramp_market_statistics_message(market_statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_statistics_message(market_statistics_message_sent);
    assert(at == 52);
    at = 0;
    decode_market_statistics_message(market_statistics_message_got);
    assert(at == 52);
    equal_market_statistics_message(market_statistics_message_got, market_statistics_message_sent)
  }
}

/* Market State Change Message: encoded, read back, and compared */
proctype check_market_state_change_message() {
  MarketStateChangeMessage market_state_change_message_sent;
  MarketStateChangeMessage market_state_change_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_state_change_message(market_state_change_message_sent, 0)
  :: pattern == 1 -> fill_market_state_change_message(market_state_change_message_sent, 32)
  :: pattern == 2 -> fill_market_state_change_message(market_state_change_message_sent, 255)
  :: else -> ramp_market_state_change_message(market_state_change_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_state_change_message(market_state_change_message_sent);
    assert(at == 13);
    at = 0;
    decode_market_state_change_message(market_state_change_message_got);
    assert(at == 13);
    equal_market_state_change_message(market_state_change_message_got, market_state_change_message_sent)
  }
}

/* System Text Message: encoded, read back, and compared */
proctype check_system_text_message() {
  SystemTextMessage system_text_message_sent;
  SystemTextMessage system_text_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_text_message(system_text_message_sent, 0)
  :: pattern == 1 -> fill_system_text_message(system_text_message_sent, 32)
  :: pattern == 2 -> fill_system_text_message(system_text_message_sent, 255)
  :: else -> ramp_system_text_message(system_text_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_text_message(system_text_message_sent);
    assert(at == 1008);
    at = 0;
    decode_system_text_message(system_text_message_got);
    assert(at == 1008);
    equal_system_text_message(system_text_message_got, system_text_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 30);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
  }
}

/* Open Price Message: encoded, read back, and compared */
proctype check_open_price_message() {
  OpenPriceMessage open_price_message_sent;
  OpenPriceMessage open_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_price_message(open_price_message_sent, 0)
  :: pattern == 1 -> fill_open_price_message(open_price_message_sent, 32)
  :: pattern == 2 -> fill_open_price_message(open_price_message_sent, 255)
  :: else -> ramp_open_price_message(open_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_price_message(open_price_message_sent);
    assert(at == 20);
    at = 0;
    decode_open_price_message(open_price_message_got);
    assert(at == 20);
    equal_open_price_message(open_price_message_got, open_price_message_sent)
  }
}

/* Close Price Message: encoded, read back, and compared */
proctype check_close_price_message() {
  ClosePriceMessage close_price_message_sent;
  ClosePriceMessage close_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_close_price_message(close_price_message_sent, 0)
  :: pattern == 1 -> fill_close_price_message(close_price_message_sent, 32)
  :: pattern == 2 -> fill_close_price_message(close_price_message_sent, 255)
  :: else -> ramp_close_price_message(close_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_close_price_message(close_price_message_sent);
    assert(at == 20);
    at = 0;
    decode_close_price_message(close_price_message_got);
    assert(at == 20);
    equal_close_price_message(close_price_message_got, close_price_message_sent)
  }
}

/* Settlement Price Message: encoded, read back, and compared */
proctype check_settlement_price_message() {
  SettlementPriceMessage settlement_price_message_sent;
  SettlementPriceMessage settlement_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_price_message(settlement_price_message_sent, 0)
  :: pattern == 1 -> fill_settlement_price_message(settlement_price_message_sent, 32)
  :: pattern == 2 -> fill_settlement_price_message(settlement_price_message_sent, 255)
  :: else -> ramp_settlement_price_message(settlement_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_price_message(settlement_price_message_sent);
    assert(at == 37);
    at = 0;
    decode_settlement_price_message(settlement_price_message_got);
    assert(at == 37);
    equal_settlement_price_message(settlement_price_message_got, settlement_price_message_sent)
  }
}

/* Index Prices Message: encoded, read back, and compared */
proctype check_index_prices_message() {
  IndexPricesMessage index_prices_message_sent;
  IndexPricesMessage index_prices_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_prices_message(index_prices_message_sent, 0)
  :: pattern == 1 -> fill_index_prices_message(index_prices_message_sent, 32)
  :: pattern == 2 -> fill_index_prices_message(index_prices_message_sent, 255)
  :: else -> ramp_index_prices_message(index_prices_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_prices_message(index_prices_message_sent);
    assert(at == 66);
    at = 0;
    decode_index_prices_message(index_prices_message_got);
    assert(at == 66);
    equal_index_prices_message(index_prices_message_got, index_prices_message_sent)
  }
}

/* End Of Day Market Summary Message: encoded, read back, and compared */
proctype check_end_of_day_market_summary_message() {
  EndOfDayMarketSummaryMessage end_of_day_market_summary_message_sent;
  EndOfDayMarketSummaryMessage end_of_day_market_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_market_summary_message(end_of_day_market_summary_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_market_summary_message(end_of_day_market_summary_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_market_summary_message(end_of_day_market_summary_message_sent, 255)
  :: else -> ramp_end_of_day_market_summary_message(end_of_day_market_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_market_summary_message(end_of_day_market_summary_message_sent);
    assert(at == 80);
    at = 0;
    decode_end_of_day_market_summary_message(end_of_day_market_summary_message_got);
    assert(at == 80);
    equal_end_of_day_market_summary_message(end_of_day_market_summary_message_got, end_of_day_market_summary_message_sent)
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
    assert(at == 13);
    at = 0;
    decode_market_event_message(market_event_message_got);
    assert(at == 13);
    equal_market_event_message(market_event_message_got, market_event_message_sent)
  }
}

/* Pre Open Price Indicator Message: encoded, read back, and compared */
proctype check_pre_open_price_indicator_message() {
  PreOpenPriceIndicatorMessage pre_open_price_indicator_message_sent;
  PreOpenPriceIndicatorMessage pre_open_price_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_pre_open_price_indicator_message(pre_open_price_indicator_message_sent, 0)
  :: pattern == 1 -> fill_pre_open_price_indicator_message(pre_open_price_indicator_message_sent, 32)
  :: pattern == 2 -> fill_pre_open_price_indicator_message(pre_open_price_indicator_message_sent, 255)
  :: else -> ramp_pre_open_price_indicator_message(pre_open_price_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_pre_open_price_indicator_message(pre_open_price_indicator_message_sent);
    assert(at == 25);
    at = 0;
    decode_pre_open_price_indicator_message(pre_open_price_indicator_message_got);
    assert(at == 25);
    equal_pre_open_price_indicator_message(pre_open_price_indicator_message_got, pre_open_price_indicator_message_sent)
  }
}

/* Strip Info Message: encoded, read back, and compared */
proctype check_strip_info_message() {
  StripInfoMessage strip_info_message_sent;
  StripInfoMessage strip_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strip_info_message(strip_info_message_sent, 0)
  :: pattern == 1 -> fill_strip_info_message(strip_info_message_sent, 32)
  :: pattern == 2 -> fill_strip_info_message(strip_info_message_sent, 255)
  :: else -> ramp_strip_info_message(strip_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strip_info_message(strip_info_message_sent);
    assert(at == 88);
    at = 0;
    decode_strip_info_message(strip_info_message_got);
    assert(at == 88);
    equal_strip_info_message(strip_info_message_got, strip_info_message_sent)
  }
}

/* Interval Price Limit Notification Message: encoded, read back, and compared */
proctype check_interval_price_limit_notification_message() {
  IntervalPriceLimitNotificationMessage interval_price_limit_notification_message_sent;
  IntervalPriceLimitNotificationMessage interval_price_limit_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_interval_price_limit_notification_message(interval_price_limit_notification_message_sent, 0)
  :: pattern == 1 -> fill_interval_price_limit_notification_message(interval_price_limit_notification_message_sent, 32)
  :: pattern == 2 -> fill_interval_price_limit_notification_message(interval_price_limit_notification_message_sent, 255)
  :: else -> ramp_interval_price_limit_notification_message(interval_price_limit_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_interval_price_limit_notification_message(interval_price_limit_notification_message_sent);
    assert(at == 35);
    at = 0;
    decode_interval_price_limit_notification_message(interval_price_limit_notification_message_got);
    assert(at == 35);
    equal_interval_price_limit_notification_message(interval_price_limit_notification_message_got, interval_price_limit_notification_message_sent)
  }
}

/* New Expiry Message: encoded, read back, and compared */
proctype check_new_expiry_message() {
  NewExpiryMessage new_expiry_message_sent;
  NewExpiryMessage new_expiry_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_expiry_message(new_expiry_message_sent, 0)
  :: pattern == 1 -> fill_new_expiry_message(new_expiry_message_sent, 32)
  :: pattern == 2 -> fill_new_expiry_message(new_expiry_message_sent, 255)
  :: else -> ramp_new_expiry_message(new_expiry_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_expiry_message(new_expiry_message_sent);
    assert(at == 515);
    at = 0;
    decode_new_expiry_message(new_expiry_message_got);
    assert(at == 515);
    equal_new_expiry_message(new_expiry_message_got, new_expiry_message_sent)
  }
}

/* New Options Market Definition Message: encoded, read back, and compared */
proctype check_new_options_market_definition_message() {
  NewOptionsMarketDefinitionMessage new_options_market_definition_message_sent;
  NewOptionsMarketDefinitionMessage new_options_market_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_new_options_market_definition_message(new_options_market_definition_message_sent, 0)
  :: pattern == 1 -> fill_new_options_market_definition_message(new_options_market_definition_message_sent, 32)
  :: pattern == 2 -> fill_new_options_market_definition_message(new_options_market_definition_message_sent, 255)
  :: else -> ramp_new_options_market_definition_message(new_options_market_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_new_options_market_definition_message(new_options_market_definition_message_sent);
    assert(at == 337);
    at = 0;
    decode_new_options_market_definition_message(new_options_market_definition_message_got);
    assert(at == 337);
    equal_new_options_market_definition_message(new_options_market_definition_message_got, new_options_market_definition_message_sent)
  }
}

/* Option Open Interest Message: encoded, read back, and compared */
proctype check_option_open_interest_message() {
  OptionOpenInterestMessage option_open_interest_message_sent;
  OptionOpenInterestMessage option_open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_open_interest_message(option_open_interest_message_sent, 0)
  :: pattern == 1 -> fill_option_open_interest_message(option_open_interest_message_sent, 32)
  :: pattern == 2 -> fill_option_open_interest_message(option_open_interest_message_sent, 255)
  :: else -> ramp_option_open_interest_message(option_open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_open_interest_message(option_open_interest_message_sent);
    assert(at == 26);
    at = 0;
    decode_option_open_interest_message(option_open_interest_message_got);
    assert(at == 26);
    equal_option_open_interest_message(option_open_interest_message_got, option_open_interest_message_sent)
  }
}

/* Option Settlement Price Message: encoded, read back, and compared */
proctype check_option_settlement_price_message() {
  OptionSettlementPriceMessage option_settlement_price_message_sent;
  OptionSettlementPriceMessage option_settlement_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_settlement_price_message(option_settlement_price_message_sent, 0)
  :: pattern == 1 -> fill_option_settlement_price_message(option_settlement_price_message_sent, 32)
  :: pattern == 2 -> fill_option_settlement_price_message(option_settlement_price_message_sent, 255)
  :: else -> ramp_option_settlement_price_message(option_settlement_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_settlement_price_message(option_settlement_price_message_sent);
    assert(at == 53);
    at = 0;
    decode_option_settlement_price_message(option_settlement_price_message_got);
    assert(at == 53);
    equal_option_settlement_price_message(option_settlement_price_message_got, option_settlement_price_message_sent)
  }
}

/* Market Snapshot Order Message: encoded, read back, and compared */
proctype check_market_snapshot_order_message() {
  MarketSnapshotOrderMessage market_snapshot_order_message_sent;
  MarketSnapshotOrderMessage market_snapshot_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_snapshot_order_message(market_snapshot_order_message_sent, 0)
  :: pattern == 1 -> fill_market_snapshot_order_message(market_snapshot_order_message_sent, 32)
  :: pattern == 2 -> fill_market_snapshot_order_message(market_snapshot_order_message_sent, 255)
  :: else -> ramp_market_snapshot_order_message(market_snapshot_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_snapshot_order_message(market_snapshot_order_message_sent);
    assert(at == 41);
    at = 0;
    decode_market_snapshot_order_message(market_snapshot_order_message_got);
    assert(at == 41);
    equal_market_snapshot_order_message(market_snapshot_order_message_got, market_snapshot_order_message_sent)
  }
}

/* Delete Order Message: encoded, read back, and compared */
proctype check_delete_order_message() {
  DeleteOrderMessage delete_order_message_sent;
  DeleteOrderMessage delete_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_order_message(delete_order_message_sent, 0)
  :: pattern == 1 -> fill_delete_order_message(delete_order_message_sent, 32)
  :: pattern == 2 -> fill_delete_order_message(delete_order_message_sent, 255)
  :: else -> ramp_delete_order_message(delete_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_order_message(delete_order_message_sent);
    assert(at == 32);
    at = 0;
    decode_delete_order_message(delete_order_message_got);
    assert(at == 32);
    equal_delete_order_message(delete_order_message_got, delete_order_message_sent)
  }
}

/* Message Bundle Marker: encoded, read back, and compared */
proctype check_message_bundle_marker() {
  MessageBundleMarker message_bundle_marker_sent;
  MessageBundleMarker message_bundle_marker_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_bundle_marker(message_bundle_marker_sent, 0)
  :: pattern == 1 -> fill_message_bundle_marker(message_bundle_marker_sent, 32)
  :: pattern == 2 -> fill_message_bundle_marker(message_bundle_marker_sent, 255)
  :: else -> ramp_message_bundle_marker(message_bundle_marker_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_bundle_marker(message_bundle_marker_sent);
    assert(at == 10);
    at = 0;
    decode_message_bundle_marker(message_bundle_marker_got);
    assert(at == 10);
    equal_message_bundle_marker(message_bundle_marker_got, message_bundle_marker_sent)
  }
}

/* Fixing Transition Message: encoded, read back, and compared */
proctype check_fixing_transition_message() {
  FixingTransitionMessage fixing_transition_message_sent;
  FixingTransitionMessage fixing_transition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixing_transition_message(fixing_transition_message_sent, 0)
  :: pattern == 1 -> fill_fixing_transition_message(fixing_transition_message_sent, 32)
  :: pattern == 2 -> fill_fixing_transition_message(fixing_transition_message_sent, 255)
  :: else -> ramp_fixing_transition_message(fixing_transition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixing_transition_message(fixing_transition_message_sent);
    assert(at == 26);
    at = 0;
    decode_fixing_transition_message(fixing_transition_message_got);
    assert(at == 26);
    equal_fixing_transition_message(fixing_transition_message_got, fixing_transition_message_sent)
  }
}

/* Fixing Lockdown Message: encoded, read back, and compared */
proctype check_fixing_lockdown_message() {
  FixingLockdownMessage fixing_lockdown_message_sent;
  FixingLockdownMessage fixing_lockdown_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixing_lockdown_message(fixing_lockdown_message_sent, 0)
  :: pattern == 1 -> fill_fixing_lockdown_message(fixing_lockdown_message_sent, 32)
  :: pattern == 2 -> fill_fixing_lockdown_message(fixing_lockdown_message_sent, 255)
  :: else -> ramp_fixing_lockdown_message(fixing_lockdown_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixing_lockdown_message(fixing_lockdown_message_sent);
    assert(at == 79);
    at = 0;
    decode_fixing_lockdown_message(fixing_lockdown_message_got);
    assert(at == 79);
    equal_fixing_lockdown_message(fixing_lockdown_message_got, fixing_lockdown_message_sent)
  }
}

/* Fixing Indicative Price Message: encoded, read back, and compared */
proctype check_fixing_indicative_price_message() {
  FixingIndicativePriceMessage fixing_indicative_price_message_sent;
  FixingIndicativePriceMessage fixing_indicative_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fixing_indicative_price_message(fixing_indicative_price_message_sent, 0)
  :: pattern == 1 -> fill_fixing_indicative_price_message(fixing_indicative_price_message_sent, 32)
  :: pattern == 2 -> fill_fixing_indicative_price_message(fixing_indicative_price_message_sent, 255)
  :: else -> ramp_fixing_indicative_price_message(fixing_indicative_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fixing_indicative_price_message(fixing_indicative_price_message_sent);
    assert(at == 25);
    at = 0;
    decode_fixing_indicative_price_message(fixing_indicative_price_message_got);
    assert(at == 25);
    equal_fixing_indicative_price_message(fixing_indicative_price_message_got, fixing_indicative_price_message_sent)
  }
}

/* Market Snapshot Price Level Message: encoded, read back, and compared */
proctype check_market_snapshot_price_level_message() {
  MarketSnapshotPriceLevelMessage market_snapshot_price_level_message_sent;
  MarketSnapshotPriceLevelMessage market_snapshot_price_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_snapshot_price_level_message(market_snapshot_price_level_message_sent, 0)
  :: pattern == 1 -> fill_market_snapshot_price_level_message(market_snapshot_price_level_message_sent, 32)
  :: pattern == 2 -> fill_market_snapshot_price_level_message(market_snapshot_price_level_message_sent, 255)
  :: else -> ramp_market_snapshot_price_level_message(market_snapshot_price_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_snapshot_price_level_message(market_snapshot_price_level_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_snapshot_price_level_message(market_snapshot_price_level_message_got);
    assert(at == 26);
    equal_market_snapshot_price_level_message(market_snapshot_price_level_message_got, market_snapshot_price_level_message_sent)
  }
}

/* Add Price Level Message: encoded, read back, and compared */
proctype check_add_price_level_message() {
  AddPriceLevelMessage add_price_level_message_sent;
  AddPriceLevelMessage add_price_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_price_level_message(add_price_level_message_sent, 0)
  :: pattern == 1 -> fill_add_price_level_message(add_price_level_message_sent, 32)
  :: pattern == 2 -> fill_add_price_level_message(add_price_level_message_sent, 255)
  :: else -> ramp_add_price_level_message(add_price_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_price_level_message(add_price_level_message_sent);
    assert(at == 34);
    at = 0;
    decode_add_price_level_message(add_price_level_message_got);
    assert(at == 34);
    equal_add_price_level_message(add_price_level_message_got, add_price_level_message_sent)
  }
}

/* Change Price Level Message: encoded, read back, and compared */
proctype check_change_price_level_message() {
  ChangePriceLevelMessage change_price_level_message_sent;
  ChangePriceLevelMessage change_price_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_change_price_level_message(change_price_level_message_sent, 0)
  :: pattern == 1 -> fill_change_price_level_message(change_price_level_message_sent, 32)
  :: pattern == 2 -> fill_change_price_level_message(change_price_level_message_sent, 255)
  :: else -> ramp_change_price_level_message(change_price_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_change_price_level_message(change_price_level_message_sent);
    assert(at == 34);
    at = 0;
    decode_change_price_level_message(change_price_level_message_got);
    assert(at == 34);
    equal_change_price_level_message(change_price_level_message_got, change_price_level_message_sent)
  }
}

/* Delete Price Level Message: encoded, read back, and compared */
proctype check_delete_price_level_message() {
  DeletePriceLevelMessage delete_price_level_message_sent;
  DeletePriceLevelMessage delete_price_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_delete_price_level_message(delete_price_level_message_sent, 0)
  :: pattern == 1 -> fill_delete_price_level_message(delete_price_level_message_sent, 32)
  :: pattern == 2 -> fill_delete_price_level_message(delete_price_level_message_sent, 255)
  :: else -> ramp_delete_price_level_message(delete_price_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_delete_price_level_message(delete_price_level_message_sent);
    assert(at == 14);
    at = 0;
    decode_delete_price_level_message(delete_price_level_message_got);
    assert(at == 14);
    equal_delete_price_level_message(delete_price_level_message_got, delete_price_level_message_sent)
  }
}

/* Rfq Message: encoded, read back, and compared */
proctype check_rfq_message() {
  RfqMessage rfq_message_sent;
  RfqMessage rfq_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rfq_message(rfq_message_sent, 0)
  :: pattern == 1 -> fill_rfq_message(rfq_message_sent, 32)
  :: pattern == 2 -> fill_rfq_message(rfq_message_sent, 255)
  :: else -> ramp_rfq_message(rfq_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rfq_message(rfq_message_sent);
    assert(at == 31);
    at = 0;
    decode_rfq_message(rfq_message_got);
    assert(at == 31);
    equal_rfq_message(rfq_message_got, rfq_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_market_snapshot_message()
  :: run check_spot_market_trade_message()
  :: run check_investigated_trade_message()
  :: run check_cancelled_trade_message()
  :: run check_market_statistics_message()
  :: run check_market_state_change_message()
  :: run check_system_text_message()
  :: run check_open_interest_message()
  :: run check_open_price_message()
  :: run check_close_price_message()
  :: run check_settlement_price_message()
  :: run check_index_prices_message()
  :: run check_end_of_day_market_summary_message()
  :: run check_market_event_message()
  :: run check_pre_open_price_indicator_message()
  :: run check_strip_info_message()
  :: run check_interval_price_limit_notification_message()
  :: run check_new_expiry_message()
  :: run check_new_options_market_definition_message()
  :: run check_option_open_interest_message()
  :: run check_option_settlement_price_message()
  :: run check_market_snapshot_order_message()
  :: run check_delete_order_message()
  :: run check_message_bundle_marker()
  :: run check_fixing_transition_message()
  :: run check_fixing_lockdown_message()
  :: run check_fixing_indicative_price_message()
  :: run check_market_snapshot_price_level_message()
  :: run check_add_price_level_message()
  :: run check_change_price_level_message()
  :: run check_delete_price_level_message()
  :: run check_rfq_message()
  fi
}
