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
#define WIRE 49

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

/* ---- System Event Message: 11 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event */
typedef SystemEventMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.stock_locate[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.stock_locate[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.stock_locate[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.stock_locate[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.stock_locate[system_event_message_at] == system_event_message_written.stock_locate[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.tracking_number[system_event_message_at] == system_event_message_written.tracking_number[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Stock Directory Message: 39 bytes --------------------------------------- */

/* Market data redistributors should process this message to populate the Financial Status Indicator (required display field) and the Market Category (recommended display field) for NASDAQ-listed issues. */
typedef StockDirectoryMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
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
  byte inverse_indicator;
  byte elo_flag
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.stock_locate[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
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
  stock_directory_message_record.elo_flag = stock_directory_message_value;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.stock_locate[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = (stock_directory_message_base + 2 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 4 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 10 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 18 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 19 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 20 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 24 + 1) % 256;
  stock_directory_message_record.issue_classification = (stock_directory_message_base + 25 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = (stock_directory_message_base + 26 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = (stock_directory_message_base + 28 + 1) % 256;
  stock_directory_message_record.short_sale_threshold_indicator = (stock_directory_message_base + 29 + 1) % 256;
  stock_directory_message_record.ipo_flag = (stock_directory_message_base + 30 + 1) % 256;
  stock_directory_message_record.luld_reference_price_tier = (stock_directory_message_base + 31 + 1) % 256;
  stock_directory_message_record.etp_flag = (stock_directory_message_base + 32 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = (stock_directory_message_base + 33 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = (stock_directory_message_base + 37 + 1) % 256;
  stock_directory_message_record.elo_flag = (stock_directory_message_base + 38 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 39 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.stock_locate[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> wire[at] = stock_directory_message_record.tracking_number[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> wire[at] = stock_directory_message_record.timestamp[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
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
  wire[at] = stock_directory_message_record.elo_flag; at = at + 1;
  skip
}

/* Stock Directory Message off the wire, 39 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.stock_locate[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
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
  stock_directory_message_record.elo_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.stock_locate[stock_directory_message_at] == stock_directory_message_written.stock_locate[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> assert(stock_directory_message_read.tracking_number[stock_directory_message_at] == stock_directory_message_written.tracking_number[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> assert(stock_directory_message_read.timestamp[stock_directory_message_at] == stock_directory_message_written.timestamp[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
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
  assert(stock_directory_message_read.elo_flag == stock_directory_message_written.elo_flag);
  skip
}

/* ---- Stock Trading Action Message: 24 bytes ---------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of a security to the trading community */
typedef StockTradingActionMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte trading_state;
  byte reserved;
  byte reason_code[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.stock_locate[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = stock_trading_action_message_value;
  stock_trading_action_message_record.reserved = stock_trading_action_message_value;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason_code[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_base) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.stock_locate[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = (stock_trading_action_message_base + 2 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = (stock_trading_action_message_base + 4 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = (stock_trading_action_message_base + 10 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = (stock_trading_action_message_base + 18 + 1) % 256;
  stock_trading_action_message_record.reserved = (stock_trading_action_message_base + 19 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason_code[stock_trading_action_message_at] = (stock_trading_action_message_base + 20 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 24 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> wire[at] = stock_trading_action_message_record.stock_locate[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> wire[at] = stock_trading_action_message_record.tracking_number[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> wire[at] = stock_trading_action_message_record.timestamp[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.stock[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.trading_state; at = at + 1;
  wire[at] = stock_trading_action_message_record.reserved; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason_code[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 24 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.stock_locate[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.stock[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.trading_state = wire[at]; at = at + 1;
  stock_trading_action_message_record.reserved = wire[at]; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason_code[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Trading Action Message is what was written, byte for byte */
inline equal_stock_trading_action_message(stock_trading_action_message_read, stock_trading_action_message_written) {
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> assert(stock_trading_action_message_read.stock_locate[stock_trading_action_message_at] == stock_trading_action_message_written.stock_locate[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 2 -> assert(stock_trading_action_message_read.tracking_number[stock_trading_action_message_at] == stock_trading_action_message_written.tracking_number[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> assert(stock_trading_action_message_read.timestamp[stock_trading_action_message_at] == stock_trading_action_message_written.timestamp[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.stock[stock_trading_action_message_at] == stock_trading_action_message_written.stock[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.trading_state == stock_trading_action_message_written.trading_state);
  assert(stock_trading_action_message_read.reserved == stock_trading_action_message_written.reserved);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason_code[stock_trading_action_message_at] == stock_trading_action_message_written.reason_code[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 19 bytes ---- */

/* Nasaq processes orders based on the most Reg SHO Restriction status value */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte locate_code[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 2 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 4 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 10 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 18 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 19 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 19 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.locate_code[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Market Participant Position Message: 25 bytes --------------------------- */

/* Nasdaq will send out this message only if Nasdaq Operations changes the status of a market participant firm in an issue */
typedef MarketParticipantPositionMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte mpid[4];
  byte stock[8];
  byte primary_market_maker;
  byte market_maker_mode;
  byte market_participant_state
};

int market_participant_position_message_at;

/* every byte of Market Participant Position Message set to one value */
inline fill_market_participant_position_message(market_participant_position_message_record, market_participant_position_message_value) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.stock_locate[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.tracking_number[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.timestamp[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 8 -> market_participant_position_message_record.stock[market_participant_position_message_at] = market_participant_position_message_value; market_participant_position_message_at = market_participant_position_message_at + 1
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
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.stock_locate[market_participant_position_message_at] = (market_participant_position_message_base + 0 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.tracking_number[market_participant_position_message_at] = (market_participant_position_message_base + 2 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.timestamp[market_participant_position_message_at] = (market_participant_position_message_base + 4 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = (market_participant_position_message_base + 10 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 8 -> market_participant_position_message_record.stock[market_participant_position_message_at] = (market_participant_position_message_base + 14 + market_participant_position_message_at + 1) % 256; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_record.primary_market_maker = (market_participant_position_message_base + 22 + 1) % 256;
  market_participant_position_message_record.market_maker_mode = (market_participant_position_message_base + 23 + 1) % 256;
  market_participant_position_message_record.market_participant_state = (market_participant_position_message_base + 24 + 1) % 256;
  skip
}

/* Market Participant Position Message to the wire, 25 bytes from where the cursor stands */
inline encode_market_participant_position_message(market_participant_position_message_record) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> wire[at] = market_participant_position_message_record.stock_locate[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> wire[at] = market_participant_position_message_record.tracking_number[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> wire[at] = market_participant_position_message_record.timestamp[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> wire[at] = market_participant_position_message_record.mpid[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 8 -> wire[at] = market_participant_position_message_record.stock[market_participant_position_message_at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  wire[at] = market_participant_position_message_record.primary_market_maker; at = at + 1;
  wire[at] = market_participant_position_message_record.market_maker_mode; at = at + 1;
  wire[at] = market_participant_position_message_record.market_participant_state; at = at + 1;
  skip
}

/* Market Participant Position Message off the wire, 25 bytes from where the cursor stands */
inline decode_market_participant_position_message(market_participant_position_message_record) {
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.stock_locate[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> market_participant_position_message_record.tracking_number[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> market_participant_position_message_record.timestamp[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> market_participant_position_message_record.mpid[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 8 -> market_participant_position_message_record.stock[market_participant_position_message_at] = wire[at]; at = at + 1; market_participant_position_message_at = market_participant_position_message_at + 1
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
  :: market_participant_position_message_at < 2 -> assert(market_participant_position_message_read.stock_locate[market_participant_position_message_at] == market_participant_position_message_written.stock_locate[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 2 -> assert(market_participant_position_message_read.tracking_number[market_participant_position_message_at] == market_participant_position_message_written.tracking_number[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 6 -> assert(market_participant_position_message_read.timestamp[market_participant_position_message_at] == market_participant_position_message_written.timestamp[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 4 -> assert(market_participant_position_message_read.mpid[market_participant_position_message_at] == market_participant_position_message_written.mpid[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  market_participant_position_message_at = 0;
  do
  :: market_participant_position_message_at < 8 -> assert(market_participant_position_message_read.stock[market_participant_position_message_at] == market_participant_position_message_written.stock[market_participant_position_message_at]); market_participant_position_message_at = market_participant_position_message_at + 1
  :: else -> break
  od;
  assert(market_participant_position_message_read.primary_market_maker == market_participant_position_message_written.primary_market_maker);
  assert(market_participant_position_message_read.market_maker_mode == market_participant_position_message_written.market_maker_mode);
  assert(market_participant_position_message_read.market_participant_state == market_participant_position_message_written.market_participant_state);
  skip
}

/* ---- Mwcb Decline Level Message: 34 bytes ------------------------------------ */

/* Informs data recipients what the daily MWCB breach points are set to for the current trading day. */
typedef MwcbDeclineLevelMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte level_1[8];
  byte level_2[8];
  byte level_3[8]
};

int mwcb_decline_level_message_at;

/* every byte of Mwcb Decline Level Message set to one value */
inline fill_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_value) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.stock_locate[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.tracking_number[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = mwcb_decline_level_message_value; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
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
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.stock_locate[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 0 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.tracking_number[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 2 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 4 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 10 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 18 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 26 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message to the wire, 34 bytes from where the cursor stands */
inline encode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> wire[at] = mwcb_decline_level_message_record.stock_locate[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> wire[at] = mwcb_decline_level_message_record.tracking_number[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> wire[at] = mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
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

/* Mwcb Decline Level Message off the wire, 34 bytes from where the cursor stands */
inline decode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.stock_locate[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.tracking_number[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = wire[at]; at = at + 1; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
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
  :: mwcb_decline_level_message_at < 2 -> assert(mwcb_decline_level_message_read.stock_locate[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.stock_locate[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 2 -> assert(mwcb_decline_level_message_read.tracking_number[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.tracking_number[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> assert(mwcb_decline_level_message_read.timestamp[mwcb_decline_level_message_at] == mwcb_decline_level_message_written.timestamp[mwcb_decline_level_message_at]); mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
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

/* ---- Mwcb Status Level Message: 11 bytes ------------------------------------- */

/* Informs data recipients when a MWCB has breached one of the established levels */
typedef MwcbStatusLevelMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte breached_level
};

int mwcb_status_level_message_at;

/* every byte of Mwcb Status Level Message set to one value */
inline fill_mwcb_status_level_message(mwcb_status_level_message_record, mwcb_status_level_message_value) {
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.stock_locate[mwcb_status_level_message_at] = mwcb_status_level_message_value; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.tracking_number[mwcb_status_level_message_at] = mwcb_status_level_message_value; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 6 -> mwcb_status_level_message_record.timestamp[mwcb_status_level_message_at] = mwcb_status_level_message_value; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_record.breached_level = mwcb_status_level_message_value;
  skip
}

/* each byte of Mwcb Status Level Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_status_level_message(mwcb_status_level_message_record, mwcb_status_level_message_base) {
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.stock_locate[mwcb_status_level_message_at] = (mwcb_status_level_message_base + 0 + mwcb_status_level_message_at + 1) % 256; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.tracking_number[mwcb_status_level_message_at] = (mwcb_status_level_message_base + 2 + mwcb_status_level_message_at + 1) % 256; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 6 -> mwcb_status_level_message_record.timestamp[mwcb_status_level_message_at] = (mwcb_status_level_message_base + 4 + mwcb_status_level_message_at + 1) % 256; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_record.breached_level = (mwcb_status_level_message_base + 10 + 1) % 256;
  skip
}

/* Mwcb Status Level Message to the wire, 11 bytes from where the cursor stands */
inline encode_mwcb_status_level_message(mwcb_status_level_message_record) {
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> wire[at] = mwcb_status_level_message_record.stock_locate[mwcb_status_level_message_at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> wire[at] = mwcb_status_level_message_record.tracking_number[mwcb_status_level_message_at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 6 -> wire[at] = mwcb_status_level_message_record.timestamp[mwcb_status_level_message_at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  wire[at] = mwcb_status_level_message_record.breached_level; at = at + 1;
  skip
}

/* Mwcb Status Level Message off the wire, 11 bytes from where the cursor stands */
inline decode_mwcb_status_level_message(mwcb_status_level_message_record) {
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.stock_locate[mwcb_status_level_message_at] = wire[at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> mwcb_status_level_message_record.tracking_number[mwcb_status_level_message_at] = wire[at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 6 -> mwcb_status_level_message_record.timestamp[mwcb_status_level_message_at] = wire[at]; at = at + 1; mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_record.breached_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Mwcb Status Level Message is what was written, byte for byte */
inline equal_mwcb_status_level_message(mwcb_status_level_message_read, mwcb_status_level_message_written) {
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> assert(mwcb_status_level_message_read.stock_locate[mwcb_status_level_message_at] == mwcb_status_level_message_written.stock_locate[mwcb_status_level_message_at]); mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 2 -> assert(mwcb_status_level_message_read.tracking_number[mwcb_status_level_message_at] == mwcb_status_level_message_written.tracking_number[mwcb_status_level_message_at]); mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  mwcb_status_level_message_at = 0;
  do
  :: mwcb_status_level_message_at < 6 -> assert(mwcb_status_level_message_read.timestamp[mwcb_status_level_message_at] == mwcb_status_level_message_written.timestamp[mwcb_status_level_message_at]); mwcb_status_level_message_at = mwcb_status_level_message_at + 1
  :: else -> break
  od;
  assert(mwcb_status_level_message_read.breached_level == mwcb_status_level_message_written.breached_level);
  skip
}

/* ---- Ipo Quoting Period Update: 27 bytes ------------------------------------- */

/* Indicates the anticipated IPO quotation release time of a security. */
typedef IpoQuotingPeriodUpdate {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte ipo_quotation_release_time[4];
  byte ipo_quotation_release_qualifier;
  byte ipo_price[4]
};

int ipo_quoting_period_update_at;

/* every byte of Ipo Quoting Period Update set to one value */
inline fill_ipo_quoting_period_update(ipo_quoting_period_update_record, ipo_quoting_period_update_value) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.stock_locate[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.tracking_number[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 6 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
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
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = ipo_quoting_period_update_value; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ipo Quoting Period Update set to where it lies, so a field read out of place says so */
inline ramp_ipo_quoting_period_update(ipo_quoting_period_update_record, ipo_quoting_period_update_base) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.stock_locate[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 0 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.tracking_number[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 2 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 6 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 4 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 8 -> ipo_quoting_period_update_record.stock[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 10 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_quotation_release_time[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 18 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_record.ipo_quotation_release_qualifier = (ipo_quoting_period_update_base + 22 + 1) % 256;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = (ipo_quoting_period_update_base + 23 + ipo_quoting_period_update_at + 1) % 256; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update to the wire, 27 bytes from where the cursor stands */
inline encode_ipo_quoting_period_update(ipo_quoting_period_update_record) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> wire[at] = ipo_quoting_period_update_record.stock_locate[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> wire[at] = ipo_quoting_period_update_record.tracking_number[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 6 -> wire[at] = ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
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
  :: ipo_quoting_period_update_at < 4 -> wire[at] = ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update off the wire, 27 bytes from where the cursor stands */
inline decode_ipo_quoting_period_update(ipo_quoting_period_update_record) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.stock_locate[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> ipo_quoting_period_update_record.tracking_number[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 6 -> ipo_quoting_period_update_record.timestamp[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
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
  :: ipo_quoting_period_update_at < 4 -> ipo_quoting_period_update_record.ipo_price[ipo_quoting_period_update_at] = wire[at]; at = at + 1; ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ipo Quoting Period Update is what was written, byte for byte */
inline equal_ipo_quoting_period_update(ipo_quoting_period_update_read, ipo_quoting_period_update_written) {
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> assert(ipo_quoting_period_update_read.stock_locate[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.stock_locate[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 2 -> assert(ipo_quoting_period_update_read.tracking_number[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.tracking_number[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_at = 0;
  do
  :: ipo_quoting_period_update_at < 6 -> assert(ipo_quoting_period_update_read.timestamp[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.timestamp[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
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
  :: ipo_quoting_period_update_at < 4 -> assert(ipo_quoting_period_update_read.ipo_price[ipo_quoting_period_update_at] == ipo_quoting_period_update_written.ipo_price[ipo_quoting_period_update_at]); ipo_quoting_period_update_at = ipo_quoting_period_update_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Luld Auction Collar Message: 32 bytes ----------------------------------- */

/* Indicates the auction collar thresholds within which a paused security can reopen following a LULD trading pause */
typedef LuldAuctionCollarMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte auction_collar_reference_price[4];
  byte upper_auction_collar_price[4];
  byte lower_auction_collar_price[4];
  byte auction_collar_extension[2]
};

int luld_auction_collar_message_at;

/* every byte of Luld Auction Collar Message set to one value */
inline fill_luld_auction_collar_message(luld_auction_collar_message_record, luld_auction_collar_message_value) {
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.stock_locate[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.tracking_number[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 6 -> luld_auction_collar_message_record.timestamp[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 8 -> luld_auction_collar_message_record.stock[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.auction_collar_reference_price[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.upper_auction_collar_price[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.lower_auction_collar_price[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.auction_collar_extension[luld_auction_collar_message_at] = luld_auction_collar_message_value; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Luld Auction Collar Message set to where it lies, so a field read out of place says so */
inline ramp_luld_auction_collar_message(luld_auction_collar_message_record, luld_auction_collar_message_base) {
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.stock_locate[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 0 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.tracking_number[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 2 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 6 -> luld_auction_collar_message_record.timestamp[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 4 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 8 -> luld_auction_collar_message_record.stock[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 10 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.auction_collar_reference_price[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 18 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.upper_auction_collar_price[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 22 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.lower_auction_collar_price[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 26 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.auction_collar_extension[luld_auction_collar_message_at] = (luld_auction_collar_message_base + 30 + luld_auction_collar_message_at + 1) % 256; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  skip
}

/* Luld Auction Collar Message to the wire, 32 bytes from where the cursor stands */
inline encode_luld_auction_collar_message(luld_auction_collar_message_record) {
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> wire[at] = luld_auction_collar_message_record.stock_locate[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> wire[at] = luld_auction_collar_message_record.tracking_number[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 6 -> wire[at] = luld_auction_collar_message_record.timestamp[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 8 -> wire[at] = luld_auction_collar_message_record.stock[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> wire[at] = luld_auction_collar_message_record.auction_collar_reference_price[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> wire[at] = luld_auction_collar_message_record.upper_auction_collar_price[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> wire[at] = luld_auction_collar_message_record.lower_auction_collar_price[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> wire[at] = luld_auction_collar_message_record.auction_collar_extension[luld_auction_collar_message_at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  skip
}

/* Luld Auction Collar Message off the wire, 32 bytes from where the cursor stands */
inline decode_luld_auction_collar_message(luld_auction_collar_message_record) {
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.stock_locate[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.tracking_number[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 6 -> luld_auction_collar_message_record.timestamp[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 8 -> luld_auction_collar_message_record.stock[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.auction_collar_reference_price[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.upper_auction_collar_price[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> luld_auction_collar_message_record.lower_auction_collar_price[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> luld_auction_collar_message_record.auction_collar_extension[luld_auction_collar_message_at] = wire[at]; at = at + 1; luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Luld Auction Collar Message is what was written, byte for byte */
inline equal_luld_auction_collar_message(luld_auction_collar_message_read, luld_auction_collar_message_written) {
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> assert(luld_auction_collar_message_read.stock_locate[luld_auction_collar_message_at] == luld_auction_collar_message_written.stock_locate[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> assert(luld_auction_collar_message_read.tracking_number[luld_auction_collar_message_at] == luld_auction_collar_message_written.tracking_number[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 6 -> assert(luld_auction_collar_message_read.timestamp[luld_auction_collar_message_at] == luld_auction_collar_message_written.timestamp[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 8 -> assert(luld_auction_collar_message_read.stock[luld_auction_collar_message_at] == luld_auction_collar_message_written.stock[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> assert(luld_auction_collar_message_read.auction_collar_reference_price[luld_auction_collar_message_at] == luld_auction_collar_message_written.auction_collar_reference_price[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> assert(luld_auction_collar_message_read.upper_auction_collar_price[luld_auction_collar_message_at] == luld_auction_collar_message_written.upper_auction_collar_price[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 4 -> assert(luld_auction_collar_message_read.lower_auction_collar_price[luld_auction_collar_message_at] == luld_auction_collar_message_written.lower_auction_collar_price[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  luld_auction_collar_message_at = 0;
  do
  :: luld_auction_collar_message_at < 2 -> assert(luld_auction_collar_message_read.auction_collar_extension[luld_auction_collar_message_at] == luld_auction_collar_message_written.auction_collar_extension[luld_auction_collar_message_at]); luld_auction_collar_message_at = luld_auction_collar_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Operational Halt Message: 20 bytes -------------------------------------- */

/* An Operational Halt means that there has been an interruption of service on the identified security impacting only the designated Market Center */
typedef OperationalHaltMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte market_code;
  byte operational_halt_action
};

int operational_halt_message_at;

/* every byte of Operational Halt Message set to one value */
inline fill_operational_halt_message(operational_halt_message_record, operational_halt_message_value) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> operational_halt_message_record.stock_locate[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> operational_halt_message_record.tracking_number[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> operational_halt_message_record.timestamp[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 2 -> operational_halt_message_record.stock_locate[operational_halt_message_at] = (operational_halt_message_base + 0 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> operational_halt_message_record.tracking_number[operational_halt_message_at] = (operational_halt_message_base + 2 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> operational_halt_message_record.timestamp[operational_halt_message_at] = (operational_halt_message_base + 4 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = (operational_halt_message_base + 10 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = (operational_halt_message_base + 18 + 1) % 256;
  operational_halt_message_record.operational_halt_action = (operational_halt_message_base + 19 + 1) % 256;
  skip
}

/* Operational Halt Message to the wire, 20 bytes from where the cursor stands */
inline encode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> wire[at] = operational_halt_message_record.stock_locate[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> wire[at] = operational_halt_message_record.tracking_number[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> wire[at] = operational_halt_message_record.timestamp[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
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

/* Operational Halt Message off the wire, 20 bytes from where the cursor stands */
inline decode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> operational_halt_message_record.stock_locate[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> operational_halt_message_record.tracking_number[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> operational_halt_message_record.timestamp[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 2 -> assert(operational_halt_message_read.stock_locate[operational_halt_message_at] == operational_halt_message_written.stock_locate[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 2 -> assert(operational_halt_message_read.tracking_number[operational_halt_message_at] == operational_halt_message_written.tracking_number[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> assert(operational_halt_message_read.timestamp[operational_halt_message_at] == operational_halt_message_written.timestamp[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
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

/* ---- Add Order No Mpid Attribution Message: 35 bytes ------------------------- */

/* This message will be generated for unattributed orders accepted by the Nasdaq system */
typedef AddOrderNoMpidAttributionMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4]
};

int add_order_no_mpid_attribution_message_at;

/* every byte of Add Order No Mpid Attribution Message set to one value */
inline fill_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_record, add_order_no_mpid_attribution_message_value) {
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.stock_locate[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.tracking_number[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 6 -> add_order_no_mpid_attribution_message_record.timestamp[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.order_reference_number[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_record.buy_sell_indicator = add_order_no_mpid_attribution_message_value;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.shares[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.stock[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.price[add_order_no_mpid_attribution_message_at] = add_order_no_mpid_attribution_message_value; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order No Mpid Attribution Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_record, add_order_no_mpid_attribution_message_base) {
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.stock_locate[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 0 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.tracking_number[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 2 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 6 -> add_order_no_mpid_attribution_message_record.timestamp[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 4 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.order_reference_number[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 10 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_record.buy_sell_indicator = (add_order_no_mpid_attribution_message_base + 18 + 1) % 256;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.shares[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 19 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.stock[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 23 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.price[add_order_no_mpid_attribution_message_at] = (add_order_no_mpid_attribution_message_base + 31 + add_order_no_mpid_attribution_message_at + 1) % 256; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order No Mpid Attribution Message to the wire, 35 bytes from where the cursor stands */
inline encode_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_record) {
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> wire[at] = add_order_no_mpid_attribution_message_record.stock_locate[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> wire[at] = add_order_no_mpid_attribution_message_record.tracking_number[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 6 -> wire[at] = add_order_no_mpid_attribution_message_record.timestamp[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> wire[at] = add_order_no_mpid_attribution_message_record.order_reference_number[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_no_mpid_attribution_message_record.buy_sell_indicator; at = at + 1;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> wire[at] = add_order_no_mpid_attribution_message_record.shares[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> wire[at] = add_order_no_mpid_attribution_message_record.stock[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> wire[at] = add_order_no_mpid_attribution_message_record.price[add_order_no_mpid_attribution_message_at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order No Mpid Attribution Message off the wire, 35 bytes from where the cursor stands */
inline decode_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_record) {
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.stock_locate[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> add_order_no_mpid_attribution_message_record.tracking_number[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 6 -> add_order_no_mpid_attribution_message_record.timestamp[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.order_reference_number[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.shares[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> add_order_no_mpid_attribution_message_record.stock[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> add_order_no_mpid_attribution_message_record.price[add_order_no_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order No Mpid Attribution Message is what was written, byte for byte */
inline equal_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_read, add_order_no_mpid_attribution_message_written) {
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> assert(add_order_no_mpid_attribution_message_read.stock_locate[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.stock_locate[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 2 -> assert(add_order_no_mpid_attribution_message_read.tracking_number[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.tracking_number[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 6 -> assert(add_order_no_mpid_attribution_message_read.timestamp[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.timestamp[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> assert(add_order_no_mpid_attribution_message_read.order_reference_number[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.order_reference_number[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  assert(add_order_no_mpid_attribution_message_read.buy_sell_indicator == add_order_no_mpid_attribution_message_written.buy_sell_indicator);
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> assert(add_order_no_mpid_attribution_message_read.shares[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.shares[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 8 -> assert(add_order_no_mpid_attribution_message_read.stock[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.stock[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_no_mpid_attribution_message_at = 0;
  do
  :: add_order_no_mpid_attribution_message_at < 4 -> assert(add_order_no_mpid_attribution_message_read.price[add_order_no_mpid_attribution_message_at] == add_order_no_mpid_attribution_message_written.price[add_order_no_mpid_attribution_message_at]); add_order_no_mpid_attribution_message_at = add_order_no_mpid_attribution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order With Mpid Attribution Message: 40 bytes ----------------------- */

/* This message will be generated for attributed orders and quotations accepted by the Nasdaq system */
typedef AddOrderWithMpidAttributionMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte attribution[4];
  byte elo_flag
};

int add_order_with_mpid_attribution_message_at;

/* every byte of Add Order With Mpid Attribution Message set to one value */
inline fill_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_record, add_order_with_mpid_attribution_message_value) {
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.stock_locate[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.tracking_number[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 6 -> add_order_with_mpid_attribution_message_record.timestamp[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.order_reference_number[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.buy_sell_indicator = add_order_with_mpid_attribution_message_value;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.shares[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.stock[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.price[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.attribution[add_order_with_mpid_attribution_message_at] = add_order_with_mpid_attribution_message_value; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.elo_flag = add_order_with_mpid_attribution_message_value;
  skip
}

/* each byte of Add Order With Mpid Attribution Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_record, add_order_with_mpid_attribution_message_base) {
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.stock_locate[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 0 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.tracking_number[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 2 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 6 -> add_order_with_mpid_attribution_message_record.timestamp[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 4 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.order_reference_number[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 10 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.buy_sell_indicator = (add_order_with_mpid_attribution_message_base + 18 + 1) % 256;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.shares[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 19 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.stock[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 23 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.price[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 31 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.attribution[add_order_with_mpid_attribution_message_at] = (add_order_with_mpid_attribution_message_base + 35 + add_order_with_mpid_attribution_message_at + 1) % 256; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.elo_flag = (add_order_with_mpid_attribution_message_base + 39 + 1) % 256;
  skip
}

/* Add Order With Mpid Attribution Message to the wire, 40 bytes from where the cursor stands */
inline encode_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_record) {
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> wire[at] = add_order_with_mpid_attribution_message_record.stock_locate[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> wire[at] = add_order_with_mpid_attribution_message_record.tracking_number[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 6 -> wire[at] = add_order_with_mpid_attribution_message_record.timestamp[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> wire[at] = add_order_with_mpid_attribution_message_record.order_reference_number[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_with_mpid_attribution_message_record.buy_sell_indicator; at = at + 1;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> wire[at] = add_order_with_mpid_attribution_message_record.shares[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> wire[at] = add_order_with_mpid_attribution_message_record.stock[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> wire[at] = add_order_with_mpid_attribution_message_record.price[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> wire[at] = add_order_with_mpid_attribution_message_record.attribution[add_order_with_mpid_attribution_message_at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_with_mpid_attribution_message_record.elo_flag; at = at + 1;
  skip
}

/* Add Order With Mpid Attribution Message off the wire, 40 bytes from where the cursor stands */
inline decode_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_record) {
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.stock_locate[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> add_order_with_mpid_attribution_message_record.tracking_number[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 6 -> add_order_with_mpid_attribution_message_record.timestamp[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.order_reference_number[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.shares[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> add_order_with_mpid_attribution_message_record.stock[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.price[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> add_order_with_mpid_attribution_message_record.attribution[add_order_with_mpid_attribution_message_at] = wire[at]; at = at + 1; add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_record.elo_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order With Mpid Attribution Message is what was written, byte for byte */
inline equal_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_read, add_order_with_mpid_attribution_message_written) {
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> assert(add_order_with_mpid_attribution_message_read.stock_locate[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.stock_locate[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 2 -> assert(add_order_with_mpid_attribution_message_read.tracking_number[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.tracking_number[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 6 -> assert(add_order_with_mpid_attribution_message_read.timestamp[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.timestamp[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> assert(add_order_with_mpid_attribution_message_read.order_reference_number[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.order_reference_number[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  assert(add_order_with_mpid_attribution_message_read.buy_sell_indicator == add_order_with_mpid_attribution_message_written.buy_sell_indicator);
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> assert(add_order_with_mpid_attribution_message_read.shares[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.shares[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 8 -> assert(add_order_with_mpid_attribution_message_read.stock[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.stock[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> assert(add_order_with_mpid_attribution_message_read.price[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.price[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  add_order_with_mpid_attribution_message_at = 0;
  do
  :: add_order_with_mpid_attribution_message_at < 4 -> assert(add_order_with_mpid_attribution_message_read.attribution[add_order_with_mpid_attribution_message_at] == add_order_with_mpid_attribution_message_written.attribution[add_order_with_mpid_attribution_message_at]); add_order_with_mpid_attribution_message_at = add_order_with_mpid_attribution_message_at + 1
  :: else -> break
  od;
  assert(add_order_with_mpid_attribution_message_read.elo_flag == add_order_with_mpid_attribution_message_written.elo_flag);
  skip
}

/* ---- Order Executed Message: 30 bytes ---------------------------------------- */

/* This message is sent whenever an order on the book is executed in whole or in part */
typedef OrderExecutedMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte executed_shares[4];
  byte match_number[8]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.stock_locate[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.timestamp[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> order_executed_message_record.stock_locate[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = (order_executed_message_base + 2 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.timestamp[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_reference_number[order_executed_message_at] = (order_executed_message_base + 10 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_shares[order_executed_message_at] = (order_executed_message_base + 18 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 22 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.stock_locate[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.tracking_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.timestamp[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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

/* Order Executed Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.stock_locate[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.tracking_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.timestamp[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.stock_locate[order_executed_message_at] == order_executed_message_written.stock_locate[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.tracking_number[order_executed_message_at] == order_executed_message_written.tracking_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.timestamp[order_executed_message_at] == order_executed_message_written.timestamp[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
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

/* ---- Order Executed With Price Message: 35 bytes ----------------------------- */

/* This message is sent whenever an order on the book is executed in whole or in part at a price different from the initial display price */
typedef OrderExecutedWithPriceMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
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
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.stock_locate[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.stock_locate[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 0 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 2 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.order_reference_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 10 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_shares[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 18 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 22 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.printable = (order_executed_with_price_message_base + 30 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.execution_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 31 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 35 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.stock_locate[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> wire[at] = order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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

/* Order Executed With Price Message off the wire, 35 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.stock_locate[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.tracking_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> order_executed_with_price_message_record.timestamp[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.stock_locate[order_executed_with_price_message_at] == order_executed_with_price_message_written.stock_locate[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.tracking_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.tracking_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 6 -> assert(order_executed_with_price_message_read.timestamp[order_executed_with_price_message_at] == order_executed_with_price_message_written.timestamp[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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

/* ---- Order Cancel Message: 22 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is modified as a result of a partial cancellation */
typedef OrderCancelMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte canceled_shares[4]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.stock_locate[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 2 -> order_cancel_message_record.stock_locate[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = (order_cancel_message_base + 2 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = (order_cancel_message_base + 4 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 8 -> order_cancel_message_record.order_reference_number[order_cancel_message_at] = (order_cancel_message_base + 10 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 4 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = (order_cancel_message_base + 18 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 22 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.stock_locate[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> wire[at] = order_cancel_message_record.tracking_number[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> wire[at] = order_cancel_message_record.timestamp[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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

/* Order Cancel Message off the wire, 22 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.stock_locate[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> order_cancel_message_record.tracking_number[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.timestamp[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.stock_locate[order_cancel_message_at] == order_cancel_message_written.stock_locate[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 2 -> assert(order_cancel_message_read.tracking_number[order_cancel_message_at] == order_cancel_message_written.tracking_number[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> assert(order_cancel_message_read.timestamp[order_cancel_message_at] == order_cancel_message_written.timestamp[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
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

/* ---- Order Delete Message: 18 bytes ------------------------------------------ */

/* This message is sent whenever an order on the book is being cancelled */
typedef OrderDeleteMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.stock_locate[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 6 -> order_delete_message_record.timestamp[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
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
  :: order_delete_message_at < 2 -> order_delete_message_record.stock_locate[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = (order_delete_message_base + 2 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 6 -> order_delete_message_record.timestamp[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> order_delete_message_record.order_reference_number[order_delete_message_at] = (order_delete_message_base + 10 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> wire[at] = order_delete_message_record.stock_locate[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> wire[at] = order_delete_message_record.tracking_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 6 -> wire[at] = order_delete_message_record.timestamp[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> wire[at] = order_delete_message_record.order_reference_number[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.stock_locate[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> order_delete_message_record.tracking_number[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 6 -> order_delete_message_record.timestamp[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
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
  :: order_delete_message_at < 2 -> assert(order_delete_message_read.stock_locate[order_delete_message_at] == order_delete_message_written.stock_locate[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 2 -> assert(order_delete_message_read.tracking_number[order_delete_message_at] == order_delete_message_written.tracking_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 6 -> assert(order_delete_message_read.timestamp[order_delete_message_at] == order_delete_message_written.timestamp[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 8 -> assert(order_delete_message_read.order_reference_number[order_delete_message_at] == order_delete_message_written.order_reference_number[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replace Message: 35 bytes ----------------------------------------- */

/* This message is sent whenever an order on the book has been cancel-replaced */
typedef OrderReplaceMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte original_order_reference_number[8];
  byte new_order_reference_number[8];
  byte shares[4];
  byte price[4];
  byte elo_flag
};

int order_replace_message_at;

/* every byte of Order Replace Message set to one value */
inline fill_order_replace_message(order_replace_message_record, order_replace_message_value) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.stock_locate[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 6 -> order_replace_message_record.timestamp[order_replace_message_at] = order_replace_message_value; order_replace_message_at = order_replace_message_at + 1
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
  order_replace_message_record.elo_flag = order_replace_message_value;
  skip
}

/* each byte of Order Replace Message set to where it lies, so a field read out of place says so */
inline ramp_order_replace_message(order_replace_message_record, order_replace_message_base) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.stock_locate[order_replace_message_at] = (order_replace_message_base + 0 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = (order_replace_message_base + 2 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 6 -> order_replace_message_record.timestamp[order_replace_message_at] = (order_replace_message_base + 4 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.original_order_reference_number[order_replace_message_at] = (order_replace_message_base + 10 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 8 -> order_replace_message_record.new_order_reference_number[order_replace_message_at] = (order_replace_message_base + 18 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.shares[order_replace_message_at] = (order_replace_message_base + 26 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 4 -> order_replace_message_record.price[order_replace_message_at] = (order_replace_message_base + 30 + order_replace_message_at + 1) % 256; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_record.elo_flag = (order_replace_message_base + 34 + 1) % 256;
  skip
}

/* Order Replace Message to the wire, 35 bytes from where the cursor stands */
inline encode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> wire[at] = order_replace_message_record.stock_locate[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> wire[at] = order_replace_message_record.tracking_number[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 6 -> wire[at] = order_replace_message_record.timestamp[order_replace_message_at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
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
  wire[at] = order_replace_message_record.elo_flag; at = at + 1;
  skip
}

/* Order Replace Message off the wire, 35 bytes from where the cursor stands */
inline decode_order_replace_message(order_replace_message_record) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.stock_locate[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> order_replace_message_record.tracking_number[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 6 -> order_replace_message_record.timestamp[order_replace_message_at] = wire[at]; at = at + 1; order_replace_message_at = order_replace_message_at + 1
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
  order_replace_message_record.elo_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Replace Message is what was written, byte for byte */
inline equal_order_replace_message(order_replace_message_read, order_replace_message_written) {
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> assert(order_replace_message_read.stock_locate[order_replace_message_at] == order_replace_message_written.stock_locate[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 2 -> assert(order_replace_message_read.tracking_number[order_replace_message_at] == order_replace_message_written.tracking_number[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
  :: else -> break
  od;
  order_replace_message_at = 0;
  do
  :: order_replace_message_at < 6 -> assert(order_replace_message_read.timestamp[order_replace_message_at] == order_replace_message_written.timestamp[order_replace_message_at]); order_replace_message_at = order_replace_message_at + 1
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
  assert(order_replace_message_read.elo_flag == order_replace_message_written.elo_flag);
  skip
}

/* ---- Non Cross Trade Message: 43 bytes --------------------------------------- */

/* Trade Messages should be included in NASDAQ time-and-sales displays as well as volume and other market statistics */
typedef NonCrossTradeMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte order_reference_number[8];
  byte buy_sell_indicator;
  byte shares[4];
  byte stock[8];
  byte price[4];
  byte match_number[8]
};

int non_cross_trade_message_at;

/* every byte of Non Cross Trade Message set to one value */
inline fill_non_cross_trade_message(non_cross_trade_message_record, non_cross_trade_message_value) {
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.stock_locate[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.tracking_number[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 6 -> non_cross_trade_message_record.timestamp[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.order_reference_number[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_record.buy_sell_indicator = non_cross_trade_message_value;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.shares[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.stock[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.price[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.match_number[non_cross_trade_message_at] = non_cross_trade_message_value; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Non Cross Trade Message set to where it lies, so a field read out of place says so */
inline ramp_non_cross_trade_message(non_cross_trade_message_record, non_cross_trade_message_base) {
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.stock_locate[non_cross_trade_message_at] = (non_cross_trade_message_base + 0 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.tracking_number[non_cross_trade_message_at] = (non_cross_trade_message_base + 2 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 6 -> non_cross_trade_message_record.timestamp[non_cross_trade_message_at] = (non_cross_trade_message_base + 4 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.order_reference_number[non_cross_trade_message_at] = (non_cross_trade_message_base + 10 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_record.buy_sell_indicator = (non_cross_trade_message_base + 18 + 1) % 256;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.shares[non_cross_trade_message_at] = (non_cross_trade_message_base + 19 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.stock[non_cross_trade_message_at] = (non_cross_trade_message_base + 23 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.price[non_cross_trade_message_at] = (non_cross_trade_message_base + 31 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.match_number[non_cross_trade_message_at] = (non_cross_trade_message_base + 35 + non_cross_trade_message_at + 1) % 256; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Non Cross Trade Message to the wire, 43 bytes from where the cursor stands */
inline encode_non_cross_trade_message(non_cross_trade_message_record) {
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> wire[at] = non_cross_trade_message_record.stock_locate[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> wire[at] = non_cross_trade_message_record.tracking_number[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 6 -> wire[at] = non_cross_trade_message_record.timestamp[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> wire[at] = non_cross_trade_message_record.order_reference_number[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = non_cross_trade_message_record.buy_sell_indicator; at = at + 1;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> wire[at] = non_cross_trade_message_record.shares[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> wire[at] = non_cross_trade_message_record.stock[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> wire[at] = non_cross_trade_message_record.price[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> wire[at] = non_cross_trade_message_record.match_number[non_cross_trade_message_at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Non Cross Trade Message off the wire, 43 bytes from where the cursor stands */
inline decode_non_cross_trade_message(non_cross_trade_message_record) {
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.stock_locate[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> non_cross_trade_message_record.tracking_number[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 6 -> non_cross_trade_message_record.timestamp[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.order_reference_number[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_record.buy_sell_indicator = wire[at]; at = at + 1;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.shares[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.stock[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> non_cross_trade_message_record.price[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> non_cross_trade_message_record.match_number[non_cross_trade_message_at] = wire[at]; at = at + 1; non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Non Cross Trade Message is what was written, byte for byte */
inline equal_non_cross_trade_message(non_cross_trade_message_read, non_cross_trade_message_written) {
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> assert(non_cross_trade_message_read.stock_locate[non_cross_trade_message_at] == non_cross_trade_message_written.stock_locate[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 2 -> assert(non_cross_trade_message_read.tracking_number[non_cross_trade_message_at] == non_cross_trade_message_written.tracking_number[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 6 -> assert(non_cross_trade_message_read.timestamp[non_cross_trade_message_at] == non_cross_trade_message_written.timestamp[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> assert(non_cross_trade_message_read.order_reference_number[non_cross_trade_message_at] == non_cross_trade_message_written.order_reference_number[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  assert(non_cross_trade_message_read.buy_sell_indicator == non_cross_trade_message_written.buy_sell_indicator);
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> assert(non_cross_trade_message_read.shares[non_cross_trade_message_at] == non_cross_trade_message_written.shares[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> assert(non_cross_trade_message_read.stock[non_cross_trade_message_at] == non_cross_trade_message_written.stock[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 4 -> assert(non_cross_trade_message_read.price[non_cross_trade_message_at] == non_cross_trade_message_written.price[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  non_cross_trade_message_at = 0;
  do
  :: non_cross_trade_message_at < 8 -> assert(non_cross_trade_message_read.match_number[non_cross_trade_message_at] == non_cross_trade_message_written.match_number[non_cross_trade_message_at]); non_cross_trade_message_at = non_cross_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cross Trade Message: 39 bytes ------------------------------------------- */

/* Cross Trade message indicates that Nasdaq has completed its cross process for a specific security */
typedef CrossTradeMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte cross_shares[8];
  byte stock[8];
  byte cross_price[4];
  byte match_number[8];
  byte cross_type
};

int cross_trade_message_at;

/* every byte of Cross Trade Message set to one value */
inline fill_cross_trade_message(cross_trade_message_record, cross_trade_message_value) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.stock_locate[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock[cross_trade_message_at] = cross_trade_message_value; cross_trade_message_at = cross_trade_message_at + 1
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
  :: cross_trade_message_at < 2 -> cross_trade_message_record.stock_locate[cross_trade_message_at] = (cross_trade_message_base + 0 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = (cross_trade_message_base + 2 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = (cross_trade_message_base + 4 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = (cross_trade_message_base + 10 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock[cross_trade_message_at] = (cross_trade_message_base + 18 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 4 -> cross_trade_message_record.cross_price[cross_trade_message_at] = (cross_trade_message_base + 26 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.match_number[cross_trade_message_at] = (cross_trade_message_base + 30 + cross_trade_message_at + 1) % 256; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_record.cross_type = (cross_trade_message_base + 38 + 1) % 256;
  skip
}

/* Cross Trade Message to the wire, 39 bytes from where the cursor stands */
inline encode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.stock_locate[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> wire[at] = cross_trade_message_record.tracking_number[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> wire[at] = cross_trade_message_record.timestamp[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.cross_shares[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> wire[at] = cross_trade_message_record.stock[cross_trade_message_at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
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

/* Cross Trade Message off the wire, 39 bytes from where the cursor stands */
inline decode_cross_trade_message(cross_trade_message_record) {
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.stock_locate[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> cross_trade_message_record.tracking_number[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> cross_trade_message_record.timestamp[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.cross_shares[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> cross_trade_message_record.stock[cross_trade_message_at] = wire[at]; at = at + 1; cross_trade_message_at = cross_trade_message_at + 1
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
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.stock_locate[cross_trade_message_at] == cross_trade_message_written.stock_locate[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 2 -> assert(cross_trade_message_read.tracking_number[cross_trade_message_at] == cross_trade_message_written.tracking_number[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 6 -> assert(cross_trade_message_read.timestamp[cross_trade_message_at] == cross_trade_message_written.timestamp[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.cross_shares[cross_trade_message_at] == cross_trade_message_written.cross_shares[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
  :: else -> break
  od;
  cross_trade_message_at = 0;
  do
  :: cross_trade_message_at < 8 -> assert(cross_trade_message_read.stock[cross_trade_message_at] == cross_trade_message_written.stock[cross_trade_message_at]); cross_trade_message_at = cross_trade_message_at + 1
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

/* ---- Broken Trade Message: 18 bytes ------------------------------------------ */

/* The Broken Trade Message is sent whenever an execution on Nasdaq is broken */
typedef BrokenTradeMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte match_number[8]
};

int broken_trade_message_at;

/* every byte of Broken Trade Message set to one value */
inline fill_broken_trade_message(broken_trade_message_record, broken_trade_message_value) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.stock_locate[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 6 -> broken_trade_message_record.timestamp[broken_trade_message_at] = broken_trade_message_value; broken_trade_message_at = broken_trade_message_at + 1
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
  :: broken_trade_message_at < 2 -> broken_trade_message_record.stock_locate[broken_trade_message_at] = (broken_trade_message_base + 0 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = (broken_trade_message_base + 2 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 6 -> broken_trade_message_record.timestamp[broken_trade_message_at] = (broken_trade_message_base + 4 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> broken_trade_message_record.match_number[broken_trade_message_at] = (broken_trade_message_base + 10 + broken_trade_message_at + 1) % 256; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message to the wire, 18 bytes from where the cursor stands */
inline encode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> wire[at] = broken_trade_message_record.stock_locate[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> wire[at] = broken_trade_message_record.tracking_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 6 -> wire[at] = broken_trade_message_record.timestamp[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> wire[at] = broken_trade_message_record.match_number[broken_trade_message_at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Broken Trade Message off the wire, 18 bytes from where the cursor stands */
inline decode_broken_trade_message(broken_trade_message_record) {
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.stock_locate[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> broken_trade_message_record.tracking_number[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 6 -> broken_trade_message_record.timestamp[broken_trade_message_at] = wire[at]; at = at + 1; broken_trade_message_at = broken_trade_message_at + 1
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
  :: broken_trade_message_at < 2 -> assert(broken_trade_message_read.stock_locate[broken_trade_message_at] == broken_trade_message_written.stock_locate[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 2 -> assert(broken_trade_message_read.tracking_number[broken_trade_message_at] == broken_trade_message_written.tracking_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 6 -> assert(broken_trade_message_read.timestamp[broken_trade_message_at] == broken_trade_message_written.timestamp[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  broken_trade_message_at = 0;
  do
  :: broken_trade_message_at < 8 -> assert(broken_trade_message_read.match_number[broken_trade_message_at] == broken_trade_message_written.match_number[broken_trade_message_at]); broken_trade_message_at = broken_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Net Order Imbalance Indicator Message: 49 bytes ------------------------- */

/* NASDAQ disseminates NOII data */
typedef NetOrderImbalanceIndicatorMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte paired_shares[8];
  byte imbalance_shares[8];
  byte imbalance_direction;
  byte stock[8];
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
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.stock_locate[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.tracking_number[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.timestamp[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = net_order_imbalance_indicator_message_value; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.stock_locate[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 0 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.tracking_number[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 2 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.timestamp[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 4 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.paired_shares[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 10 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.imbalance_shares[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 18 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.imbalance_direction = (net_order_imbalance_indicator_message_base + 26 + 1) % 256;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 27 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.far_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 35 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.near_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 39 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 4 -> net_order_imbalance_indicator_message_record.current_reference_price[net_order_imbalance_indicator_message_at] = (net_order_imbalance_indicator_message_base + 43 + net_order_imbalance_indicator_message_at + 1) % 256; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_record.cross_type = (net_order_imbalance_indicator_message_base + 47 + 1) % 256;
  net_order_imbalance_indicator_message_record.price_variation_indicator = (net_order_imbalance_indicator_message_base + 48 + 1) % 256;
  skip
}

/* Net Order Imbalance Indicator Message to the wire, 49 bytes from where the cursor stands */
inline encode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> wire[at] = net_order_imbalance_indicator_message_record.stock_locate[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> wire[at] = net_order_imbalance_indicator_message_record.tracking_number[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> wire[at] = net_order_imbalance_indicator_message_record.timestamp[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 8 -> wire[at] = net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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

/* Net Order Imbalance Indicator Message off the wire, 49 bytes from where the cursor stands */
inline decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_record) {
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.stock_locate[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> net_order_imbalance_indicator_message_record.tracking_number[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> net_order_imbalance_indicator_message_record.timestamp[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 8 -> net_order_imbalance_indicator_message_record.stock[net_order_imbalance_indicator_message_at] = wire[at]; at = at + 1; net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 2 -> assert(net_order_imbalance_indicator_message_read.stock_locate[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.stock_locate[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 2 -> assert(net_order_imbalance_indicator_message_read.tracking_number[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.tracking_number[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
  :: else -> break
  od;
  net_order_imbalance_indicator_message_at = 0;
  do
  :: net_order_imbalance_indicator_message_at < 6 -> assert(net_order_imbalance_indicator_message_read.timestamp[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.timestamp[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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
  :: net_order_imbalance_indicator_message_at < 8 -> assert(net_order_imbalance_indicator_message_read.stock[net_order_imbalance_indicator_message_at] == net_order_imbalance_indicator_message_written.stock[net_order_imbalance_indicator_message_at]); net_order_imbalance_indicator_message_at = net_order_imbalance_indicator_message_at + 1
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

/* ---- Retail Price Improvement Indicator Message: 19 bytes -------------------- */

/* Identifies a retail interest indication of the Bid, Ask or both the Bid and Ask for NASDAQ-listed securities. */
typedef RetailPriceImprovementIndicatorMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte interest_flag
};

int retail_price_improvement_indicator_message_at;

/* every byte of Retail Price Improvement Indicator Message set to one value */
inline fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record, retail_price_improvement_indicator_message_value) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.stock_locate[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.tracking_number[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 6 -> retail_price_improvement_indicator_message_record.timestamp[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = retail_price_improvement_indicator_message_value; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = retail_price_improvement_indicator_message_value;
  skip
}

/* each byte of Retail Price Improvement Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record, retail_price_improvement_indicator_message_base) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.stock_locate[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 0 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.tracking_number[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 2 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 6 -> retail_price_improvement_indicator_message_record.timestamp[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 4 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = (retail_price_improvement_indicator_message_base + 10 + retail_price_improvement_indicator_message_at + 1) % 256; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = (retail_price_improvement_indicator_message_base + 18 + 1) % 256;
  skip
}

/* Retail Price Improvement Indicator Message to the wire, 19 bytes from where the cursor stands */
inline encode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> wire[at] = retail_price_improvement_indicator_message_record.stock_locate[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> wire[at] = retail_price_improvement_indicator_message_record.tracking_number[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 6 -> wire[at] = retail_price_improvement_indicator_message_record.timestamp[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> wire[at] = retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_price_improvement_indicator_message_record.interest_flag; at = at + 1;
  skip
}

/* Retail Price Improvement Indicator Message off the wire, 19 bytes from where the cursor stands */
inline decode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_record) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.stock_locate[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> retail_price_improvement_indicator_message_record.tracking_number[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 6 -> retail_price_improvement_indicator_message_record.timestamp[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> retail_price_improvement_indicator_message_record.stock[retail_price_improvement_indicator_message_at] = wire[at]; at = at + 1; retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_record.interest_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Price Improvement Indicator Message is what was written, byte for byte */
inline equal_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_read, retail_price_improvement_indicator_message_written) {
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> assert(retail_price_improvement_indicator_message_read.stock_locate[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.stock_locate[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 2 -> assert(retail_price_improvement_indicator_message_read.tracking_number[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.tracking_number[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 6 -> assert(retail_price_improvement_indicator_message_read.timestamp[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.timestamp[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_indicator_message_at = 0;
  do
  :: retail_price_improvement_indicator_message_at < 8 -> assert(retail_price_improvement_indicator_message_read.stock[retail_price_improvement_indicator_message_at] == retail_price_improvement_indicator_message_written.stock[retail_price_improvement_indicator_message_at]); retail_price_improvement_indicator_message_at = retail_price_improvement_indicator_message_at + 1
  :: else -> break
  od;
  assert(retail_price_improvement_indicator_message_read.interest_flag == retail_price_improvement_indicator_message_written.interest_flag);
  skip
}

/* ---- Direct Listing With Capital Raise Price Discovery Message: 47 bytes ----- */

/* This message is disseminated only for Direct Listing with Capital Raise (DLCR) securities */
typedef DirectListingWithCapitalRaisePriceDiscoveryMessage {
  byte stock_locate[2];
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte open_eligibility_status;
  byte minimum_allowable_price[4];
  byte maximum_allowable_price[4];
  byte near_execution_price[4];
  byte near_execution_time[8];
  byte lower_price_range_collar[4];
  byte upper_price_range_collar[4]
};

int direct_listing_with_capital_raise_price_discovery_message_at;

/* every byte of Direct Listing With Capital Raise Price Discovery Message set to one value */
inline fill_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_record, direct_listing_with_capital_raise_price_discovery_message_value) {
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 6 -> direct_listing_with_capital_raise_price_discovery_message_record.timestamp[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.stock[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_record.open_eligibility_status = direct_listing_with_capital_raise_price_discovery_message_value;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = direct_listing_with_capital_raise_price_discovery_message_value; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Direct Listing With Capital Raise Price Discovery Message set to where it lies, so a field read out of place says so */
inline ramp_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_record, direct_listing_with_capital_raise_price_discovery_message_base) {
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 0 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 2 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 6 -> direct_listing_with_capital_raise_price_discovery_message_record.timestamp[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 4 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.stock[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 10 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_record.open_eligibility_status = (direct_listing_with_capital_raise_price_discovery_message_base + 18 + 1) % 256;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 19 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 23 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 27 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 31 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 39 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = (direct_listing_with_capital_raise_price_discovery_message_base + 43 + direct_listing_with_capital_raise_price_discovery_message_at + 1) % 256; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  skip
}

/* Direct Listing With Capital Raise Price Discovery Message to the wire, 47 bytes from where the cursor stands */
inline encode_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_record) {
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 6 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.timestamp[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.stock[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.open_eligibility_status; at = at + 1;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> wire[at] = direct_listing_with_capital_raise_price_discovery_message_record.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  skip
}

/* Direct Listing With Capital Raise Price Discovery Message off the wire, 47 bytes from where the cursor stands */
inline decode_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_record) {
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> direct_listing_with_capital_raise_price_discovery_message_record.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 6 -> direct_listing_with_capital_raise_price_discovery_message_record.timestamp[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.stock[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_record.open_eligibility_status = wire[at]; at = at + 1;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> direct_listing_with_capital_raise_price_discovery_message_record.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> direct_listing_with_capital_raise_price_discovery_message_record.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] = wire[at]; at = at + 1; direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Direct Listing With Capital Raise Price Discovery Message is what was written, byte for byte */
inline equal_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_read, direct_listing_with_capital_raise_price_discovery_message_written) {
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.stock_locate[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 2 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.tracking_number[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 6 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.timestamp[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.timestamp[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.stock[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.stock[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  assert(direct_listing_with_capital_raise_price_discovery_message_read.open_eligibility_status == direct_listing_with_capital_raise_price_discovery_message_written.open_eligibility_status);
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.minimum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.maximum_allowable_price[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.near_execution_price[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 8 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.near_execution_time[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.lower_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
  :: else -> break
  od;
  direct_listing_with_capital_raise_price_discovery_message_at = 0;
  do
  :: direct_listing_with_capital_raise_price_discovery_message_at < 4 -> assert(direct_listing_with_capital_raise_price_discovery_message_read.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at] == direct_listing_with_capital_raise_price_discovery_message_written.upper_price_range_collar[direct_listing_with_capital_raise_price_discovery_message_at]); direct_listing_with_capital_raise_price_discovery_message_at = direct_listing_with_capital_raise_price_discovery_message_at + 1
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
    assert(at == 24);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 24);
    equal_stock_trading_action_message(stock_trading_action_message_got, stock_trading_action_message_sent)
  }
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message: encoded, read back, and compared */
proctype check_reg_sho_short_sale_price_test_restricted_indicator_message() {
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_sent;
  RegShoShortSalePriceTestRestrictedIndicatorMessage reg_sho_short_sale_price_test_restricted_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  :: pattern == 1 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 32)
  :: pattern == 2 -> fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 255)
  :: else -> ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_sent);
    assert(at == 19);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 19);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
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
    assert(at == 25);
    at = 0;
    decode_market_participant_position_message(market_participant_position_message_got);
    assert(at == 25);
    equal_market_participant_position_message(market_participant_position_message_got, market_participant_position_message_sent)
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
    assert(at == 34);
    at = 0;
    decode_mwcb_decline_level_message(mwcb_decline_level_message_got);
    assert(at == 34);
    equal_mwcb_decline_level_message(mwcb_decline_level_message_got, mwcb_decline_level_message_sent)
  }
}

/* Mwcb Status Level Message: encoded, read back, and compared */
proctype check_mwcb_status_level_message() {
  MwcbStatusLevelMessage mwcb_status_level_message_sent;
  MwcbStatusLevelMessage mwcb_status_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_status_level_message(mwcb_status_level_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_status_level_message(mwcb_status_level_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_status_level_message(mwcb_status_level_message_sent, 255)
  :: else -> ramp_mwcb_status_level_message(mwcb_status_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_status_level_message(mwcb_status_level_message_sent);
    assert(at == 11);
    at = 0;
    decode_mwcb_status_level_message(mwcb_status_level_message_got);
    assert(at == 11);
    equal_mwcb_status_level_message(mwcb_status_level_message_got, mwcb_status_level_message_sent)
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
    assert(at == 27);
    at = 0;
    decode_ipo_quoting_period_update(ipo_quoting_period_update_got);
    assert(at == 27);
    equal_ipo_quoting_period_update(ipo_quoting_period_update_got, ipo_quoting_period_update_sent)
  }
}

/* Luld Auction Collar Message: encoded, read back, and compared */
proctype check_luld_auction_collar_message() {
  LuldAuctionCollarMessage luld_auction_collar_message_sent;
  LuldAuctionCollarMessage luld_auction_collar_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_luld_auction_collar_message(luld_auction_collar_message_sent, 0)
  :: pattern == 1 -> fill_luld_auction_collar_message(luld_auction_collar_message_sent, 32)
  :: pattern == 2 -> fill_luld_auction_collar_message(luld_auction_collar_message_sent, 255)
  :: else -> ramp_luld_auction_collar_message(luld_auction_collar_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_luld_auction_collar_message(luld_auction_collar_message_sent);
    assert(at == 32);
    at = 0;
    decode_luld_auction_collar_message(luld_auction_collar_message_got);
    assert(at == 32);
    equal_luld_auction_collar_message(luld_auction_collar_message_got, luld_auction_collar_message_sent)
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
    assert(at == 20);
    at = 0;
    decode_operational_halt_message(operational_halt_message_got);
    assert(at == 20);
    equal_operational_halt_message(operational_halt_message_got, operational_halt_message_sent)
  }
}

/* Add Order No Mpid Attribution Message: encoded, read back, and compared */
proctype check_add_order_no_mpid_attribution_message() {
  AddOrderNoMpidAttributionMessage add_order_no_mpid_attribution_message_sent;
  AddOrderNoMpidAttributionMessage add_order_no_mpid_attribution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_sent, 0)
  :: pattern == 1 -> fill_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_sent, 32)
  :: pattern == 2 -> fill_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_sent, 255)
  :: else -> ramp_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_sent);
    assert(at == 35);
    at = 0;
    decode_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_got);
    assert(at == 35);
    equal_add_order_no_mpid_attribution_message(add_order_no_mpid_attribution_message_got, add_order_no_mpid_attribution_message_sent)
  }
}

/* Add Order With Mpid Attribution Message: encoded, read back, and compared */
proctype check_add_order_with_mpid_attribution_message() {
  AddOrderWithMpidAttributionMessage add_order_with_mpid_attribution_message_sent;
  AddOrderWithMpidAttributionMessage add_order_with_mpid_attribution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_sent, 0)
  :: pattern == 1 -> fill_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_sent, 32)
  :: pattern == 2 -> fill_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_sent, 255)
  :: else -> ramp_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_sent);
    assert(at == 40);
    at = 0;
    decode_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_got);
    assert(at == 40);
    equal_add_order_with_mpid_attribution_message(add_order_with_mpid_attribution_message_got, add_order_with_mpid_attribution_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 30);
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
    assert(at == 35);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 35);
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
    assert(at == 22);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 22);
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
    assert(at == 18);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 18);
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
    assert(at == 35);
    at = 0;
    decode_order_replace_message(order_replace_message_got);
    assert(at == 35);
    equal_order_replace_message(order_replace_message_got, order_replace_message_sent)
  }
}

/* Non Cross Trade Message: encoded, read back, and compared */
proctype check_non_cross_trade_message() {
  NonCrossTradeMessage non_cross_trade_message_sent;
  NonCrossTradeMessage non_cross_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_non_cross_trade_message(non_cross_trade_message_sent, 0)
  :: pattern == 1 -> fill_non_cross_trade_message(non_cross_trade_message_sent, 32)
  :: pattern == 2 -> fill_non_cross_trade_message(non_cross_trade_message_sent, 255)
  :: else -> ramp_non_cross_trade_message(non_cross_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_non_cross_trade_message(non_cross_trade_message_sent);
    assert(at == 43);
    at = 0;
    decode_non_cross_trade_message(non_cross_trade_message_got);
    assert(at == 43);
    equal_non_cross_trade_message(non_cross_trade_message_got, non_cross_trade_message_sent)
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
    assert(at == 39);
    at = 0;
    decode_cross_trade_message(cross_trade_message_got);
    assert(at == 39);
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
    assert(at == 18);
    at = 0;
    decode_broken_trade_message(broken_trade_message_got);
    assert(at == 18);
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
    assert(at == 49);
    at = 0;
    decode_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got);
    assert(at == 49);
    equal_net_order_imbalance_indicator_message(net_order_imbalance_indicator_message_got, net_order_imbalance_indicator_message_sent)
  }
}

/* Retail Price Improvement Indicator Message: encoded, read back, and compared */
proctype check_retail_price_improvement_indicator_message() {
  RetailPriceImprovementIndicatorMessage retail_price_improvement_indicator_message_sent;
  RetailPriceImprovementIndicatorMessage retail_price_improvement_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 0)
  :: pattern == 1 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 32)
  :: pattern == 2 -> fill_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 255)
  :: else -> ramp_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_sent);
    assert(at == 19);
    at = 0;
    decode_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_got);
    assert(at == 19);
    equal_retail_price_improvement_indicator_message(retail_price_improvement_indicator_message_got, retail_price_improvement_indicator_message_sent)
  }
}

/* Direct Listing With Capital Raise Price Discovery Message: encoded, read back, and compared */
proctype check_direct_listing_with_capital_raise_price_discovery_message() {
  DirectListingWithCapitalRaisePriceDiscoveryMessage direct_listing_with_capital_raise_price_discovery_message_sent;
  DirectListingWithCapitalRaisePriceDiscoveryMessage direct_listing_with_capital_raise_price_discovery_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_sent, 0)
  :: pattern == 1 -> fill_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_sent, 32)
  :: pattern == 2 -> fill_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_sent, 255)
  :: else -> ramp_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_sent);
    assert(at == 47);
    at = 0;
    decode_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_got);
    assert(at == 47);
    equal_direct_listing_with_capital_raise_price_discovery_message(direct_listing_with_capital_raise_price_discovery_message_got, direct_listing_with_capital_raise_price_discovery_message_sent)
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
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_market_participant_position_message()
  :: run check_mwcb_decline_level_message()
  :: run check_mwcb_status_level_message()
  :: run check_ipo_quoting_period_update()
  :: run check_luld_auction_collar_message()
  :: run check_operational_halt_message()
  :: run check_add_order_no_mpid_attribution_message()
  :: run check_add_order_with_mpid_attribution_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_order_cancel_message()
  :: run check_order_delete_message()
  :: run check_order_replace_message()
  :: run check_non_cross_trade_message()
  :: run check_cross_trade_message()
  :: run check_broken_trade_message()
  :: run check_net_order_imbalance_indicator_message()
  :: run check_retail_price_improvement_indicator_message()
  :: run check_direct_listing_with_capital_raise_price_discovery_message()
  fi
}
