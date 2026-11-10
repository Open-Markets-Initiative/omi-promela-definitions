/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Last Sale
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
#define WIRE 62

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

/* ---- Message Header: 11 bytes ------------------------------------------------ */

typedef MessageHeader {
  byte message_length[2];
  byte tracking_number[2];
  byte timestamp[6];
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
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
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
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 10 + 1) % 256;
  skip
}

/* Message Header to the wire, 11 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.tracking_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 11 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.tracking_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
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
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.tracking_number[message_header_at] == message_header_written.tracking_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 6 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- System Event Message: 1 bytes ------------------------------------------- */

/* System Event Messages is used to signal key market or data feed control events. */
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

/* ---- Trade Report Message: 32 bytes ------------------------------------------ */

/* The following message is used to relay PSX execution system transactions that are reported for the current business day. Please note that PSX only reports one-side of a trade execution on the PSX Last Sale (PLS) feed and other data feed products. */
typedef TradeReportMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte trade_price[4];
  byte trade_size[4];
  byte sale_condition_modifier_level_1;
  byte sale_condition_modifier_level_2;
  byte sale_condition_modifier_level_3;
  byte sale_condition_modifier_level_4
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_record.market_center_identifier = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = trade_report_message_value;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_modifier_level_1 = trade_report_message_value;
  trade_report_message_record.sale_condition_modifier_level_2 = trade_report_message_value;
  trade_report_message_record.sale_condition_modifier_level_3 = trade_report_message_value;
  trade_report_message_record.sale_condition_modifier_level_4 = trade_report_message_value;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_record.market_center_identifier = (trade_report_message_base + 0 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = (trade_report_message_base + 1 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = (trade_report_message_base + 9 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = (trade_report_message_base + 10 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 20 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 24 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_modifier_level_1 = (trade_report_message_base + 28 + 1) % 256;
  trade_report_message_record.sale_condition_modifier_level_2 = (trade_report_message_base + 29 + 1) % 256;
  trade_report_message_record.sale_condition_modifier_level_3 = (trade_report_message_base + 30 + 1) % 256;
  trade_report_message_record.sale_condition_modifier_level_4 = (trade_report_message_base + 31 + 1) % 256;
  skip
}

/* Trade Report Message to the wire, 32 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  wire[at] = trade_report_message_record.market_center_identifier; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.issue_symbol[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.security_class; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> wire[at] = trade_report_message_record.trade_control_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.trade_size[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.sale_condition_modifier_level_1; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_modifier_level_2; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_modifier_level_3; at = at + 1;
  wire[at] = trade_report_message_record.sale_condition_modifier_level_4; at = at + 1;
  skip
}

/* Trade Report Message off the wire, 32 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = wire[at]; at = at + 1;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.trade_size[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.sale_condition_modifier_level_1 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_modifier_level_2 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_modifier_level_3 = wire[at]; at = at + 1;
  trade_report_message_record.sale_condition_modifier_level_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  assert(trade_report_message_read.market_center_identifier == trade_report_message_written.market_center_identifier);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.issue_symbol[trade_report_message_at] == trade_report_message_written.issue_symbol[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.security_class == trade_report_message_written.security_class);
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> assert(trade_report_message_read.trade_control_number[trade_report_message_at] == trade_report_message_written.trade_control_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.trade_size[trade_report_message_at] == trade_report_message_written.trade_size[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.sale_condition_modifier_level_1 == trade_report_message_written.sale_condition_modifier_level_1);
  assert(trade_report_message_read.sale_condition_modifier_level_2 == trade_report_message_written.sale_condition_modifier_level_2);
  assert(trade_report_message_read.sale_condition_modifier_level_3 == trade_report_message_written.sale_condition_modifier_level_3);
  assert(trade_report_message_read.sale_condition_modifier_level_4 == trade_report_message_written.sale_condition_modifier_level_4);
  skip
}

/* ---- Next Shares Trade Report Message: 36 bytes ------------------------------ */

/* The following message is used to relay PSX execution system and TRF trade transactions for Exchange Traded Managed Funds (NextShares) that are reported for the current business day. */
typedef NextSharesTradeReportMessage {
  byte market_center_identifier;
  byte next_shares_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte proxy_price[4];
  byte trade_size[4];
  byte nav_premium_discount_amount[4];
  byte sale_condition_modifier_level_1;
  byte sale_condition_modifier_level_2;
  byte sale_condition_modifier_level_3;
  byte sale_condition_modifier_level_4
};

int next_shares_trade_report_message_at;

/* every byte of Next Shares Trade Report Message set to one value */
inline fill_next_shares_trade_report_message(next_shares_trade_report_message_record, next_shares_trade_report_message_value) {
  next_shares_trade_report_message_record.market_center_identifier = next_shares_trade_report_message_value;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = next_shares_trade_report_message_value;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = next_shares_trade_report_message_value; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.sale_condition_modifier_level_1 = next_shares_trade_report_message_value;
  next_shares_trade_report_message_record.sale_condition_modifier_level_2 = next_shares_trade_report_message_value;
  next_shares_trade_report_message_record.sale_condition_modifier_level_3 = next_shares_trade_report_message_value;
  next_shares_trade_report_message_record.sale_condition_modifier_level_4 = next_shares_trade_report_message_value;
  skip
}

/* each byte of Next Shares Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_next_shares_trade_report_message(next_shares_trade_report_message_record, next_shares_trade_report_message_base) {
  next_shares_trade_report_message_record.market_center_identifier = (next_shares_trade_report_message_base + 0 + 1) % 256;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 1 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = (next_shares_trade_report_message_base + 9 + 1) % 256;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 10 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 20 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 24 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = (next_shares_trade_report_message_base + 28 + next_shares_trade_report_message_at + 1) % 256; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.sale_condition_modifier_level_1 = (next_shares_trade_report_message_base + 32 + 1) % 256;
  next_shares_trade_report_message_record.sale_condition_modifier_level_2 = (next_shares_trade_report_message_base + 33 + 1) % 256;
  next_shares_trade_report_message_record.sale_condition_modifier_level_3 = (next_shares_trade_report_message_base + 34 + 1) % 256;
  next_shares_trade_report_message_record.sale_condition_modifier_level_4 = (next_shares_trade_report_message_base + 35 + 1) % 256;
  skip
}

/* Next Shares Trade Report Message to the wire, 36 bytes from where the cursor stands */
inline encode_next_shares_trade_report_message(next_shares_trade_report_message_record) {
  wire[at] = next_shares_trade_report_message_record.market_center_identifier; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> wire[at] = next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = next_shares_trade_report_message_record.security_class; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> wire[at] = next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> wire[at] = next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = next_shares_trade_report_message_record.sale_condition_modifier_level_1; at = at + 1;
  wire[at] = next_shares_trade_report_message_record.sale_condition_modifier_level_2; at = at + 1;
  wire[at] = next_shares_trade_report_message_record.sale_condition_modifier_level_3; at = at + 1;
  wire[at] = next_shares_trade_report_message_record.sale_condition_modifier_level_4; at = at + 1;
  skip
}

/* Next Shares Trade Report Message off the wire, 36 bytes from where the cursor stands */
inline decode_next_shares_trade_report_message(next_shares_trade_report_message_record) {
  next_shares_trade_report_message_record.market_center_identifier = wire[at]; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> next_shares_trade_report_message_record.next_shares_symbol[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.security_class = wire[at]; at = at + 1;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> next_shares_trade_report_message_record.trade_control_number[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.proxy_price[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.trade_size[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> next_shares_trade_report_message_record.nav_premium_discount_amount[next_shares_trade_report_message_at] = wire[at]; at = at + 1; next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_record.sale_condition_modifier_level_1 = wire[at]; at = at + 1;
  next_shares_trade_report_message_record.sale_condition_modifier_level_2 = wire[at]; at = at + 1;
  next_shares_trade_report_message_record.sale_condition_modifier_level_3 = wire[at]; at = at + 1;
  next_shares_trade_report_message_record.sale_condition_modifier_level_4 = wire[at]; at = at + 1;
  skip
}

/* what was read of Next Shares Trade Report Message is what was written, byte for byte */
inline equal_next_shares_trade_report_message(next_shares_trade_report_message_read, next_shares_trade_report_message_written) {
  assert(next_shares_trade_report_message_read.market_center_identifier == next_shares_trade_report_message_written.market_center_identifier);
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 8 -> assert(next_shares_trade_report_message_read.next_shares_symbol[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.next_shares_symbol[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  assert(next_shares_trade_report_message_read.security_class == next_shares_trade_report_message_written.security_class);
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 10 -> assert(next_shares_trade_report_message_read.trade_control_number[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.trade_control_number[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.proxy_price[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.proxy_price[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.trade_size[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.trade_size[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  next_shares_trade_report_message_at = 0;
  do
  :: next_shares_trade_report_message_at < 4 -> assert(next_shares_trade_report_message_read.nav_premium_discount_amount[next_shares_trade_report_message_at] == next_shares_trade_report_message_written.nav_premium_discount_amount[next_shares_trade_report_message_at]); next_shares_trade_report_message_at = next_shares_trade_report_message_at + 1
  :: else -> break
  od;
  assert(next_shares_trade_report_message_read.sale_condition_modifier_level_1 == next_shares_trade_report_message_written.sale_condition_modifier_level_1);
  assert(next_shares_trade_report_message_read.sale_condition_modifier_level_2 == next_shares_trade_report_message_written.sale_condition_modifier_level_2);
  assert(next_shares_trade_report_message_read.sale_condition_modifier_level_3 == next_shares_trade_report_message_written.sale_condition_modifier_level_3);
  assert(next_shares_trade_report_message_read.sale_condition_modifier_level_4 == next_shares_trade_report_message_written.sale_condition_modifier_level_4);
  skip
}

/* ---- Trade Cancel Error Message: 32 bytes ------------------------------------ */

/* The following message is used in the event that a PSX trade transaction is cancelled on the same business day that it is reported */
typedef TradeCancelErrorMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_trade_size[4];
  byte original_sale_condition_modifier[4]
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_record.market_center_identifier = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = trade_cancel_error_message_value;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Error Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_base) {
  trade_cancel_error_message_record.market_center_identifier = (trade_cancel_error_message_base + 0 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 1 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = (trade_cancel_error_message_base + 9 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 10 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 20 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 24 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 28 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message to the wire, 32 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  wire[at] = trade_cancel_error_message_record.market_center_identifier; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.security_class; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> wire[at] = trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message off the wire, 32 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = wire[at]; at = at + 1;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Error Message is what was written, byte for byte */
inline equal_trade_cancel_error_message(trade_cancel_error_message_read, trade_cancel_error_message_written) {
  assert(trade_cancel_error_message_read.market_center_identifier == trade_cancel_error_message_written.market_center_identifier);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.issue_symbol[trade_cancel_error_message_at] == trade_cancel_error_message_written.issue_symbol[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.security_class == trade_cancel_error_message_written.security_class);
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> assert(trade_cancel_error_message_read.original_trade_control_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_control_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_trade_size[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_size[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_sale_condition_modifier[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_sale_condition_modifier[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Error For Next Shares Message: 36 bytes -------------------- */

/* The following message is used in the event that a Nasdaq or TRF trade transaction for an NextShares is cancelled on the same business day that it is reported. */
typedef TradeCancelErrorForNextSharesMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_nav_premium_discount_amount[4];
  byte original_trade_size[4];
  byte original_sale_condition_modifier[4]
};

int trade_cancel_error_for_next_shares_message_at;

/* every byte of Trade Cancel Error For Next Shares Message set to one value */
inline fill_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_record, trade_cancel_error_for_next_shares_message_value) {
  trade_cancel_error_for_next_shares_message_record.market_center_identifier = trade_cancel_error_for_next_shares_message_value;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 8 -> trade_cancel_error_for_next_shares_message_record.issue_symbol[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_record.security_class = trade_cancel_error_for_next_shares_message_value;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 10 -> trade_cancel_error_for_next_shares_message_record.original_trade_control_number[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_price[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_size[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at] = trade_cancel_error_for_next_shares_message_value; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancel Error For Next Shares Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_record, trade_cancel_error_for_next_shares_message_base) {
  trade_cancel_error_for_next_shares_message_record.market_center_identifier = (trade_cancel_error_for_next_shares_message_base + 0 + 1) % 256;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 8 -> trade_cancel_error_for_next_shares_message_record.issue_symbol[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 1 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_record.security_class = (trade_cancel_error_for_next_shares_message_base + 9 + 1) % 256;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 10 -> trade_cancel_error_for_next_shares_message_record.original_trade_control_number[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 10 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_price[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 20 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 24 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_size[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 28 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at] = (trade_cancel_error_for_next_shares_message_base + 32 + trade_cancel_error_for_next_shares_message_at + 1) % 256; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error For Next Shares Message to the wire, 36 bytes from where the cursor stands */
inline encode_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_record) {
  wire[at] = trade_cancel_error_for_next_shares_message_record.market_center_identifier; at = at + 1;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 8 -> wire[at] = trade_cancel_error_for_next_shares_message_record.issue_symbol[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_for_next_shares_message_record.security_class; at = at + 1;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 10 -> wire[at] = trade_cancel_error_for_next_shares_message_record.original_trade_control_number[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> wire[at] = trade_cancel_error_for_next_shares_message_record.original_trade_price[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> wire[at] = trade_cancel_error_for_next_shares_message_record.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> wire[at] = trade_cancel_error_for_next_shares_message_record.original_trade_size[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> wire[at] = trade_cancel_error_for_next_shares_message_record.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error For Next Shares Message off the wire, 36 bytes from where the cursor stands */
inline decode_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_record) {
  trade_cancel_error_for_next_shares_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 8 -> trade_cancel_error_for_next_shares_message_record.issue_symbol[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_record.security_class = wire[at]; at = at + 1;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 10 -> trade_cancel_error_for_next_shares_message_record.original_trade_control_number[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_price[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_trade_size[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> trade_cancel_error_for_next_shares_message_record.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at] = wire[at]; at = at + 1; trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancel Error For Next Shares Message is what was written, byte for byte */
inline equal_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_read, trade_cancel_error_for_next_shares_message_written) {
  assert(trade_cancel_error_for_next_shares_message_read.market_center_identifier == trade_cancel_error_for_next_shares_message_written.market_center_identifier);
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 8 -> assert(trade_cancel_error_for_next_shares_message_read.issue_symbol[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.issue_symbol[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_for_next_shares_message_read.security_class == trade_cancel_error_for_next_shares_message_written.security_class);
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 10 -> assert(trade_cancel_error_for_next_shares_message_read.original_trade_control_number[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.original_trade_control_number[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> assert(trade_cancel_error_for_next_shares_message_read.original_trade_price[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.original_trade_price[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> assert(trade_cancel_error_for_next_shares_message_read.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.original_nav_premium_discount_amount[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> assert(trade_cancel_error_for_next_shares_message_read.original_trade_size[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.original_trade_size[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_for_next_shares_message_at = 0;
  do
  :: trade_cancel_error_for_next_shares_message_at < 4 -> assert(trade_cancel_error_for_next_shares_message_read.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at] == trade_cancel_error_for_next_shares_message_written.original_sale_condition_modifier[trade_cancel_error_for_next_shares_message_at]); trade_cancel_error_for_next_shares_message_at = trade_cancel_error_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 54 bytes -------------------------------------- */

/* The following message is used in the event that a TRF trade transaction is corrected on the same business day that it is reported. */
typedef TradeCorrectionMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_trade_size[4];
  byte original_sale_condition_modifier[4];
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[4];
  byte corrected_trade_size[4];
  byte corrected_sale_condition_modifier[4]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_record.market_center_identifier = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = trade_correction_message_value;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition_modifier[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_message(trade_correction_message_record, trade_correction_message_base) {
  trade_correction_message_record.market_center_identifier = (trade_correction_message_base + 0 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = (trade_correction_message_base + 1 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = (trade_correction_message_base + 9 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 10 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 20 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = (trade_correction_message_base + 24 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition_modifier[trade_correction_message_at] = (trade_correction_message_base + 28 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 32 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 42 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = (trade_correction_message_base + 46 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at] = (trade_correction_message_base + 50 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 54 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  wire[at] = trade_correction_message_record.market_center_identifier; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.issue_symbol[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.security_class; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.original_trade_control_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.original_sale_condition_modifier[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> wire[at] = trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 54 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = wire[at]; at = at + 1;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition_modifier[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction Message is what was written, byte for byte */
inline equal_trade_correction_message(trade_correction_message_read, trade_correction_message_written) {
  assert(trade_correction_message_read.market_center_identifier == trade_correction_message_written.market_center_identifier);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.issue_symbol[trade_correction_message_at] == trade_correction_message_written.issue_symbol[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.security_class == trade_correction_message_written.security_class);
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.original_trade_control_number[trade_correction_message_at] == trade_correction_message_written.original_trade_control_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_trade_size[trade_correction_message_at] == trade_correction_message_written.original_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.original_sale_condition_modifier[trade_correction_message_at] == trade_correction_message_written.original_sale_condition_modifier[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> assert(trade_correction_message_read.corrected_trade_control_number[trade_correction_message_at] == trade_correction_message_written.corrected_trade_control_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_trade_size[trade_correction_message_at] == trade_correction_message_written.corrected_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_sale_condition_modifier[trade_correction_message_at] == trade_correction_message_written.corrected_sale_condition_modifier[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction For Next Shares Message: 62 bytes ---------------------- */

/* The following message is used in the event that a TRF trade transaction for a NextShares is corrected on the same business day that it is reported. */
typedef TradeCorrectionForNextSharesMessage {
  byte market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[4];
  byte original_nav_premium_discount_amount[4];
  byte original_trade_size[4];
  byte original_sale_condition_modifier[4];
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[4];
  byte corrected_nav_premium_discount_amount[4];
  byte corrected_trade_size[4];
  byte corrected_sale_condition_modifier[4]
};

int trade_correction_for_next_shares_message_at;

/* every byte of Trade Correction For Next Shares Message set to one value */
inline fill_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_record, trade_correction_for_next_shares_message_value) {
  trade_correction_for_next_shares_message_record.market_center_identifier = trade_correction_for_next_shares_message_value;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 8 -> trade_correction_for_next_shares_message_record.issue_symbol[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_record.security_class = trade_correction_for_next_shares_message_value;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.original_trade_control_number[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_price[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_size[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_sale_condition_modifier[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.corrected_trade_control_number[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_price[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_size[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at] = trade_correction_for_next_shares_message_value; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Correction For Next Shares Message set to where it lies, so a field read out of place says so */
inline ramp_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_record, trade_correction_for_next_shares_message_base) {
  trade_correction_for_next_shares_message_record.market_center_identifier = (trade_correction_for_next_shares_message_base + 0 + 1) % 256;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 8 -> trade_correction_for_next_shares_message_record.issue_symbol[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 1 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_record.security_class = (trade_correction_for_next_shares_message_base + 9 + 1) % 256;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.original_trade_control_number[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 10 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_price[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 20 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 24 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_size[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 28 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_sale_condition_modifier[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 32 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.corrected_trade_control_number[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 36 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_price[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 46 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 50 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_size[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 54 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at] = (trade_correction_for_next_shares_message_base + 58 + trade_correction_for_next_shares_message_at + 1) % 256; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction For Next Shares Message to the wire, 62 bytes from where the cursor stands */
inline encode_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_record) {
  wire[at] = trade_correction_for_next_shares_message_record.market_center_identifier; at = at + 1;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 8 -> wire[at] = trade_correction_for_next_shares_message_record.issue_symbol[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_for_next_shares_message_record.security_class; at = at + 1;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> wire[at] = trade_correction_for_next_shares_message_record.original_trade_control_number[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.original_trade_price[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.original_trade_size[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.original_sale_condition_modifier[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> wire[at] = trade_correction_for_next_shares_message_record.corrected_trade_control_number[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.corrected_trade_price[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.corrected_trade_size[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> wire[at] = trade_correction_for_next_shares_message_record.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction For Next Shares Message off the wire, 62 bytes from where the cursor stands */
inline decode_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_record) {
  trade_correction_for_next_shares_message_record.market_center_identifier = wire[at]; at = at + 1;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 8 -> trade_correction_for_next_shares_message_record.issue_symbol[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_record.security_class = wire[at]; at = at + 1;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.original_trade_control_number[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_price[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_trade_size[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.original_sale_condition_modifier[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> trade_correction_for_next_shares_message_record.corrected_trade_control_number[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_price[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_trade_size[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> trade_correction_for_next_shares_message_record.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at] = wire[at]; at = at + 1; trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Correction For Next Shares Message is what was written, byte for byte */
inline equal_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_read, trade_correction_for_next_shares_message_written) {
  assert(trade_correction_for_next_shares_message_read.market_center_identifier == trade_correction_for_next_shares_message_written.market_center_identifier);
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 8 -> assert(trade_correction_for_next_shares_message_read.issue_symbol[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.issue_symbol[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_for_next_shares_message_read.security_class == trade_correction_for_next_shares_message_written.security_class);
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> assert(trade_correction_for_next_shares_message_read.original_trade_control_number[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.original_trade_control_number[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.original_trade_price[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.original_trade_price[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.original_nav_premium_discount_amount[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.original_trade_size[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.original_trade_size[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.original_sale_condition_modifier[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.original_sale_condition_modifier[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 10 -> assert(trade_correction_for_next_shares_message_read.corrected_trade_control_number[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.corrected_trade_control_number[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.corrected_trade_price[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.corrected_trade_price[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.corrected_nav_premium_discount_amount[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.corrected_trade_size[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.corrected_trade_size[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  trade_correction_for_next_shares_message_at = 0;
  do
  :: trade_correction_for_next_shares_message_at < 4 -> assert(trade_correction_for_next_shares_message_read.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at] == trade_correction_for_next_shares_message_written.corrected_sale_condition_modifier[trade_correction_for_next_shares_message_at]); trade_correction_for_next_shares_message_at = trade_correction_for_next_shares_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Action Message: 14 bytes ---------------------------------------- */

/* PSX uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef TradingActionMessage {
  byte issue_symbol[8];
  byte security_class;
  byte current_trading_state;
  byte trading_action_reason[4]
};

int trading_action_message_at;

/* every byte of Trading Action Message set to one value */
inline fill_trading_action_message(trading_action_message_record, trading_action_message_value) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.issue_symbol[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.security_class = trading_action_message_value;
  trading_action_message_record.current_trading_state = trading_action_message_value;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.trading_action_reason[trading_action_message_at] = trading_action_message_value; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_trading_action_message(trading_action_message_record, trading_action_message_base) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.issue_symbol[trading_action_message_at] = (trading_action_message_base + 0 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.security_class = (trading_action_message_base + 8 + 1) % 256;
  trading_action_message_record.current_trading_state = (trading_action_message_base + 9 + 1) % 256;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.trading_action_reason[trading_action_message_at] = (trading_action_message_base + 10 + trading_action_message_at + 1) % 256; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message to the wire, 14 bytes from where the cursor stands */
inline encode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> wire[at] = trading_action_message_record.issue_symbol[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_action_message_record.security_class; at = at + 1;
  wire[at] = trading_action_message_record.current_trading_state; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> wire[at] = trading_action_message_record.trading_action_reason[trading_action_message_at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Action Message off the wire, 14 bytes from where the cursor stands */
inline decode_trading_action_message(trading_action_message_record) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> trading_action_message_record.issue_symbol[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  trading_action_message_record.security_class = wire[at]; at = at + 1;
  trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> trading_action_message_record.trading_action_reason[trading_action_message_at] = wire[at]; at = at + 1; trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Action Message is what was written, byte for byte */
inline equal_trading_action_message(trading_action_message_read, trading_action_message_written) {
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 8 -> assert(trading_action_message_read.issue_symbol[trading_action_message_at] == trading_action_message_written.issue_symbol[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  assert(trading_action_message_read.security_class == trading_action_message_written.security_class);
  assert(trading_action_message_read.current_trading_state == trading_action_message_written.current_trading_state);
  trading_action_message_at = 0;
  do
  :: trading_action_message_at < 4 -> assert(trading_action_message_read.trading_action_reason[trading_action_message_at] == trading_action_message_written.trading_action_reason[trading_action_message_at]); trading_action_message_at = trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 9 bytes ----- */

/* For Nasdaq-listed issues, Nasdaq supports a full pre-opening spin of Reg SHO Short Sale Price Test Restricted Indicator messages indicating the Rule 201 status for all active issues. Nasdaq also sends the Reg SHO Short Sale Price Test Restricted Indicator message in the event of an intraday status change. For other exchange-listed issues, Nasdaq relays the Reg SHO Short Sale Price Test Restricted Indicator message when it receives an update from the primary listing exchange. */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte stock[8];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 8 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 9 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 9 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.stock[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Stock Directory Message: 28 bytes --------------------------------------- */

/* At the start of each trading day, PSX disseminates stock directory messages for all active symbols in the PSX system */
typedef StockDirectoryMessage {
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
  :: stock_directory_message_at < 8 -> stock_directory_message_record.stock[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.market_category = (stock_directory_message_base + 8 + 1) % 256;
  stock_directory_message_record.financial_status_indicator = (stock_directory_message_base + 9 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.round_lot_size[stock_directory_message_at] = (stock_directory_message_base + 10 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.round_lots_only = (stock_directory_message_base + 14 + 1) % 256;
  stock_directory_message_record.issue_classification = (stock_directory_message_base + 15 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.issue_sub_type[stock_directory_message_at] = (stock_directory_message_base + 16 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.authenticity = (stock_directory_message_base + 18 + 1) % 256;
  stock_directory_message_record.short_sale_threshold_indicator = (stock_directory_message_base + 19 + 1) % 256;
  stock_directory_message_record.ipo_flag = (stock_directory_message_base + 20 + 1) % 256;
  stock_directory_message_record.luld_reference_price_tier = (stock_directory_message_base + 21 + 1) % 256;
  stock_directory_message_record.etp_flag = (stock_directory_message_base + 22 + 1) % 256;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 4 -> stock_directory_message_record.etp_leverage_factor[stock_directory_message_at] = (stock_directory_message_base + 23 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_record.inverse_indicator = (stock_directory_message_base + 27 + 1) % 256;
  skip
}

/* Stock Directory Message to the wire, 28 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
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

/* Stock Directory Message off the wire, 28 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
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

/* ---- Mwcb Decline Level Message: 24 bytes ------------------------------------ */

/* Informs data recipients what the daily MWCB breach points are set to for the current trading day. */
typedef MwcbDeclineLevelMessage {
  byte level_1[8];
  byte level_2[8];
  byte level_3[8]
};

int mwcb_decline_level_message_at;

/* every byte of Mwcb Decline Level Message set to one value */
inline fill_mwcb_decline_level_message(mwcb_decline_level_message_record, mwcb_decline_level_message_value) {
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
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_1[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 0 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_2[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 8 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 8 -> mwcb_decline_level_message_record.level_3[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 16 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mwcb Decline Level Message to the wire, 24 bytes from where the cursor stands */
inline encode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
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

/* Mwcb Decline Level Message off the wire, 24 bytes from where the cursor stands */
inline decode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
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

/* ---- Mwcb Breach Message: 1 bytes -------------------------------------------- */

/* Informs data recipients when a MWCB has breached one of the established levels */
typedef MwcbBreachMessage {
  byte breached_level
};

/* every byte of Mwcb Breach Message set to one value */
inline fill_mwcb_breach_message(mwcb_breach_message_record, mwcb_breach_message_value) {
  mwcb_breach_message_record.breached_level = mwcb_breach_message_value;
  skip
}

/* each byte of Mwcb Breach Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_breach_message(mwcb_breach_message_record, mwcb_breach_message_base) {
  mwcb_breach_message_record.breached_level = (mwcb_breach_message_base + 0 + 1) % 256;
  skip
}

/* Mwcb Breach Message to the wire, 1 bytes from where the cursor stands */
inline encode_mwcb_breach_message(mwcb_breach_message_record) {
  wire[at] = mwcb_breach_message_record.breached_level; at = at + 1;
  skip
}

/* Mwcb Breach Message off the wire, 1 bytes from where the cursor stands */
inline decode_mwcb_breach_message(mwcb_breach_message_record) {
  mwcb_breach_message_record.breached_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Mwcb Breach Message is what was written, byte for byte */
inline equal_mwcb_breach_message(mwcb_breach_message_read, mwcb_breach_message_written) {
  assert(mwcb_breach_message_read.breached_level == mwcb_breach_message_written.breached_level);
  skip
}

/* ---- Operational Halt Message: 10 bytes -------------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of the three market centers operated by Nasdaq. */
typedef OperationalHaltMessage {
  byte stock[8];
  byte market_code;
  byte operational_halt_action
};

int operational_halt_message_at;

/* every byte of Operational Halt Message set to one value */
inline fill_operational_halt_message(operational_halt_message_record, operational_halt_message_value) {
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
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock[operational_halt_message_at] = (operational_halt_message_base + 0 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_record.market_code = (operational_halt_message_base + 8 + 1) % 256;
  operational_halt_message_record.operational_halt_action = (operational_halt_message_base + 9 + 1) % 256;
  skip
}

/* Operational Halt Message to the wire, 10 bytes from where the cursor stands */
inline encode_operational_halt_message(operational_halt_message_record) {
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> wire[at] = operational_halt_message_record.stock[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  wire[at] = operational_halt_message_record.market_code; at = at + 1;
  wire[at] = operational_halt_message_record.operational_halt_action; at = at + 1;
  skip
}

/* Operational Halt Message off the wire, 10 bytes from where the cursor stands */
inline decode_operational_halt_message(operational_halt_message_record) {
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
    assert(at == 11);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 11);
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

/* Trade Report Message: encoded, read back, and compared */
proctype check_trade_report_message() {
  TradeReportMessage trade_report_message_sent;
  TradeReportMessage trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_report_message(trade_report_message_sent, 0)
  :: pattern == 1 -> fill_trade_report_message(trade_report_message_sent, 32)
  :: pattern == 2 -> fill_trade_report_message(trade_report_message_sent, 255)
  :: else -> ramp_trade_report_message(trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_report_message(trade_report_message_sent);
    assert(at == 32);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 32);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
  }
}

/* Next Shares Trade Report Message: encoded, read back, and compared */
proctype check_next_shares_trade_report_message() {
  NextSharesTradeReportMessage next_shares_trade_report_message_sent;
  NextSharesTradeReportMessage next_shares_trade_report_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 0)
  :: pattern == 1 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 32)
  :: pattern == 2 -> fill_next_shares_trade_report_message(next_shares_trade_report_message_sent, 255)
  :: else -> ramp_next_shares_trade_report_message(next_shares_trade_report_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_next_shares_trade_report_message(next_shares_trade_report_message_sent);
    assert(at == 36);
    at = 0;
    decode_next_shares_trade_report_message(next_shares_trade_report_message_got);
    assert(at == 36);
    equal_next_shares_trade_report_message(next_shares_trade_report_message_got, next_shares_trade_report_message_sent)
  }
}

/* Trade Cancel Error Message: encoded, read back, and compared */
proctype check_trade_cancel_error_message() {
  TradeCancelErrorMessage trade_cancel_error_message_sent;
  TradeCancelErrorMessage trade_cancel_error_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_message(trade_cancel_error_message_sent, 255)
  :: else -> ramp_trade_cancel_error_message(trade_cancel_error_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_message(trade_cancel_error_message_sent);
    assert(at == 32);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 32);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
  }
}

/* Trade Cancel Error For Next Shares Message: encoded, read back, and compared */
proctype check_trade_cancel_error_for_next_shares_message() {
  TradeCancelErrorForNextSharesMessage trade_cancel_error_for_next_shares_message_sent;
  TradeCancelErrorForNextSharesMessage trade_cancel_error_for_next_shares_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_sent, 255)
  :: else -> ramp_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_sent);
    assert(at == 36);
    at = 0;
    decode_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_got);
    assert(at == 36);
    equal_trade_cancel_error_for_next_shares_message(trade_cancel_error_for_next_shares_message_got, trade_cancel_error_for_next_shares_message_sent)
  }
}

/* Trade Correction Message: encoded, read back, and compared */
proctype check_trade_correction_message() {
  TradeCorrectionMessage trade_correction_message_sent;
  TradeCorrectionMessage trade_correction_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_message(trade_correction_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_message(trade_correction_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_message(trade_correction_message_sent, 255)
  :: else -> ramp_trade_correction_message(trade_correction_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_message(trade_correction_message_sent);
    assert(at == 54);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 54);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
  }
}

/* Trade Correction For Next Shares Message: encoded, read back, and compared */
proctype check_trade_correction_for_next_shares_message() {
  TradeCorrectionForNextSharesMessage trade_correction_for_next_shares_message_sent;
  TradeCorrectionForNextSharesMessage trade_correction_for_next_shares_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_sent, 0)
  :: pattern == 1 -> fill_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_sent, 32)
  :: pattern == 2 -> fill_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_sent, 255)
  :: else -> ramp_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_sent);
    assert(at == 62);
    at = 0;
    decode_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_got);
    assert(at == 62);
    equal_trade_correction_for_next_shares_message(trade_correction_for_next_shares_message_got, trade_correction_for_next_shares_message_sent)
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
    assert(at == 14);
    at = 0;
    decode_trading_action_message(trading_action_message_got);
    assert(at == 14);
    equal_trading_action_message(trading_action_message_got, trading_action_message_sent)
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
    assert(at == 9);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 9);
    equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got, reg_sho_short_sale_price_test_restricted_indicator_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 28);
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
    assert(at == 24);
    at = 0;
    decode_mwcb_decline_level_message(mwcb_decline_level_message_got);
    assert(at == 24);
    equal_mwcb_decline_level_message(mwcb_decline_level_message_got, mwcb_decline_level_message_sent)
  }
}

/* Mwcb Breach Message: encoded, read back, and compared */
proctype check_mwcb_breach_message() {
  MwcbBreachMessage mwcb_breach_message_sent;
  MwcbBreachMessage mwcb_breach_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mwcb_breach_message(mwcb_breach_message_sent, 0)
  :: pattern == 1 -> fill_mwcb_breach_message(mwcb_breach_message_sent, 32)
  :: pattern == 2 -> fill_mwcb_breach_message(mwcb_breach_message_sent, 255)
  :: else -> ramp_mwcb_breach_message(mwcb_breach_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mwcb_breach_message(mwcb_breach_message_sent);
    assert(at == 1);
    at = 0;
    decode_mwcb_breach_message(mwcb_breach_message_got);
    assert(at == 1);
    equal_mwcb_breach_message(mwcb_breach_message_got, mwcb_breach_message_sent)
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
    assert(at == 10);
    at = 0;
    decode_operational_halt_message(operational_halt_message_got);
    assert(at == 10);
    equal_operational_halt_message(operational_halt_message_got, operational_halt_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_trade_report_message()
  :: run check_next_shares_trade_report_message()
  :: run check_trade_cancel_error_message()
  :: run check_trade_cancel_error_for_next_shares_message()
  :: run check_trade_correction_message()
  :: run check_trade_correction_for_next_shares_message()
  :: run check_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_stock_directory_message()
  :: run check_mwcb_decline_level_message()
  :: run check_mwcb_breach_message()
  :: run check_operational_halt_message()
  fi
}
