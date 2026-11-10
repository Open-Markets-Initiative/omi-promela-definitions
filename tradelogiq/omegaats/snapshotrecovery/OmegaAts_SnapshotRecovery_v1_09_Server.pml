/*
 * Tradelogiq Markets Inc. Omega Snapshot Recovery
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
 *   - a field present only on a condition
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

/* ---- Server Packet Header: 3 bytes ------------------------------------------- */

/* Tradelogiq SoupTcp Server Packet Header */
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

/* The server sends a Login Accepted Packet in response to receiving a valid Login Request from the client */
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

/* The server sends this packet in response to an invalid Login Request Packet from the client and closes the socket connection */
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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* The spin consists of a Start-Of-Messages event, Add Order messages and an End-Of-Messages event, after which the Reallocation Server disconnects. */
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

/* A Requested Sequence Number of 1 returns the symbol spin, the Instrument Directory messages distributed early in the Tradelogiq start of day. */
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

/* The symbol spin carries the Extended Stock Directory of bonds, debentures, rights, notes and warrants alongside the Stock Directory. */
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

/* If sequence 1 is used for the Sequenced Number field the reallocation server will return the symbol spin with the stock trading status messages before returning all open orders seen on the book. */
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

/* Only open orders are sent in the spin; the spin will not contain any message for an order which is no longer in the book. */
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_stock_directory_message()
  :: run check_extended_stock_directory_message()
  :: run check_stock_trading_action_message()
  :: run check_add_order_message()
  fi
}
