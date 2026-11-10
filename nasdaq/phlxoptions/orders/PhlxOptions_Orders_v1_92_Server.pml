/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) PHLX Orders
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
 *   - a field read in bits
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 30

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

/* ---- Timestamp: 8 bytes ------------------------------------------------------ */

/* Time the message was sent: seconds after midnight and the nanosecond portion, U.S. Eastern Time */
typedef Timestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int timestamp_at;

/* every byte of Timestamp set to one value */
inline fill_timestamp(timestamp_record, timestamp_value) {
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.seconds[timestamp_at] = timestamp_value; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.nanoseconds[timestamp_at] = timestamp_value; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Timestamp set to where it lies, so a field read out of place says so */
inline ramp_timestamp(timestamp_record, timestamp_base) {
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.seconds[timestamp_at] = (timestamp_base + 0 + timestamp_at + 1) % 256; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.nanoseconds[timestamp_at] = (timestamp_base + 4 + timestamp_at + 1) % 256; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_timestamp(timestamp_record) {
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> wire[at] = timestamp_record.seconds[timestamp_at]; at = at + 1; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> wire[at] = timestamp_record.nanoseconds[timestamp_at]; at = at + 1; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_timestamp(timestamp_record) {
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.seconds[timestamp_at] = wire[at]; at = at + 1; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> timestamp_record.nanoseconds[timestamp_at] = wire[at]; at = at + 1; timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Timestamp is what was written, byte for byte */
inline equal_timestamp(timestamp_read, timestamp_written) {
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> assert(timestamp_read.seconds[timestamp_at] == timestamp_written.seconds[timestamp_at]); timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  timestamp_at = 0;
  do
  :: timestamp_at < 4 -> assert(timestamp_read.nanoseconds[timestamp_at] == timestamp_written.nanoseconds[timestamp_at]); timestamp_at = timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 10 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  Timestamp timestamp;
  byte event_code;
  byte version
};

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  fill_timestamp(system_event_message_record.timestamp, system_event_message_value);
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_record.version = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  ramp_timestamp(system_event_message_record.timestamp, system_event_message_base + 0);
  system_event_message_record.event_code = (system_event_message_base + 8 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 9 + 1) % 256;
  skip
}

/* System Event Message to the wire, 10 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  encode_timestamp(system_event_message_record.timestamp);
  wire[at] = system_event_message_record.event_code; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  skip
}

/* System Event Message off the wire, 10 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  decode_timestamp(system_event_message_record.timestamp);
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_record.version = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  equal_timestamp(system_event_message_read.timestamp, system_event_message_written.timestamp);
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  assert(system_event_message_read.version == system_event_message_written.version);
  skip
}

/* ---- Complex Trading Action Message: 13 bytes -------------------------------- */

/* PHLX uses this administrative message to indicate the current trading status of a strategy within the PHLX Options Market. */
typedef ComplexTradingActionMessage {
  Timestamp timestamp;
  byte strategy_id[4];
  byte current_trading_state
};

int complex_trading_action_message_at;

/* every byte of Complex Trading Action Message set to one value */
inline fill_complex_trading_action_message(complex_trading_action_message_record, complex_trading_action_message_value) {
  fill_timestamp(complex_trading_action_message_record.timestamp, complex_trading_action_message_value);
  complex_trading_action_message_at = 0;
  do
  :: complex_trading_action_message_at < 4 -> complex_trading_action_message_record.strategy_id[complex_trading_action_message_at] = complex_trading_action_message_value; complex_trading_action_message_at = complex_trading_action_message_at + 1
  :: else -> break
  od;
  complex_trading_action_message_record.current_trading_state = complex_trading_action_message_value;
  skip
}

/* each byte of Complex Trading Action Message set to where it lies, so a field read out of place says so */
inline ramp_complex_trading_action_message(complex_trading_action_message_record, complex_trading_action_message_base) {
  ramp_timestamp(complex_trading_action_message_record.timestamp, complex_trading_action_message_base + 0);
  complex_trading_action_message_at = 0;
  do
  :: complex_trading_action_message_at < 4 -> complex_trading_action_message_record.strategy_id[complex_trading_action_message_at] = (complex_trading_action_message_base + 8 + complex_trading_action_message_at + 1) % 256; complex_trading_action_message_at = complex_trading_action_message_at + 1
  :: else -> break
  od;
  complex_trading_action_message_record.current_trading_state = (complex_trading_action_message_base + 12 + 1) % 256;
  skip
}

/* Complex Trading Action Message to the wire, 13 bytes from where the cursor stands */
inline encode_complex_trading_action_message(complex_trading_action_message_record) {
  encode_timestamp(complex_trading_action_message_record.timestamp);
  complex_trading_action_message_at = 0;
  do
  :: complex_trading_action_message_at < 4 -> wire[at] = complex_trading_action_message_record.strategy_id[complex_trading_action_message_at]; at = at + 1; complex_trading_action_message_at = complex_trading_action_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_trading_action_message_record.current_trading_state; at = at + 1;
  skip
}

/* Complex Trading Action Message off the wire, 13 bytes from where the cursor stands */
inline decode_complex_trading_action_message(complex_trading_action_message_record) {
  decode_timestamp(complex_trading_action_message_record.timestamp);
  complex_trading_action_message_at = 0;
  do
  :: complex_trading_action_message_at < 4 -> complex_trading_action_message_record.strategy_id[complex_trading_action_message_at] = wire[at]; at = at + 1; complex_trading_action_message_at = complex_trading_action_message_at + 1
  :: else -> break
  od;
  complex_trading_action_message_record.current_trading_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Trading Action Message is what was written, byte for byte */
inline equal_complex_trading_action_message(complex_trading_action_message_read, complex_trading_action_message_written) {
  equal_timestamp(complex_trading_action_message_read.timestamp, complex_trading_action_message_written.timestamp);
  complex_trading_action_message_at = 0;
  do
  :: complex_trading_action_message_at < 4 -> assert(complex_trading_action_message_read.strategy_id[complex_trading_action_message_at] == complex_trading_action_message_written.strategy_id[complex_trading_action_message_at]); complex_trading_action_message_at = complex_trading_action_message_at + 1
  :: else -> break
  od;
  assert(complex_trading_action_message_read.current_trading_state == complex_trading_action_message_written.current_trading_state);
  skip
}

/* ---- Strategy Open Closed Message: 13 bytes ---------------------------------- */

/* PHLX uses this administrative message to indicate when a strategy has completed the opening process or when the strategy has closed and is no longer available for auto execution. */
typedef StrategyOpenClosedMessage {
  Timestamp timestamp;
  byte strategy_id[4];
  byte open_state
};

int strategy_open_closed_message_at;

/* every byte of Strategy Open Closed Message set to one value */
inline fill_strategy_open_closed_message(strategy_open_closed_message_record, strategy_open_closed_message_value) {
  fill_timestamp(strategy_open_closed_message_record.timestamp, strategy_open_closed_message_value);
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at] = strategy_open_closed_message_value; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_record.open_state = strategy_open_closed_message_value;
  skip
}

/* each byte of Strategy Open Closed Message set to where it lies, so a field read out of place says so */
inline ramp_strategy_open_closed_message(strategy_open_closed_message_record, strategy_open_closed_message_base) {
  ramp_timestamp(strategy_open_closed_message_record.timestamp, strategy_open_closed_message_base + 0);
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at] = (strategy_open_closed_message_base + 8 + strategy_open_closed_message_at + 1) % 256; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_record.open_state = (strategy_open_closed_message_base + 12 + 1) % 256;
  skip
}

/* Strategy Open Closed Message to the wire, 13 bytes from where the cursor stands */
inline encode_strategy_open_closed_message(strategy_open_closed_message_record) {
  encode_timestamp(strategy_open_closed_message_record.timestamp);
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> wire[at] = strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at]; at = at + 1; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_open_closed_message_record.open_state; at = at + 1;
  skip
}

/* Strategy Open Closed Message off the wire, 13 bytes from where the cursor stands */
inline decode_strategy_open_closed_message(strategy_open_closed_message_record) {
  decode_timestamp(strategy_open_closed_message_record.timestamp);
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at] = wire[at]; at = at + 1; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_record.open_state = wire[at]; at = at + 1;
  skip
}

