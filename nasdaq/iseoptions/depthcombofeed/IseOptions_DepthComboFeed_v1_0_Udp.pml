/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Ise Depth Combo Market Data Feed
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
#define WIRE 51

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

/* ---- System Event Message: 13 bytes ------------------------------------------ */

/* The system event message type is used to signal a market or data feed handler event. */
typedef SystemEventMessage {
  byte timestamp[6];
  byte event_code;
  byte current_year[2];
  byte current_month;
  byte current_day;
  byte version;
  byte sub_version
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = system_event_message_value;
  system_event_message_record.current_day = system_event_message_value;
  system_event_message_record.version = system_event_message_value;
  system_event_message_record.sub_version = system_event_message_value;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 0 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 6 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = (system_event_message_base + 7 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = (system_event_message_base + 9 + 1) % 256;
  system_event_message_record.current_day = (system_event_message_base + 10 + 1) % 256;
  system_event_message_record.version = (system_event_message_base + 11 + 1) % 256;
  system_event_message_record.sub_version = (system_event_message_base + 12 + 1) % 256;
  skip
}

/* System Event Message to the wire, 13 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.current_year[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.current_month; at = at + 1;
  wire[at] = system_event_message_record.current_day; at = at + 1;
  wire[at] = system_event_message_record.version; at = at + 1;
  wire[at] = system_event_message_record.sub_version; at = at + 1;
  skip
}

/* System Event Message off the wire, 13 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.current_year[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.current_month = wire[at]; at = at + 1;
  system_event_message_record.current_day = wire[at]; at = at + 1;
  system_event_message_record.version = wire[at]; at = at + 1;
  system_event_message_record.sub_version = wire[at]; at = at + 1;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 6 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.current_year[system_event_message_at] == system_event_message_written.current_year[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.current_month == system_event_message_written.current_month);
  assert(system_event_message_read.current_day == system_event_message_written.current_day);
  assert(system_event_message_read.version == system_event_message_written.version);
  assert(system_event_message_read.sub_version == system_event_message_written.sub_version);
  skip
}

/* ---- Strategy Trading Action Message: 11 bytes ------------------------------- */

/* ISE uses this administrative message to indicate the current trading status of a strategy within the ISE Options Market. Messages will be sent when the strategy is halted or is released for trading. */
typedef StrategyTradingActionMessage {
  byte timestamp[6];
  byte strategy_id[4];
  byte current_trading_state
};

int strategy_trading_action_message_at;

/* every byte of Strategy Trading Action Message set to one value */
inline fill_strategy_trading_action_message(strategy_trading_action_message_record, strategy_trading_action_message_value) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 6 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = strategy_trading_action_message_value; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
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
  :: strategy_trading_action_message_at < 6 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = (strategy_trading_action_message_base + 0 + strategy_trading_action_message_at + 1) % 256; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 4 -> strategy_trading_action_message_record.strategy_id[strategy_trading_action_message_at] = (strategy_trading_action_message_base + 6 + strategy_trading_action_message_at + 1) % 256; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
  :: else -> break
  od;
  strategy_trading_action_message_record.current_trading_state = (strategy_trading_action_message_base + 10 + 1) % 256;
  skip
}

/* Strategy Trading Action Message to the wire, 11 bytes from where the cursor stands */
inline encode_strategy_trading_action_message(strategy_trading_action_message_record) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 6 -> wire[at] = strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
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

