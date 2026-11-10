/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) TotalView Itch
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
 *   - a run filling what frames it
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 41

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Packet Header: 3 bytes ------------------------------------------- */

/* Packet header of a packet sent by the server */
typedef ServerPacketHeader {
  byte packet_length[2];
  byte server_packet_type
};

int server_packet_header_at;

/* every byte of Server Packet Header set to one value */
inline fill_server_packet_header(server_packet_header_record, server_packet_header_value) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = server_packet_header_value; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = server_packet_header_value;
  skip
}

/* each byte of Server Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_packet_header(server_packet_header_record, server_packet_header_base) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = (server_packet_header_base + 0 + server_packet_header_at + 1) % 256; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = (server_packet_header_base + 2 + 1) % 256;
  skip
}

/* Server Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> wire[at] = server_packet_header_record.packet_length[server_packet_header_at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = server_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_server_packet_header(server_packet_header_record) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> server_packet_header_record.packet_length[server_packet_header_at] = wire[at]; at = at + 1; server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  server_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Packet Header is what was written, byte for byte */
inline equal_server_packet_header(server_packet_header_read, server_packet_header_written) {
  server_packet_header_at = 0;
  do
  :: server_packet_header_at < 2 -> assert(server_packet_header_read.packet_length[server_packet_header_at] == server_packet_header_written.packet_length[server_packet_header_at]); server_packet_header_at = server_packet_header_at + 1
  :: else -> break
  od;
  assert(server_packet_header_read.server_packet_type == server_packet_header_written.server_packet_type);
  skip
}

/* ---- Login Accepted Packet: 30 bytes ----------------------------------------- */

