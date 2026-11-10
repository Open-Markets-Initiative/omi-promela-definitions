/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Snapshot
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
 *   - the dispatch that chooses a message by its type
 *   - a field present only on a condition
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 114

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Server Tcp Packet Header: 3 bytes --------------------------------------- */

/* Packet header of a packet sent by the server */
typedef ServerTcpPacketHeader {
  byte packet_length[2];
  byte server_packet_type
};

int server_tcp_packet_header_at;

/* every byte of Server Tcp Packet Header set to one value */
inline fill_server_tcp_packet_header(server_tcp_packet_header_record, server_tcp_packet_header_value) {
  server_tcp_packet_header_at = 0;
  do
  :: server_tcp_packet_header_at < 2 -> server_tcp_packet_header_record.packet_length[server_tcp_packet_header_at] = server_tcp_packet_header_value; server_tcp_packet_header_at = server_tcp_packet_header_at + 1
  :: else -> break
  od;
  server_tcp_packet_header_record.server_packet_type = server_tcp_packet_header_value;
  skip
}

/* each byte of Server Tcp Packet Header set to where it lies, so a field read out of place says so */
inline ramp_server_tcp_packet_header(server_tcp_packet_header_record, server_tcp_packet_header_base) {
  server_tcp_packet_header_at = 0;
  do
  :: server_tcp_packet_header_at < 2 -> server_tcp_packet_header_record.packet_length[server_tcp_packet_header_at] = (server_tcp_packet_header_base + 0 + server_tcp_packet_header_at + 1) % 256; server_tcp_packet_header_at = server_tcp_packet_header_at + 1
  :: else -> break
  od;
  server_tcp_packet_header_record.server_packet_type = (server_tcp_packet_header_base + 2 + 1) % 256;
  skip
}

/* Server Tcp Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_server_tcp_packet_header(server_tcp_packet_header_record) {
  server_tcp_packet_header_at = 0;
  do
  :: server_tcp_packet_header_at < 2 -> wire[at] = server_tcp_packet_header_record.packet_length[server_tcp_packet_header_at]; at = at + 1; server_tcp_packet_header_at = server_tcp_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = server_tcp_packet_header_record.server_packet_type; at = at + 1;
  skip
}

/* Server Tcp Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_server_tcp_packet_header(server_tcp_packet_header_record) {
  server_tcp_packet_header_at = 0;
  do
  :: server_tcp_packet_header_at < 2 -> server_tcp_packet_header_record.packet_length[server_tcp_packet_header_at] = wire[at]; at = at + 1; server_tcp_packet_header_at = server_tcp_packet_header_at + 1
  :: else -> break
  od;
  server_tcp_packet_header_record.server_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Server Tcp Packet Header is what was written, byte for byte */
inline equal_server_tcp_packet_header(server_tcp_packet_header_read, server_tcp_packet_header_written) {
  server_tcp_packet_header_at = 0;
  do
  :: server_tcp_packet_header_at < 2 -> assert(server_tcp_packet_header_read.packet_length[server_tcp_packet_header_at] == server_tcp_packet_header_written.packet_length[server_tcp_packet_header_at]); server_tcp_packet_header_at = server_tcp_packet_header_at + 1
  :: else -> break
  od;
  assert(server_tcp_packet_header_read.server_packet_type == server_tcp_packet_header_written.server_packet_type);
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

/* UTP Snap-Shot message header — fixed Version + Message Category prefix */
typedef MessageHeader {
  byte version;
  byte message_category
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.version = message_header_value;
  message_header_record.message_category = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.version = (message_header_base + 0 + 1) % 256;
  message_header_record.message_category = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.version; at = at + 1;
  wire[at] = message_header_record.message_category; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.version = wire[at]; at = at + 1;
  message_header_record.message_category = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.version == message_header_written.version);
  assert(message_header_read.message_category == message_header_written.message_category);
  skip
}

/* ---- Issue Symbol Directory Message: 87 bytes -------------------------------- */

/* Issue Symbol Directory Message providing reference data for NASDAQ-listed securities. To be retired in Q1 2027 in favor of the Enhanced Issue Symbol Directory Message (Type F). */
typedef IssueSymbolDirectoryMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte old_symbol[11];
  byte issue_name[30];
  byte issue_type;
  byte issue_subtype[2];
  byte market_tier;
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte round_lot_size[2];
  byte financial_status_indicator
};

int issue_symbol_directory_message_at;

/* every byte of Issue Symbol Directory Message set to one value */
inline fill_issue_symbol_directory_message(issue_symbol_directory_message_record, issue_symbol_directory_message_value) {
  issue_symbol_directory_message_record.market_center_originator = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.sub_market_center_id = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.authenticity = issue_symbol_directory_message_value;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = issue_symbol_directory_message_value;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = issue_symbol_directory_message_value; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = issue_symbol_directory_message_value;
  skip
}