/* Strategy Trading Action Message off the wire, 11 bytes from where the cursor stands */
inline decode_strategy_trading_action_message(strategy_trading_action_message_record) {
  strategy_trading_action_message_at = 0;
  do
  :: strategy_trading_action_message_at < 6 -> strategy_trading_action_message_record.timestamp[strategy_trading_action_message_at] = wire[at]; at = at + 1; strategy_trading_action_message_at = strategy_trading_action_message_at + 1
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
  :: strategy_trading_action_message_at < 6 -> assert(strategy_trading_action_message_read.timestamp[strategy_trading_action_message_at] == strategy_trading_action_message_written.timestamp[strategy_trading_action_message_at]); strategy_trading_action_message_at = strategy_trading_action_message_at + 1
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

/* ---- Strategy Open Closed Message: 11 bytes ---------------------------------- */

/* The options system uses this administrative message to indicate when a strategy has completed the opening process and is now available for auto execution or when the option has closed and is no longer available for auto execution. */
typedef StrategyOpenClosedMessage {
  byte timestamp[6];
  byte strategy_id[4];
  byte open_state
};

int strategy_open_closed_message_at;

/* every byte of Strategy Open Closed Message set to one value */
inline fill_strategy_open_closed_message(strategy_open_closed_message_record, strategy_open_closed_message_value) {
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 6 -> strategy_open_closed_message_record.timestamp[strategy_open_closed_message_at] = strategy_open_closed_message_value; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
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
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 6 -> strategy_open_closed_message_record.timestamp[strategy_open_closed_message_at] = (strategy_open_closed_message_base + 0 + strategy_open_closed_message_at + 1) % 256; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at] = (strategy_open_closed_message_base + 6 + strategy_open_closed_message_at + 1) % 256; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_record.open_state = (strategy_open_closed_message_base + 10 + 1) % 256;
  skip
}

/* Strategy Open Closed Message to the wire, 11 bytes from where the cursor stands */
inline encode_strategy_open_closed_message(strategy_open_closed_message_record) {
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 6 -> wire[at] = strategy_open_closed_message_record.timestamp[strategy_open_closed_message_at]; at = at + 1; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> wire[at] = strategy_open_closed_message_record.strategy_id[strategy_open_closed_message_at]; at = at + 1; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  wire[at] = strategy_open_closed_message_record.open_state; at = at + 1;
  skip
}

/* Strategy Open Closed Message off the wire, 11 bytes from where the cursor stands */
inline decode_strategy_open_closed_message(strategy_open_closed_message_record) {
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 6 -> strategy_open_closed_message_record.timestamp[strategy_open_closed_message_at] = wire[at]; at = at + 1; strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
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
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 6 -> assert(strategy_open_closed_message_read.timestamp[strategy_open_closed_message_at] == strategy_open_closed_message_written.timestamp[strategy_open_closed_message_at]); strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  strategy_open_closed_message_at = 0;
  do
  :: strategy_open_closed_message_at < 4 -> assert(strategy_open_closed_message_read.strategy_id[strategy_open_closed_message_at] == strategy_open_closed_message_written.strategy_id[strategy_open_closed_message_at]); strategy_open_closed_message_at = strategy_open_closed_message_at + 1
  :: else -> break
  od;
  assert(strategy_open_closed_message_read.open_state == strategy_open_closed_message_written.open_state);
  skip
}

/* ---- Complex Strategy Ticker Message: 51 bytes ------------------------------- */

/* The ticker message is used to send real time trade information. */
typedef ComplexStrategyTickerMessage {
  byte timestamp[6];
  byte strategy_id[4];
  byte last_price[8];
  byte size[4];
  byte volume[4];
  byte high[8];
  byte low[8];
  byte first[8];
  byte trade_condition
};

int complex_strategy_ticker_message_at;

