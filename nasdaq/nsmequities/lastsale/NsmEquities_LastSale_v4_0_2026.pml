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
#define WIRE 86

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
  byte tracking_number[2];
  byte timestamp[6];
  byte event_code
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
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
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
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

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
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

/* ---- Trade Report Message: 56 bytes ------------------------------------------ */

/* The following message is used to relay trade transactions that are reported for the current business day. Please note that Nasdaq only reports one-side of a trade execution on the Last Sale feeds. */
typedef TradeReportMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte client_timestamp[8];
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte trade_control_number[10];
  byte trade_price[8];
  byte trade_size[8];
  byte sale_condition_modifier[4]
};

int trade_report_message_at;

/* every byte of Trade Report Message set to one value */
inline fill_trade_report_message(trade_report_message_record, trade_report_message_value) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.tracking_number[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 6 -> trade_report_message_record.timestamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.client_timestamp[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = trade_report_message_value;
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
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_size[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sale_condition_modifier[trade_report_message_at] = trade_report_message_value; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Report Message set to where it lies, so a field read out of place says so */
inline ramp_trade_report_message(trade_report_message_record, trade_report_message_base) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.tracking_number[trade_report_message_at] = (trade_report_message_base + 0 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 6 -> trade_report_message_record.timestamp[trade_report_message_at] = (trade_report_message_base + 2 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.client_timestamp[trade_report_message_at] = (trade_report_message_base + 8 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = (trade_report_message_base + 16 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.issue_symbol[trade_report_message_at] = (trade_report_message_base + 17 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.security_class = (trade_report_message_base + 25 + 1) % 256;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 10 -> trade_report_message_record.trade_control_number[trade_report_message_at] = (trade_report_message_base + 26 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = (trade_report_message_base + 36 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_size[trade_report_message_at] = (trade_report_message_base + 44 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sale_condition_modifier[trade_report_message_at] = (trade_report_message_base + 52 + trade_report_message_at + 1) % 256; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message to the wire, 56 bytes from where the cursor stands */
inline encode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> wire[at] = trade_report_message_record.tracking_number[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 6 -> wire[at] = trade_report_message_record.timestamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.client_timestamp[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_report_message_record.originating_market_center_identifier; at = at + 1;
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
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trade_price[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> wire[at] = trade_report_message_record.trade_size[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> wire[at] = trade_report_message_record.sale_condition_modifier[trade_report_message_at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Report Message off the wire, 56 bytes from where the cursor stands */
inline decode_trade_report_message(trade_report_message_record) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> trade_report_message_record.tracking_number[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 6 -> trade_report_message_record.timestamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.client_timestamp[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
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
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_price[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> trade_report_message_record.trade_size[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> trade_report_message_record.sale_condition_modifier[trade_report_message_at] = wire[at]; at = at + 1; trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Report Message is what was written, byte for byte */
inline equal_trade_report_message(trade_report_message_read, trade_report_message_written) {
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 2 -> assert(trade_report_message_read.tracking_number[trade_report_message_at] == trade_report_message_written.tracking_number[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 6 -> assert(trade_report_message_read.timestamp[trade_report_message_at] == trade_report_message_written.timestamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.client_timestamp[trade_report_message_at] == trade_report_message_written.client_timestamp[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  assert(trade_report_message_read.originating_market_center_identifier == trade_report_message_written.originating_market_center_identifier);
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
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trade_price[trade_report_message_at] == trade_report_message_written.trade_price[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 8 -> assert(trade_report_message_read.trade_size[trade_report_message_at] == trade_report_message_written.trade_size[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  trade_report_message_at = 0;
  do
  :: trade_report_message_at < 4 -> assert(trade_report_message_read.sale_condition_modifier[trade_report_message_at] == trade_report_message_written.sale_condition_modifier[trade_report_message_at]); trade_report_message_at = trade_report_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Cancel Error Message: 56 bytes ------------------------------------ */

/* The following message is used in the event that a transaction is cancelled on the same business day that it is reported. */
typedef TradeCancelErrorMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte client_timestamp[8];
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[8];
  byte original_trade_size[8];
  byte original_sale_condition_modifier[4]
};

int trade_cancel_error_message_at;

/* every byte of Trade Cancel Error Message set to one value */
inline fill_trade_cancel_error_message(trade_cancel_error_message_record, trade_cancel_error_message_value) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.tracking_number[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 6 -> trade_cancel_error_message_record.timestamp[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.client_timestamp[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.originating_market_center_identifier = trade_cancel_error_message_value;
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
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = trade_cancel_error_message_value; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
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
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.tracking_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 0 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 6 -> trade_cancel_error_message_record.timestamp[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 2 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.client_timestamp[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 8 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.originating_market_center_identifier = (trade_cancel_error_message_base + 16 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.issue_symbol[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 17 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.security_class = (trade_cancel_error_message_base + 25 + 1) % 256;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 10 -> trade_cancel_error_message_record.original_trade_control_number[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 26 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 36 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 44 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at] = (trade_cancel_error_message_base + 52 + trade_cancel_error_message_at + 1) % 256; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message to the wire, 56 bytes from where the cursor stands */
inline encode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> wire[at] = trade_cancel_error_message_record.tracking_number[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 6 -> wire[at] = trade_cancel_error_message_record.timestamp[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.client_timestamp[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_cancel_error_message_record.originating_market_center_identifier; at = at + 1;
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
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> wire[at] = trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> wire[at] = trade_cancel_error_message_record.original_sale_condition_modifier[trade_cancel_error_message_at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancel Error Message off the wire, 56 bytes from where the cursor stands */
inline decode_trade_cancel_error_message(trade_cancel_error_message_record) {
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> trade_cancel_error_message_record.tracking_number[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 6 -> trade_cancel_error_message_record.timestamp[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.client_timestamp[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
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
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_price[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> trade_cancel_error_message_record.original_trade_size[trade_cancel_error_message_at] = wire[at]; at = at + 1; trade_cancel_error_message_at = trade_cancel_error_message_at + 1
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
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 2 -> assert(trade_cancel_error_message_read.tracking_number[trade_cancel_error_message_at] == trade_cancel_error_message_written.tracking_number[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 6 -> assert(trade_cancel_error_message_read.timestamp[trade_cancel_error_message_at] == trade_cancel_error_message_written.timestamp[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.client_timestamp[trade_cancel_error_message_at] == trade_cancel_error_message_written.client_timestamp[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  assert(trade_cancel_error_message_read.originating_market_center_identifier == trade_cancel_error_message_written.originating_market_center_identifier);
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
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_trade_price[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_price[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 8 -> assert(trade_cancel_error_message_read.original_trade_size[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_trade_size[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  trade_cancel_error_message_at = 0;
  do
  :: trade_cancel_error_message_at < 4 -> assert(trade_cancel_error_message_read.original_sale_condition_modifier[trade_cancel_error_message_at] == trade_cancel_error_message_written.original_sale_condition_modifier[trade_cancel_error_message_at]); trade_cancel_error_message_at = trade_cancel_error_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Correction Message: 86 bytes -------------------------------------- */

/* The following message is used in the event that a trade transaction is corrected on the same business day that it is reported. */
typedef TradeCorrectionMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte client_timestamp[8];
  byte originating_market_center_identifier;
  byte issue_symbol[8];
  byte security_class;
  byte original_trade_control_number[10];
  byte original_trade_price[8];
  byte original_trade_size[8];
  byte original_sale_condition_modifier[4];
  byte corrected_trade_control_number[10];
  byte corrected_trade_price[8];
  byte corrected_trade_size[8];
  byte corrected_sale_condition_modifier[4]
};

int trade_correction_message_at;

/* every byte of Trade Correction Message set to one value */
inline fill_trade_correction_message(trade_correction_message_record, trade_correction_message_value) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.tracking_number[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.timestamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.client_timestamp[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = trade_correction_message_value;
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
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
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
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = trade_correction_message_value; trade_correction_message_at = trade_correction_message_at + 1
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
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.tracking_number[trade_correction_message_at] = (trade_correction_message_base + 0 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.timestamp[trade_correction_message_at] = (trade_correction_message_base + 2 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.client_timestamp[trade_correction_message_at] = (trade_correction_message_base + 8 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = (trade_correction_message_base + 16 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.issue_symbol[trade_correction_message_at] = (trade_correction_message_base + 17 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.security_class = (trade_correction_message_base + 25 + 1) % 256;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.original_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 26 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = (trade_correction_message_base + 36 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = (trade_correction_message_base + 44 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.original_sale_condition_modifier[trade_correction_message_at] = (trade_correction_message_base + 52 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 10 -> trade_correction_message_record.corrected_trade_control_number[trade_correction_message_at] = (trade_correction_message_base + 56 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = (trade_correction_message_base + 66 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = (trade_correction_message_base + 74 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at] = (trade_correction_message_base + 82 + trade_correction_message_at + 1) % 256; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message to the wire, 86 bytes from where the cursor stands */
inline encode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> wire[at] = trade_correction_message_record.tracking_number[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> wire[at] = trade_correction_message_record.timestamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.client_timestamp[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_correction_message_record.originating_market_center_identifier; at = at + 1;
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
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.original_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
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
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_price[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> wire[at] = trade_correction_message_record.corrected_trade_size[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> wire[at] = trade_correction_message_record.corrected_sale_condition_modifier[trade_correction_message_at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Correction Message off the wire, 86 bytes from where the cursor stands */
inline decode_trade_correction_message(trade_correction_message_record) {
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> trade_correction_message_record.tracking_number[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> trade_correction_message_record.timestamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.client_timestamp[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_record.originating_market_center_identifier = wire[at]; at = at + 1;
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
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.original_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
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
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_price[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> trade_correction_message_record.corrected_trade_size[trade_correction_message_at] = wire[at]; at = at + 1; trade_correction_message_at = trade_correction_message_at + 1
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
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 2 -> assert(trade_correction_message_read.tracking_number[trade_correction_message_at] == trade_correction_message_written.tracking_number[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 6 -> assert(trade_correction_message_read.timestamp[trade_correction_message_at] == trade_correction_message_written.timestamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.client_timestamp[trade_correction_message_at] == trade_correction_message_written.client_timestamp[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  assert(trade_correction_message_read.originating_market_center_identifier == trade_correction_message_written.originating_market_center_identifier);
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
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_price[trade_correction_message_at] == trade_correction_message_written.original_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.original_trade_size[trade_correction_message_at] == trade_correction_message_written.original_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
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
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_price[trade_correction_message_at] == trade_correction_message_written.corrected_trade_price[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 8 -> assert(trade_correction_message_read.corrected_trade_size[trade_correction_message_at] == trade_correction_message_written.corrected_trade_size[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  trade_correction_message_at = 0;
  do
  :: trade_correction_message_at < 4 -> assert(trade_correction_message_read.corrected_sale_condition_modifier[trade_correction_message_at] == trade_correction_message_written.corrected_sale_condition_modifier[trade_correction_message_at]); trade_correction_message_at = trade_correction_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Stock Trading Action Message: 22 bytes ---------------------------------- */

/* Nasdaq uses this administrative message to indicate the current trading status of a security to the trading community. */
typedef StockTradingActionMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte issue_symbol[8];
  byte security_class;
  byte current_trading_state;
  byte reason[4]
};

int stock_trading_action_message_at;

/* every byte of Stock Trading Action Message set to one value */
inline fill_stock_trading_action_message(stock_trading_action_message_record, stock_trading_action_message_value) {
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
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = stock_trading_action_message_value; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = stock_trading_action_message_value;
  stock_trading_action_message_record.current_trading_state = stock_trading_action_message_value;
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
  :: stock_trading_action_message_at < 2 -> stock_trading_action_message_record.tracking_number[stock_trading_action_message_at] = (stock_trading_action_message_base + 0 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 6 -> stock_trading_action_message_record.timestamp[stock_trading_action_message_at] = (stock_trading_action_message_base + 2 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = (stock_trading_action_message_base + 8 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = (stock_trading_action_message_base + 16 + 1) % 256;
  stock_trading_action_message_record.current_trading_state = (stock_trading_action_message_base + 17 + 1) % 256;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> stock_trading_action_message_record.reason[stock_trading_action_message_at] = (stock_trading_action_message_base + 18 + stock_trading_action_message_at + 1) % 256; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message to the wire, 22 bytes from where the cursor stands */
inline encode_stock_trading_action_message(stock_trading_action_message_record) {
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
  :: stock_trading_action_message_at < 8 -> wire[at] = stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = stock_trading_action_message_record.security_class; at = at + 1;
  wire[at] = stock_trading_action_message_record.current_trading_state; at = at + 1;
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> wire[at] = stock_trading_action_message_record.reason[stock_trading_action_message_at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Trading Action Message off the wire, 22 bytes from where the cursor stands */
inline decode_stock_trading_action_message(stock_trading_action_message_record) {
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
  :: stock_trading_action_message_at < 8 -> stock_trading_action_message_record.issue_symbol[stock_trading_action_message_at] = wire[at]; at = at + 1; stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  stock_trading_action_message_record.security_class = wire[at]; at = at + 1;
  stock_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
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
  :: stock_trading_action_message_at < 8 -> assert(stock_trading_action_message_read.issue_symbol[stock_trading_action_message_at] == stock_trading_action_message_written.issue_symbol[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  assert(stock_trading_action_message_read.security_class == stock_trading_action_message_written.security_class);
  assert(stock_trading_action_message_read.current_trading_state == stock_trading_action_message_written.current_trading_state);
  stock_trading_action_message_at = 0;
  do
  :: stock_trading_action_message_at < 4 -> assert(stock_trading_action_message_read.reason[stock_trading_action_message_at] == stock_trading_action_message_written.reason[stock_trading_action_message_at]); stock_trading_action_message_at = stock_trading_action_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reg Sho Short Sale Price Test Restricted Indicator Message: 17 bytes ---- */

/* Nasdaq processes orders based on the most Reg SHO Restriction status value. */
typedef RegShoShortSalePriceTestRestrictedIndicatorMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte issue_symbol[8];
  byte reg_sho_action
};

int reg_sho_short_sale_price_test_restricted_indicator_message_at;

/* every byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to one value */
inline fill_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_value) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = reg_sho_short_sale_price_test_restricted_indicator_message_value; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = reg_sho_short_sale_price_test_restricted_indicator_message_value;
  skip
}

/* each byte of Reg Sho Short Sale Price Test Restricted Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record, reg_sho_short_sale_price_test_restricted_indicator_message_base) {
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 2 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.tracking_number[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 0 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 6 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.timestamp[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 2 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_at = 0;
  do
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 8 + reg_sho_short_sale_price_test_restricted_indicator_message_at + 1) % 256; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = (reg_sho_short_sale_price_test_restricted_indicator_message_base + 16 + 1) % 256;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message to the wire, 17 bytes from where the cursor stands */
inline encode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  wire[at] = reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action; at = at + 1;
  skip
}

/* Reg Sho Short Sale Price Test Restricted Indicator Message off the wire, 17 bytes from where the cursor stands */
inline decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_record) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> reg_sho_short_sale_price_test_restricted_indicator_message_record.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] = wire[at]; at = at + 1; reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  reg_sho_short_sale_price_test_restricted_indicator_message_record.reg_sho_action = wire[at]; at = at + 1;
  skip
}

/* what was read of Reg Sho Short Sale Price Test Restricted Indicator Message is what was written, byte for byte */
inline equal_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_read, reg_sho_short_sale_price_test_restricted_indicator_message_written) {
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
  :: reg_sho_short_sale_price_test_restricted_indicator_message_at < 8 -> assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at] == reg_sho_short_sale_price_test_restricted_indicator_message_written.issue_symbol[reg_sho_short_sale_price_test_restricted_indicator_message_at]); reg_sho_short_sale_price_test_restricted_indicator_message_at = reg_sho_short_sale_price_test_restricted_indicator_message_at + 1
  :: else -> break
  od;
  assert(reg_sho_short_sale_price_test_restricted_indicator_message_read.reg_sho_action == reg_sho_short_sale_price_test_restricted_indicator_message_written.reg_sho_action);
  skip
}

/* ---- Stock Directory Message: 48 bytes --------------------------------------- */

/* At the start of each trading day, Nasdaq disseminates stock directory messages for all active Nasdaq and non Nasdaq listed security symbols. */
typedef StockDirectoryMessage {
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
  byte bloomberg_id[12]
};

int stock_directory_message_at;

/* every byte of Stock Directory Message set to one value */
inline fill_stock_directory_message(stock_directory_message_record, stock_directory_message_value) {
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
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = stock_directory_message_value; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stock Directory Message set to where it lies, so a field read out of place says so */
inline ramp_stock_directory_message(stock_directory_message_record, stock_directory_message_base) {
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 2 -> stock_directory_message_record.tracking_number[stock_directory_message_at] = (stock_directory_message_base + 0 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 6 -> stock_directory_message_record.timestamp[stock_directory_message_at] = (stock_directory_message_base + 2 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
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
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = (stock_directory_message_base + 36 + stock_directory_message_at + 1) % 256; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message to the wire, 48 bytes from where the cursor stands */
inline encode_stock_directory_message(stock_directory_message_record) {
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
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> wire[at] = stock_directory_message_record.bloomberg_id[stock_directory_message_at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Stock Directory Message off the wire, 48 bytes from where the cursor stands */
inline decode_stock_directory_message(stock_directory_message_record) {
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
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> stock_directory_message_record.bloomberg_id[stock_directory_message_at] = wire[at]; at = at + 1; stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stock Directory Message is what was written, byte for byte */
inline equal_stock_directory_message(stock_directory_message_read, stock_directory_message_written) {
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
  stock_directory_message_at = 0;
  do
  :: stock_directory_message_at < 12 -> assert(stock_directory_message_read.bloomberg_id[stock_directory_message_at] == stock_directory_message_written.bloomberg_id[stock_directory_message_at]); stock_directory_message_at = stock_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Adjusted Closing Price Message: 25 bytes -------------------------------- */

/* At the start of each trading day, Nasdaq disseminates the adjusted closing price for all active symbols in the Nasdaq system. */
typedef AdjustedClosingPriceMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte issue_symbol[8];
  byte security_class;
  byte adjusted_closing_price[8]
};

int adjusted_closing_price_message_at;

/* every byte of Adjusted Closing Price Message set to one value */
inline fill_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_value) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 6 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = adjusted_closing_price_message_value;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = adjusted_closing_price_message_value; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Adjusted Closing Price Message set to where it lies, so a field read out of place says so */
inline ramp_adjusted_closing_price_message(adjusted_closing_price_message_record, adjusted_closing_price_message_base) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 0 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 6 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 2 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 8 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = (adjusted_closing_price_message_base + 16 + 1) % 256;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = (adjusted_closing_price_message_base + 17 + adjusted_closing_price_message_at + 1) % 256; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message to the wire, 25 bytes from where the cursor stands */
inline encode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> wire[at] = adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 6 -> wire[at] = adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  wire[at] = adjusted_closing_price_message_record.security_class; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> wire[at] = adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Adjusted Closing Price Message off the wire, 25 bytes from where the cursor stands */
inline decode_adjusted_closing_price_message(adjusted_closing_price_message_record) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> adjusted_closing_price_message_record.tracking_number[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 6 -> adjusted_closing_price_message_record.timestamp[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.issue_symbol[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_record.security_class = wire[at]; at = at + 1;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> adjusted_closing_price_message_record.adjusted_closing_price[adjusted_closing_price_message_at] = wire[at]; at = at + 1; adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Adjusted Closing Price Message is what was written, byte for byte */
inline equal_adjusted_closing_price_message(adjusted_closing_price_message_read, adjusted_closing_price_message_written) {
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 2 -> assert(adjusted_closing_price_message_read.tracking_number[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.tracking_number[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 6 -> assert(adjusted_closing_price_message_read.timestamp[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.timestamp[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.issue_symbol[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.issue_symbol[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  assert(adjusted_closing_price_message_read.security_class == adjusted_closing_price_message_written.security_class);
  adjusted_closing_price_message_at = 0;
  do
  :: adjusted_closing_price_message_at < 8 -> assert(adjusted_closing_price_message_read.adjusted_closing_price[adjusted_closing_price_message_at] == adjusted_closing_price_message_written.adjusted_closing_price[adjusted_closing_price_message_at]); adjusted_closing_price_message_at = adjusted_closing_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Mwcb Decline Level Message: 32 bytes ------------------------------------ */

/* Informs data recipients what the daily MWCB breach points are set to for the current trading day. */
typedef MwcbDeclineLevelMessage {
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
  :: mwcb_decline_level_message_at < 2 -> mwcb_decline_level_message_record.tracking_number[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 0 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
  :: else -> break
  od;
  mwcb_decline_level_message_at = 0;
  do
  :: mwcb_decline_level_message_at < 6 -> mwcb_decline_level_message_record.timestamp[mwcb_decline_level_message_at] = (mwcb_decline_level_message_base + 2 + mwcb_decline_level_message_at + 1) % 256; mwcb_decline_level_message_at = mwcb_decline_level_message_at + 1
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

/* Mwcb Decline Level Message off the wire, 32 bytes from where the cursor stands */
inline decode_mwcb_decline_level_message(mwcb_decline_level_message_record) {
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

/* ---- Mwcb Status Message: 9 bytes -------------------------------------------- */

/* Informs data recipients when a MWCB has breached one of the established levels. */
typedef MwcbStatusMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte breached_level
};

int mwcb_status_message_at;

/* every byte of Mwcb Status Message set to one value */
inline fill_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_value) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 2 -> mwcb_status_message_record.tracking_number[mwcb_status_message_at] = mwcb_status_message_value; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 6 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = mwcb_status_message_value; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = mwcb_status_message_value;
  skip
}

/* each byte of Mwcb Status Message set to where it lies, so a field read out of place says so */
inline ramp_mwcb_status_message(mwcb_status_message_record, mwcb_status_message_base) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 2 -> mwcb_status_message_record.tracking_number[mwcb_status_message_at] = (mwcb_status_message_base + 0 + mwcb_status_message_at + 1) % 256; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 6 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = (mwcb_status_message_base + 2 + mwcb_status_message_at + 1) % 256; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = (mwcb_status_message_base + 8 + 1) % 256;
  skip
}

/* Mwcb Status Message to the wire, 9 bytes from where the cursor stands */
inline encode_mwcb_status_message(mwcb_status_message_record) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 2 -> wire[at] = mwcb_status_message_record.tracking_number[mwcb_status_message_at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 6 -> wire[at] = mwcb_status_message_record.timestamp[mwcb_status_message_at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  wire[at] = mwcb_status_message_record.breached_level; at = at + 1;
  skip
}

/* Mwcb Status Message off the wire, 9 bytes from where the cursor stands */
inline decode_mwcb_status_message(mwcb_status_message_record) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 2 -> mwcb_status_message_record.tracking_number[mwcb_status_message_at] = wire[at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 6 -> mwcb_status_message_record.timestamp[mwcb_status_message_at] = wire[at]; at = at + 1; mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_record.breached_level = wire[at]; at = at + 1;
  skip
}

/* what was read of Mwcb Status Message is what was written, byte for byte */
inline equal_mwcb_status_message(mwcb_status_message_read, mwcb_status_message_written) {
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 2 -> assert(mwcb_status_message_read.tracking_number[mwcb_status_message_at] == mwcb_status_message_written.tracking_number[mwcb_status_message_at]); mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  mwcb_status_message_at = 0;
  do
  :: mwcb_status_message_at < 6 -> assert(mwcb_status_message_read.timestamp[mwcb_status_message_at] == mwcb_status_message_written.timestamp[mwcb_status_message_at]); mwcb_status_message_at = mwcb_status_message_at + 1
  :: else -> break
  od;
  assert(mwcb_status_message_read.breached_level == mwcb_status_message_written.breached_level);
  skip
}

/* ---- Ipo Quoting Period Update Message: 29 bytes ----------------------------- */

/* Indicates the anticipated IPO quotation release time of a security. */
typedef IpoQuotingPeriodUpdateMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock[8];
  byte ipo_quotation_release_time[4];
  byte ipo_quotation_release_qualifier;
  byte ipo_price[8]
};

int ipo_quoting_period_update_message_at;

/* every byte of Ipo Quoting Period Update Message set to one value */
inline fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_value) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = ipo_quoting_period_update_message_value;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = ipo_quoting_period_update_message_value; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ipo Quoting Period Update Message set to where it lies, so a field read out of place says so */
inline ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record, ipo_quoting_period_update_message_base) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 0 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 2 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 8 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 16 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = (ipo_quoting_period_update_message_base + 20 + 1) % 256;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = (ipo_quoting_period_update_message_base + 21 + ipo_quoting_period_update_message_at + 1) % 256; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message to the wire, 29 bytes from where the cursor stands */
inline encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> wire[at] = ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> wire[at] = ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> wire[at] = ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  wire[at] = ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> wire[at] = ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ipo Quoting Period Update Message off the wire, 29 bytes from where the cursor stands */
inline decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_record) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> ipo_quoting_period_update_message_record.tracking_number[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> ipo_quoting_period_update_message_record.timestamp[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.stock[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> ipo_quoting_period_update_message_record.ipo_quotation_release_time[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_record.ipo_quotation_release_qualifier = wire[at]; at = at + 1;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> ipo_quoting_period_update_message_record.ipo_price[ipo_quoting_period_update_message_at] = wire[at]; at = at + 1; ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ipo Quoting Period Update Message is what was written, byte for byte */
inline equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_read, ipo_quoting_period_update_message_written) {
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 2 -> assert(ipo_quoting_period_update_message_read.tracking_number[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.tracking_number[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 6 -> assert(ipo_quoting_period_update_message_read.timestamp[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.timestamp[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> assert(ipo_quoting_period_update_message_read.stock[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.stock[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 4 -> assert(ipo_quoting_period_update_message_read.ipo_quotation_release_time[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_quotation_release_time[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  assert(ipo_quoting_period_update_message_read.ipo_quotation_release_qualifier == ipo_quoting_period_update_message_written.ipo_quotation_release_qualifier);
  ipo_quoting_period_update_message_at = 0;
  do
  :: ipo_quoting_period_update_message_at < 8 -> assert(ipo_quoting_period_update_message_read.ipo_price[ipo_quoting_period_update_message_at] == ipo_quoting_period_update_message_written.ipo_price[ipo_quoting_period_update_message_at]); ipo_quoting_period_update_message_at = ipo_quoting_period_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Operational Halt Message: 18 bytes -------------------------------------- */

/* An Operational Halt means that there has been an interruption of service on the identified security impacting only the designated Market Center. */
typedef OperationalHaltMessage {
  byte tracking_number[2];
  byte timestamp[6];
  byte stock_alpha_8[8];
  byte market_code;
  byte operational_halt_action
};

int operational_halt_message_at;

/* every byte of Operational Halt Message set to one value */
inline fill_operational_halt_message(operational_halt_message_record, operational_halt_message_value) {
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
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock_alpha_8[operational_halt_message_at] = operational_halt_message_value; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 2 -> operational_halt_message_record.tracking_number[operational_halt_message_at] = (operational_halt_message_base + 0 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 6 -> operational_halt_message_record.timestamp[operational_halt_message_at] = (operational_halt_message_base + 2 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
  :: else -> break
  od;
  operational_halt_message_at = 0;
  do
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock_alpha_8[operational_halt_message_at] = (operational_halt_message_base + 8 + operational_halt_message_at + 1) % 256; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 8 -> wire[at] = operational_halt_message_record.stock_alpha_8[operational_halt_message_at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 8 -> operational_halt_message_record.stock_alpha_8[operational_halt_message_at] = wire[at]; at = at + 1; operational_halt_message_at = operational_halt_message_at + 1
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
  :: operational_halt_message_at < 8 -> assert(operational_halt_message_read.stock_alpha_8[operational_halt_message_at] == operational_halt_message_written.stock_alpha_8[operational_halt_message_at]); operational_halt_message_at = operational_halt_message_at + 1
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
    assert(at == 56);
    at = 0;
    decode_trade_report_message(trade_report_message_got);
    assert(at == 56);
    equal_trade_report_message(trade_report_message_got, trade_report_message_sent)
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
    assert(at == 56);
    at = 0;
    decode_trade_cancel_error_message(trade_cancel_error_message_got);
    assert(at == 56);
    equal_trade_cancel_error_message(trade_cancel_error_message_got, trade_cancel_error_message_sent)
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
    assert(at == 86);
    at = 0;
    decode_trade_correction_message(trade_correction_message_got);
    assert(at == 86);
    equal_trade_correction_message(trade_correction_message_got, trade_correction_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_stock_trading_action_message(stock_trading_action_message_got);
    assert(at == 22);
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
    assert(at == 17);
    at = 0;
    decode_reg_sho_short_sale_price_test_restricted_indicator_message(reg_sho_short_sale_price_test_restricted_indicator_message_got);
    assert(at == 17);
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
    assert(at == 48);
    at = 0;
    decode_stock_directory_message(stock_directory_message_got);
    assert(at == 48);
    equal_stock_directory_message(stock_directory_message_got, stock_directory_message_sent)
  }
}

/* Adjusted Closing Price Message: encoded, read back, and compared */
proctype check_adjusted_closing_price_message() {
  AdjustedClosingPriceMessage adjusted_closing_price_message_sent;
  AdjustedClosingPriceMessage adjusted_closing_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  :: pattern == 1 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 32)
  :: pattern == 2 -> fill_adjusted_closing_price_message(adjusted_closing_price_message_sent, 255)
  :: else -> ramp_adjusted_closing_price_message(adjusted_closing_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_adjusted_closing_price_message(adjusted_closing_price_message_sent);
    assert(at == 25);
    at = 0;
    decode_adjusted_closing_price_message(adjusted_closing_price_message_got);
    assert(at == 25);
    equal_adjusted_closing_price_message(adjusted_closing_price_message_got, adjusted_closing_price_message_sent)
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

/* Ipo Quoting Period Update Message: encoded, read back, and compared */
proctype check_ipo_quoting_period_update_message() {
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_sent;
  IpoQuotingPeriodUpdateMessage ipo_quoting_period_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  :: pattern == 1 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 32)
  :: pattern == 2 -> fill_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 255)
  :: else -> ramp_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_sent);
    assert(at == 29);
    at = 0;
    decode_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got);
    assert(at == 29);
    equal_ipo_quoting_period_update_message(ipo_quoting_period_update_message_got, ipo_quoting_period_update_message_sent)
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
  :: run check_trade_report_message()
  :: run check_trade_cancel_error_message()
  :: run check_trade_correction_message()
  :: run check_stock_trading_action_message()
  :: run check_reg_sho_short_sale_price_test_restricted_indicator_message()
  :: run check_stock_directory_message()
  :: run check_adjusted_closing_price_message()
  :: run check_mwcb_decline_level_message()
  :: run check_mwcb_status_message()
  :: run check_ipo_quoting_period_update_message()
  :: run check_operational_halt_message()
  fi
}