/* what was read of Strategy Open Closed Message is what was written, byte for byte */
inline equal_strategy_open_closed_message(strategy_open_closed_message_read, strategy_open_closed_message_written) {
  equal_timestamp(strategy_open_closed_message_read.timestamp, strategy_open_closed_message_written.timestamp);
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> assert(strategy_open_closed_message_read.strategy_id[strategy_open_closed_message_at] == strategy_open_closed_message_written.strategy_id[strategy_open_closed_message_at]); strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  assert(strategy_open_closed_message_read.open_state == strategy_open_closed_message_written.open_state);
  skip
}

/* ---- Complex Auction Notification Message: 27 bytes -------------------------- */

/* When a Complex Order Live Auction (COLA) or PIXL/Solicitation auction starts for a strategy of an underlying, a COLA/PIXL/Solicitation notification message containing the auction information will be sent. */
typedef ComplexAuctionNotificationMessage {
  Timestamp timestamp;
  byte strategy_id[4];
  byte auction_id[4];
  byte auction_type;
  byte price[4];
  byte auction_side;
  byte debit_or_credit;
  byte volume[4]
};

int complex_auction_notification_message_at;

/* every byte of Complex Auction Notification Message set to one value */
inline fill_complex_auction_notification_message(complex_auction_notification_message_record, complex_auction_notification_message_value) {
  fill_timestamp(complex_auction_notification_message_record.timestamp, complex_auction_notification_message_value);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.strategy_id[complex_auction_notification_message_at] = complex_auction_notification_message_value; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.auction_id[complex_auction_notification_message_at] = complex_auction_notification_message_value; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_type = complex_auction_notification_message_value;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.price[complex_auction_notification_message_at] = complex_auction_notification_message_value; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_side = complex_auction_notification_message_value;
  complex_auction_notification_message_record.debit_or_credit = complex_auction_notification_message_value;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.volume[complex_auction_notification_message_at] = complex_auction_notification_message_value; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Auction Notification Message set to where it lies, so a field read out of place says so */
inline ramp_complex_auction_notification_message(complex_auction_notification_message_record, complex_auction_notification_message_base) {
  ramp_timestamp(complex_auction_notification_message_record.timestamp, complex_auction_notification_message_base + 0);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.strategy_id[complex_auction_notification_message_at] = (complex_auction_notification_message_base + 8 + complex_auction_notification_message_at + 1) % 256; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.auction_id[complex_auction_notification_message_at] = (complex_auction_notification_message_base + 12 + complex_auction_notification_message_at + 1) % 256; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_type = (complex_auction_notification_message_base + 16 + 1) % 256;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.price[complex_auction_notification_message_at] = (complex_auction_notification_message_base + 17 + complex_auction_notification_message_at + 1) % 256; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_side = (complex_auction_notification_message_base + 21 + 1) % 256;
  complex_auction_notification_message_record.debit_or_credit = (complex_auction_notification_message_base + 22 + 1) % 256;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.volume[complex_auction_notification_message_at] = (complex_auction_notification_message_base + 23 + complex_auction_notification_message_at + 1) % 256; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Auction Notification Message to the wire, 27 bytes from where the cursor stands */
inline encode_complex_auction_notification_message(complex_auction_notification_message_record) {
  encode_timestamp(complex_auction_notification_message_record.timestamp);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> wire[at] = complex_auction_notification_message_record.strategy_id[complex_auction_notification_message_at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> wire[at] = complex_auction_notification_message_record.auction_id[complex_auction_notification_message_at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_auction_notification_message_record.auction_type; at = at + 1;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> wire[at] = complex_auction_notification_message_record.price[complex_auction_notification_message_at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_auction_notification_message_record.auction_side; at = at + 1;
  wire[at] = complex_auction_notification_message_record.debit_or_credit; at = at + 1;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> wire[at] = complex_auction_notification_message_record.volume[complex_auction_notification_message_at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Auction Notification Message off the wire, 27 bytes from where the cursor stands */
inline decode_complex_auction_notification_message(complex_auction_notification_message_record) {
  decode_timestamp(complex_auction_notification_message_record.timestamp);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.strategy_id[complex_auction_notification_message_at] = wire[at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.auction_id[complex_auction_notification_message_at] = wire[at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_type = wire[at]; at = at + 1;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.price[complex_auction_notification_message_at] = wire[at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_record.auction_side = wire[at]; at = at + 1;
  complex_auction_notification_message_record.debit_or_credit = wire[at]; at = at + 1;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> complex_auction_notification_message_record.volume[complex_auction_notification_message_at] = wire[at]; at = at + 1; complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Auction Notification Message is what was written, byte for byte */
inline equal_complex_auction_notification_message(complex_auction_notification_message_read, complex_auction_notification_message_written) {
  equal_timestamp(complex_auction_notification_message_read.timestamp, complex_auction_notification_message_written.timestamp);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> assert(complex_auction_notification_message_read.strategy_id[complex_auction_notification_message_at] == complex_auction_notification_message_written.strategy_id[complex_auction_notification_message_at]); complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> assert(complex_auction_notification_message_read.auction_id[complex_auction_notification_message_at] == complex_auction_notification_message_written.auction_id[complex_auction_notification_message_at]); complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_auction_notification_message_read.auction_type == complex_auction_notification_message_written.auction_type);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> assert(complex_auction_notification_message_read.price[complex_auction_notification_message_at] == complex_auction_notification_message_written.price[complex_auction_notification_message_at]); complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  assert(complex_auction_notification_message_read.auction_side == complex_auction_notification_message_written.auction_side);
  assert(complex_auction_notification_message_read.debit_or_credit == complex_auction_notification_message_written.debit_or_credit);
  complex_auction_notification_message_at = 0;
  do
  :: complex_auction_notification_message_at < 4 -> assert(complex_auction_notification_message_read.volume[complex_auction_notification_message_at] == complex_auction_notification_message_written.volume[complex_auction_notification_message_at]); complex_auction_notification_message_at = complex_auction_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Replay Sequence Message: 20 bytes -------------------------------- */

/* The End of replay Sequence message reflects the sequence number at the time replay of existing messages is complete. The firms can then use this sequence number to resume on the real time Mold channel. Only for SoupBINTCP. */
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

/* Timestamp: encoded, read back, and compared */
proctype check_timestamp() {
  Timestamp timestamp_sent;
  Timestamp timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_timestamp(timestamp_sent, 0)
  :: pattern == 1 -> fill_timestamp(timestamp_sent, 32)
  :: pattern == 2 -> fill_timestamp(timestamp_sent, 255)
  :: else -> ramp_timestamp(timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_timestamp(timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_timestamp(timestamp_got);
    assert(at == 8);
    equal_timestamp(timestamp_got, timestamp_sent)
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
    assert(at == 10);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 10);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Complex Trading Action Message: encoded, read back, and compared */
proctype check_complex_trading_action_message() {
  ComplexTradingActionMessage complex_trading_action_message_sent;
  ComplexTradingActionMessage complex_trading_action_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_trading_action_message(complex_trading_action_message_sent, 0)
  :: pattern == 1 -> fill_complex_trading_action_message(complex_trading_action_message_sent, 32)
  :: pattern == 2 -> fill_complex_trading_action_message(complex_trading_action_message_sent, 255)
  :: else -> ramp_complex_trading_action_message(complex_trading_action_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_trading_action_message(complex_trading_action_message_sent);
    assert(at == 13);
    at = 0;
    decode_complex_trading_action_message(complex_trading_action_message_got);
    assert(at == 13);
    equal_complex_trading_action_message(complex_trading_action_message_got, complex_trading_action_message_sent)
  }
}

/* Strategy Open Closed Message: encoded, read back, and compared */
proctype check_strategy_open_closed_message() {
  StrategyOpenClosedMessage strategy_open_closed_message_sent;
  StrategyOpenClosedMessage strategy_open_closed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_strategy_open_closed_message(strategy_open_closed_message_sent, 0)
  :: pattern == 1 -> fill_strategy_open_closed_message(strategy_open_closed_message_sent, 32)
  :: pattern == 2 -> fill_strategy_open_closed_message(strategy_open_closed_message_sent, 255)
  :: else -> ramp_strategy_open_closed_message(strategy_open_closed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_strategy_open_closed_message(strategy_open_closed_message_sent);
    assert(at == 13);
    at = 0;
    decode_strategy_open_closed_message(strategy_open_closed_message_got);
    assert(at == 13);
    equal_strategy_open_closed_message(strategy_open_closed_message_got, strategy_open_closed_message_sent)
  }
}

/* Complex Auction Notification Message: encoded, read back, and compared */
proctype check_complex_auction_notification_message() {
  ComplexAuctionNotificationMessage complex_auction_notification_message_sent;
  ComplexAuctionNotificationMessage complex_auction_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_auction_notification_message(complex_auction_notification_message_sent, 0)
  :: pattern == 1 -> fill_complex_auction_notification_message(complex_auction_notification_message_sent, 32)
  :: pattern == 2 -> fill_complex_auction_notification_message(complex_auction_notification_message_sent, 255)
  :: else -> ramp_complex_auction_notification_message(complex_auction_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_auction_notification_message(complex_auction_notification_message_sent);
    assert(at == 27);
    at = 0;
    decode_complex_auction_notification_message(complex_auction_notification_message_got);
    assert(at == 27);
    equal_complex_auction_notification_message(complex_auction_notification_message_got, complex_auction_notification_message_sent)
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
  :: run check_timestamp()
  :: run check_system_event_message()
  :: run check_complex_trading_action_message()
  :: run check_strategy_open_closed_message()
  :: run check_complex_auction_notification_message()
  :: run check_end_of_replay_sequence_message()
  fi
}