/* every byte of Complex Strategy Ticker Message set to one value */
inline fill_complex_strategy_ticker_message(complex_strategy_ticker_message_record, complex_strategy_ticker_message_value) {
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 6 -> complex_strategy_ticker_message_record.timestamp[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.strategy_id[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.last_price[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.size[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.volume[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.high[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.low[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.first[complex_strategy_ticker_message_at] = complex_strategy_ticker_message_value; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_record.trade_condition = complex_strategy_ticker_message_value;
  skip
}

/* each byte of Complex Strategy Ticker Message set to where it lies, so a field read out of place says so */
inline ramp_complex_strategy_ticker_message(complex_strategy_ticker_message_record, complex_strategy_ticker_message_base) {
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 6 -> complex_strategy_ticker_message_record.timestamp[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 0 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.strategy_id[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 6 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.last_price[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 10 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.size[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 18 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.volume[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 22 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.high[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 26 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.low[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 34 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.first[complex_strategy_ticker_message_at] = (complex_strategy_ticker_message_base + 42 + complex_strategy_ticker_message_at + 1) % 256; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_record.trade_condition = (complex_strategy_ticker_message_base + 50 + 1) % 256;
  skip
}

/* Complex Strategy Ticker Message to the wire, 51 bytes from where the cursor stands */
inline encode_complex_strategy_ticker_message(complex_strategy_ticker_message_record) {
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 6 -> wire[at] = complex_strategy_ticker_message_record.timestamp[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> wire[at] = complex_strategy_ticker_message_record.strategy_id[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> wire[at] = complex_strategy_ticker_message_record.last_price[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> wire[at] = complex_strategy_ticker_message_record.size[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> wire[at] = complex_strategy_ticker_message_record.volume[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> wire[at] = complex_strategy_ticker_message_record.high[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> wire[at] = complex_strategy_ticker_message_record.low[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> wire[at] = complex_strategy_ticker_message_record.first[complex_strategy_ticker_message_at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_strategy_ticker_message_record.trade_condition; at = at + 1;
  skip
}

/* Complex Strategy Ticker Message off the wire, 51 bytes from where the cursor stands */
inline decode_complex_strategy_ticker_message(complex_strategy_ticker_message_record) {
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 6 -> complex_strategy_ticker_message_record.timestamp[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.strategy_id[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.last_price[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.size[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> complex_strategy_ticker_message_record.volume[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.high[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.low[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> complex_strategy_ticker_message_record.first[complex_strategy_ticker_message_at] = wire[at]; at = at + 1; complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Complex Strategy Ticker Message is what was written, byte for byte */
inline equal_complex_strategy_ticker_message(complex_strategy_ticker_message_read, complex_strategy_ticker_message_written) {
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 6 -> assert(complex_strategy_ticker_message_read.timestamp[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.timestamp[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> assert(complex_strategy_ticker_message_read.strategy_id[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.strategy_id[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> assert(complex_strategy_ticker_message_read.last_price[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.last_price[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> assert(complex_strategy_ticker_message_read.size[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.size[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 4 -> assert(complex_strategy_ticker_message_read.volume[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.volume[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> assert(complex_strategy_ticker_message_read.high[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.high[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> assert(complex_strategy_ticker_message_read.low[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.low[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  complex_strategy_ticker_message_at = 0;
  do
  :: complex_strategy_ticker_message_at < 8 -> assert(complex_strategy_ticker_message_read.first[complex_strategy_ticker_message_at] == complex_strategy_ticker_message_written.first[complex_strategy_ticker_message_at]); complex_strategy_ticker_message_at = complex_strategy_ticker_message_at + 1
  :: else -> break
  od;
  assert(complex_strategy_ticker_message_read.trade_condition == complex_strategy_ticker_message_written.trade_condition);
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
    assert(at == 13);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 13);
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
    assert(at == 11);
    at = 0;
    decode_strategy_trading_action_message(strategy_trading_action_message_got);
    assert(at == 11);
    equal_strategy_trading_action_message(strategy_trading_action_message_got, strategy_trading_action_message_sent)
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
    assert(at == 11);
    at = 0;
    decode_strategy_open_closed_message(strategy_open_closed_message_got);
    assert(at == 11);
    equal_strategy_open_closed_message(strategy_open_closed_message_got, strategy_open_closed_message_sent)
  }
}

/* Complex Strategy Ticker Message: encoded, read back, and compared */
proctype check_complex_strategy_ticker_message() {
  ComplexStrategyTickerMessage complex_strategy_ticker_message_sent;
  ComplexStrategyTickerMessage complex_strategy_ticker_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_strategy_ticker_message(complex_strategy_ticker_message_sent, 0)
  :: pattern == 1 -> fill_complex_strategy_ticker_message(complex_strategy_ticker_message_sent, 32)
  :: pattern == 2 -> fill_complex_strategy_ticker_message(complex_strategy_ticker_message_sent, 255)
  :: else -> ramp_complex_strategy_ticker_message(complex_strategy_ticker_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_strategy_ticker_message(complex_strategy_ticker_message_sent);
    assert(at == 51);
    at = 0;
    decode_complex_strategy_ticker_message(complex_strategy_ticker_message_got);
    assert(at == 51);
    equal_complex_strategy_ticker_message(complex_strategy_ticker_message_got, complex_strategy_ticker_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_strategy_trading_action_message()
  :: run check_strategy_open_closed_message()
  :: run check_complex_strategy_ticker_message()
  fi
}
