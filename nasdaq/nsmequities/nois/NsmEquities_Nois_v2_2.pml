/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Net Order Imbalance Snapshot
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
#define WIRE 39

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

/* Itch Mold Udp Packet Header */
typedef PacketHeader {
  byte session[10];
  byte sequence_number[4];
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
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 14 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
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
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 9 bytes ------------------------------------------------- */

/* Mold Udp Message Header */
typedef MessageHeader {
  byte timestamp[8];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 8 + 1) % 256;
  skip
}

/* Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 1 bytes ------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte event_code
};

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.event_code = (system_event_message_base + 0 + 1) % 256;
  skip
}

/* System Event Message to the wire, 1 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 1 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Stock Directory: 20 bytes ----------------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates stock directory messages for all active symbols in the Nasdaq execution system. */
typedef StockDirectory {
  byte symbol[8];
  byte market_category;
  byte rfu;
  byte round_lot_size[6];
  byte round_lots_only;
  byte issue_classification;
  byte issue_sub_type[2]
};

int stock_directory_at;

/* every byte of Stock Directory set to one value */
inline fill_stock_directory(stock_directory_record, stock_directory_value) {
  stock_directory_at = 0;
  do
  :: stock_directory_at < 8 -> stock_directory_record.symbol[stock_directory_at] = stock_directory_value; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.market_category = stock_directory_value;
  stock_directory_record.rfu = stock_directory_value;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 6 -> stock_directory_record.round_lot_size[stock_directory_at] = stock_directory_value; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.round_lots_only = stock_directory_value;
  stock_directory_record.issue_classification = stock_directory_value;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 2 -> stock_directory_record.issue_sub_type[stock_directory_at] = stock_directory_value; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Directory set to where it lies, so a field read out of place says so */
inline ramp_stock_directory(stock_directory_record, stock_directory_base) {
  stock_directory_at = 0;
  do
  :: stock_directory_at < 8 -> stock_directory_record.symbol[stock_directory_at] = (stock_directory_base + 0 + stock_directory_at + 1) % 256; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.market_category = (stock_directory_base + 8 + 1) % 256;
  stock_directory_record.rfu = (stock_directory_base + 9 + 1) % 256;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 6 -> stock_directory_record.round_lot_size[stock_directory_at] = (stock_directory_base + 10 + stock_directory_at + 1) % 256; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.round_lots_only = (stock_directory_base + 16 + 1) % 256;
  stock_directory_record.issue_classification = (stock_directory_base + 17 + 1) % 256;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 2 -> stock_directory_record.issue_sub_type[stock_directory_at] = (stock_directory_base + 18 + stock_directory_at + 1) % 256; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory to the wire, 20 bytes from where the cursor stands */
inline encode_stock_directory(stock_directory_record) {
  stock_directory_at = 0;
  do
  :: stock_directory_at < 8 -> wire[at] = stock_directory_record.symbol[stock_directory_at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_record.market_category; at = at + 1;
  wire[at] = stock_directory_record.rfu; at = at + 1;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 6 -> wire[at] = stock_directory_record.round_lot_size[stock_directory_at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  wire[at] = stock_directory_record.round_lots_only; at = at + 1;
  wire[at] = stock_directory_record.issue_classification; at = at + 1;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 2 -> wire[at] = stock_directory_record.issue_sub_type[stock_directory_at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory off the wire, 20 bytes from where the cursor stands */
inline decode_stock_directory(stock_directory_record) {
  stock_directory_at = 0;
  do
  :: stock_directory_at < 8 -> stock_directory_record.symbol[stock_directory_at] = wire[at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.market_category = wire[at]; at = at + 1;
  stock_directory_record.rfu = wire[at]; at = at + 1;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 6 -> stock_directory_record.round_lot_size[stock_directory_at] = wire[at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  stock_directory_record.round_lots_only = wire[at]; at = at + 1;
  stock_directory_record.issue_classification = wire[at]; at = at + 1;
  stock_directory_at = 0;
  do
  :: stock_directory_at < 2 -> stock_directory_record.issue_sub_type[stock_directory_at] = wire[at]; at = at + 1; stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Directory is what was written, byte for byte */
inline equal_stock_directory(stock_directory_read, stock_directory_written) {
  stock_directory_at = 0;
  do
  :: stock_directory_at < 8 -> assert(stock_directory_read.symbol[stock_directory_at] == stock_directory_written.symbol[stock_directory_at]); stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  assert(stock_directory_read.market_category == stock_directory_written.market_category);
  assert(stock_directory_read.rfu == stock_directory_written.rfu);
  stock_directory_at = 0;
  do
  :: stock_directory_at < 6 -> assert(stock_directory_read.round_lot_size[stock_directory_at] == stock_directory_written.round_lot_size[stock_directory_at]); stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  assert(stock_directory_read.round_lots_only == stock_directory_written.round_lots_only);
  assert(stock_directory_read.issue_classification == stock_directory_written.issue_classification);
  stock_directory_at = 0;
  do
  :: stock_directory_at < 2 -> assert(stock_directory_read.issue_sub_type[stock_directory_at] == stock_directory_written.issue_sub_type[stock_directory_at]); stock_directory_at = stock_directory_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Trading Action: 10 bytes ------------------------------------------ */

/* Nasdaq uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef StockTradingAction {
  byte symbol[8];
  byte trading_state;
  byte reason
};

int stock_trading_action_at;

/* every byte of Stock Trading Action set to one value */
inline fill_stock_trading_action(stock_trading_action_record, stock_trading_action_value) {
  stock_trading_action_at = 0;
  do
  :: stock_trading_action_at < 8 -> stock_trading_action_record.symbol[stock_trading_action_at] = stock_trading_action_value; stock_trading_action_at = stock_trading_action_at + 1
  :: else -> break
  od;
  stock_trading_action_record.trading_state = stock_trading_action_value;
  stock_trading_action_record.reason = stock_trading_action_value;
  skip
}

/* each byte of Stock Trading Action set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action(stock_trading_action_record, stock_trading_action_base) {
  stock_trading_action_at = 0;
  do
  :: stock_trading_action_at < 8 -> stock_trading_action_record.symbol[stock_trading_action_at] = (stock_trading_action_base + 0 + stock_trading_action_at + 1) % 256; stock_trading_action_at = stock_trading_action_at + 1
  :: else -> break
  od;
  stock_trading_action_record.trading_state = (stock_trading_action_base + 8 + 1) % 256;
  stock_trading_action_record.reason = (stock_trading_action_base + 9 + 1) % 256;
  skip
}

/* Stock Trading Action to the wire, 10 bytes from where the cursor stands */
inline encode_stock_trading_action(stock_trading_action_record) {
  stock_trading_action_at = 0;
  do
  :: stock_trading_action_at < 8 -> wire[at] = stock_trading_action_record.symbol[stock_trading_action_at]; at = at + 1; stock_trading_action_at = stock_trading_action_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_record.trading_state; at = at + 1;
  wire[at] = stock_trading_action_record.reason; at = at + 1;
  skip
}

/* Stock Trading Action off the wire, 10 bytes from where the cursor stands */
inline decode_stock_trading_action(stock_trading_action_record) {
  stock_trading_action_at = 0;
  do
  :: stock_trading_action_at < 8 -> stock_trading_action_record.symbol[stock_trading_action_at] = wire[at]; at = at + 1; stock_trading_action_at = stock_trading_action_at + 1
  :: else -> break
  od;
  stock_trading_action_record.trading_state = wire[at]; at = at + 1;
  stock_trading_action_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Trading Action is what was written, byte for byte */
inline equal_stock_trading_action(stock_trading_action_read, stock_trading_action_written) {
  stock_trading_action_at = 0;
  do
  :: stock_trading_action_at < 8 -> assert(stock_trading_action_read.symbol[stock_trading_action_at] == stock_trading_action_written.symbol[stock_trading_action_at]); stock_trading_action_at = stock_trading_action_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_read.trading_state == stock_trading_action_written.trading_state);
  assert(stock_trading_action_read.reason == stock_trading_action_written.reason);
  skip
}

/* ---- Nois Message: 39 bytes -------------------------------------------------- */

/* Nasdaq Net Order Imbalance Snapshot (NOIS) provides a snapshot of the Nasdaq net order imbalance data at selected time intervals. */
typedef NoisMessage {
  byte imbalance_shares[9];
  byte imbalance_direction;
  byte symbol[8];
  byte near_price[10];
  byte current_reference_price[10];
  byte cross_type
};

int nois_message_at;

/* every byte of Nois Message set to one value */
inline fill_nois_message(nois_message_record, nois_message_value) {
  nois_message_at = 0;
  do
  :: nois_message_at < 9 -> nois_message_record.imbalance_shares[nois_message_at] = nois_message_value; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.imbalance_direction = nois_message_value;
  nois_message_at = 0;
  do
  :: nois_message_at < 8 -> nois_message_record.symbol[nois_message_at] = nois_message_value; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.near_price[nois_message_at] = nois_message_value; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.current_reference_price[nois_message_at] = nois_message_value; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.cross_type = nois_message_value;
  skip
}

/* each byte of Nois Message set to where it lies, so a field read out of place says so */
inline ramp_nois_message(nois_message_record, nois_message_base) {
  nois_message_at = 0;
  do
  :: nois_message_at < 9 -> nois_message_record.imbalance_shares[nois_message_at] = (nois_message_base + 0 + nois_message_at + 1) % 256; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.imbalance_direction = (nois_message_base + 9 + 1) % 256;
  nois_message_at = 0;
  do
  :: nois_message_at < 8 -> nois_message_record.symbol[nois_message_at] = (nois_message_base + 10 + nois_message_at + 1) % 256; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.near_price[nois_message_at] = (nois_message_base + 18 + nois_message_at + 1) % 256; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.current_reference_price[nois_message_at] = (nois_message_base + 28 + nois_message_at + 1) % 256; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.cross_type = (nois_message_base + 38 + 1) % 256;
  skip
}

/* Nois Message to the wire, 39 bytes from where the cursor stands */
inline encode_nois_message(nois_message_record) {
  nois_message_at = 0;
  do
  :: nois_message_at < 9 -> wire[at] = nois_message_record.imbalance_shares[nois_message_at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  wire[at] = nois_message_record.imbalance_direction; at = at + 1;
  nois_message_at = 0;
  do
  :: nois_message_at < 8 -> wire[at] = nois_message_record.symbol[nois_message_at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> wire[at] = nois_message_record.near_price[nois_message_at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> wire[at] = nois_message_record.current_reference_price[nois_message_at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  wire[at] = nois_message_record.cross_type; at = at + 1;
  skip
}

/* Nois Message off the wire, 39 bytes from where the cursor stands */
inline decode_nois_message(nois_message_record) {
  nois_message_at = 0;
  do
  :: nois_message_at < 9 -> nois_message_record.imbalance_shares[nois_message_at] = wire[at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.imbalance_direction = wire[at]; at = at + 1;
  nois_message_at = 0;
  do
  :: nois_message_at < 8 -> nois_message_record.symbol[nois_message_at] = wire[at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.near_price[nois_message_at] = wire[at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> nois_message_record.current_reference_price[nois_message_at] = wire[at]; at = at + 1; nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Nois Message is what was written, byte for byte */
inline equal_nois_message(nois_message_read, nois_message_written) {
  nois_message_at = 0;
  do
  :: nois_message_at < 9 -> assert(nois_message_read.imbalance_shares[nois_message_at] == nois_message_written.imbalance_shares[nois_message_at]); nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  assert(nois_message_read.imbalance_direction == nois_message_written.imbalance_direction);
  nois_message_at = 0;
  do
  :: nois_message_at < 8 -> assert(nois_message_read.symbol[nois_message_at] == nois_message_written.symbol[nois_message_at]); nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> assert(nois_message_read.near_price[nois_message_at] == nois_message_written.near_price[nois_message_at]); nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  nois_message_at = 0;
  do
  :: nois_message_at < 10 -> assert(nois_message_read.current_reference_price[nois_message_at] == nois_message_written.current_reference_price[nois_message_at]); nois_message_at = nois_message_at + 1
  :: else -> break
  od;
  assert(nois_message_read.cross_type == nois_message_written.cross_type);
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
    assert(at == 9);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 9);
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
    assert(at == 1);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 1);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Stock Directory: encoded, read back, and compared */
proctype check_stock_directory() {
  StockDirectory stock_directory_sent;
  StockDirectory stock_directory_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_directory(stock_directory_sent, 0)
  :: pattern == 1 -> fill_stock_directory(stock_directory_sent, 32)
  :: pattern == 2 -> fill_stock_directory(stock_directory_sent, 255)
  :: else -> ramp_stock_directory(stock_directory_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_directory(stock_directory_sent);
    assert(at == 20);
    at = 0;
    decode_stock_directory(stock_directory_got);
    assert(at == 20);
    equal_stock_directory(stock_directory_got, stock_directory_sent)
  }
}

/* Stock Trading Action: encoded, read back, and compared */
proctype check_stock_trading_action() {
  StockTradingAction stock_trading_action_sent;
  StockTradingAction stock_trading_action_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stock_trading_action(stock_trading_action_sent, 0)
  :: pattern == 1 -> fill_stock_trading_action(stock_trading_action_sent, 32)
  :: pattern == 2 -> fill_stock_trading_action(stock_trading_action_sent, 255)
  :: else -> ramp_stock_trading_action(stock_trading_action_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stock_trading_action(stock_trading_action_sent);
    assert(at == 10);
    at = 0;
    decode_stock_trading_action(stock_trading_action_got);
    assert(at == 10);
    equal_stock_trading_action(stock_trading_action_got, stock_trading_action_sent)
  }
}

/* Nois Message: encoded, read back, and compared */
proctype check_nois_message() {
  NoisMessage nois_message_sent;
  NoisMessage nois_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_nois_message(nois_message_sent, 0)
  :: pattern == 1 -> fill_nois_message(nois_message_sent, 32)
  :: pattern == 2 -> fill_nois_message(nois_message_sent, 255)
  :: else -> ramp_nois_message(nois_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_nois_message(nois_message_sent);
    assert(at == 39);
    at = 0;
    decode_nois_message(nois_message_got);
    assert(at == 39);
    equal_nois_message(nois_message_got, nois_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_stock_directory()
  :: run check_stock_trading_action()
  :: run check_nois_message()
  fi
}