/* The SoupBinTCP server sends a Login Accepted Packet in response to receiving a valid Login Request from the client */
typedef LoginAcceptedPacket {
  byte accepted_session[10];
  byte accepted_sequence_number[20]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 30 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.accepted_session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> wire[at] = login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 30 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.accepted_session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> login_accepted_packet_record.accepted_sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.accepted_session[login_accepted_packet_at] == login_accepted_packet_written.accepted_session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 20 -> assert(login_accepted_packet_read.accepted_sequence_number[login_accepted_packet_at] == login_accepted_packet_written.accepted_sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The SoupBinTCP server sends this packet in response to an invalid Login Request Packet from the client */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
  skip
}

/* ---- Timestamp Message: 4 bytes ---------------------------------------------- */

/* Reflects the number of seconds past midnight that the Timestamp message was generated. */
typedef TimestampMessage {
  byte second[4]
};

int timestamp_message_at;

/* every byte of Timestamp Message set to one value */
inline fill_timestamp_message(timestamp_message_record, timestamp_message_value) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = timestamp_message_value; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp Message set to where it lies, so a field read out of place says so */
inline ramp_timestamp_message(timestamp_message_record, timestamp_message_base) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = (timestamp_message_base + 0 + timestamp_message_at + 1) % 256; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message to the wire, 4 bytes from where the cursor stands */
inline encode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> wire[at] = timestamp_message_record.second[timestamp_message_at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp Message off the wire, 4 bytes from where the cursor stands */
inline decode_timestamp_message(timestamp_message_record) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> timestamp_message_record.second[timestamp_message_at] = wire[at]; at = at + 1; timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp Message is what was written, byte for byte */
inline equal_timestamp_message(timestamp_message_read, timestamp_message_written) {
  timestamp_message_at = 0;
  do
  :: timestamp_message_at < 4 -> assert(timestamp_message_read.second[timestamp_message_at] == timestamp_message_written.second[timestamp_message_at]); timestamp_message_at = timestamp_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 5 bytes ------------------------------------------- */

/* The system event message type is used to signal a market or data feed handler event. */
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

/* ---- Stock Directory Message: 17 bytes --------------------------------------- */

/* Market data redistributors should process this message to populate the Financial Status Indicator (required display field) and the Market Category (recommended display field) for NASDAQ-listed issues. */
typedef StockDirectoryMessage {
  byte nanoseconds[4];
  byte stock[6];
  byte market_category;
  byte financial_status_indicator;
  byte round_lot_size[4];
  byte round_lots_only
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.nanoseconds[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.stock[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
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
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.nanoseconds[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 4 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 10 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 11 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 12 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 16 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 17 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> wire[at] = stock_directory_message_record.nanoseconds[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> wire[at] = stock_directory_message_record.stock[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
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
  skip
}

/* Stock Directory Message off the wire, 17 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.nanoseconds[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.stock[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
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
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> assert(stock_directory_message_read.nanoseconds[stock_directory_message_at] == stock_directory_message_written.nanoseconds[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> assert(stock_directory_message_read.stock[stock_directory_message_at] == stock_directory_message_written.stock[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
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
  skip
}

/* ---- Stock Trading Action Message: 16 bytes ---------------------------------- */

/* NASDAQ uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef StockTradingActionMessage {
  byte nanoseconds[4];
  byte stock[6];
  byte trading_state;
  byte reserved;
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.nanoseconds[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = stock_trading_action_message_value;
  stock_trading_action_message_record.reserved = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.nanoseconds[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = (stock_trading_action_message_base + 4 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = (stock_trading_action_message_base + 10 + 1) % 256;
  stock_trading_action_message_record.reserved = (stock_trading_action_message_base + 11 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 12 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 16 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.nanoseconds[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> wire[at] = stock_trading_action_message_record.stock[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = stock_trading_action_message_record.reserved; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 16 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.nanoseconds[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_record.reserved = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.nanoseconds[stock_trading_action_message_at] == stock_trading_action_message_written.nanoseconds[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> assert(stock_trading_action_message_read.stock[stock_trading_action_message_at] == stock_trading_action_message_written.stock[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.trading_state == stock_trading_action_message_written.trading_state);
  assert(stock_trading_action_message_read.reserved == stock_trading_action_message_written.reserved);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Participant Position Message: 17 bytes --------------------------- */

/* At the start of each trading day, NASDAQ disseminates a spin of market participant position messages. Throughout the day, NASDAQ will send out this message only if NASDAQ Operations changes the status of a market participant firm in an issue. */
typedef MarketParticipantPositionMessage {
  byte nanoseconds[4];
  byte mpid[4];
  byte stock[6];
  byte primary_market_maker;
  byte market_maker_mode;
  byte market_participant_state
};

int market_participant_position_message_at;

/* every byte of Market Participant Position Message set to one value */
inline fill_market_participant_position_message(market_participant_position_message_record, market_participant_position_message_value) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.nanoseconds[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.stock[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_record.primary_market_maker = market_participant_position_message_value;
  market_participant_position_message_record.market_maker_mode = market_participant_position_message_value;
  market_participant_position_message_record.market_participant_state = market_participant_position_message_value;
  skip
}

/* each byte of Market Participant Position Message set to where it lies, so a field read out of place says so */
inline ramp_market_participant_position_message(market_participant_position_message_record, market_participant_position_message_base) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.nanoseconds[market_participant_position_message_at] = (market_participant_position_message_base + 0 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = (market_participant_position_message_base + 4 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.stock[market_participant_position_message_at] = (market_participant_position_message_base + 8 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_record.primary_market_maker = (market_participant_position_message_base + 14 + 1) % 256;
  market_participant_position_message_record.market_maker_mode = (market_participant_position_message_base + 15 + 1) % 256;
  market_participant_position_message_record.market_participant_state = (market_participant_position_message_base + 16 + 1) % 256;
  skip
}

/* Market Participant Position Message to the wire, 17 bytes from where the cursor stands */
inline encode_market_participant_position_message(market_participant_position_message_record) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> wire[at] = market_participant_position_message_record.nanoseconds[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> wire[at] = market_participant_position_message_record.mpid[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> wire[at] = market_participant_position_message_record.stock[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  wire[at] = market_participant_position_message_record.primary_market_maker; at = at + 1;
  wire[at] = market_participant_position_message_record.market_maker_mode; at = at + 1;
  wire[at] = market_participant_position_message_record.market_participant_state; at = at + 1;
  skip
}

/* Market Participant Position Message off the wire, 17 bytes from where the cursor stands */
inline decode_market_participant_position_message(market_participant_position_message_record) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.nanoseconds[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.stock[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_record.primary_market_maker = wire[at]; at = at + 1;
  market_participant_position_message_record.market_maker_mode = wire[at]; at = at + 1;
  market_participant_position_message_record.market_participant_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Participant Position Message is what was written, byte for byte */
inline equal_market_participant_position_message(market_participant_position_message_read, market_participant_position_message_written) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> assert(market_participant_position_message_read.nanoseconds[market_participant_position_message_at] == market_participant_position_message_written.nanoseconds[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> assert(market_participant_position_message_read.mpid[market_participant_position_message_at] == market_participant_position_message_written.mpid[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> assert(market_participant_position_message_read.stock[market_participant_position_message_at] == market_participant_position_message_written.stock[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  assert(market_participant_position_message_read.primary_market_maker == market_participant_position_message_written.primary_market_maker);
  assert(market_participant_position_message_read.market_maker_mode == market_participant_position_message_written.market_maker_mode);
  assert(market_participant_position_message_read.market_participant_state == market_participant_position_message_written.market_participant_state);
  skip
}

/* ---- Add Order Message: 28 bytes --------------------------------------------- */

/* This message will be generated for unattributed orders accepted by the NASDAQ system. */
typedef AddOrderMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte side;
  byte shares[4];
  byte stock[6];
  byte price[4];
  byte display
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
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.stock[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = add_order_message_value;
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
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = (add_order_message_base + 4 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.stock[add_order_message_at] = (add_order_message_base + 17 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = (add_order_message_base + 23 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = (add_order_message_base + 27 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 28 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.nanoseconds[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> wire[at] = add_order_message_record.order_reference_number[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.shares[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.stock[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> wire[at] = add_order_message_record.price[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.display; at = at + 1;
  skip
}

/* Add Order Message off the wire, 28 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.nanoseconds[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 8 -> add_order_message_record.order_reference_number[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.shares[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.stock[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> add_order_message_record.price[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = wire[at]; at = at + 1;
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
  :: add_order_message_at < 8 -> assert(add_order_message_read.order_reference_number[add_order_message_at] == add_order_message_written.order_reference_number[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side == add_order_message_written.side);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.shares[add_order_message_at] == add_order_message_written.shares[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.stock[add_order_message_at] == add_order_message_written.stock[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 4 -> assert(add_order_message_read.price[add_order_message_at] == add_order_message_written.price[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.display == add_order_message_written.display);
  skip
}

/* ---- Add Order With Mpid Message: 31 bytes ----------------------------------- */

/* This message will be generated for attributed orders and quotations accepted by the NASDAQ system. */
typedef AddOrderWithMpidMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte side;
  byte shares[4];
  byte stock[6];
  byte price[4];
  byte attribution[4]
};

int add_order_with_mpid_message_at;

/* every byte of Add Order With Mpid Message set to one value */
inline fill_add_order_with_mpid_message(add_order_with_mpid_message_record, add_order_with_mpid_message_value) {
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.nanoseconds[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 8 -> add_order_with_mpid_message_record.order_reference_number[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_record.side = add_order_with_mpid_message_value;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.shares[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 6 -> add_order_with_mpid_message_record.stock[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.price[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.attribution[add_order_with_mpid_message_at] = add_order_with_mpid_message_value; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order With Mpid Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_with_mpid_message(add_order_with_mpid_message_record, add_order_with_mpid_message_base) {
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.nanoseconds[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 0 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 8 -> add_order_with_mpid_message_record.order_reference_number[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 4 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_record.side = (add_order_with_mpid_message_base + 12 + 1) % 256;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.shares[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 13 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 6 -> add_order_with_mpid_message_record.stock[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 17 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.price[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 23 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.attribution[add_order_with_mpid_message_at] = (add_order_with_mpid_message_base + 27 + add_order_with_mpid_message_at + 1) % 256; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order With Mpid Message to the wire, 31 bytes from where the cursor stands */
inline encode_add_order_with_mpid_message(add_order_with_mpid_message_record) {
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> wire[at] = add_order_with_mpid_message_record.nanoseconds[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 8 -> wire[at] = add_order_with_mpid_message_record.order_reference_number[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_with_mpid_message_record.side; at = at + 1;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> wire[at] = add_order_with_mpid_message_record.shares[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 6 -> wire[at] = add_order_with_mpid_message_record.stock[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> wire[at] = add_order_with_mpid_message_record.price[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> wire[at] = add_order_with_mpid_message_record.attribution[add_order_with_mpid_message_at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order With Mpid Message off the wire, 31 bytes from where the cursor stands */
inline decode_add_order_with_mpid_message(add_order_with_mpid_message_record) {
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.nanoseconds[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 8 -> add_order_with_mpid_message_record.order_reference_number[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_record.side = wire[at]; at = at + 1;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.shares[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 6 -> add_order_with_mpid_message_record.stock[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.price[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> add_order_with_mpid_message_record.attribution[add_order_with_mpid_message_at] = wire[at]; at = at + 1; add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order With Mpid Message is what was written, byte for byte */
inline equal_add_order_with_mpid_message(add_order_with_mpid_message_read, add_order_with_mpid_message_written) {
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> assert(add_order_with_mpid_message_read.nanoseconds[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.nanoseconds[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 8 -> assert(add_order_with_mpid_message_read.order_reference_number[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.order_reference_number[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  assert(add_order_with_mpid_message_read.side == add_order_with_mpid_message_written.side);
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> assert(add_order_with_mpid_message_read.shares[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.shares[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 6 -> assert(add_order_with_mpid_message_read.stock[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.stock[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> assert(add_order_with_mpid_message_read.price[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.price[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_message_at = 0;
  do
  :: add_order_with_mpid_message_at < 4 -> assert(add_order_with_mpid_message_read.attribution[add_order_with_mpid_message_at] == add_order_with_mpid_message_written.attribution[add_order_with_mpid_message_at]); add_order_with_mpid_message_at = add_order_with_mpid_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 24 bytes ---------------------------------------- */

/* This message is sent whenever an order on the book is executed in whole or in part. */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte executed_shares[4];
  byte match_number[8]
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
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 16 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 24 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_reference_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_shares[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 24 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_reference_number[order_executed_message_at] == order_executed_message_written.order_reference_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_shares[order_executed_message_at] == order_executed_message_written.executed_shares[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 29 bytes ----------------------------- */

/* This message is sent whenever an order on the book is executed in whole or in part at a price different from the initial display price. */
typedef OrderExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte executed_shares[4];
  byte match_number[8];
  byte printable;
  byte execution_price[4]
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
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
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
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 12 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 16 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 24 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 25 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 29 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.printable; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 29 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
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
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.order_reference_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.order_reference_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.executed_shares[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_shares[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.printable == order_executed_with_price_message_written.printable);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.execution_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.execution_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 16 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is modified as a result of a partial cancellation. */
typedef OrderCancelMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte canceled_shares[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 4 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = (order_cancel_message_base + 12 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 16 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.nanoseconds[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> wire[at] = order_cancel_message_record.order_reference_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> wire[at] = order_cancel_message_record.canceled_shares[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 16 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.nanoseconds[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.nanoseconds[order_cancel_message_at] == order_cancel_message_written.nanoseconds[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> assert(order_cancel_message_read.order_reference_number[order_cancel_message_at] == order_cancel_message_written.order_reference_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> assert(order_cancel_message_read.canceled_shares[order_cancel_message_at] == order_cancel_message_written.canceled_shares[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 12 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is being cancelled. All remaining shares are no longer accessible so the order must be removed from the book. */
typedef OrderDeleteMessage {
  byte nanoseconds[4];
  byte order_reference_number[8]
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
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
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
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.nanoseconds[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_reference_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.nanoseconds[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
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
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_reference_number[order_delete_message_at] == order_delete_message_written.order_reference_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 29 bytes ----------------------------------------- */

/* This message is sent whenever an order on the book has been cancel-replaced. All remaining shares from the original order are no longer accessible, and must be removed. The new order details are provided for the replacement, along with a new order reference number which will be used henceforth. */
typedef OrderReplaceMessage {
  byte nanoseconds[4];
  byte original_order_reference_number[8];
  byte new_order_reference_number[8];
  byte shares[4];
  byte price[4];
  byte display
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
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
  order_replace_message_record.display = order_replace_message_value;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = (order_replace_message_base + 4 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = (order_replace_message_base + 12 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.shares[order_replace_message_at] = (order_replace_message_base + 20 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 24 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_record.display = (order_replace_message_base + 28 + 1) % 256;
  skip
}

/* Order Replace Message to the wire, 29 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> wire[at] = order_replace_message_record.nanoseconds[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.original_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> wire[at] = order_replace_message_record.new_order_reference_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
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
  wire[at] = order_replace_message_record.display; at = at + 1;
  skip
}

/* Order Replace Message off the wire, 29 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.nanoseconds[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
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
  order_replace_message_record.display = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> assert(order_replace_message_read.nanoseconds[order_replace_message_at] == order_replace_message_written.nanoseconds[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.original_order_reference_number[order_replace_message_at] == order_replace_message_written.original_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> assert(order_replace_message_read.new_order_reference_number[order_replace_message_at] == order_replace_message_written.new_order_reference_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
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
  assert(order_replace_message_read.display == order_replace_message_written.display);
  skip
}

/* ---- Order Display Message: 12 bytes ----------------------------------------- */

/* This message is disseminated to alert the TotalView-ITCH users that a Flash order has been added to the continuous order book for display on all NASDAQ data feeds. */
typedef OrderDisplayMessage {
  byte nanoseconds[4];
  byte order_reference_number[8]
};

int order_display_message_at;

/* every byte of Order Display Message set to one value */
inline fill_order_display_message(order_display_message_record, order_display_message_value) {
  order_display_message_at = 0;
  do
  :: order_display_message_at < 4 -> order_display_message_record.nanoseconds[order_display_message_at] = order_display_message_value; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  order_display_message_at = 0;
  do
  :: order_display_message_at < 8 -> order_display_message_record.order_reference_number[order_display_message_at] = order_display_message_value; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Display Message set to where it lies, so a field read out of place says so */
inline ramp_order_display_message(order_display_message_record, order_display_message_base) {
  order_display_message_at = 0;
  do
  :: order_display_message_at < 4 -> order_display_message_record.nanoseconds[order_display_message_at] = (order_display_message_base + 0 + order_display_message_at + 1) % 256; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  order_display_message_at = 0;
  do
  :: order_display_message_at < 8 -> order_display_message_record.order_reference_number[order_display_message_at] = (order_display_message_base + 4 + order_display_message_at + 1) % 256; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Display Message to the wire, 12 bytes from where the cursor stands */
inline encode_order_display_message(order_display_message_record) {
  order_display_message_at = 0;
  do
  :: order_display_message_at < 4 -> wire[at] = order_display_message_record.nanoseconds[order_display_message_at]; at = at + 1; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  order_display_message_at = 0;
  do
  :: order_display_message_at < 8 -> wire[at] = order_display_message_record.order_reference_number[order_display_message_at]; at = at + 1; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Display Message off the wire, 12 bytes from where the cursor stands */
inline decode_order_display_message(order_display_message_record) {
  order_display_message_at = 0;
  do
  :: order_display_message_at < 4 -> order_display_message_record.nanoseconds[order_display_message_at] = wire[at]; at = at + 1; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  order_display_message_at = 0;
  do
  :: order_display_message_at < 8 -> order_display_message_record.order_reference_number[order_display_message_at] = wire[at]; at = at + 1; order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Display Message is what was written, byte for byte */
inline equal_order_display_message(order_display_message_read, order_display_message_written) {
  order_display_message_at = 0;
  do
  :: order_display_message_at < 4 -> assert(order_display_message_read.nanoseconds[order_display_message_at] == order_display_message_written.nanoseconds[order_display_message_at]); order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  order_display_message_at = 0;
  do
  :: order_display_message_at < 8 -> assert(order_display_message_read.order_reference_number[order_display_message_at] == order_display_message_written.order_reference_number[order_display_message_at]); order_display_message_at = order_display_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 35 bytes ------------------------------------------------- */

/* The Trade Message is designed to provide execution details for normal match events involving non-displayable order types. */
typedef TradeMessage {
  byte nanoseconds[4];
  byte order_reference_number[8];
  byte side;
  byte shares[4];
  byte stock[6];
  byte price[4];
  byte match_number[8]
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
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.stock[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
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
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = (trade_message_base + 4 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = (trade_message_base + 12 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = (trade_message_base + 13 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.stock[trade_message_at] = (trade_message_base + 17 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = (trade_message_base + 27 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 35 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.nanoseconds[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.order_reference_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.shares[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.stock[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.match_number[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 35 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.nanoseconds[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.order_reference_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.shares[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.stock[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.match_number[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
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
  :: trade_message_at < 8 -> assert(trade_message_read.order_reference_number[trade_message_at] == trade_message_written.order_reference_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side == trade_message_written.side);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.shares[trade_message_at] == trade_message_written.shares[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.stock[trade_message_at] == trade_message_written.stock[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.match_number[trade_message_at] == trade_message_written.match_number[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Trade Message: 31 bytes ------------------------------------------- */

/* Cross Trade message indicates that NASDAQ has completed its cross process for a specific security. */
typedef CrossTradeMessage {
  byte nanoseconds[4];
  byte cross_shares[8];
  byte stock[6];
  byte cross_price[4];
  byte match_number[8];
  byte cross_type
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.nanoseconds[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.stock[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = cross_trade_message_value;
  skip
}

/* each byte of Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_cross_trade_message(cross_trade_message_record, cross_trade_message_base) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.nanoseconds[cross_trade_message_at] = (cross_trade_message_base + 0 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = (cross_trade_message_base + 4 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.stock[cross_trade_message_at] = (cross_trade_message_base + 12 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = (cross_trade_message_base + 18 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = (cross_trade_message_base + 22 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = (cross_trade_message_base + 30 + 1) % 256;
  skip
}

/* Cross Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.nanoseconds[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.cross_shares[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> wire[at] = cross_trade_message_record.stock[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> wire[at] = cross_trade_message_record.cross_price[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.match_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_trade_message_record.cross_type; at = at + 1;
  skip
}

/* Cross Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.nanoseconds[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.stock[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Cross Trade Message is what was written, byte for byte */
inline equal_cross_trade_message(cross_trade_message_read, cross_trade_message_written) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.nanoseconds[cross_trade_message_at] == cross_trade_message_written.nanoseconds[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.cross_shares[cross_trade_message_at] == cross_trade_message_written.cross_shares[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> assert(cross_trade_message_read.stock[cross_trade_message_at] == cross_trade_message_written.stock[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> assert(cross_trade_message_read.cross_price[cross_trade_message_at] == cross_trade_message_written.cross_price[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.match_number[cross_trade_message_at] == cross_trade_message_written.match_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  assert(cross_trade_message_read.cross_type == cross_trade_message_written.cross_type);
  skip
}

/* ---- Broken Trade Message: 12 bytes ------------------------------------------ */

/* The Broken Trade Message is sent whenever an execution on NASDAQ is broken. */
typedef BrokenTradeMessage {
  byte nanoseconds[4];
  byte match_number[8]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Broken Trade Message set to where it lies, so a field read out of place says so */
inline ramp_broken_trade_message(broken_trade_message_record, broken_trade_message_base) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 12 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> wire[at] = broken_trade_message_record.nanoseconds[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 12 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> broken_trade_message_record.nanoseconds[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Broken Trade Message is what was written, byte for byte */
inline equal_broken_trade_message(broken_trade_message_read, broken_trade_message_written) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 4 -> assert(broken_trade_message_read.nanoseconds[broken_trade_message_at] == broken_trade_message_written.nanoseconds[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Net Order Imbalance Indicator Message: 41 bytes ------------------------- */

/* NASDAQ disseminates NOII data at 5-second intervals in the minutes leading up to the NASDAQ Opening Cross and NASDAQ Closing Cross. */
typedef NetOrderImbalanceIndicatorMessage {
  byte nanoseconds[4];
  byte paired_shares[8];
  byte imbalance_shares[8];
  byte imbalance_direction;
  byte stock[6];
  byte far_price[4];
  byte near_price[4];
  byte current_reference_price[4];
  byte cross_type;
  byte price_variation_indicator
};

int net_order_imbalance_indicator_message_at;

/* every byte of Net Order Imbalance Indicator Message set to one value */
inline fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record, net_order_imbalance_indicator_message_value) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.paired_shares[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.imbalance_shares[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = net_order_imbalance_indicator_message_value;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.far_price[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.near_price[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.current_reference_price[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.cross_type = net_order_imbalance_indicator_message_value;
  net_order_imbalance_indicator_message_record.price_variation_indicator = net_order_imbalance_indicator_message_value;
  skip
}

/* each byte of Net Order Imbalance Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record, net_order_imbalance_indicator_message_base) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 0 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.paired_shares[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 4 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.imbalance_shares[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 12 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = (net_order_imbalance_indicator_message_base + 20 + 1) % 256;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 21 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.far_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 27 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.near_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 31 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.current_reference_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 35 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.cross_type = (net_order_imbalance_indicator_message_base + 39 + 1) % 256;
  net_order_imbalance_indicator_message_record.price_variation_indicator = (net_order_imbalance_indicator_message_base + 40 + 1) % 256;
  skip
}

/* Net Order Imbalance Indicator Message to the wire, 41 bytes from where the cursor stands */
inline encode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> wire[at] = net_order_imbalance_indicator_message_record.paired_shares[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> wire[at] = net_order_imbalance_indicator_message_record.imbalance_shares[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_indicator_message_record.imbalance_direction; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> wire[at] = net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.far_price[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.near_price[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> wire[at] = net_order_imbalance_indicator_message_record.current_reference_price[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = net_order_imbalance_indicator_message_record.cross_type; at = at + 1;
  wire[at] = net_order_imbalance_indicator_message_record.price_variation_indicator; at = at + 1;
  skip
}

/* Net Order Imbalance Indicator Message off the wire, 41 bytes from where the cursor stands */
inline decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.nanoseconds[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.paired_shares[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.imbalance_shares[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = wire[at]; at = at + 1;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.far_price[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.near_price[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.current_reference_price[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.cross_type = wire[at]; at = at + 1;
  net_order_imbalance_indicator_message_record.price_variation_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Net Order Imbalance Indicator Message is what was written, byte for byte */
inline equal_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_read, net_order_imbalance_indicator_message_written) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.nanoseconds[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.nanoseconds[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> assert(net_order_imbalance_indicator_message_read.paired_shares[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.paired_shares[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> assert(net_order_imbalance_indicator_message_read.imbalance_shares[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.imbalance_shares[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_indicator_message_read.imbalance_direction == net_order_imbalance_indicator_message_written.imbalance_direction);
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> assert(net_order_imbalance_indicator_message_read.stock[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.stock[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.far_price[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.far_price[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.near_price[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.near_price[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> assert(net_order_imbalance_indicator_message_read.current_reference_price[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.current_reference_price[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  assert(net_order_imbalance_indicator_message_read.cross_type == net_order_imbalance_indicator_message_written.cross_type);
  assert(net_order_imbalance_indicator_message_read.price_variation_indicator == net_order_imbalance_indicator_message_written.price_variation_indicator);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Server Packet Header: encoded, read back, and compared */
proctype check_server_packet_header() {
  ServerPacketHeader server_packet_header_sent;
  ServerPacketHeader server_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_packet_header(server_packet_header_sent, 0)
  :: pattern == 1 -> fill_server_packet_header(server_packet_header_sent, 32)
  :: pattern == 2 -> fill_server_packet_header(server_packet_header_sent, 255)
  :: else -> ramp_server_packet_header(server_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_packet_header(server_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_server_packet_header(server_packet_header_got);
    assert(at == 3);
    equal_server_packet_header(server_packet_header_got, server_packet_header_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 30);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 30);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
  }
}

/* Timestamp Message: encoded, read back, and compared */
proctype check_timestamp_message() {
  TimestampMessage timestamp_message_sent;
  TimestampMessage timestamp_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp_message(timestamp_message_sent, 0)
  :: pattern == 1 -> fill_timestamp_message(timestamp_message_sent, 32)
  :: pattern == 2 -> fill_timestamp_message(timestamp_message_sent, 255)
  :: else -> ramp_timestamp_message(timestamp_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp_message(timestamp_message_sent);
    assert(at == 4);
    at = 0;
    decode_timestamp_message(timestamp_message_got);
    assert(at == 4);
    equal_timestamp_message(timestamp_message_got, timestamp_message_sent)
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
    assert(at == 17);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 17);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 16);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
  }
}

/* Market Participant Position Message: encoded, read back, and compared */
proctype check_market_participant_position_message() {
  MarketParticipantPositionMessage market_participant_position_message_sent;
  MarketParticipantPositionMessage market_participant_position_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_participant_position_message(market_participant_position_message_sent, 0)
  :: pattern == 1 -> fill_market_participant_position_message(market_participant_position_message_sent, 32)
  :: pattern == 2 -> fill_market_participant_position_message(market_participant_position_message_sent, 255)
  :: else -> ramp_market_participant_position_message(market_participant_position_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_participant_position_message(market_participant_position_message_sent);
    assert(at == 17);
    at = 0;
    decode_market_participant_position_message(market_participant_position_message_got);
    assert(at == 17);
    equal_market_participant_position_message(market_participant_position_message_got, market_participant_position_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 28);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Add Order With Mpid Message: encoded, read back, and compared */
proctype check_add_order_with_mpid_message() {
  AddOrderWithMpidMessage add_order_with_mpid_message_sent;
  AddOrderWithMpidMessage add_order_with_mpid_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_with_mpid_message(add_order_with_mpid_message_sent, 0)
  :: pattern == 1 -> fill_add_order_with_mpid_message(add_order_with_mpid_message_sent, 32)
  :: pattern == 2 -> fill_add_order_with_mpid_message(add_order_with_mpid_message_sent, 255)
  :: else -> ramp_add_order_with_mpid_message(add_order_with_mpid_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_with_mpid_message(add_order_with_mpid_message_sent);
    assert(at == 31);
    at = 0;
    decode_add_order_with_mpid_message(add_order_with_mpid_message_got);
    assert(at == 31);
    equal_add_order_with_mpid_message(add_order_with_mpid_message_got, add_order_with_mpid_message_sent)
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
    assert(at == 24);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 24);
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
    assert(at == 29);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 29);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
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
    assert(at == 16);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 16);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 12);
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
    assert(at == 29);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 29);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Order Display Message: encoded, read back, and compared */
proctype check_order_display_message() {
  OrderDisplayMessage order_display_message_sent;
  OrderDisplayMessage order_display_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_display_message(order_display_message_sent, 0)
  :: pattern == 1 -> fill_order_display_message(order_display_message_sent, 32)
  :: pattern == 2 -> fill_order_display_message(order_display_message_sent, 255)
  :: else -> ramp_order_display_message(order_display_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_display_message(order_display_message_sent);
    assert(at == 12);
    at = 0;
    decode_order_display_message(order_display_message_got);
    assert(at == 12);
    equal_order_display_message(order_display_message_got, order_display_message_sent)
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
    assert(at == 35);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 35);
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

/* Net Order Imbalance Indicator Message: encoded, read back, and compared */
proctype check_net_order_imbalance_indicator_message() {
  NetOrderImbalanceIndicatorMessage net_order_imbalance_indicator_message_sent;
  NetOrderImbalanceIndicatorMessage net_order_imbalance_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 0)
  :: pattern == 1 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 32)
  :: pattern == 2 -> fill_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 255)
  :: else -> ramp_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_sent);
    assert(at == 41);
    at = 0;
    decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got);
    assert(at == 41);
    equal_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got, net_order_imbalance_indicator_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_timestamp_message()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_stock_trading_action_message()
  :: run check_market_participant_position_message()
  :: run check_add_order_message()
  :: run check_add_order_with_mpid_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_order_display_message()
  :: run check_trade_message()
  :: run check_cross_trade_message()
  :: run check_broken_trade_message()
  :: run check_net_order_imbalance_indicator_message()
  fi
}
