/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Spread Trade Feed
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 43

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

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte tracking_number[2];
  byte timestamp[8];
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
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 2 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 10 + 1) % 256;
  skip
}

/* System Event Message to the wire, 11 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.tracking_number[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 11 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.tracking_number[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Strategy Trading Action Message: 15 bytes ------------------------------- */

/* The options system uses this administrative message to indicate the current trading status of an index or equity option within the options market. */
typedef StrategyTradingActionMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte current_trading_state
};

int strategy_trading_action_message_at;

/* every byte of Strategy Trading Action Message set to one value */
inline fill_strategy_trading_action_message(strategy_trading_action_message_record, strategy_trading_action_message_value) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 2 -> strategy_trading_action_message_record.tracking_number[strategy_trading_action_message_at] = strategy_trading_action_message_value; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 8 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = strategy_trading_action_message_value; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> strategy_trading_action_message_record.strategy_id[strategy_trading_action_message_at] = strategy_trading_action_message_value; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_record.current_trading_state = strategy_trading_action_message_value;
  skip
}

/* each byte of Strategy Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_strategy_trading_action_message(strategy_trading_action_message_record, strategy_trading_action_message_base) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 2 -> strategy_trading_action_message_record.tracking_number[strategy_trading_action_message_at] = (strategy_trading_action_message_base + 0 + strategy_trading_action_message_at + 1) % 256; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 8 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = (strategy_trading_action_message_base + 2 + strategy_trading_action_message_at + 1) % 256; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> strategy_trading_action_message_record.strategy_id[strategy_trading_action_message_at] = (strategy_trading_action_message_base + 10 + strategy_trading_action_message_at + 1) % 256; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_record.current_trading_state = (strategy_trading_action_message_base + 14 + 1) % 256;
  skip
}

/* Strategy Trading Action Message to the wire, 15 bytes from where the cursor stands */
inline encode_strategy_trading_action_message(strategy_trading_action_message_record) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 2 -> wire[at] = strategy_trading_action_message_record.tracking_number[strategy_trading_action_message_at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 8 -> wire[at] = strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> wire[at] = strategy_trading_action_message_record.strategy_id[strategy_trading_action_message_at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_trading_action_message_record.current_trading_state; at = at + 1;
  skip
}

/* Strategy Trading Action Message off the wire, 15 bytes from where the cursor stands */
inline decode_strategy_trading_action_message(strategy_trading_action_message_record) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 2 -> strategy_trading_action_message_record.tracking_number[strategy_trading_action_message_at] = wire[at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 8 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = wire[at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> strategy_trading_action_message_record.strategy_id[strategy_trading_action_message_at] = wire[at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Strategy Trading Action Message is what was written, byte for byte */
inline equal_strategy_trading_action_message(strategy_trading_action_message_read, strategy_trading_action_message_written) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 2 -> assert(strategy_trading_action_message_read.tracking_number[strategy_trading_action_message_at] == strategy_trading_action_message_written.tracking_number[strategy_trading_action_message_at]); strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 8 -> assert(strategy_trading_action_message_read.timestamp[strategy_trading_action_message_at] == strategy_trading_action_message_written.timestamp[strategy_trading_action_message_at]); strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> assert(strategy_trading_action_message_read.strategy_id[strategy_trading_action_message_at] == strategy_trading_action_message_written.strategy_id[strategy_trading_action_message_at]); strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  assert(strategy_trading_action_message_read.current_trading_state == strategy_trading_action_message_written.current_trading_state);
  skip
}

/* ---- Complex Strategy Trade Report: 43 bytes --------------------------------- */

/* The Complex Strategy Trade Report message is used to publish real-time trade information for complex strategies. */
typedef ComplexStrategyTradeReport {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte cross_id[4];
  byte trade_condition;
  byte price[4];
  byte volume[4];
  byte reserved_16[16]
};

int complex_strategy_trade_report_at;

/* every byte of Complex Strategy Trade Report set to one value */
inline fill_complex_strategy_trade_report(complex_strategy_trade_report_record, complex_strategy_trade_report_value) {
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 2 -> complex_strategy_trade_report_record.tracking_number[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 8 -> complex_strategy_trade_report_record.timestamp[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.strategy_id[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.cross_id[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_record.trade_condition = complex_strategy_trade_report_value;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.price[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.volume[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 16 -> complex_strategy_trade_report_record.reserved_16[complex_strategy_trade_report_at] = complex_strategy_trade_report_value; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Strategy Trade Report set to where it lies, so a field read out of place says so */
inline ramp_complex_strategy_trade_report(complex_strategy_trade_report_record, complex_strategy_trade_report_base) {
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 2 -> complex_strategy_trade_report_record.tracking_number[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 0 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 8 -> complex_strategy_trade_report_record.timestamp[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 2 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.strategy_id[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 10 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.cross_id[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 14 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_record.trade_condition = (complex_strategy_trade_report_base + 18 + 1) % 256;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.price[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 19 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.volume[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 23 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 16 -> complex_strategy_trade_report_record.reserved_16[complex_strategy_trade_report_at] = (complex_strategy_trade_report_base + 27 + complex_strategy_trade_report_at + 1) % 256; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Strategy Trade Report to the wire, 43 bytes from where the cursor stands */
inline encode_complex_strategy_trade_report(complex_strategy_trade_report_record) {
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 2 -> wire[at] = complex_strategy_trade_report_record.tracking_number[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 8 -> wire[at] = complex_strategy_trade_report_record.timestamp[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> wire[at] = complex_strategy_trade_report_record.strategy_id[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> wire[at] = complex_strategy_trade_report_record.cross_id[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  wire[at] = complex_strategy_trade_report_record.trade_condition; at = at + 1;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> wire[at] = complex_strategy_trade_report_record.price[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> wire[at] = complex_strategy_trade_report_record.volume[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 16 -> wire[at] = complex_strategy_trade_report_record.reserved_16[complex_strategy_trade_report_at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Strategy Trade Report off the wire, 43 bytes from where the cursor stands */
inline decode_complex_strategy_trade_report(complex_strategy_trade_report_record) {
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 2 -> complex_strategy_trade_report_record.tracking_number[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 8 -> complex_strategy_trade_report_record.timestamp[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.strategy_id[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.cross_id[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_record.trade_condition = wire[at]; at = at + 1;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.price[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> complex_strategy_trade_report_record.volume[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 16 -> complex_strategy_trade_report_record.reserved_16[complex_strategy_trade_report_at] = wire[at]; at = at + 1; complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Strategy Trade Report is what was written, byte for byte */
inline equal_complex_strategy_trade_report(complex_strategy_trade_report_read, complex_strategy_trade_report_written) {
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 2 -> assert(complex_strategy_trade_report_read.tracking_number[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.tracking_number[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 8 -> assert(complex_strategy_trade_report_read.timestamp[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.timestamp[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> assert(complex_strategy_trade_report_read.strategy_id[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.strategy_id[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> assert(complex_strategy_trade_report_read.cross_id[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.cross_id[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  assert(complex_strategy_trade_report_read.trade_condition == complex_strategy_trade_report_written.trade_condition);
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> assert(complex_strategy_trade_report_read.price[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.price[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 4 -> assert(complex_strategy_trade_report_read.volume[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.volume[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  complex_strategy_trade_report_at = 0;
  do
  :: complex_strategy_trade_report_at < 16 -> assert(complex_strategy_trade_report_read.reserved_16[complex_strategy_trade_report_at] == complex_strategy_trade_report_written.reserved_16[complex_strategy_trade_report_at]); complex_strategy_trade_report_at = complex_strategy_trade_report_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Replay Sequence Message: 20 bytes -------------------------------- */

/* The End of replay Sequence message reflects the sequence number at the time replay of existing messages is complete. */
typedef EndOfReplaySequenceMessage {
  byte end_of_replay_sequence_number[20]
};

int end_of_replay_sequence_message_at;

/* every byte of End Of Replay Sequence Message set to one value */
inline fill_end_of_replay_sequence_message(end_of_replay_sequence_message_record, end_of_replay_sequence_message_value) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = end_of_replay_sequence_message_value; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Replay Sequence Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_replay_sequence_message(end_of_replay_sequence_message_record, end_of_replay_sequence_message_base) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = (end_of_replay_sequence_message_base + 0 + end_of_replay_sequence_message_at + 1) % 256; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Replay Sequence Message to the wire, 20 bytes from where the cursor stands */
inline encode_end_of_replay_sequence_message(end_of_replay_sequence_message_record) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> wire[at] = end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at]; at = at + 1; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Replay Sequence Message off the wire, 20 bytes from where the cursor stands */
inline decode_end_of_replay_sequence_message(end_of_replay_sequence_message_record) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> end_of_replay_sequence_message_record.end_of_replay_sequence_number[end_of_replay_sequence_message_at] = wire[at]; at = at + 1; end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Replay Sequence Message is what was written, byte for byte */
inline equal_end_of_replay_sequence_message(end_of_replay_sequence_message_read, end_of_replay_sequence_message_written) {
  end_of_replay_sequence_message_at = 0;
  do
  :: end_of_replay_sequence_message_at < 20 -> assert(end_of_replay_sequence_message_read.end_of_replay_sequence_number[end_of_replay_sequence_message_at] == end_of_replay_sequence_message_written.end_of_replay_sequence_number[end_of_replay_sequence_message_at]); end_of_replay_sequence_message_at = end_of_replay_sequence_message_at + 1
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

/* Strategy Trading Action Message: encoded, read back, and compared */
proctype check_strategy_trading_action_message() {
  StrategyTradingActionMessage strategy_trading_action_message_sent;
  StrategyTradingActionMessage strategy_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategy_trading_action_message(strategy_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_strategy_trading_action_message(strategy_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_strategy_trading_action_message(strategy_trading_action_message_sent, 255)
  :: else -> ramp_strategy_trading_action_message(strategy_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategy_trading_action_message(strategy_trading_action_message_sent);
    assert(at == 15);
    at = 0;
    decode_strategy_trading_action_message(strategy_trading_action_message_got);
    assert(at == 15);
    equal_strategy_trading_action_message(strategy_trading_action_message_got, strategy_trading_action_message_sent)
  }
}

/* Complex Strategy Trade Report: encoded, read back, and compared */
proctype check_complex_strategy_trade_report() {
  ComplexStrategyTradeReport complex_strategy_trade_report_sent;
  ComplexStrategyTradeReport complex_strategy_trade_report_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_strategy_trade_report(complex_strategy_trade_report_sent, 0)
  :: pattern == 1 -> fill_complex_strategy_trade_report(complex_strategy_trade_report_sent, 32)
  :: pattern == 2 -> fill_complex_strategy_trade_report(complex_strategy_trade_report_sent, 255)
  :: else -> ramp_complex_strategy_trade_report(complex_strategy_trade_report_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_strategy_trade_report(complex_strategy_trade_report_sent);
    assert(at == 43);
    at = 0;
    decode_complex_strategy_trade_report(complex_strategy_trade_report_got);
    assert(at == 43);
    equal_complex_strategy_trade_report(complex_strategy_trade_report_got, complex_strategy_trade_report_sent)
  }
}

/* End Of Replay Sequence Message: encoded, read back, and compared */
proctype check_end_of_replay_sequence_message() {
  EndOfReplaySequenceMessage end_of_replay_sequence_message_sent;
  EndOfReplaySequenceMessage end_of_replay_sequence_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 0)
  :: pattern == 1 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 32)
  :: pattern == 2 -> fill_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 255)
  :: else -> ramp_end_of_replay_sequence_message(end_of_replay_sequence_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_replay_sequence_message(end_of_replay_sequence_message_sent);
    assert(at == 20);
    at = 0;
    decode_end_of_replay_sequence_message(end_of_replay_sequence_message_got);
    assert(at == 20);
    equal_end_of_replay_sequence_message(end_of_replay_sequence_message_got, end_of_replay_sequence_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_server_packet_header()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_system_event_message()
  :: run check_strategy_trading_action_message()
  :: run check_complex_strategy_trade_report()
  :: run check_end_of_replay_sequence_message()
  fi
}