/* each byte of Issue Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_issue_symbol_directory_message(issue_symbol_directory_message_record, issue_symbol_directory_message_base) {
  issue_symbol_directory_message_record.market_center_originator = (issue_symbol_directory_message_base + 0 + 1) % 256;
  issue_symbol_directory_message_record.sub_market_center_id = (issue_symbol_directory_message_base + 1 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 2 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 10 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 18 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 26 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 37 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 48 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = (issue_symbol_directory_message_base + 78 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 79 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = (issue_symbol_directory_message_base + 81 + 1) % 256;
  issue_symbol_directory_message_record.authenticity = (issue_symbol_directory_message_base + 82 + 1) % 256;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = (issue_symbol_directory_message_base + 83 + 1) % 256;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = (issue_symbol_directory_message_base + 84 + issue_symbol_directory_message_at + 1) % 256; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = (issue_symbol_directory_message_base + 86 + 1) % 256;
  skip
}

/* Issue Symbol Directory Message to the wire, 87 bytes from where the cursor stands */
inline encode_issue_symbol_directory_message(issue_symbol_directory_message_record) {
  wire[at] = issue_symbol_directory_message_record.market_center_originator; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.sub_market_center_id; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> wire[at] = issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> wire[at] = issue_symbol_directory_message_record.symbol[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> wire[at] = issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> wire[at] = issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.issue_type; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> wire[at] = issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.market_tier; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.authenticity; at = at + 1;
  wire[at] = issue_symbol_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> wire[at] = issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = issue_symbol_directory_message_record.financial_status_indicator; at = at + 1;
  skip
}

/* Issue Symbol Directory Message off the wire, 87 bytes from where the cursor stands */
inline decode_issue_symbol_directory_message(issue_symbol_directory_message_record) {
  issue_symbol_directory_message_record.market_center_originator = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.sub_market_center_id = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.sip_timestamp[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.timestamp_1[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> issue_symbol_directory_message_record.participant_token[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.symbol[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> issue_symbol_directory_message_record.old_symbol[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> issue_symbol_directory_message_record.issue_name[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.issue_type = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.issue_subtype[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.market_tier = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.authenticity = wire[at]; at = at + 1;
  issue_symbol_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> issue_symbol_directory_message_record.round_lot_size[issue_symbol_directory_message_at] = wire[at]; at = at + 1; issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Issue Symbol Directory Message is what was written, byte for byte */
inline equal_issue_symbol_directory_message(issue_symbol_directory_message_read, issue_symbol_directory_message_written) {
  assert(issue_symbol_directory_message_read.market_center_originator == issue_symbol_directory_message_written.market_center_originator);
  assert(issue_symbol_directory_message_read.sub_market_center_id == issue_symbol_directory_message_written.sub_market_center_id);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.sip_timestamp[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.sip_timestamp[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.timestamp_1[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.timestamp_1[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 8 -> assert(issue_symbol_directory_message_read.participant_token[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.participant_token[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> assert(issue_symbol_directory_message_read.symbol[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.symbol[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 11 -> assert(issue_symbol_directory_message_read.old_symbol[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.old_symbol[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 30 -> assert(issue_symbol_directory_message_read.issue_name[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.issue_name[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.issue_type == issue_symbol_directory_message_written.issue_type);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> assert(issue_symbol_directory_message_read.issue_subtype[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.issue_subtype[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.market_tier == issue_symbol_directory_message_written.market_tier);
  assert(issue_symbol_directory_message_read.authenticity == issue_symbol_directory_message_written.authenticity);
  assert(issue_symbol_directory_message_read.short_sale_threshold_indicator == issue_symbol_directory_message_written.short_sale_threshold_indicator);
  issue_symbol_directory_message_at = 0;
  do
  :: issue_symbol_directory_message_at < 2 -> assert(issue_symbol_directory_message_read.round_lot_size[issue_symbol_directory_message_at] == issue_symbol_directory_message_written.round_lot_size[issue_symbol_directory_message_at]); issue_symbol_directory_message_at = issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(issue_symbol_directory_message_read.financial_status_indicator == issue_symbol_directory_message_written.financial_status_indicator);
  skip
}

/* ---- Enhanced Issue Symbol Directory Message: 114 bytes ---------------------- */

/* Enhanced Issue Symbol Directory Message — introduced in v3.0 alongside the existing Issue Symbol Directory Message (Type B) to support the SEC MPI Tick Rule (Nov 2026) and Extended Operational Hours (Dec 6, 2026). Adds ETP/IPO/MPI/Trading-State/Halt-Reason/Reg-SHO fields and two RESERVED prior-close prices. */
typedef EnhancedIssueSymbolDirectoryMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte old_symbol[11];
  byte issue_name[30];
  byte issue_type;
  byte issue_subtype[2];
  byte market_tier;
  byte authenticity;
  byte short_sale_threshold_indicator;
  byte round_lot_size[2];
  byte financial_status_indicator;
  byte etp_indicator;
  byte new_issue_indicator;
  byte mpi_tick;
  byte trading_state;
  byte halt_reason[6];
  byte reg_sho_action;
  byte consolidated_prior_day_close_price[8];
  byte listing_market_official_prior_day_close_price[8]
};

int enhanced_issue_symbol_directory_message_at;

/* every byte of Enhanced Issue Symbol Directory Message set to one value */
inline fill_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_record, enhanced_issue_symbol_directory_message_value) {
  enhanced_issue_symbol_directory_message_record.market_center_originator = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.sub_market_center_id = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.sip_timestamp[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.timestamp_1[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.participant_token[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.symbol[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.old_symbol[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 30 -> enhanced_issue_symbol_directory_message_record.issue_name[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.issue_type = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.issue_subtype[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.market_tier = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.authenticity = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.short_sale_threshold_indicator = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.round_lot_size[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.financial_status_indicator = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.etp_indicator = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.new_issue_indicator = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.mpi_tick = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_record.trading_state = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 6 -> enhanced_issue_symbol_directory_message_record.halt_reason[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.reg_sho_action = enhanced_issue_symbol_directory_message_value;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = enhanced_issue_symbol_directory_message_value; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enhanced Issue Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_record, enhanced_issue_symbol_directory_message_base) {
  enhanced_issue_symbol_directory_message_record.market_center_originator = (enhanced_issue_symbol_directory_message_base + 0 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.sub_market_center_id = (enhanced_issue_symbol_directory_message_base + 1 + 1) % 256;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.sip_timestamp[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 2 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.timestamp_1[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 10 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.participant_token[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 18 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.symbol[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 26 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.old_symbol[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 37 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 30 -> enhanced_issue_symbol_directory_message_record.issue_name[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 48 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.issue_type = (enhanced_issue_symbol_directory_message_base + 78 + 1) % 256;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.issue_subtype[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 79 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.market_tier = (enhanced_issue_symbol_directory_message_base + 81 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.authenticity = (enhanced_issue_symbol_directory_message_base + 82 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.short_sale_threshold_indicator = (enhanced_issue_symbol_directory_message_base + 83 + 1) % 256;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.round_lot_size[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 84 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.financial_status_indicator = (enhanced_issue_symbol_directory_message_base + 86 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.etp_indicator = (enhanced_issue_symbol_directory_message_base + 87 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.new_issue_indicator = (enhanced_issue_symbol_directory_message_base + 88 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.mpi_tick = (enhanced_issue_symbol_directory_message_base + 89 + 1) % 256;
  enhanced_issue_symbol_directory_message_record.trading_state = (enhanced_issue_symbol_directory_message_base + 90 + 1) % 256;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 6 -> enhanced_issue_symbol_directory_message_record.halt_reason[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 91 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.reg_sho_action = (enhanced_issue_symbol_directory_message_base + 97 + 1) % 256;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 98 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = (enhanced_issue_symbol_directory_message_base + 106 + enhanced_issue_symbol_directory_message_at + 1) % 256; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Issue Symbol Directory Message to the wire, 114 bytes from where the cursor stands */
inline encode_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_record) {
  wire[at] = enhanced_issue_symbol_directory_message_record.market_center_originator; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.sub_market_center_id; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> wire[at] = enhanced_issue_symbol_directory_message_record.sip_timestamp[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> wire[at] = enhanced_issue_symbol_directory_message_record.timestamp_1[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> wire[at] = enhanced_issue_symbol_directory_message_record.participant_token[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> wire[at] = enhanced_issue_symbol_directory_message_record.symbol[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> wire[at] = enhanced_issue_symbol_directory_message_record.old_symbol[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 30 -> wire[at] = enhanced_issue_symbol_directory_message_record.issue_name[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_issue_symbol_directory_message_record.issue_type; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> wire[at] = enhanced_issue_symbol_directory_message_record.issue_subtype[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_issue_symbol_directory_message_record.market_tier; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.authenticity; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.short_sale_threshold_indicator; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> wire[at] = enhanced_issue_symbol_directory_message_record.round_lot_size[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_issue_symbol_directory_message_record.financial_status_indicator; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.etp_indicator; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.new_issue_indicator; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.mpi_tick; at = at + 1;
  wire[at] = enhanced_issue_symbol_directory_message_record.trading_state; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 6 -> wire[at] = enhanced_issue_symbol_directory_message_record.halt_reason[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_issue_symbol_directory_message_record.reg_sho_action; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> wire[at] = enhanced_issue_symbol_directory_message_record.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> wire[at] = enhanced_issue_symbol_directory_message_record.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Issue Symbol Directory Message off the wire, 114 bytes from where the cursor stands */
inline decode_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_record) {
  enhanced_issue_symbol_directory_message_record.market_center_originator = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.sub_market_center_id = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.sip_timestamp[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.timestamp_1[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.participant_token[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.symbol[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> enhanced_issue_symbol_directory_message_record.old_symbol[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 30 -> enhanced_issue_symbol_directory_message_record.issue_name[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.issue_type = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.issue_subtype[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.market_tier = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.authenticity = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.short_sale_threshold_indicator = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> enhanced_issue_symbol_directory_message_record.round_lot_size[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.financial_status_indicator = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.etp_indicator = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.new_issue_indicator = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.mpi_tick = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_record.trading_state = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 6 -> enhanced_issue_symbol_directory_message_record.halt_reason[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_record.reg_sho_action = wire[at]; at = at + 1;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> enhanced_issue_symbol_directory_message_record.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at] = wire[at]; at = at + 1; enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enhanced Issue Symbol Directory Message is what was written, byte for byte */
inline equal_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_read, enhanced_issue_symbol_directory_message_written) {
  assert(enhanced_issue_symbol_directory_message_read.market_center_originator == enhanced_issue_symbol_directory_message_written.market_center_originator);
  assert(enhanced_issue_symbol_directory_message_read.sub_market_center_id == enhanced_issue_symbol_directory_message_written.sub_market_center_id);
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> assert(enhanced_issue_symbol_directory_message_read.sip_timestamp[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.sip_timestamp[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> assert(enhanced_issue_symbol_directory_message_read.timestamp_1[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.timestamp_1[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> assert(enhanced_issue_symbol_directory_message_read.participant_token[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.participant_token[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> assert(enhanced_issue_symbol_directory_message_read.symbol[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.symbol[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 11 -> assert(enhanced_issue_symbol_directory_message_read.old_symbol[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.old_symbol[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 30 -> assert(enhanced_issue_symbol_directory_message_read.issue_name[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.issue_name[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(enhanced_issue_symbol_directory_message_read.issue_type == enhanced_issue_symbol_directory_message_written.issue_type);
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> assert(enhanced_issue_symbol_directory_message_read.issue_subtype[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.issue_subtype[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(enhanced_issue_symbol_directory_message_read.market_tier == enhanced_issue_symbol_directory_message_written.market_tier);
  assert(enhanced_issue_symbol_directory_message_read.authenticity == enhanced_issue_symbol_directory_message_written.authenticity);
  assert(enhanced_issue_symbol_directory_message_read.short_sale_threshold_indicator == enhanced_issue_symbol_directory_message_written.short_sale_threshold_indicator);
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 2 -> assert(enhanced_issue_symbol_directory_message_read.round_lot_size[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.round_lot_size[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(enhanced_issue_symbol_directory_message_read.financial_status_indicator == enhanced_issue_symbol_directory_message_written.financial_status_indicator);
  assert(enhanced_issue_symbol_directory_message_read.etp_indicator == enhanced_issue_symbol_directory_message_written.etp_indicator);
  assert(enhanced_issue_symbol_directory_message_read.new_issue_indicator == enhanced_issue_symbol_directory_message_written.new_issue_indicator);
  assert(enhanced_issue_symbol_directory_message_read.mpi_tick == enhanced_issue_symbol_directory_message_written.mpi_tick);
  assert(enhanced_issue_symbol_directory_message_read.trading_state == enhanced_issue_symbol_directory_message_written.trading_state);
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 6 -> assert(enhanced_issue_symbol_directory_message_read.halt_reason[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.halt_reason[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(enhanced_issue_symbol_directory_message_read.reg_sho_action == enhanced_issue_symbol_directory_message_written.reg_sho_action);
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> assert(enhanced_issue_symbol_directory_message_read.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.consolidated_prior_day_close_price[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  enhanced_issue_symbol_directory_message_at = 0;
  do
  :: enhanced_issue_symbol_directory_message_at < 8 -> assert(enhanced_issue_symbol_directory_message_read.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at] == enhanced_issue_symbol_directory_message_written.listing_market_official_prior_day_close_price[enhanced_issue_symbol_directory_message_at]); enhanced_issue_symbol_directory_message_at = enhanced_issue_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 38 bytes ---- */

/* Reg SHO Restriction Indicator Message indicating the Rule 201 status for NASDAQ-listed securities. Snap-Shot sends a full spin of all active securities reflecting the current Reg SHO Action. */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + 1) % 256;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 1 + 1) % 256;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 2 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 10 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 18 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 26 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 37 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 38 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator; at = at + 1;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 38 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_record.market_center_originator = wire[at]; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.sub_market_center_id = wire[at]; at = at + 1;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.market_center_originator == reg_sho_short_sale_price_test_restricted_indicator_message_written.market_center_originator);
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.sub_market_center_id == reg_sho_short_sale_price_test_restricted_indicator_message_written.sub_market_center_id);
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.sip_timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.timestamp_1[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.participant_token[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 11 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Cross Sro Trading Action Message: 56 bytes ------------------------------ */

/* Cross SRO Trading Action message. In Snap-Shot, sent only for NASDAQ-listed issues currently halted, in a Quote Resumption, or in a LULD pause. Absence implies the issue is eligible for normal quoting and trading. */
typedef CrossSroTradingActionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte trading_action_code;
  byte trading_action_sequence_number[4];
  byte action_time[8];
  byte reason_for_the_trading_action[6]
};

int cross_sro_trading_action_message_at;

/* every byte of Cross Sro Trading Action Message set to one value */
inline fill_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_value) {
  cross_sro_trading_action_message_record.market_center_originator = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_record.sub_market_center_id = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = cross_sro_trading_action_message_value;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = cross_sro_trading_action_message_value; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cross Sro Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_cross_sro_trading_action_message(cross_sro_trading_action_message_record, cross_sro_trading_action_message_base) {
  cross_sro_trading_action_message_record.market_center_originator = (cross_sro_trading_action_message_base + 0 + 1) % 256;
  cross_sro_trading_action_message_record.sub_market_center_id = (cross_sro_trading_action_message_base + 1 + 1) % 256;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 2 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 10 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 18 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 26 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = (cross_sro_trading_action_message_base + 37 + 1) % 256;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 38 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 42 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = (cross_sro_trading_action_message_base + 50 + cross_sro_trading_action_message_at + 1) % 256; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message to the wire, 56 bytes from where the cursor stands */
inline encode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  wire[at] = cross_sro_trading_action_message_record.market_center_originator; at = at + 1;
  wire[at] = cross_sro_trading_action_message_record.sub_market_center_id; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> wire[at] = cross_sro_trading_action_message_record.symbol[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = cross_sro_trading_action_message_record.trading_action_code; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> wire[at] = cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> wire[at] = cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> wire[at] = cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cross Sro Trading Action Message off the wire, 56 bytes from where the cursor stands */
inline decode_cross_sro_trading_action_message(cross_sro_trading_action_message_record) {
  cross_sro_trading_action_message_record.market_center_originator = wire[at]; at = at + 1;
  cross_sro_trading_action_message_record.sub_market_center_id = wire[at]; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.sip_timestamp[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.timestamp_1[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.participant_token[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> cross_sro_trading_action_message_record.symbol[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_record.trading_action_code = wire[at]; at = at + 1;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> cross_sro_trading_action_message_record.trading_action_sequence_number[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> cross_sro_trading_action_message_record.action_time[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> cross_sro_trading_action_message_record.reason_for_the_trading_action[cross_sro_trading_action_message_at] = wire[at]; at = at + 1; cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cross Sro Trading Action Message is what was written, byte for byte */
inline equal_cross_sro_trading_action_message(cross_sro_trading_action_message_read, cross_sro_trading_action_message_written) {
  assert(cross_sro_trading_action_message_read.market_center_originator == cross_sro_trading_action_message_written.market_center_originator);
  assert(cross_sro_trading_action_message_read.sub_market_center_id == cross_sro_trading_action_message_written.sub_market_center_id);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.sip_timestamp[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.sip_timestamp[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.timestamp_1[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.timestamp_1[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.participant_token[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.participant_token[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 11 -> assert(cross_sro_trading_action_message_read.symbol[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.symbol[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  assert(cross_sro_trading_action_message_read.trading_action_code == cross_sro_trading_action_message_written.trading_action_code);
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 4 -> assert(cross_sro_trading_action_message_read.trading_action_sequence_number[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.trading_action_sequence_number[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 8 -> assert(cross_sro_trading_action_message_read.action_time[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.action_time[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  cross_sro_trading_action_message_at = 0;
  do
  :: cross_sro_trading_action_message_at < 6 -> assert(cross_sro_trading_action_message_read.reason_for_the_trading_action[cross_sro_trading_action_message_at] == cross_sro_trading_action_message_written.reason_for_the_trading_action[cross_sro_trading_action_message_at]); cross_sro_trading_action_message_at = cross_sro_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Center Trading Action Message: 47 bytes -------------------------- */

/* Market Center Trading Action message — sent when a UTP participant invokes or releases a market center-specific trading halt for a NASDAQ-listed security. Other participants may continue to quote and trade. */
typedef MarketCenterTradingActionMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte trading_action_code;
  byte action_time[8];
  byte market_center_identifier
};

int market_center_trading_action_message_at;

/* every byte of Market Center Trading Action Message set to one value */
inline fill_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_value) {
  market_center_trading_action_message_record.market_center_originator = market_center_trading_action_message_value;
  market_center_trading_action_message_record.sub_market_center_id = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = market_center_trading_action_message_value;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = market_center_trading_action_message_value; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = market_center_trading_action_message_value;
  skip
}

/* each byte of Market Center Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_market_center_trading_action_message(market_center_trading_action_message_record, market_center_trading_action_message_base) {
  market_center_trading_action_message_record.market_center_originator = (market_center_trading_action_message_base + 0 + 1) % 256;
  market_center_trading_action_message_record.sub_market_center_id = (market_center_trading_action_message_base + 1 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 2 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 10 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 18 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 26 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = (market_center_trading_action_message_base + 37 + 1) % 256;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = (market_center_trading_action_message_base + 38 + market_center_trading_action_message_at + 1) % 256; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = (market_center_trading_action_message_base + 46 + 1) % 256;
  skip
}

/* Market Center Trading Action Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_center_trading_action_message(market_center_trading_action_message_record) {
  wire[at] = market_center_trading_action_message_record.market_center_originator; at = at + 1;
  wire[at] = market_center_trading_action_message_record.sub_market_center_id; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> wire[at] = market_center_trading_action_message_record.symbol[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.trading_action_code; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> wire[at] = market_center_trading_action_message_record.action_time[market_center_trading_action_message_at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = market_center_trading_action_message_record.market_center_identifier; at = at + 1;
  skip
}

/* Market Center Trading Action Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_center_trading_action_message(market_center_trading_action_message_record) {
  market_center_trading_action_message_record.market_center_originator = wire[at]; at = at + 1;
  market_center_trading_action_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.sip_timestamp[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.timestamp_1[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.participant_token[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> market_center_trading_action_message_record.symbol[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.trading_action_code = wire[at]; at = at + 1;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> market_center_trading_action_message_record.action_time[market_center_trading_action_message_at] = wire[at]; at = at + 1; market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_record.market_center_identifier = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Center Trading Action Message is what was written, byte for byte */
inline equal_market_center_trading_action_message(market_center_trading_action_message_read, market_center_trading_action_message_written) {
  assert(market_center_trading_action_message_read.market_center_originator == market_center_trading_action_message_written.market_center_originator);
  assert(market_center_trading_action_message_read.sub_market_center_id == market_center_trading_action_message_written.sub_market_center_id);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.sip_timestamp[market_center_trading_action_message_at] == market_center_trading_action_message_written.sip_timestamp[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.timestamp_1[market_center_trading_action_message_at] == market_center_trading_action_message_written.timestamp_1[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.participant_token[market_center_trading_action_message_at] == market_center_trading_action_message_written.participant_token[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 11 -> assert(market_center_trading_action_message_read.symbol[market_center_trading_action_message_at] == market_center_trading_action_message_written.symbol[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.trading_action_code == market_center_trading_action_message_written.trading_action_code);
  market_center_trading_action_message_at = 0;
  do
  :: market_center_trading_action_message_at < 8 -> assert(market_center_trading_action_message_read.action_time[market_center_trading_action_message_at] == market_center_trading_action_message_written.action_time[market_center_trading_action_message_at]); market_center_trading_action_message_at = market_center_trading_action_message_at + 1
  :: else -> break
  od;
  assert(market_center_trading_action_message_read.market_center_identifier == market_center_trading_action_message_written.market_center_identifier);
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Message: 50 bytes ------------- */

/* MWCB Decline Message. Communicates the daily MWCB breach points (Levels 1/2/3) set based on the prior day's closing value of the S&P 500 index. May be re-sent if levels are reset due to erroneous activity; participants should use the most recently disseminated values. */
typedef MarketWideCircuitBreakerDeclineLevelMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8]
};

int market_wide_circuit_breaker_decline_level_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record, market_wide_circuit_breaker_decline_level_message_value) {
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = market_wide_circuit_breaker_decline_level_message_value;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = market_wide_circuit_breaker_decline_level_message_value;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = market_wide_circuit_breaker_decline_level_message_value; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record, market_wide_circuit_breaker_decline_level_message_base) {
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = (market_wide_circuit_breaker_decline_level_message_base + 0 + 1) % 256;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = (market_wide_circuit_breaker_decline_level_message_base + 1 + 1) % 256;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 2 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 10 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 18 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 26 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 34 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = (market_wide_circuit_breaker_decline_level_message_base + 42 + market_wide_circuit_breaker_decline_level_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Decline Level Message to the wire, 50 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record) {
  wire[at] = market_wide_circuit_breaker_decline_level_message_record.market_center_originator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Wide Circuit Breaker Decline Level Message off the wire, 50 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_record) {
  market_wide_circuit_breaker_decline_level_message_record.market_center_originator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.participant_token[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> market_wide_circuit_breaker_decline_level_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_read, market_wide_circuit_breaker_decline_level_message_written) {
  assert(market_wide_circuit_breaker_decline_level_message_read.market_center_originator == market_wide_circuit_breaker_decline_level_message_written.market_center_originator);
  assert(market_wide_circuit_breaker_decline_level_message_read.sub_market_center_id == market_wide_circuit_breaker_decline_level_message_written.sub_market_center_id);
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.sip_timestamp[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.timestamp_1[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.timestamp_1[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.participant_token[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.participant_token[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at] == market_wide_circuit_breaker_decline_level_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_message_at]); market_wide_circuit_breaker_decline_level_message_at = market_wide_circuit_breaker_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Limit Up Limit Down Price Band Message: 62 bytes ------------------------ */

/* Limit Up – Limit Down Price Band Message. Reflects the current LULD band for LULD-eligible securities. Designed to prevent trades outside specified Upper and Lower Limit Price Bands. */
typedef LimitUpLimitDownPriceBandMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte luld_price_band_indicator;
  byte luld_price_band_effective_time[8];
  byte limit_down_price[8];
  byte limit_up_price[8]
};

int limit_up_limit_down_price_band_message_at;

/* every byte of Limit Up Limit Down Price Band Message set to one value */
inline fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record, limit_up_limit_down_price_band_message_value) {
  limit_up_limit_down_price_band_message_record.market_center_originator = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = limit_up_limit_down_price_band_message_value;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = limit_up_limit_down_price_band_message_value; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Limit Up Limit Down Price Band Message set to where it lies, so a field read out of place says so */
inline ramp_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record, limit_up_limit_down_price_band_message_base) {
  limit_up_limit_down_price_band_message_record.market_center_originator = (limit_up_limit_down_price_band_message_base + 0 + 1) % 256;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = (limit_up_limit_down_price_band_message_base + 1 + 1) % 256;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 2 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 10 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 18 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 26 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = (limit_up_limit_down_price_band_message_base + 37 + 1) % 256;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 38 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 46 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = (limit_up_limit_down_price_band_message_base + 54 + limit_up_limit_down_price_band_message_at + 1) % 256; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Up Limit Down Price Band Message to the wire, 62 bytes from where the cursor stands */
inline encode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record) {
  wire[at] = limit_up_limit_down_price_band_message_record.market_center_originator; at = at + 1;
  wire[at] = limit_up_limit_down_price_band_message_record.sub_market_center_id; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> wire[at] = limit_up_limit_down_price_band_message_record.symbol[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  wire[at] = limit_up_limit_down_price_band_message_record.luld_price_band_indicator; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> wire[at] = limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* Limit Up Limit Down Price Band Message off the wire, 62 bytes from where the cursor stands */
inline decode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_record) {
  limit_up_limit_down_price_band_message_record.market_center_originator = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_record.sub_market_center_id = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.sip_timestamp[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.timestamp_1[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.participant_token[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> limit_up_limit_down_price_band_message_record.symbol[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_record.luld_price_band_indicator = wire[at]; at = at + 1;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_down_price[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> limit_up_limit_down_price_band_message_record.limit_up_price[limit_up_limit_down_price_band_message_at] = wire[at]; at = at + 1; limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Limit Up Limit Down Price Band Message is what was written, byte for byte */
inline equal_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_read, limit_up_limit_down_price_band_message_written) {
  assert(limit_up_limit_down_price_band_message_read.market_center_originator == limit_up_limit_down_price_band_message_written.market_center_originator);
  assert(limit_up_limit_down_price_band_message_read.sub_market_center_id == limit_up_limit_down_price_band_message_written.sub_market_center_id);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.sip_timestamp[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.sip_timestamp[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.timestamp_1[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.timestamp_1[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.participant_token[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.participant_token[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 11 -> assert(limit_up_limit_down_price_band_message_read.symbol[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.symbol[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  assert(limit_up_limit_down_price_band_message_read.luld_price_band_indicator == limit_up_limit_down_price_band_message_written.luld_price_band_indicator);
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.luld_price_band_effective_time[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.limit_down_price[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.limit_down_price[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  limit_up_limit_down_price_band_message_at = 0;
  do
  :: limit_up_limit_down_price_band_message_at < 8 -> assert(limit_up_limit_down_price_band_message_read.limit_up_price[limit_up_limit_down_price_band_message_at] == limit_up_limit_down_price_band_message_written.limit_up_price[limit_up_limit_down_price_band_message_at]); limit_up_limit_down_price_band_message_at = limit_up_limit_down_price_band_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Collar Message: 66 bytes ---------------------------------------- */

/* Auction Collar Message published by primary markets using an automated reopening after a LULD Trading Pause. Snap-Shot sends only the most recent Auction Collar message per security. */
typedef AuctionCollarMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte symbol[11];
  byte trading_action_sequence_number[4];
  byte collar_reference_price[8];
  byte collar_up_price[8];
  byte collar_down_price[8];
  byte collar_extension_indicator
};

int auction_collar_message_at;

/* every byte of Auction Collar Message set to one value */
inline fill_auction_collar_message(auction_collar_message_record, auction_collar_message_value) {
  auction_collar_message_record.market_center_originator = auction_collar_message_value;
  auction_collar_message_record.sub_market_center_id = auction_collar_message_value;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = auction_collar_message_value; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = auction_collar_message_value;
  skip
}

/* each byte of Auction Collar Message set to where it lies, so a field read out of place says so */
inline ramp_auction_collar_message(auction_collar_message_record, auction_collar_message_base) {
  auction_collar_message_record.market_center_originator = (auction_collar_message_base + 0 + 1) % 256;
  auction_collar_message_record.sub_market_center_id = (auction_collar_message_base + 1 + 1) % 256;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = (auction_collar_message_base + 2 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = (auction_collar_message_base + 10 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = (auction_collar_message_base + 18 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol[auction_collar_message_at] = (auction_collar_message_base + 26 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = (auction_collar_message_base + 37 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = (auction_collar_message_base + 41 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = (auction_collar_message_base + 49 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = (auction_collar_message_base + 57 + auction_collar_message_at + 1) % 256; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = (auction_collar_message_base + 65 + 1) % 256;
  skip
}

/* Auction Collar Message to the wire, 66 bytes from where the cursor stands */
inline encode_auction_collar_message(auction_collar_message_record) {
  wire[at] = auction_collar_message_record.market_center_originator; at = at + 1;
  wire[at] = auction_collar_message_record.sub_market_center_id; at = at + 1;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.sip_timestamp[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.timestamp_1[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.participant_token[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> wire[at] = auction_collar_message_record.symbol[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> wire[at] = auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_reference_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_up_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> wire[at] = auction_collar_message_record.collar_down_price[auction_collar_message_at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_collar_message_record.collar_extension_indicator; at = at + 1;
  skip
}

/* Auction Collar Message off the wire, 66 bytes from where the cursor stands */
inline decode_auction_collar_message(auction_collar_message_record) {
  auction_collar_message_record.market_center_originator = wire[at]; at = at + 1;
  auction_collar_message_record.sub_market_center_id = wire[at]; at = at + 1;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.sip_timestamp[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.timestamp_1[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.participant_token[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> auction_collar_message_record.symbol[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> auction_collar_message_record.trading_action_sequence_number[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_reference_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_up_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> auction_collar_message_record.collar_down_price[auction_collar_message_at] = wire[at]; at = at + 1; auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_record.collar_extension_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Collar Message is what was written, byte for byte */
inline equal_auction_collar_message(auction_collar_message_read, auction_collar_message_written) {
  assert(auction_collar_message_read.market_center_originator == auction_collar_message_written.market_center_originator);
  assert(auction_collar_message_read.sub_market_center_id == auction_collar_message_written.sub_market_center_id);
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.sip_timestamp[auction_collar_message_at] == auction_collar_message_written.sip_timestamp[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.timestamp_1[auction_collar_message_at] == auction_collar_message_written.timestamp_1[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.participant_token[auction_collar_message_at] == auction_collar_message_written.participant_token[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 11 -> assert(auction_collar_message_read.symbol[auction_collar_message_at] == auction_collar_message_written.symbol[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 4 -> assert(auction_collar_message_read.trading_action_sequence_number[auction_collar_message_at] == auction_collar_message_written.trading_action_sequence_number[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_reference_price[auction_collar_message_at] == auction_collar_message_written.collar_reference_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_up_price[auction_collar_message_at] == auction_collar_message_written.collar_up_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  auction_collar_message_at = 0;
  do
  :: auction_collar_message_at < 8 -> assert(auction_collar_message_read.collar_down_price[auction_collar_message_at] == auction_collar_message_written.collar_down_price[auction_collar_message_at]); auction_collar_message_at = auction_collar_message_at + 1
  :: else -> break
  od;
  assert(auction_collar_message_read.collar_extension_indicator == auction_collar_message_written.collar_extension_indicator);
  skip
}

/* ---- Snapshot Sequence Message: 34 bytes ------------------------------------- */

/* Snapshot Sequence Number Message. Reflects the UTP Data Service sequence number at the time the UTP Snap-Shot spin was requested. To stay current, firms should process real-time UTP Data Service messages beginning with the next sequence number after this value. */
typedef SnapshotSequenceMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8];
  byte sequence_number[8]
};

int snapshot_sequence_message_at;

/* every byte of Snapshot Sequence Message set to one value */
inline fill_snapshot_sequence_message(snapshot_sequence_message_record, snapshot_sequence_message_value) {
  snapshot_sequence_message_record.market_center_originator = snapshot_sequence_message_value;
  snapshot_sequence_message_record.sub_market_center_id = snapshot_sequence_message_value;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sip_timestamp[snapshot_sequence_message_at] = snapshot_sequence_message_value; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.timestamp_1[snapshot_sequence_message_at] = snapshot_sequence_message_value; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.participant_token[snapshot_sequence_message_at] = snapshot_sequence_message_value; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sequence_number[snapshot_sequence_message_at] = snapshot_sequence_message_value; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_sequence_message(snapshot_sequence_message_record, snapshot_sequence_message_base) {
  snapshot_sequence_message_record.market_center_originator = (snapshot_sequence_message_base + 0 + 1) % 256;
  snapshot_sequence_message_record.sub_market_center_id = (snapshot_sequence_message_base + 1 + 1) % 256;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sip_timestamp[snapshot_sequence_message_at] = (snapshot_sequence_message_base + 2 + snapshot_sequence_message_at + 1) % 256; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.timestamp_1[snapshot_sequence_message_at] = (snapshot_sequence_message_base + 10 + snapshot_sequence_message_at + 1) % 256; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.participant_token[snapshot_sequence_message_at] = (snapshot_sequence_message_base + 18 + snapshot_sequence_message_at + 1) % 256; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sequence_number[snapshot_sequence_message_at] = (snapshot_sequence_message_base + 26 + snapshot_sequence_message_at + 1) % 256; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Sequence Message to the wire, 34 bytes from where the cursor stands */
inline encode_snapshot_sequence_message(snapshot_sequence_message_record) {
  wire[at] = snapshot_sequence_message_record.market_center_originator; at = at + 1;
  wire[at] = snapshot_sequence_message_record.sub_market_center_id; at = at + 1;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> wire[at] = snapshot_sequence_message_record.sip_timestamp[snapshot_sequence_message_at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> wire[at] = snapshot_sequence_message_record.timestamp_1[snapshot_sequence_message_at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> wire[at] = snapshot_sequence_message_record.participant_token[snapshot_sequence_message_at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> wire[at] = snapshot_sequence_message_record.sequence_number[snapshot_sequence_message_at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Sequence Message off the wire, 34 bytes from where the cursor stands */
inline decode_snapshot_sequence_message(snapshot_sequence_message_record) {
  snapshot_sequence_message_record.market_center_originator = wire[at]; at = at + 1;
  snapshot_sequence_message_record.sub_market_center_id = wire[at]; at = at + 1;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sip_timestamp[snapshot_sequence_message_at] = wire[at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.timestamp_1[snapshot_sequence_message_at] = wire[at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.participant_token[snapshot_sequence_message_at] = wire[at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> snapshot_sequence_message_record.sequence_number[snapshot_sequence_message_at] = wire[at]; at = at + 1; snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Sequence Message is what was written, byte for byte */
inline equal_snapshot_sequence_message(snapshot_sequence_message_read, snapshot_sequence_message_written) {
  assert(snapshot_sequence_message_read.market_center_originator == snapshot_sequence_message_written.market_center_originator);
  assert(snapshot_sequence_message_read.sub_market_center_id == snapshot_sequence_message_written.sub_market_center_id);
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> assert(snapshot_sequence_message_read.sip_timestamp[snapshot_sequence_message_at] == snapshot_sequence_message_written.sip_timestamp[snapshot_sequence_message_at]); snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> assert(snapshot_sequence_message_read.timestamp_1[snapshot_sequence_message_at] == snapshot_sequence_message_written.timestamp_1[snapshot_sequence_message_at]); snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> assert(snapshot_sequence_message_read.participant_token[snapshot_sequence_message_at] == snapshot_sequence_message_written.participant_token[snapshot_sequence_message_at]); snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  snapshot_sequence_message_at = 0;
  do
  :: snapshot_sequence_message_at < 8 -> assert(snapshot_sequence_message_read.sequence_number[snapshot_sequence_message_at] == snapshot_sequence_message_written.sequence_number[snapshot_sequence_message_at]); snapshot_sequence_message_at = snapshot_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 26 bytes ------------------------------------------ */

/* Start of Day Control Message. Each day, signals that all subsequent data transmitted will be real-time updates. Prior to 03:58 the data feed handler may be broadcasting heartbeats. */
typedef StartOfDayMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_record.market_center_originator = start_of_day_message_value;
  start_of_day_message_record.sub_market_center_id = start_of_day_message_value;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_record.market_center_originator = (start_of_day_message_base + 0 + 1) % 256;
  start_of_day_message_record.sub_market_center_id = (start_of_day_message_base + 1 + 1) % 256;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = (start_of_day_message_base + 2 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = (start_of_day_message_base + 10 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = (start_of_day_message_base + 18 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  wire[at] = start_of_day_message_record.market_center_originator; at = at + 1;
  wire[at] = start_of_day_message_record.sub_market_center_id; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.sip_timestamp[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.timestamp_1[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.participant_token[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_record.market_center_originator = wire[at]; at = at + 1;
  start_of_day_message_record.sub_market_center_id = wire[at]; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.sip_timestamp[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.timestamp_1[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_token[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  assert(start_of_day_message_read.market_center_originator == start_of_day_message_written.market_center_originator);
  assert(start_of_day_message_read.sub_market_center_id == start_of_day_message_written.sub_market_center_id);
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.sip_timestamp[start_of_day_message_at] == start_of_day_message_written.sip_timestamp[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.timestamp_1[start_of_day_message_at] == start_of_day_message_written.timestamp_1[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.participant_token[start_of_day_message_at] == start_of_day_message_written.participant_token[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Session Open Message: 26 bytes ----------------------------------- */

/* Market Session Open Control Message. Signifies the opening of market systems for the Normal Market Session. Each UTP participant may choose to provide its own Market Session Open control message. */
typedef MarketSessionOpenMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int market_session_open_message_at;

/* every byte of Market Session Open Message set to one value */
inline fill_market_session_open_message(market_session_open_message_record, market_session_open_message_value) {
  market_session_open_message_record.market_center_originator = market_session_open_message_value;
  market_session_open_message_record.sub_market_center_id = market_session_open_message_value;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = market_session_open_message_value; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Session Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_open_message(market_session_open_message_record, market_session_open_message_base) {
  market_session_open_message_record.market_center_originator = (market_session_open_message_base + 0 + 1) % 256;
  market_session_open_message_record.sub_market_center_id = (market_session_open_message_base + 1 + 1) % 256;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = (market_session_open_message_base + 2 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = (market_session_open_message_base + 10 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = (market_session_open_message_base + 18 + market_session_open_message_at + 1) % 256; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Open Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_open_message(market_session_open_message_record) {
  wire[at] = market_session_open_message_record.market_center_originator; at = at + 1;
  wire[at] = market_session_open_message_record.sub_market_center_id; at = at + 1;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.sip_timestamp[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.timestamp_1[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> wire[at] = market_session_open_message_record.participant_token[market_session_open_message_at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Open Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_open_message(market_session_open_message_record) {
  market_session_open_message_record.market_center_originator = wire[at]; at = at + 1;
  market_session_open_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.sip_timestamp[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.timestamp_1[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> market_session_open_message_record.participant_token[market_session_open_message_at] = wire[at]; at = at + 1; market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Session Open Message is what was written, byte for byte */
inline equal_market_session_open_message(market_session_open_message_read, market_session_open_message_written) {
  assert(market_session_open_message_read.market_center_originator == market_session_open_message_written.market_center_originator);
  assert(market_session_open_message_read.sub_market_center_id == market_session_open_message_written.sub_market_center_id);
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.sip_timestamp[market_session_open_message_at] == market_session_open_message_written.sip_timestamp[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.timestamp_1[market_session_open_message_at] == market_session_open_message_written.timestamp_1[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  market_session_open_message_at = 0;
  do
  :: market_session_open_message_at < 8 -> assert(market_session_open_message_read.participant_token[market_session_open_message_at] == market_session_open_message_written.participant_token[market_session_open_message_at]); market_session_open_message_at = market_session_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Session Close Message: 26 bytes ---------------------------------- */

/* Market Session Close Control Message. Signals the closing of market systems for the Normal Market Session. */
typedef MarketSessionCloseMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int market_session_close_message_at;

/* every byte of Market Session Close Message set to one value */
inline fill_market_session_close_message(market_session_close_message_record, market_session_close_message_value) {
  market_session_close_message_record.market_center_originator = market_session_close_message_value;
  market_session_close_message_record.sub_market_center_id = market_session_close_message_value;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = market_session_close_message_value; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Session Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_session_close_message(market_session_close_message_record, market_session_close_message_base) {
  market_session_close_message_record.market_center_originator = (market_session_close_message_base + 0 + 1) % 256;
  market_session_close_message_record.sub_market_center_id = (market_session_close_message_base + 1 + 1) % 256;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = (market_session_close_message_base + 2 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = (market_session_close_message_base + 10 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = (market_session_close_message_base + 18 + market_session_close_message_at + 1) % 256; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Close Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_session_close_message(market_session_close_message_record) {
  wire[at] = market_session_close_message_record.market_center_originator; at = at + 1;
  wire[at] = market_session_close_message_record.sub_market_center_id; at = at + 1;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.sip_timestamp[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.timestamp_1[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> wire[at] = market_session_close_message_record.participant_token[market_session_close_message_at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Session Close Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_session_close_message(market_session_close_message_record) {
  market_session_close_message_record.market_center_originator = wire[at]; at = at + 1;
  market_session_close_message_record.sub_market_center_id = wire[at]; at = at + 1;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.sip_timestamp[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.timestamp_1[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> market_session_close_message_record.participant_token[market_session_close_message_at] = wire[at]; at = at + 1; market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Session Close Message is what was written, byte for byte */
inline equal_market_session_close_message(market_session_close_message_read, market_session_close_message_written) {
  assert(market_session_close_message_read.market_center_originator == market_session_close_message_written.market_center_originator);
  assert(market_session_close_message_read.sub_market_center_id == market_session_close_message_written.sub_market_center_id);
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.sip_timestamp[market_session_close_message_at] == market_session_close_message_written.sip_timestamp[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.timestamp_1[market_session_close_message_at] == market_session_close_message_written.timestamp_1[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  market_session_close_message_at = 0;
  do
  :: market_session_close_message_at < 8 -> assert(market_session_close_message_read.participant_token[market_session_close_message_at] == market_session_close_message_written.participant_token[market_session_close_message_at]); market_session_close_message_at = market_session_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 26 bytes -------------------------------------------- */

/* End of Day Control Message. Signals the end of active message dissemination for the UTP SIP operational cycle. */
typedef EndOfDayMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_record.market_center_originator = end_of_day_message_value;
  end_of_day_message_record.sub_market_center_id = end_of_day_message_value;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_record.market_center_originator = (end_of_day_message_base + 0 + 1) % 256;
  end_of_day_message_record.sub_market_center_id = (end_of_day_message_base + 1 + 1) % 256;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = (end_of_day_message_base + 2 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = (end_of_day_message_base + 10 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = (end_of_day_message_base + 18 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  wire[at] = end_of_day_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_day_message_record.sub_market_center_id; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.sip_timestamp[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.timestamp_1[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.participant_token[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_day_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.sip_timestamp[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.timestamp_1[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_token[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  assert(end_of_day_message_read.market_center_originator == end_of_day_message_written.market_center_originator);
  assert(end_of_day_message_read.sub_market_center_id == end_of_day_message_written.sub_market_center_id);
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.sip_timestamp[end_of_day_message_at] == end_of_day_message_written.sip_timestamp[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.timestamp_1[end_of_day_message_at] == end_of_day_message_written.timestamp_1[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.participant_token[end_of_day_message_at] == end_of_day_message_written.participant_token[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Transmissions Message: 26 bytes ---------------------------------- */

/* End of Transmissions Control Message. Last production message of the day; signals no further transmissions through the UTP SIP line. */
typedef EndOfTransmissionsMessage {
  byte market_center_originator;
  byte sub_market_center_id;
  byte sip_timestamp[8];
  byte timestamp_1[8];
  byte participant_token[8]
};

int end_of_transmissions_message_at;

/* every byte of End Of Transmissions Message set to one value */
inline fill_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_value) {
  end_of_transmissions_message_record.market_center_originator = end_of_transmissions_message_value;
  end_of_transmissions_message_record.sub_market_center_id = end_of_transmissions_message_value;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = end_of_transmissions_message_value; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Transmissions Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_transmissions_message(end_of_transmissions_message_record, end_of_transmissions_message_base) {
  end_of_transmissions_message_record.market_center_originator = (end_of_transmissions_message_base + 0 + 1) % 256;
  end_of_transmissions_message_record.sub_market_center_id = (end_of_transmissions_message_base + 1 + 1) % 256;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 2 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 10 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = (end_of_transmissions_message_base + 18 + end_of_transmissions_message_at + 1) % 256; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmissions Message to the wire, 26 bytes from where the cursor stands */
inline encode_end_of_transmissions_message(end_of_transmissions_message_record) {
  wire[at] = end_of_transmissions_message_record.market_center_originator; at = at + 1;
  wire[at] = end_of_transmissions_message_record.sub_market_center_id; at = at + 1;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> wire[at] = end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Transmissions Message off the wire, 26 bytes from where the cursor stands */
inline decode_end_of_transmissions_message(end_of_transmissions_message_record) {
  end_of_transmissions_message_record.market_center_originator = wire[at]; at = at + 1;
  end_of_transmissions_message_record.sub_market_center_id = wire[at]; at = at + 1;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.sip_timestamp[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.timestamp_1[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> end_of_transmissions_message_record.participant_token[end_of_transmissions_message_at] = wire[at]; at = at + 1; end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Transmissions Message is what was written, byte for byte */
inline equal_end_of_transmissions_message(end_of_transmissions_message_read, end_of_transmissions_message_written) {
  assert(end_of_transmissions_message_read.market_center_originator == end_of_transmissions_message_written.market_center_originator);
  assert(end_of_transmissions_message_read.sub_market_center_id == end_of_transmissions_message_written.sub_market_center_id);
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.sip_timestamp[end_of_transmissions_message_at] == end_of_transmissions_message_written.sip_timestamp[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.timestamp_1[end_of_transmissions_message_at] == end_of_transmissions_message_written.timestamp_1[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  end_of_transmissions_message_at = 0;
  do
  :: end_of_transmissions_message_at < 8 -> assert(end_of_transmissions_message_read.participant_token[end_of_transmissions_message_at] == end_of_transmissions_message_written.participant_token[end_of_transmissions_message_at]); end_of_transmissions_message_at = end_of_transmissions_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Accepted Packet: 30 bytes ----------------------------------------- */

/* SoupBinTCP Login Accepted Packet */
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

/* SoupBinTCP Login Rejected Packet */
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

/* ---- What spin checks -------------------------------------------------------- */

/* Server Tcp Packet Header: encoded, read back, and compared */
proctype check_server_tcp_packet_header() {
  ServerTcpPacketHeader server_tcp_packet_header_sent;
  ServerTcpPacketHeader server_tcp_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_server_tcp_packet_header(server_tcp_packet_header_sent, 0)
  :: pattern == 1 -> fill_server_tcp_packet_header(server_tcp_packet_header_sent, 32)
  :: pattern == 2 -> fill_server_tcp_packet_header(server_tcp_packet_header_sent, 255)
  :: else -> ramp_server_tcp_packet_header(server_tcp_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_server_tcp_packet_header(server_tcp_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_server_tcp_packet_header(server_tcp_packet_header_got);
    assert(at == 3);
    equal_server_tcp_packet_header(server_tcp_packet_header_got, server_tcp_packet_header_sent)
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

/* Issue Symbol Directory Message: encoded, read back, and compared */
proctype check_issue_symbol_directory_message() {
  IssueSymbolDirectoryMessage issue_symbol_directory_message_sent;
  IssueSymbolDirectoryMessage issue_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_issue_symbol_directory_message(issue_symbol_directory_message_sent, 255)
  :: else -> ramp_issue_symbol_directory_message(issue_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_issue_symbol_directory_message(issue_symbol_directory_message_sent);
    assert(at == 87);
    at = 0;
    decode_issue_symbol_directory_message(issue_symbol_directory_message_got);
    assert(at == 87);
    equal_issue_symbol_directory_message(issue_symbol_directory_message_got, issue_symbol_directory_message_sent)
  }
}

/* Enhanced Issue Symbol Directory Message: encoded, read back, and compared */
proctype check_enhanced_issue_symbol_directory_message() {
  EnhancedIssueSymbolDirectoryMessage enhanced_issue_symbol_directory_message_sent;
  EnhancedIssueSymbolDirectoryMessage enhanced_issue_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_sent, 255)
  :: else -> ramp_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_sent);
    assert(at == 114);
    at = 0;
    decode_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_got);
    assert(at == 114);
    equal_enhanced_issue_symbol_directory_message(enhanced_issue_symbol_directory_message_got, enhanced_issue_symbol_directory_message_sent)
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
    assert(at == 38);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 38);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
  }
}

/* Cross Sro Trading Action Message: encoded, read back, and compared */
proctype check_cross_sro_trading_action_message() {
  CrossSroTradingActionMessage cross_sro_trading_action_message_sent;
  CrossSroTradingActionMessage cross_sro_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 255)
  :: else -> ramp_cross_sro_trading_action_message(cross_sro_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cross_sro_trading_action_message(cross_sro_trading_action_message_sent);
    assert(at == 56);
    at = 0;
    decode_cross_sro_trading_action_message(cross_sro_trading_action_message_got);
    assert(at == 56);
    equal_cross_sro_trading_action_message(cross_sro_trading_action_message_got, cross_sro_trading_action_message_sent)
  }
}

/* Market Center Trading Action Message: encoded, read back, and compared */
proctype check_market_center_trading_action_message() {
  MarketCenterTradingActionMessage market_center_trading_action_message_sent;
  MarketCenterTradingActionMessage market_center_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_market_center_trading_action_message(market_center_trading_action_message_sent, 255)
  :: else -> ramp_market_center_trading_action_message(market_center_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_center_trading_action_message(market_center_trading_action_message_sent);
    assert(at == 47);
    at = 0;
    decode_market_center_trading_action_message(market_center_trading_action_message_got);
    assert(at == 47);
    equal_market_center_trading_action_message(market_center_trading_action_message_got, market_center_trading_action_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_message() {
  MarketWideCircuitBreakerDeclineLevelMessage market_wide_circuit_breaker_decline_level_message_sent;
  MarketWideCircuitBreakerDeclineLevelMessage market_wide_circuit_breaker_decline_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_sent);
    assert(at == 50);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_got);
    assert(at == 50);
    equal_market_wide_circuit_breaker_decline_level_message(market_wide_circuit_breaker_decline_level_message_got, market_wide_circuit_breaker_decline_level_message_sent)
  }
}

/* Limit Up Limit Down Price Band Message: encoded, read back, and compared */
proctype check_limit_up_limit_down_price_band_message() {
  LimitUpLimitDownPriceBandMessage limit_up_limit_down_price_band_message_sent;
  LimitUpLimitDownPriceBandMessage limit_up_limit_down_price_band_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 0)
  :: pattern == 1 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 32)
  :: pattern == 2 -> fill_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 255)
  :: else -> ramp_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_sent);
    assert(at == 62);
    at = 0;
    decode_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_got);
    assert(at == 62);
    equal_limit_up_limit_down_price_band_message(limit_up_limit_down_price_band_message_got, limit_up_limit_down_price_band_message_sent)
  }
}

/* Auction Collar Message: encoded, read back, and compared */
proctype check_auction_collar_message() {
  AuctionCollarMessage auction_collar_message_sent;
  AuctionCollarMessage auction_collar_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_collar_message(auction_collar_message_sent, 0)
  :: pattern == 1 -> fill_auction_collar_message(auction_collar_message_sent, 32)
  :: pattern == 2 -> fill_auction_collar_message(auction_collar_message_sent, 255)
  :: else -> ramp_auction_collar_message(auction_collar_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_collar_message(auction_collar_message_sent);
    assert(at == 66);
    at = 0;
    decode_auction_collar_message(auction_collar_message_got);
    assert(at == 66);
    equal_auction_collar_message(auction_collar_message_got, auction_collar_message_sent)
  }
}

/* Snapshot Sequence Message: encoded, read back, and compared */
proctype check_snapshot_sequence_message() {
  SnapshotSequenceMessage snapshot_sequence_message_sent;
  SnapshotSequenceMessage snapshot_sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_sequence_message(snapshot_sequence_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_sequence_message(snapshot_sequence_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_sequence_message(snapshot_sequence_message_sent, 255)
  :: else -> ramp_snapshot_sequence_message(snapshot_sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_sequence_message(snapshot_sequence_message_sent);
    assert(at == 34);
    at = 0;
    decode_snapshot_sequence_message(snapshot_sequence_message_got);
    assert(at == 34);
    equal_snapshot_sequence_message(snapshot_sequence_message_got, snapshot_sequence_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 26);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 26);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* Market Session Open Message: encoded, read back, and compared */
proctype check_market_session_open_message() {
  MarketSessionOpenMessage market_session_open_message_sent;
  MarketSessionOpenMessage market_session_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_open_message(market_session_open_message_sent, 0)
  :: pattern == 1 -> fill_market_session_open_message(market_session_open_message_sent, 32)
  :: pattern == 2 -> fill_market_session_open_message(market_session_open_message_sent, 255)
  :: else -> ramp_market_session_open_message(market_session_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_open_message(market_session_open_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_session_open_message(market_session_open_message_got);
    assert(at == 26);
    equal_market_session_open_message(market_session_open_message_got, market_session_open_message_sent)
  }
}

/* Market Session Close Message: encoded, read back, and compared */
proctype check_market_session_close_message() {
  MarketSessionCloseMessage market_session_close_message_sent;
  MarketSessionCloseMessage market_session_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_session_close_message(market_session_close_message_sent, 0)
  :: pattern == 1 -> fill_market_session_close_message(market_session_close_message_sent, 32)
  :: pattern == 2 -> fill_market_session_close_message(market_session_close_message_sent, 255)
  :: else -> ramp_market_session_close_message(market_session_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_session_close_message(market_session_close_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_session_close_message(market_session_close_message_got);
    assert(at == 26);
    equal_market_session_close_message(market_session_close_message_got, market_session_close_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 26);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* End Of Transmissions Message: encoded, read back, and compared */
proctype check_end_of_transmissions_message() {
  EndOfTransmissionsMessage end_of_transmissions_message_sent;
  EndOfTransmissionsMessage end_of_transmissions_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  :: pattern == 1 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 32)
  :: pattern == 2 -> fill_end_of_transmissions_message(end_of_transmissions_message_sent, 255)
  :: else -> ramp_end_of_transmissions_message(end_of_transmissions_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_transmissions_message(end_of_transmissions_message_sent);
    assert(at == 26);
    at = 0;
    decode_end_of_transmissions_message(end_of_transmissions_message_got);
    assert(at == 26);
    equal_end_of_transmissions_message(end_of_transmissions_message_got, end_of_transmissions_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_tcp_packet_header()
  :: run check_message_header()
  :: run check_issue_symbol_directory_message()
  :: run check_enhanced_issue_symbol_directory_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_cross_sro_trading_action_message()
  :: run check_market_center_trading_action_message()
  :: run check_market_wide_circuit_breaker_decline_level_message()
  :: run check_limit_up_limit_down_price_band_message()
  :: run check_auction_collar_message()
  :: run check_snapshot_sequence_message()
  :: run check_start_of_day_message()
  :: run check_market_session_open_message()
  :: run check_market_session_close_message()
  :: run check_end_of_day_message()
  :: run check_end_of_transmissions_message()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  fi
}
