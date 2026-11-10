/*
 * Australian Securities Exchange 24 Itch
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
 *   - a run of a stated number of entries
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 112

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Session: 10 bytes ------------------------------------------------------- */

typedef Session {
  byte protocol_version[3];
  byte session_year[2];
  byte session_week[2];
  byte trading_service[3]
};

int session_at;

/* every byte of Session set to one value */
inline fill_session(session_record, session_value) {
  session_at = 0;
  do
  :: session_at < 3 -> session_record.protocol_version[session_at] = session_value; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_year[session_at] = session_value; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_week[session_at] = session_value; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 3 -> session_record.trading_service[session_at] = session_value; session_at = session_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Session set to where it lies, so a field read out of place says so */
inline ramp_session(session_record, session_base) {
  session_at = 0;
  do
  :: session_at < 3 -> session_record.protocol_version[session_at] = (session_base + 0 + session_at + 1) % 256; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_year[session_at] = (session_base + 3 + session_at + 1) % 256; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_week[session_at] = (session_base + 5 + session_at + 1) % 256; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 3 -> session_record.trading_service[session_at] = (session_base + 7 + session_at + 1) % 256; session_at = session_at + 1
  :: else -> break
  od;
  skip
}

/* Session to the wire, 10 bytes from where the cursor stands */
inline encode_session(session_record) {
  session_at = 0;
  do
  :: session_at < 3 -> wire[at] = session_record.protocol_version[session_at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> wire[at] = session_record.session_year[session_at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> wire[at] = session_record.session_week[session_at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 3 -> wire[at] = session_record.trading_service[session_at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  skip
}

/* Session off the wire, 10 bytes from where the cursor stands */
inline decode_session(session_record) {
  session_at = 0;
  do
  :: session_at < 3 -> session_record.protocol_version[session_at] = wire[at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_year[session_at] = wire[at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> session_record.session_week[session_at] = wire[at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 3 -> session_record.trading_service[session_at] = wire[at]; at = at + 1; session_at = session_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Session is what was written, byte for byte */
inline equal_session(session_read, session_written) {
  session_at = 0;
  do
  :: session_at < 3 -> assert(session_read.protocol_version[session_at] == session_written.protocol_version[session_at]); session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> assert(session_read.session_year[session_at] == session_written.session_year[session_at]); session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 2 -> assert(session_read.session_week[session_at] == session_written.session_week[session_at]); session_at = session_at + 1
  :: else -> break
  od;
  session_at = 0;
  do
  :: session_at < 3 -> assert(session_read.trading_service[session_at] == session_written.trading_service[session_at]); session_at = session_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Packet Header: 20 bytes ------------------------------------------------- */

/* Itch Mold Udp 64 Packet Header */
typedef PacketHeader {
  Session session;
  byte sequence_number[8];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  fill_session(packet_header_record.session, packet_header_value);
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
  ramp_session(packet_header_record.session, packet_header_base + 0);
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
  encode_session(packet_header_record.session);
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
  decode_session(packet_header_record.session);
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
  equal_session(packet_header_read.session, packet_header_written.session);
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

/* ---- Time Message: 4 bytes --------------------------------------------------- */

/* The server will, on each packet multicast, transmit this message for every second for which at least one application message is generated */
typedef TimeMessage {
  byte second[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.second[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.second[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.second[time_message_at] == time_message_written.second[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Event Message: 7 bytes ------------------------------------------- */

/* The system event message is used to signal a market or trading period event. */
typedef SystemEventMessage {
  byte nanoseconds[4];
  byte trade_date[2];
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.trade_date[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.trade_date[system_event_message_at] = (system_event_message_base + 4 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_record.event_code = (system_event_message_base + 6 + 1) % 256;
  skip
}

/* System Event Message to the wire, 7 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> wire[at] = system_event_message_record.nanoseconds[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> wire[at] = system_event_message_record.trade_date[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_event_message_record.event_code; at = at + 1;
  skip
}

/* System Event Message off the wire, 7 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_at = 0;
  do
  :: system_event_message_at < 4 -> system_event_message_record.nanoseconds[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> system_event_message_record.trade_date[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
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
  system_event_message_at = 0;
  do
  :: system_event_message_at < 2 -> assert(system_event_message_read.trade_date[system_event_message_at] == system_event_message_written.trade_date[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  assert(system_event_message_read.event_code == system_event_message_written.event_code);
  skip
}

/* ---- Future Symbol Directory Message: 53 bytes ------------------------------- */

/* As each product moves to the new Trade Date, ASX Trade24 will disseminate the future symbol messages defining the available futures, CFDs and Share Future contracts for each instrument. The action of disseminating this message will automatically imply the contract is in a “Pending” session state. */
typedef FutureSymbolDirectoryMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte exchange[6];
  byte instrument[6];
  byte contract_type;
  byte expiry_year[2];
  byte expiry_month;
  byte price_decimal_position;
  byte price_fractional_denominator[4];
  byte price_minimum_tick[2];
  byte last_trading_date[4];
  byte prior_day_settlement[4];
  byte financial_type;
  byte currency[3];
  byte lot_size_or_face_value[4];
  byte maturity_value;
  byte coupon_rate[2];
  byte payments_per_year
};

int future_symbol_directory_message_at;

/* every byte of Future Symbol Directory Message set to one value */
inline fill_future_symbol_directory_message(future_symbol_directory_message_record, future_symbol_directory_message_value) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.contract_number[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.contract_type = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = future_symbol_directory_message_value;
  future_symbol_directory_message_record.price_decimal_position = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.financial_type = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = future_symbol_directory_message_value;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = future_symbol_directory_message_value; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = future_symbol_directory_message_value;
  skip
}

/* each byte of Future Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_future_symbol_directory_message(future_symbol_directory_message_record, future_symbol_directory_message_base) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 0 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 4 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.contract_number[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 6 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 10 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 16 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.contract_type = (future_symbol_directory_message_base + 22 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 23 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = (future_symbol_directory_message_base + 25 + 1) % 256;
  future_symbol_directory_message_record.price_decimal_position = (future_symbol_directory_message_base + 26 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 27 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 31 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 33 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 37 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.financial_type = (future_symbol_directory_message_base + 41 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 42 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 45 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = (future_symbol_directory_message_base + 49 + 1) % 256;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = (future_symbol_directory_message_base + 50 + future_symbol_directory_message_at + 1) % 256; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = (future_symbol_directory_message_base + 52 + 1) % 256;
  skip
}

/* Future Symbol Directory Message to the wire, 53 bytes from where the cursor stands */
inline encode_future_symbol_directory_message(future_symbol_directory_message_record) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.contract_number[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> wire[at] = future_symbol_directory_message_record.exchange[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> wire[at] = future_symbol_directory_message_record.instrument[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.contract_type; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.expiry_month; at = at + 1;
  wire[at] = future_symbol_directory_message_record.price_decimal_position; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.financial_type; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> wire[at] = future_symbol_directory_message_record.currency[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> wire[at] = future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.maturity_value; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> wire[at] = future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = future_symbol_directory_message_record.payments_per_year; at = at + 1;
  skip
}

/* Future Symbol Directory Message off the wire, 53 bytes from where the cursor stands */
inline decode_future_symbol_directory_message(future_symbol_directory_message_record) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.nanoseconds[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.trade_date[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.contract_number[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.exchange[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> future_symbol_directory_message_record.instrument[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.contract_type = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.expiry_year[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.expiry_month = wire[at]; at = at + 1;
  future_symbol_directory_message_record.price_decimal_position = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.price_fractional_denominator[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.price_minimum_tick[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.last_trading_date[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.prior_day_settlement[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.financial_type = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> future_symbol_directory_message_record.currency[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> future_symbol_directory_message_record.lot_size_or_face_value[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.maturity_value = wire[at]; at = at + 1;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> future_symbol_directory_message_record.coupon_rate[future_symbol_directory_message_at] = wire[at]; at = at + 1; future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_record.payments_per_year = wire[at]; at = at + 1;
  skip
}

/* what was read of Future Symbol Directory Message is what was written, byte for byte */
inline equal_future_symbol_directory_message(future_symbol_directory_message_read, future_symbol_directory_message_written) {
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.nanoseconds[future_symbol_directory_message_at] == future_symbol_directory_message_written.nanoseconds[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.trade_date[future_symbol_directory_message_at] == future_symbol_directory_message_written.trade_date[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.contract_number[future_symbol_directory_message_at] == future_symbol_directory_message_written.contract_number[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> assert(future_symbol_directory_message_read.exchange[future_symbol_directory_message_at] == future_symbol_directory_message_written.exchange[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 6 -> assert(future_symbol_directory_message_read.instrument[future_symbol_directory_message_at] == future_symbol_directory_message_written.instrument[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.contract_type == future_symbol_directory_message_written.contract_type);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.expiry_year[future_symbol_directory_message_at] == future_symbol_directory_message_written.expiry_year[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.expiry_month == future_symbol_directory_message_written.expiry_month);
  assert(future_symbol_directory_message_read.price_decimal_position == future_symbol_directory_message_written.price_decimal_position);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.price_fractional_denominator[future_symbol_directory_message_at] == future_symbol_directory_message_written.price_fractional_denominator[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.price_minimum_tick[future_symbol_directory_message_at] == future_symbol_directory_message_written.price_minimum_tick[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.last_trading_date[future_symbol_directory_message_at] == future_symbol_directory_message_written.last_trading_date[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.prior_day_settlement[future_symbol_directory_message_at] == future_symbol_directory_message_written.prior_day_settlement[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.financial_type == future_symbol_directory_message_written.financial_type);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 3 -> assert(future_symbol_directory_message_read.currency[future_symbol_directory_message_at] == future_symbol_directory_message_written.currency[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 4 -> assert(future_symbol_directory_message_read.lot_size_or_face_value[future_symbol_directory_message_at] == future_symbol_directory_message_written.lot_size_or_face_value[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.maturity_value == future_symbol_directory_message_written.maturity_value);
  future_symbol_directory_message_at = 0;
  do
  :: future_symbol_directory_message_at < 2 -> assert(future_symbol_directory_message_read.coupon_rate[future_symbol_directory_message_at] == future_symbol_directory_message_written.coupon_rate[future_symbol_directory_message_at]); future_symbol_directory_message_at = future_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(future_symbol_directory_message_read.payments_per_year == future_symbol_directory_message_written.payments_per_year);
  skip
}

/* ---- Spread Symbol Directory Message: 34 bytes ------------------------------- */

/* As each product moves to the new Trade Date, ASX Trade24 will disseminate the spread symbol messages defining the available calendar spread and inter-spread contracts. For contracts that are inter-spreads, the underlying legs are in the same Trade Date. */
typedef SpreadSymbolDirectoryMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte exchange[6];
  byte contract_type;
  byte first_leg_contract_number[4];
  byte second_leg_contract_number[4];
  byte primary_ratio;
  byte secondary_ratio;
  byte price_decimal_position;
  byte price_fractional_denominator[4];
  byte price_minimum_tick[2]
};

int spread_symbol_directory_message_at;

/* every byte of Spread Symbol Directory Message set to one value */
inline fill_spread_symbol_directory_message(spread_symbol_directory_message_record, spread_symbol_directory_message_value) {
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.nanoseconds[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.trade_date[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.contract_number[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 6 -> spread_symbol_directory_message_record.exchange[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.contract_type = spread_symbol_directory_message_value;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.first_leg_contract_number[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.second_leg_contract_number[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.primary_ratio = spread_symbol_directory_message_value;
  spread_symbol_directory_message_record.secondary_ratio = spread_symbol_directory_message_value;
  spread_symbol_directory_message_record.price_decimal_position = spread_symbol_directory_message_value;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.price_fractional_denominator[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.price_minimum_tick[spread_symbol_directory_message_at] = spread_symbol_directory_message_value; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spread Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_spread_symbol_directory_message(spread_symbol_directory_message_record, spread_symbol_directory_message_base) {
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.nanoseconds[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 0 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.trade_date[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 4 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.contract_number[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 6 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 6 -> spread_symbol_directory_message_record.exchange[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 10 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.contract_type = (spread_symbol_directory_message_base + 16 + 1) % 256;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.first_leg_contract_number[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 17 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.second_leg_contract_number[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 21 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.primary_ratio = (spread_symbol_directory_message_base + 25 + 1) % 256;
  spread_symbol_directory_message_record.secondary_ratio = (spread_symbol_directory_message_base + 26 + 1) % 256;
  spread_symbol_directory_message_record.price_decimal_position = (spread_symbol_directory_message_base + 27 + 1) % 256;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.price_fractional_denominator[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 28 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.price_minimum_tick[spread_symbol_directory_message_at] = (spread_symbol_directory_message_base + 32 + spread_symbol_directory_message_at + 1) % 256; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Symbol Directory Message to the wire, 34 bytes from where the cursor stands */
inline encode_spread_symbol_directory_message(spread_symbol_directory_message_record) {
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> wire[at] = spread_symbol_directory_message_record.nanoseconds[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> wire[at] = spread_symbol_directory_message_record.trade_date[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> wire[at] = spread_symbol_directory_message_record.contract_number[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 6 -> wire[at] = spread_symbol_directory_message_record.exchange[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_symbol_directory_message_record.contract_type; at = at + 1;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> wire[at] = spread_symbol_directory_message_record.first_leg_contract_number[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> wire[at] = spread_symbol_directory_message_record.second_leg_contract_number[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_symbol_directory_message_record.primary_ratio; at = at + 1;
  wire[at] = spread_symbol_directory_message_record.secondary_ratio; at = at + 1;
  wire[at] = spread_symbol_directory_message_record.price_decimal_position; at = at + 1;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> wire[at] = spread_symbol_directory_message_record.price_fractional_denominator[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> wire[at] = spread_symbol_directory_message_record.price_minimum_tick[spread_symbol_directory_message_at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spread Symbol Directory Message off the wire, 34 bytes from where the cursor stands */
inline decode_spread_symbol_directory_message(spread_symbol_directory_message_record) {
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.nanoseconds[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.trade_date[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.contract_number[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 6 -> spread_symbol_directory_message_record.exchange[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.contract_type = wire[at]; at = at + 1;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.first_leg_contract_number[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.second_leg_contract_number[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_record.primary_ratio = wire[at]; at = at + 1;
  spread_symbol_directory_message_record.secondary_ratio = wire[at]; at = at + 1;
  spread_symbol_directory_message_record.price_decimal_position = wire[at]; at = at + 1;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> spread_symbol_directory_message_record.price_fractional_denominator[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> spread_symbol_directory_message_record.price_minimum_tick[spread_symbol_directory_message_at] = wire[at]; at = at + 1; spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spread Symbol Directory Message is what was written, byte for byte */
inline equal_spread_symbol_directory_message(spread_symbol_directory_message_read, spread_symbol_directory_message_written) {
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> assert(spread_symbol_directory_message_read.nanoseconds[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.nanoseconds[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> assert(spread_symbol_directory_message_read.trade_date[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.trade_date[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> assert(spread_symbol_directory_message_read.contract_number[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.contract_number[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 6 -> assert(spread_symbol_directory_message_read.exchange[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.exchange[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(spread_symbol_directory_message_read.contract_type == spread_symbol_directory_message_written.contract_type);
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> assert(spread_symbol_directory_message_read.first_leg_contract_number[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.first_leg_contract_number[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> assert(spread_symbol_directory_message_read.second_leg_contract_number[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.second_leg_contract_number[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(spread_symbol_directory_message_read.primary_ratio == spread_symbol_directory_message_written.primary_ratio);
  assert(spread_symbol_directory_message_read.secondary_ratio == spread_symbol_directory_message_written.secondary_ratio);
  assert(spread_symbol_directory_message_read.price_decimal_position == spread_symbol_directory_message_written.price_decimal_position);
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 4 -> assert(spread_symbol_directory_message_read.price_fractional_denominator[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.price_fractional_denominator[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  spread_symbol_directory_message_at = 0;
  do
  :: spread_symbol_directory_message_at < 2 -> assert(spread_symbol_directory_message_read.price_minimum_tick[spread_symbol_directory_message_at] == spread_symbol_directory_message_written.price_minimum_tick[spread_symbol_directory_message_at]); spread_symbol_directory_message_at = spread_symbol_directory_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Option Symbol Directory Message: 74 bytes ------------------------------- */

/* As each product moves to the new Trade Date, ASX Trade24 will disseminate the option symbol messages defining all the available options contracts. For Single Session Options only, the exchange can activate or de-activate option symbols during the course of trading by issuing Order Book State messages for affected option contracts. If an option symbol is not active (Activated field is ‘N’) or is de-activated (Trading Status is “I”), reference to that option contract should be removed from the list of actively traded contracts. If an option symbol is active (Activated field is ‘Y’) or is activated (Trading Status is “A”), reference to that option contract should be added to the list of actively traded contracts. */
typedef OptionSymbolDirectoryMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte exchange[6];
  byte instrument[6];
  byte contract_type;
  byte expiry_year[2];
  byte expiry_month;
  byte option_type;
  byte strike[4];
  byte underlying_contract_number[4];
  byte price_decimal_position;
  byte price_fractional_denominator[4];
  byte price_minimum_tick[2];
  byte strike_price_decimal_position;
  byte strike_price_fractional_denominator[4];
  byte strike_price_minimum_tick[2];
  byte last_trading_date[4];
  byte prior_day_settlement[4];
  byte volatility[4];
  byte financial_type;
  byte currency[3];
  byte lot_size_or_face_value[4];
  byte maturity_value;
  byte coupon_rate[2];
  byte payments_per_year;
  byte activated
};

int option_symbol_directory_message_at;

/* every byte of Option Symbol Directory Message set to one value */
inline fill_option_symbol_directory_message(option_symbol_directory_message_record, option_symbol_directory_message_value) {
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.nanoseconds[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.trade_date[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.contract_number[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.exchange[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.instrument[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.contract_type = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.expiry_year[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.expiry_month = option_symbol_directory_message_value;
  option_symbol_directory_message_record.option_type = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.underlying_contract_number[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.price_decimal_position = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.price_fractional_denominator[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.price_minimum_tick[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.strike_price_decimal_position = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike_price_fractional_denominator[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.strike_price_minimum_tick[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.last_trading_date[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.prior_day_settlement[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.volatility[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.financial_type = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 3 -> option_symbol_directory_message_record.currency[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.lot_size_or_face_value[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.maturity_value = option_symbol_directory_message_value;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.coupon_rate[option_symbol_directory_message_at] = option_symbol_directory_message_value; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.payments_per_year = option_symbol_directory_message_value;
  option_symbol_directory_message_record.activated = option_symbol_directory_message_value;
  skip
}

/* each byte of Option Symbol Directory Message set to where it lies, so a field read out of place says so */
inline ramp_option_symbol_directory_message(option_symbol_directory_message_record, option_symbol_directory_message_base) {
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.nanoseconds[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 0 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.trade_date[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 4 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.contract_number[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 6 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.exchange[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 10 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.instrument[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 16 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.contract_type = (option_symbol_directory_message_base + 22 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.expiry_year[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 23 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.expiry_month = (option_symbol_directory_message_base + 25 + 1) % 256;
  option_symbol_directory_message_record.option_type = (option_symbol_directory_message_base + 26 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 27 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.underlying_contract_number[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 31 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.price_decimal_position = (option_symbol_directory_message_base + 35 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.price_fractional_denominator[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 36 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.price_minimum_tick[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 40 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.strike_price_decimal_position = (option_symbol_directory_message_base + 42 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike_price_fractional_denominator[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 43 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.strike_price_minimum_tick[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 47 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.last_trading_date[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 49 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.prior_day_settlement[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 53 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.volatility[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 57 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.financial_type = (option_symbol_directory_message_base + 61 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 3 -> option_symbol_directory_message_record.currency[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 62 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.lot_size_or_face_value[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 65 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.maturity_value = (option_symbol_directory_message_base + 69 + 1) % 256;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.coupon_rate[option_symbol_directory_message_at] = (option_symbol_directory_message_base + 70 + option_symbol_directory_message_at + 1) % 256; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.payments_per_year = (option_symbol_directory_message_base + 72 + 1) % 256;
  option_symbol_directory_message_record.activated = (option_symbol_directory_message_base + 73 + 1) % 256;
  skip
}

/* Option Symbol Directory Message to the wire, 74 bytes from where the cursor stands */
inline encode_option_symbol_directory_message(option_symbol_directory_message_record) {
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.nanoseconds[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> wire[at] = option_symbol_directory_message_record.trade_date[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.contract_number[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> wire[at] = option_symbol_directory_message_record.exchange[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> wire[at] = option_symbol_directory_message_record.instrument[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.contract_type; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> wire[at] = option_symbol_directory_message_record.expiry_year[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.expiry_month; at = at + 1;
  wire[at] = option_symbol_directory_message_record.option_type; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.strike[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.underlying_contract_number[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.price_decimal_position; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.price_fractional_denominator[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> wire[at] = option_symbol_directory_message_record.price_minimum_tick[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.strike_price_decimal_position; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.strike_price_fractional_denominator[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> wire[at] = option_symbol_directory_message_record.strike_price_minimum_tick[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.last_trading_date[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.prior_day_settlement[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.volatility[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.financial_type; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 3 -> wire[at] = option_symbol_directory_message_record.currency[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> wire[at] = option_symbol_directory_message_record.lot_size_or_face_value[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.maturity_value; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> wire[at] = option_symbol_directory_message_record.coupon_rate[option_symbol_directory_message_at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  wire[at] = option_symbol_directory_message_record.payments_per_year; at = at + 1;
  wire[at] = option_symbol_directory_message_record.activated; at = at + 1;
  skip
}

/* Option Symbol Directory Message off the wire, 74 bytes from where the cursor stands */
inline decode_option_symbol_directory_message(option_symbol_directory_message_record) {
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.nanoseconds[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.trade_date[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.contract_number[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.exchange[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> option_symbol_directory_message_record.instrument[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.contract_type = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.expiry_year[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.expiry_month = wire[at]; at = at + 1;
  option_symbol_directory_message_record.option_type = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.underlying_contract_number[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.price_decimal_position = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.price_fractional_denominator[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.price_minimum_tick[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.strike_price_decimal_position = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.strike_price_fractional_denominator[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.strike_price_minimum_tick[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.last_trading_date[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.prior_day_settlement[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.volatility[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.financial_type = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 3 -> option_symbol_directory_message_record.currency[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> option_symbol_directory_message_record.lot_size_or_face_value[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.maturity_value = wire[at]; at = at + 1;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> option_symbol_directory_message_record.coupon_rate[option_symbol_directory_message_at] = wire[at]; at = at + 1; option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_record.payments_per_year = wire[at]; at = at + 1;
  option_symbol_directory_message_record.activated = wire[at]; at = at + 1;
  skip
}

/* what was read of Option Symbol Directory Message is what was written, byte for byte */
inline equal_option_symbol_directory_message(option_symbol_directory_message_read, option_symbol_directory_message_written) {
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.nanoseconds[option_symbol_directory_message_at] == option_symbol_directory_message_written.nanoseconds[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> assert(option_symbol_directory_message_read.trade_date[option_symbol_directory_message_at] == option_symbol_directory_message_written.trade_date[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.contract_number[option_symbol_directory_message_at] == option_symbol_directory_message_written.contract_number[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> assert(option_symbol_directory_message_read.exchange[option_symbol_directory_message_at] == option_symbol_directory_message_written.exchange[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 6 -> assert(option_symbol_directory_message_read.instrument[option_symbol_directory_message_at] == option_symbol_directory_message_written.instrument[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.contract_type == option_symbol_directory_message_written.contract_type);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> assert(option_symbol_directory_message_read.expiry_year[option_symbol_directory_message_at] == option_symbol_directory_message_written.expiry_year[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.expiry_month == option_symbol_directory_message_written.expiry_month);
  assert(option_symbol_directory_message_read.option_type == option_symbol_directory_message_written.option_type);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.strike[option_symbol_directory_message_at] == option_symbol_directory_message_written.strike[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.underlying_contract_number[option_symbol_directory_message_at] == option_symbol_directory_message_written.underlying_contract_number[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.price_decimal_position == option_symbol_directory_message_written.price_decimal_position);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.price_fractional_denominator[option_symbol_directory_message_at] == option_symbol_directory_message_written.price_fractional_denominator[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> assert(option_symbol_directory_message_read.price_minimum_tick[option_symbol_directory_message_at] == option_symbol_directory_message_written.price_minimum_tick[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.strike_price_decimal_position == option_symbol_directory_message_written.strike_price_decimal_position);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.strike_price_fractional_denominator[option_symbol_directory_message_at] == option_symbol_directory_message_written.strike_price_fractional_denominator[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> assert(option_symbol_directory_message_read.strike_price_minimum_tick[option_symbol_directory_message_at] == option_symbol_directory_message_written.strike_price_minimum_tick[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.last_trading_date[option_symbol_directory_message_at] == option_symbol_directory_message_written.last_trading_date[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.prior_day_settlement[option_symbol_directory_message_at] == option_symbol_directory_message_written.prior_day_settlement[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.volatility[option_symbol_directory_message_at] == option_symbol_directory_message_written.volatility[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.financial_type == option_symbol_directory_message_written.financial_type);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 3 -> assert(option_symbol_directory_message_read.currency[option_symbol_directory_message_at] == option_symbol_directory_message_written.currency[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 4 -> assert(option_symbol_directory_message_read.lot_size_or_face_value[option_symbol_directory_message_at] == option_symbol_directory_message_written.lot_size_or_face_value[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.maturity_value == option_symbol_directory_message_written.maturity_value);
  option_symbol_directory_message_at = 0;
  do
  :: option_symbol_directory_message_at < 2 -> assert(option_symbol_directory_message_read.coupon_rate[option_symbol_directory_message_at] == option_symbol_directory_message_written.coupon_rate[option_symbol_directory_message_at]); option_symbol_directory_message_at = option_symbol_directory_message_at + 1
  :: else -> break
  od;
  assert(option_symbol_directory_message_read.payments_per_year == option_symbol_directory_message_written.payments_per_year);
  assert(option_symbol_directory_message_read.activated == option_symbol_directory_message_written.activated);
  skip
}

/* ---- Order Book State Message: 11 bytes -------------------------------------- */

/* ASX Trade24 uses this message to indicate the current session state of a contract to the market. */
typedef OrderBookStateMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte trading_status
};

int order_book_state_message_at;

/* every byte of Order Book State Message set to one value */
inline fill_order_book_state_message(order_book_state_message_record, order_book_state_message_value) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.contract_number[order_book_state_message_at] = order_book_state_message_value; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.trading_status = order_book_state_message_value;
  skip
}

/* each byte of Order Book State Message set to where it lies, so a field read out of place says so */
inline ramp_order_book_state_message(order_book_state_message_record, order_book_state_message_base) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = (order_book_state_message_base + 0 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = (order_book_state_message_base + 4 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.contract_number[order_book_state_message_at] = (order_book_state_message_base + 6 + order_book_state_message_at + 1) % 256; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.trading_status = (order_book_state_message_base + 10 + 1) % 256;
  skip
}

/* Order Book State Message to the wire, 11 bytes from where the cursor stands */
inline encode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.nanoseconds[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> wire[at] = order_book_state_message_record.trade_date[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> wire[at] = order_book_state_message_record.contract_number[order_book_state_message_at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  wire[at] = order_book_state_message_record.trading_status; at = at + 1;
  skip
}

/* Order Book State Message off the wire, 11 bytes from where the cursor stands */
inline decode_order_book_state_message(order_book_state_message_record) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.nanoseconds[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> order_book_state_message_record.trade_date[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> order_book_state_message_record.contract_number[order_book_state_message_at] = wire[at]; at = at + 1; order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Book State Message is what was written, byte for byte */
inline equal_order_book_state_message(order_book_state_message_read, order_book_state_message_written) {
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.nanoseconds[order_book_state_message_at] == order_book_state_message_written.nanoseconds[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 2 -> assert(order_book_state_message_read.trade_date[order_book_state_message_at] == order_book_state_message_written.trade_date[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  order_book_state_message_at = 0;
  do
  :: order_book_state_message_at < 4 -> assert(order_book_state_message_read.contract_number[order_book_state_message_at] == order_book_state_message_written.contract_number[order_book_state_message_at]); order_book_state_message_at = order_book_state_message_at + 1
  :: else -> break
  od;
  assert(order_book_state_message_read.trading_status == order_book_state_message_written.trading_status);
  skip
}

/* ---- Order Added Message: 31 bytes ------------------------------------------- */

/* An Order Added message indicates a new order has been accepted by the ASX Trade24 system and was added to the order book. All orders in ASX Trade24 are anonymous and one “Add” type is supported for “real” orders that are not custom market orders. The message is referenced by an Order Number assigned by ASX Trade24 and is unique for the life of the order. */
typedef OrderAddedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte order_book_priority[4];
  byte quantity[4];
  byte price[4]
};

int order_added_message_at;

/* every byte of Order Added Message set to one value */
inline fill_order_added_message(order_added_message_record, order_added_message_value) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 2 -> order_added_message_record.trade_date[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.contract_number[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.side = order_added_message_value;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.order_book_priority[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = order_added_message_value; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Added Message set to where it lies, so a field read out of place says so */
inline ramp_order_added_message(order_added_message_record, order_added_message_base) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = (order_added_message_base + 0 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 2 -> order_added_message_record.trade_date[order_added_message_at] = (order_added_message_base + 4 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.contract_number[order_added_message_at] = (order_added_message_base + 6 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.side = (order_added_message_base + 10 + 1) % 256;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = (order_added_message_base + 11 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.order_book_priority[order_added_message_at] = (order_added_message_base + 19 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = (order_added_message_base + 23 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = (order_added_message_base + 27 + order_added_message_at + 1) % 256; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Message to the wire, 31 bytes from where the cursor stands */
inline encode_order_added_message(order_added_message_record) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.nanoseconds[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 2 -> wire[at] = order_added_message_record.trade_date[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.contract_number[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  wire[at] = order_added_message_record.side; at = at + 1;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> wire[at] = order_added_message_record.order_number[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.order_book_priority[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.quantity[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> wire[at] = order_added_message_record.price[order_added_message_at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Added Message off the wire, 31 bytes from where the cursor stands */
inline decode_order_added_message(order_added_message_record) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.nanoseconds[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 2 -> order_added_message_record.trade_date[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.contract_number[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_record.side = wire[at]; at = at + 1;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> order_added_message_record.order_number[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.order_book_priority[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.quantity[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> order_added_message_record.price[order_added_message_at] = wire[at]; at = at + 1; order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Added Message is what was written, byte for byte */
inline equal_order_added_message(order_added_message_read, order_added_message_written) {
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.nanoseconds[order_added_message_at] == order_added_message_written.nanoseconds[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 2 -> assert(order_added_message_read.trade_date[order_added_message_at] == order_added_message_written.trade_date[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.contract_number[order_added_message_at] == order_added_message_written.contract_number[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  assert(order_added_message_read.side == order_added_message_written.side);
  order_added_message_at = 0;
  do
  :: order_added_message_at < 8 -> assert(order_added_message_read.order_number[order_added_message_at] == order_added_message_written.order_number[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.order_book_priority[order_added_message_at] == order_added_message_written.order_book_priority[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.quantity[order_added_message_at] == order_added_message_written.quantity[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  order_added_message_at = 0;
  do
  :: order_added_message_at < 4 -> assert(order_added_message_read.price[order_added_message_at] == order_added_message_written.price[order_added_message_at]); order_added_message_at = order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Replaced Message: 31 bytes ---------------------------------------- */

/* This message is sent whenever an order in the book has been modified for price or volume where the priority changes. Even though the side and contract number cannot be changed, these fields are included in the message to provide fast look-up. */
typedef OrderReplacedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte order_book_priority[4];
  byte quantity[4];
  byte price[4]
};

int order_replaced_message_at;

/* every byte of Order Replaced Message set to one value */
inline fill_order_replaced_message(order_replaced_message_record, order_replaced_message_value) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.trade_date[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.contract_number[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = order_replaced_message_value;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_priority[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = order_replaced_message_value; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_order_replaced_message(order_replaced_message_record, order_replaced_message_base) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = (order_replaced_message_base + 0 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.trade_date[order_replaced_message_at] = (order_replaced_message_base + 4 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.contract_number[order_replaced_message_at] = (order_replaced_message_base + 6 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = (order_replaced_message_base + 10 + 1) % 256;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = (order_replaced_message_base + 11 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_priority[order_replaced_message_at] = (order_replaced_message_base + 19 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = (order_replaced_message_base + 23 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = (order_replaced_message_base + 27 + order_replaced_message_at + 1) % 256; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message to the wire, 31 bytes from where the cursor stands */
inline encode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.nanoseconds[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> wire[at] = order_replaced_message_record.trade_date[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.contract_number[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = order_replaced_message_record.side; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> wire[at] = order_replaced_message_record.order_number[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.order_book_priority[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.quantity[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> wire[at] = order_replaced_message_record.price[order_replaced_message_at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Replaced Message off the wire, 31 bytes from where the cursor stands */
inline decode_order_replaced_message(order_replaced_message_record) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.nanoseconds[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> order_replaced_message_record.trade_date[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.contract_number[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_record.side = wire[at]; at = at + 1;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> order_replaced_message_record.order_number[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.order_book_priority[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.quantity[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> order_replaced_message_record.price[order_replaced_message_at] = wire[at]; at = at + 1; order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Replaced Message is what was written, byte for byte */
inline equal_order_replaced_message(order_replaced_message_read, order_replaced_message_written) {
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.nanoseconds[order_replaced_message_at] == order_replaced_message_written.nanoseconds[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 2 -> assert(order_replaced_message_read.trade_date[order_replaced_message_at] == order_replaced_message_written.trade_date[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.contract_number[order_replaced_message_at] == order_replaced_message_written.contract_number[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  assert(order_replaced_message_read.side == order_replaced_message_written.side);
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 8 -> assert(order_replaced_message_read.order_number[order_replaced_message_at] == order_replaced_message_written.order_number[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.order_book_priority[order_replaced_message_at] == order_replaced_message_written.order_book_priority[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.quantity[order_replaced_message_at] == order_replaced_message_written.quantity[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  order_replaced_message_at = 0;
  do
  :: order_replaced_message_at < 4 -> assert(order_replaced_message_read.price[order_replaced_message_at] == order_replaced_message_written.price[order_replaced_message_at]); order_replaced_message_at = order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Volume Cancelled Message: 23 bytes -------------------------------- */

/* This message is sent whenever an order in the book is modified as a result of a partial cancellation of volume. The difference between this message and the Order Replaced is an Order Replaced will always show a change of order book priority in regards to the order’s position in the queue. An Order Volume Cancelled message is not sent when an order has partially traded. */
typedef OrderVolumeCancelledMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte quantity[4]
};

int order_volume_cancelled_message_at;

/* every byte of Order Volume Cancelled Message set to one value */
inline fill_order_volume_cancelled_message(order_volume_cancelled_message_record, order_volume_cancelled_message_value) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.contract_number[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = order_volume_cancelled_message_value;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_number[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = order_volume_cancelled_message_value; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Volume Cancelled Message set to where it lies, so a field read out of place says so */
inline ramp_order_volume_cancelled_message(order_volume_cancelled_message_record, order_volume_cancelled_message_base) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 0 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 4 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.contract_number[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 6 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = (order_volume_cancelled_message_base + 10 + 1) % 256;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_number[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 11 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = (order_volume_cancelled_message_base + 19 + order_volume_cancelled_message_at + 1) % 256; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Volume Cancelled Message to the wire, 23 bytes from where the cursor stands */
inline encode_order_volume_cancelled_message(order_volume_cancelled_message_record) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> wire[at] = order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.contract_number[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_volume_cancelled_message_record.side; at = at + 1;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> wire[at] = order_volume_cancelled_message_record.order_number[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> wire[at] = order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Volume Cancelled Message off the wire, 23 bytes from where the cursor stands */
inline decode_order_volume_cancelled_message(order_volume_cancelled_message_record) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.nanoseconds[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> order_volume_cancelled_message_record.trade_date[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.contract_number[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_record.side = wire[at]; at = at + 1;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> order_volume_cancelled_message_record.order_number[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> order_volume_cancelled_message_record.quantity[order_volume_cancelled_message_at] = wire[at]; at = at + 1; order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Volume Cancelled Message is what was written, byte for byte */
inline equal_order_volume_cancelled_message(order_volume_cancelled_message_read, order_volume_cancelled_message_written) {
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.nanoseconds[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.nanoseconds[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 2 -> assert(order_volume_cancelled_message_read.trade_date[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.trade_date[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.contract_number[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.contract_number[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  assert(order_volume_cancelled_message_read.side == order_volume_cancelled_message_written.side);
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 8 -> assert(order_volume_cancelled_message_read.order_number[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.order_number[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  order_volume_cancelled_message_at = 0;
  do
  :: order_volume_cancelled_message_at < 4 -> assert(order_volume_cancelled_message_read.quantity[order_volume_cancelled_message_at] == order_volume_cancelled_message_written.quantity[order_volume_cancelled_message_at]); order_volume_cancelled_message_at = order_volume_cancelled_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Deleted Message: 19 bytes ----------------------------------------- */

/* This message is sent whenever an order in the book is cancelled by the owner, expired, cancelled by the exchange, purged or volume cancelled. All remaining volume is no longer accessible so the order must be removed from the book. */
typedef OrderDeletedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8]
};

int order_deleted_message_at;

/* every byte of Order Deleted Message set to one value */
inline fill_order_deleted_message(order_deleted_message_record, order_deleted_message_value) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.contract_number[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = order_deleted_message_value;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = order_deleted_message_value; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_order_deleted_message(order_deleted_message_record, order_deleted_message_base) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = (order_deleted_message_base + 0 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = (order_deleted_message_base + 4 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.contract_number[order_deleted_message_at] = (order_deleted_message_base + 6 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = (order_deleted_message_base + 10 + 1) % 256;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = (order_deleted_message_base + 11 + order_deleted_message_at + 1) % 256; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message to the wire, 19 bytes from where the cursor stands */
inline encode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.nanoseconds[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> wire[at] = order_deleted_message_record.trade_date[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> wire[at] = order_deleted_message_record.contract_number[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  wire[at] = order_deleted_message_record.side; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> wire[at] = order_deleted_message_record.order_number[order_deleted_message_at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Deleted Message off the wire, 19 bytes from where the cursor stands */
inline decode_order_deleted_message(order_deleted_message_record) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.nanoseconds[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> order_deleted_message_record.trade_date[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> order_deleted_message_record.contract_number[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_record.side = wire[at]; at = at + 1;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> order_deleted_message_record.order_number[order_deleted_message_at] = wire[at]; at = at + 1; order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Deleted Message is what was written, byte for byte */
inline equal_order_deleted_message(order_deleted_message_read, order_deleted_message_written) {
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.nanoseconds[order_deleted_message_at] == order_deleted_message_written.nanoseconds[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 2 -> assert(order_deleted_message_read.trade_date[order_deleted_message_at] == order_deleted_message_written.trade_date[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 4 -> assert(order_deleted_message_read.contract_number[order_deleted_message_at] == order_deleted_message_written.contract_number[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  assert(order_deleted_message_read.side == order_deleted_message_written.side);
  order_deleted_message_at = 0;
  do
  :: order_deleted_message_at < 8 -> assert(order_deleted_message_read.order_number[order_deleted_message_at] == order_deleted_message_written.order_number[order_deleted_message_at]); order_deleted_message_at = order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Added Message: 31 bytes ----------------------------------- */

/* This message is the same format as the Order Added message, except the nature of this order is it has an implied price, implied volume and a priority that is derived from two or more spreadable “real” orders. */
typedef ImpliedOrderAddedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte order_book_priority[4];
  byte quantity[4];
  byte price[4]
};

int implied_order_added_message_at;

/* every byte of Implied Order Added Message set to one value */
inline fill_implied_order_added_message(implied_order_added_message_record, implied_order_added_message_value) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.contract_number[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = implied_order_added_message_value;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_number[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.price[implied_order_added_message_at] = implied_order_added_message_value; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Added Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_added_message(implied_order_added_message_record, implied_order_added_message_base) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = (implied_order_added_message_base + 0 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = (implied_order_added_message_base + 4 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.contract_number[implied_order_added_message_at] = (implied_order_added_message_base + 6 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = (implied_order_added_message_base + 10 + 1) % 256;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_number[implied_order_added_message_at] = (implied_order_added_message_base + 11 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = (implied_order_added_message_base + 19 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = (implied_order_added_message_base + 23 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.price[implied_order_added_message_at] = (implied_order_added_message_base + 27 + implied_order_added_message_at + 1) % 256; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Added Message to the wire, 31 bytes from where the cursor stands */
inline encode_implied_order_added_message(implied_order_added_message_record) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.nanoseconds[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> wire[at] = implied_order_added_message_record.trade_date[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.contract_number[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_added_message_record.side; at = at + 1;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> wire[at] = implied_order_added_message_record.order_number[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.order_book_priority[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.quantity[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> wire[at] = implied_order_added_message_record.price[implied_order_added_message_at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Added Message off the wire, 31 bytes from where the cursor stands */
inline decode_implied_order_added_message(implied_order_added_message_record) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.nanoseconds[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> implied_order_added_message_record.trade_date[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.contract_number[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_record.side = wire[at]; at = at + 1;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> implied_order_added_message_record.order_number[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.order_book_priority[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.quantity[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> implied_order_added_message_record.price[implied_order_added_message_at] = wire[at]; at = at + 1; implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Added Message is what was written, byte for byte */
inline equal_implied_order_added_message(implied_order_added_message_read, implied_order_added_message_written) {
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.nanoseconds[implied_order_added_message_at] == implied_order_added_message_written.nanoseconds[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 2 -> assert(implied_order_added_message_read.trade_date[implied_order_added_message_at] == implied_order_added_message_written.trade_date[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.contract_number[implied_order_added_message_at] == implied_order_added_message_written.contract_number[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  assert(implied_order_added_message_read.side == implied_order_added_message_written.side);
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 8 -> assert(implied_order_added_message_read.order_number[implied_order_added_message_at] == implied_order_added_message_written.order_number[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.order_book_priority[implied_order_added_message_at] == implied_order_added_message_written.order_book_priority[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.quantity[implied_order_added_message_at] == implied_order_added_message_written.quantity[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  implied_order_added_message_at = 0;
  do
  :: implied_order_added_message_at < 4 -> assert(implied_order_added_message_read.price[implied_order_added_message_at] == implied_order_added_message_written.price[implied_order_added_message_at]); implied_order_added_message_at = implied_order_added_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Replaced Message: 31 bytes -------------------------------- */

/* This message is the same format as the Order Replaced message, except this replacement refers to an implied order and is sent whenever the implied pricing or volume has changed due to a price or volume movement of “real” orders for a side of a single contract number. */
typedef ImpliedOrderReplacedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte order_book_priority[4];
  byte quantity[4];
  byte price[4]
};

int implied_order_replaced_message_at;

/* every byte of Implied Order Replaced Message set to one value */
inline fill_implied_order_replaced_message(implied_order_replaced_message_record, implied_order_replaced_message_value) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.contract_number[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = implied_order_replaced_message_value;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_number[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = implied_order_replaced_message_value; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_replaced_message(implied_order_replaced_message_record, implied_order_replaced_message_base) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 0 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 4 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.contract_number[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 6 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = (implied_order_replaced_message_base + 10 + 1) % 256;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_number[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 11 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 19 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 23 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = (implied_order_replaced_message_base + 27 + implied_order_replaced_message_at + 1) % 256; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Replaced Message to the wire, 31 bytes from where the cursor stands */
inline encode_implied_order_replaced_message(implied_order_replaced_message_record) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> wire[at] = implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.contract_number[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_replaced_message_record.side; at = at + 1;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> wire[at] = implied_order_replaced_message_record.order_number[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.quantity[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> wire[at] = implied_order_replaced_message_record.price[implied_order_replaced_message_at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Replaced Message off the wire, 31 bytes from where the cursor stands */
inline decode_implied_order_replaced_message(implied_order_replaced_message_record) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.nanoseconds[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> implied_order_replaced_message_record.trade_date[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.contract_number[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_record.side = wire[at]; at = at + 1;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> implied_order_replaced_message_record.order_number[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.order_book_priority[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.quantity[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> implied_order_replaced_message_record.price[implied_order_replaced_message_at] = wire[at]; at = at + 1; implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Replaced Message is what was written, byte for byte */
inline equal_implied_order_replaced_message(implied_order_replaced_message_read, implied_order_replaced_message_written) {
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.nanoseconds[implied_order_replaced_message_at] == implied_order_replaced_message_written.nanoseconds[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 2 -> assert(implied_order_replaced_message_read.trade_date[implied_order_replaced_message_at] == implied_order_replaced_message_written.trade_date[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.contract_number[implied_order_replaced_message_at] == implied_order_replaced_message_written.contract_number[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  assert(implied_order_replaced_message_read.side == implied_order_replaced_message_written.side);
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 8 -> assert(implied_order_replaced_message_read.order_number[implied_order_replaced_message_at] == implied_order_replaced_message_written.order_number[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.order_book_priority[implied_order_replaced_message_at] == implied_order_replaced_message_written.order_book_priority[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.quantity[implied_order_replaced_message_at] == implied_order_replaced_message_written.quantity[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  implied_order_replaced_message_at = 0;
  do
  :: implied_order_replaced_message_at < 4 -> assert(implied_order_replaced_message_read.price[implied_order_replaced_message_at] == implied_order_replaced_message_written.price[implied_order_replaced_message_at]); implied_order_replaced_message_at = implied_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Implied Order Deleted Message: 19 bytes --------------------------------- */

/* This message is the same format as the Order Deleted message, except this deletion refers to an implied order. When received, any implied volume is no longer accessible so the “implied” order of the indicated side must be removed from the book. */
typedef ImpliedOrderDeletedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8]
};

int implied_order_deleted_message_at;

/* every byte of Implied Order Deleted Message set to one value */
inline fill_implied_order_deleted_message(implied_order_deleted_message_record, implied_order_deleted_message_value) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.contract_number[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = implied_order_deleted_message_value;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_number[implied_order_deleted_message_at] = implied_order_deleted_message_value; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Implied Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_implied_order_deleted_message(implied_order_deleted_message_record, implied_order_deleted_message_base) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 0 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 4 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.contract_number[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 6 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = (implied_order_deleted_message_base + 10 + 1) % 256;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_number[implied_order_deleted_message_at] = (implied_order_deleted_message_base + 11 + implied_order_deleted_message_at + 1) % 256; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Deleted Message to the wire, 19 bytes from where the cursor stands */
inline encode_implied_order_deleted_message(implied_order_deleted_message_record) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> wire[at] = implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> wire[at] = implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> wire[at] = implied_order_deleted_message_record.contract_number[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  wire[at] = implied_order_deleted_message_record.side; at = at + 1;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> wire[at] = implied_order_deleted_message_record.order_number[implied_order_deleted_message_at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Implied Order Deleted Message off the wire, 19 bytes from where the cursor stands */
inline decode_implied_order_deleted_message(implied_order_deleted_message_record) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.nanoseconds[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> implied_order_deleted_message_record.trade_date[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> implied_order_deleted_message_record.contract_number[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_record.side = wire[at]; at = at + 1;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> implied_order_deleted_message_record.order_number[implied_order_deleted_message_at] = wire[at]; at = at + 1; implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Implied Order Deleted Message is what was written, byte for byte */
inline equal_implied_order_deleted_message(implied_order_deleted_message_read, implied_order_deleted_message_written) {
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> assert(implied_order_deleted_message_read.nanoseconds[implied_order_deleted_message_at] == implied_order_deleted_message_written.nanoseconds[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 2 -> assert(implied_order_deleted_message_read.trade_date[implied_order_deleted_message_at] == implied_order_deleted_message_written.trade_date[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 4 -> assert(implied_order_deleted_message_read.contract_number[implied_order_deleted_message_at] == implied_order_deleted_message_written.contract_number[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  assert(implied_order_deleted_message_read.side == implied_order_deleted_message_written.side);
  implied_order_deleted_message_at = 0;
  do
  :: implied_order_deleted_message_at < 8 -> assert(implied_order_deleted_message_read.order_number[implied_order_deleted_message_at] == implied_order_deleted_message_written.order_number[implied_order_deleted_message_at]); implied_order_deleted_message_at = implied_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Custom Market Order Replaced Message: 22 bytes -------------------------- */

/* This message is sent whenever an order in the custom market book has been modified for volume. Custom market order modification messages always include the Order Number of the Custom Market Order Added to which the update applies. To determine the current display volume for an order, subscribers must replace the original volume stated in the Custom Market Order Added message with the quantity stated in the Custom Market Order Replaced message of the same order number. */
typedef CustomMarketOrderReplacedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte order_number[8];
  byte order_book_priority[4];
  byte quantity[4]
};

int custom_market_order_replaced_message_at;

/* every byte of Custom Market Order Replaced Message set to one value */
inline fill_custom_market_order_replaced_message(custom_market_order_replaced_message_record, custom_market_order_replaced_message_value) {
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.nanoseconds[custom_market_order_replaced_message_at] = custom_market_order_replaced_message_value; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 2 -> custom_market_order_replaced_message_record.trade_date[custom_market_order_replaced_message_at] = custom_market_order_replaced_message_value; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 8 -> custom_market_order_replaced_message_record.order_number[custom_market_order_replaced_message_at] = custom_market_order_replaced_message_value; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.order_book_priority[custom_market_order_replaced_message_at] = custom_market_order_replaced_message_value; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.quantity[custom_market_order_replaced_message_at] = custom_market_order_replaced_message_value; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Custom Market Order Replaced Message set to where it lies, so a field read out of place says so */
inline ramp_custom_market_order_replaced_message(custom_market_order_replaced_message_record, custom_market_order_replaced_message_base) {
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.nanoseconds[custom_market_order_replaced_message_at] = (custom_market_order_replaced_message_base + 0 + custom_market_order_replaced_message_at + 1) % 256; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 2 -> custom_market_order_replaced_message_record.trade_date[custom_market_order_replaced_message_at] = (custom_market_order_replaced_message_base + 4 + custom_market_order_replaced_message_at + 1) % 256; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 8 -> custom_market_order_replaced_message_record.order_number[custom_market_order_replaced_message_at] = (custom_market_order_replaced_message_base + 6 + custom_market_order_replaced_message_at + 1) % 256; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.order_book_priority[custom_market_order_replaced_message_at] = (custom_market_order_replaced_message_base + 14 + custom_market_order_replaced_message_at + 1) % 256; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.quantity[custom_market_order_replaced_message_at] = (custom_market_order_replaced_message_base + 18 + custom_market_order_replaced_message_at + 1) % 256; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Custom Market Order Replaced Message to the wire, 22 bytes from where the cursor stands */
inline encode_custom_market_order_replaced_message(custom_market_order_replaced_message_record) {
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> wire[at] = custom_market_order_replaced_message_record.nanoseconds[custom_market_order_replaced_message_at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 2 -> wire[at] = custom_market_order_replaced_message_record.trade_date[custom_market_order_replaced_message_at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 8 -> wire[at] = custom_market_order_replaced_message_record.order_number[custom_market_order_replaced_message_at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> wire[at] = custom_market_order_replaced_message_record.order_book_priority[custom_market_order_replaced_message_at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> wire[at] = custom_market_order_replaced_message_record.quantity[custom_market_order_replaced_message_at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Custom Market Order Replaced Message off the wire, 22 bytes from where the cursor stands */
inline decode_custom_market_order_replaced_message(custom_market_order_replaced_message_record) {
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.nanoseconds[custom_market_order_replaced_message_at] = wire[at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 2 -> custom_market_order_replaced_message_record.trade_date[custom_market_order_replaced_message_at] = wire[at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 8 -> custom_market_order_replaced_message_record.order_number[custom_market_order_replaced_message_at] = wire[at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.order_book_priority[custom_market_order_replaced_message_at] = wire[at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> custom_market_order_replaced_message_record.quantity[custom_market_order_replaced_message_at] = wire[at]; at = at + 1; custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Custom Market Order Replaced Message is what was written, byte for byte */
inline equal_custom_market_order_replaced_message(custom_market_order_replaced_message_read, custom_market_order_replaced_message_written) {
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> assert(custom_market_order_replaced_message_read.nanoseconds[custom_market_order_replaced_message_at] == custom_market_order_replaced_message_written.nanoseconds[custom_market_order_replaced_message_at]); custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 2 -> assert(custom_market_order_replaced_message_read.trade_date[custom_market_order_replaced_message_at] == custom_market_order_replaced_message_written.trade_date[custom_market_order_replaced_message_at]); custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 8 -> assert(custom_market_order_replaced_message_read.order_number[custom_market_order_replaced_message_at] == custom_market_order_replaced_message_written.order_number[custom_market_order_replaced_message_at]); custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> assert(custom_market_order_replaced_message_read.order_book_priority[custom_market_order_replaced_message_at] == custom_market_order_replaced_message_written.order_book_priority[custom_market_order_replaced_message_at]); custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  custom_market_order_replaced_message_at = 0;
  do
  :: custom_market_order_replaced_message_at < 4 -> assert(custom_market_order_replaced_message_read.quantity[custom_market_order_replaced_message_at] == custom_market_order_replaced_message_written.quantity[custom_market_order_replaced_message_at]); custom_market_order_replaced_message_at = custom_market_order_replaced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Custom Market Order Deleted Message: 14 bytes --------------------------- */

/* This message is sent whenever an order in the custom market book is cancelled by the owner, expired, cancelled by the exchange or purged. All remaining volume is no longer accessible so the order must be removed from the book. A Custom Market Order Deleted message is not sent when an order has traded out. */
typedef CustomMarketOrderDeletedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte order_number[8]
};

int custom_market_order_deleted_message_at;

/* every byte of Custom Market Order Deleted Message set to one value */
inline fill_custom_market_order_deleted_message(custom_market_order_deleted_message_record, custom_market_order_deleted_message_value) {
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 4 -> custom_market_order_deleted_message_record.nanoseconds[custom_market_order_deleted_message_at] = custom_market_order_deleted_message_value; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 2 -> custom_market_order_deleted_message_record.trade_date[custom_market_order_deleted_message_at] = custom_market_order_deleted_message_value; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 8 -> custom_market_order_deleted_message_record.order_number[custom_market_order_deleted_message_at] = custom_market_order_deleted_message_value; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Custom Market Order Deleted Message set to where it lies, so a field read out of place says so */
inline ramp_custom_market_order_deleted_message(custom_market_order_deleted_message_record, custom_market_order_deleted_message_base) {
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 4 -> custom_market_order_deleted_message_record.nanoseconds[custom_market_order_deleted_message_at] = (custom_market_order_deleted_message_base + 0 + custom_market_order_deleted_message_at + 1) % 256; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 2 -> custom_market_order_deleted_message_record.trade_date[custom_market_order_deleted_message_at] = (custom_market_order_deleted_message_base + 4 + custom_market_order_deleted_message_at + 1) % 256; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 8 -> custom_market_order_deleted_message_record.order_number[custom_market_order_deleted_message_at] = (custom_market_order_deleted_message_base + 6 + custom_market_order_deleted_message_at + 1) % 256; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Custom Market Order Deleted Message to the wire, 14 bytes from where the cursor stands */
inline encode_custom_market_order_deleted_message(custom_market_order_deleted_message_record) {
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 4 -> wire[at] = custom_market_order_deleted_message_record.nanoseconds[custom_market_order_deleted_message_at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 2 -> wire[at] = custom_market_order_deleted_message_record.trade_date[custom_market_order_deleted_message_at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 8 -> wire[at] = custom_market_order_deleted_message_record.order_number[custom_market_order_deleted_message_at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Custom Market Order Deleted Message off the wire, 14 bytes from where the cursor stands */
inline decode_custom_market_order_deleted_message(custom_market_order_deleted_message_record) {
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 4 -> custom_market_order_deleted_message_record.nanoseconds[custom_market_order_deleted_message_at] = wire[at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 2 -> custom_market_order_deleted_message_record.trade_date[custom_market_order_deleted_message_at] = wire[at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 8 -> custom_market_order_deleted_message_record.order_number[custom_market_order_deleted_message_at] = wire[at]; at = at + 1; custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Custom Market Order Deleted Message is what was written, byte for byte */
inline equal_custom_market_order_deleted_message(custom_market_order_deleted_message_read, custom_market_order_deleted_message_written) {
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 4 -> assert(custom_market_order_deleted_message_read.nanoseconds[custom_market_order_deleted_message_at] == custom_market_order_deleted_message_written.nanoseconds[custom_market_order_deleted_message_at]); custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 2 -> assert(custom_market_order_deleted_message_read.trade_date[custom_market_order_deleted_message_at] == custom_market_order_deleted_message_written.trade_date[custom_market_order_deleted_message_at]); custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  custom_market_order_deleted_message_at = 0;
  do
  :: custom_market_order_deleted_message_at < 8 -> assert(custom_market_order_deleted_message_read.order_number[custom_market_order_deleted_message_at] == custom_market_order_deleted_message_written.order_number[custom_market_order_deleted_message_at]); custom_market_order_deleted_message_at = custom_market_order_deleted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message: 36 bytes ---------------------------------------- */

/* This message is sent whenever a resting order of the book is executed in whole or in part where the price and contract number of the order and trade are the same. It is possible to receive several Order Executed messages for the same order reference number if that order is executed in several parts. */
typedef OrderExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4]
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
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contract_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = order_executed_message_value;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.trade_price[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = (order_executed_message_base + 4 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contract_number[order_executed_message_at] = (order_executed_message_base + 6 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = (order_executed_message_base + 10 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = (order_executed_message_base + 11 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = (order_executed_message_base + 19 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = (order_executed_message_base + 23 + 1) % 256;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = (order_executed_message_base + 24 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = (order_executed_message_base + 28 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.trade_price[order_executed_message_at] = (order_executed_message_base + 32 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 36 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.nanoseconds[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> wire[at] = order_executed_message_record.trade_date[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.contract_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.side; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> wire[at] = order_executed_message_record.order_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.quantity_remaining[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_message_record.trade_type; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.match_number[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.executed_quantity[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.trade_price[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 36 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.nanoseconds[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 2 -> order_executed_message_record.trade_date[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.contract_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.side = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> order_executed_message_record.order_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.quantity_remaining[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_record.trade_type = wire[at]; at = at + 1;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.match_number[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.executed_quantity[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.trade_price[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 2 -> assert(order_executed_message_read.trade_date[order_executed_message_at] == order_executed_message_written.trade_date[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.contract_number[order_executed_message_at] == order_executed_message_written.contract_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.side == order_executed_message_written.side);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 8 -> assert(order_executed_message_read.order_number[order_executed_message_at] == order_executed_message_written.order_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.quantity_remaining[order_executed_message_at] == order_executed_message_written.quantity_remaining[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  assert(order_executed_message_read.trade_type == order_executed_message_written.trade_type);
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.match_number[order_executed_message_at] == order_executed_message_written.match_number[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.executed_quantity[order_executed_message_at] == order_executed_message_written.executed_quantity[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.trade_price[order_executed_message_at] == order_executed_message_written.trade_price[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed With Price Message: 47 bytes ----------------------------- */

/* This message is sent whenever two resting orders of the same contract are executed. This can occur in two circumstances: During levelling in whole or in part at a price that could be different from one or both resting order prices. */
typedef OrderExecutedWithPriceMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte buying_order_number[8];
  byte buyer_quantity_remaining[4];
  byte selling_order_number[8];
  byte seller_quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4]
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
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.trade_date[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.contract_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.buying_order_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.buyer_quantity_remaining[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.selling_order_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.seller_quantity_remaining[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_type = order_executed_with_price_message_value;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = order_executed_with_price_message_value; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.trade_date[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 4 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.contract_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 6 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.buying_order_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 10 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.buyer_quantity_remaining[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 18 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.selling_order_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 22 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.seller_quantity_remaining[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 30 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_type = (order_executed_with_price_message_base + 34 + 1) % 256;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 35 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 39 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = (order_executed_with_price_message_base + 43 + order_executed_with_price_message_at + 1) % 256; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message to the wire, 47 bytes from where the cursor stands */
inline encode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> wire[at] = order_executed_with_price_message_record.trade_date[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.contract_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.buying_order_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.buyer_quantity_remaining[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> wire[at] = order_executed_with_price_message_record.selling_order_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.seller_quantity_remaining[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = order_executed_with_price_message_record.trade_type; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.match_number[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> wire[at] = order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed With Price Message off the wire, 47 bytes from where the cursor stands */
inline decode_order_executed_with_price_message(order_executed_with_price_message_record) {
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.nanoseconds[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 2 -> order_executed_with_price_message_record.trade_date[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.contract_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.buying_order_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.buyer_quantity_remaining[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> order_executed_with_price_message_record.selling_order_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.seller_quantity_remaining[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_record.trade_type = wire[at]; at = at + 1;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.match_number[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.executed_quantity[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> order_executed_with_price_message_record.trade_price[order_executed_with_price_message_at] = wire[at]; at = at + 1; order_executed_with_price_message_at = order_executed_with_price_message_at + 1
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
  :: order_executed_with_price_message_at < 2 -> assert(order_executed_with_price_message_read.trade_date[order_executed_with_price_message_at] == order_executed_with_price_message_written.trade_date[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.contract_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.contract_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.buying_order_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.buying_order_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.buyer_quantity_remaining[order_executed_with_price_message_at] == order_executed_with_price_message_written.buyer_quantity_remaining[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 8 -> assert(order_executed_with_price_message_read.selling_order_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.selling_order_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.seller_quantity_remaining[order_executed_with_price_message_at] == order_executed_with_price_message_written.seller_quantity_remaining[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(order_executed_with_price_message_read.trade_type == order_executed_with_price_message_written.trade_type);
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.match_number[order_executed_with_price_message_at] == order_executed_with_price_message_written.match_number[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.executed_quantity[order_executed_with_price_message_at] == order_executed_with_price_message_written.executed_quantity[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  order_executed_with_price_message_at = 0;
  do
  :: order_executed_with_price_message_at < 4 -> assert(order_executed_with_price_message_read.trade_price[order_executed_with_price_message_at] == order_executed_with_price_message_written.trade_price[order_executed_with_price_message_at]); order_executed_with_price_message_at = order_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spread Executed Message: 46 bytes --------------------------------------- */

/* This message is sent whenever the open leg of a resting spread order is traded in whole or in part where the price and the contract number will be different than the traded contract number. It is possible to receive several Spread Executed messages for the same order number if that order is executed in several parts. */
typedef SpreadExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4];
  byte traded_contract_number[4];
  byte spread_trade_price[4];
  byte trade_side_of_leg;
  byte printable
};

int spread_executed_message_at;

/* every byte of Spread Executed Message set to one value */
inline fill_spread_executed_message(spread_executed_message_record, spread_executed_message_value) {
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.nanoseconds[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 2 -> spread_executed_message_record.trade_date[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.contract_number[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.side = spread_executed_message_value;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 8 -> spread_executed_message_record.order_number[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.quantity_remaining[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_type = spread_executed_message_value;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.match_number[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.executed_quantity[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.trade_price[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.traded_contract_number[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.spread_trade_price[spread_executed_message_at] = spread_executed_message_value; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_side_of_leg = spread_executed_message_value;
  spread_executed_message_record.printable = spread_executed_message_value;
  skip
}

/* each byte of Spread Executed Message set to where it lies, so a field read out of place says so */
inline ramp_spread_executed_message(spread_executed_message_record, spread_executed_message_base) {
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.nanoseconds[spread_executed_message_at] = (spread_executed_message_base + 0 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 2 -> spread_executed_message_record.trade_date[spread_executed_message_at] = (spread_executed_message_base + 4 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.contract_number[spread_executed_message_at] = (spread_executed_message_base + 6 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.side = (spread_executed_message_base + 10 + 1) % 256;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 8 -> spread_executed_message_record.order_number[spread_executed_message_at] = (spread_executed_message_base + 11 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.quantity_remaining[spread_executed_message_at] = (spread_executed_message_base + 19 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_type = (spread_executed_message_base + 23 + 1) % 256;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.match_number[spread_executed_message_at] = (spread_executed_message_base + 24 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.executed_quantity[spread_executed_message_at] = (spread_executed_message_base + 28 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.trade_price[spread_executed_message_at] = (spread_executed_message_base + 32 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.traded_contract_number[spread_executed_message_at] = (spread_executed_message_base + 36 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.spread_trade_price[spread_executed_message_at] = (spread_executed_message_base + 40 + spread_executed_message_at + 1) % 256; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_side_of_leg = (spread_executed_message_base + 44 + 1) % 256;
  spread_executed_message_record.printable = (spread_executed_message_base + 45 + 1) % 256;
  skip
}

/* Spread Executed Message to the wire, 46 bytes from where the cursor stands */
inline encode_spread_executed_message(spread_executed_message_record) {
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.nanoseconds[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 2 -> wire[at] = spread_executed_message_record.trade_date[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.contract_number[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_executed_message_record.side; at = at + 1;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 8 -> wire[at] = spread_executed_message_record.order_number[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.quantity_remaining[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_executed_message_record.trade_type; at = at + 1;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.match_number[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.executed_quantity[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.trade_price[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.traded_contract_number[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> wire[at] = spread_executed_message_record.spread_trade_price[spread_executed_message_at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = spread_executed_message_record.trade_side_of_leg; at = at + 1;
  wire[at] = spread_executed_message_record.printable; at = at + 1;
  skip
}

/* Spread Executed Message off the wire, 46 bytes from where the cursor stands */
inline decode_spread_executed_message(spread_executed_message_record) {
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.nanoseconds[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 2 -> spread_executed_message_record.trade_date[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.contract_number[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.side = wire[at]; at = at + 1;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 8 -> spread_executed_message_record.order_number[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.quantity_remaining[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_type = wire[at]; at = at + 1;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.match_number[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.executed_quantity[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.trade_price[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.traded_contract_number[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> spread_executed_message_record.spread_trade_price[spread_executed_message_at] = wire[at]; at = at + 1; spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_record.trade_side_of_leg = wire[at]; at = at + 1;
  spread_executed_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Spread Executed Message is what was written, byte for byte */
inline equal_spread_executed_message(spread_executed_message_read, spread_executed_message_written) {
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.nanoseconds[spread_executed_message_at] == spread_executed_message_written.nanoseconds[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 2 -> assert(spread_executed_message_read.trade_date[spread_executed_message_at] == spread_executed_message_written.trade_date[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.contract_number[spread_executed_message_at] == spread_executed_message_written.contract_number[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  assert(spread_executed_message_read.side == spread_executed_message_written.side);
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 8 -> assert(spread_executed_message_read.order_number[spread_executed_message_at] == spread_executed_message_written.order_number[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.quantity_remaining[spread_executed_message_at] == spread_executed_message_written.quantity_remaining[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  assert(spread_executed_message_read.trade_type == spread_executed_message_written.trade_type);
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.match_number[spread_executed_message_at] == spread_executed_message_written.match_number[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.executed_quantity[spread_executed_message_at] == spread_executed_message_written.executed_quantity[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.trade_price[spread_executed_message_at] == spread_executed_message_written.trade_price[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.traded_contract_number[spread_executed_message_at] == spread_executed_message_written.traded_contract_number[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  spread_executed_message_at = 0;
  do
  :: spread_executed_message_at < 4 -> assert(spread_executed_message_read.spread_trade_price[spread_executed_message_at] == spread_executed_message_written.spread_trade_price[spread_executed_message_at]); spread_executed_message_at = spread_executed_message_at + 1
  :: else -> break
  od;
  assert(spread_executed_message_read.trade_side_of_leg == spread_executed_message_written.trade_side_of_leg);
  assert(spread_executed_message_read.printable == spread_executed_message_written.printable);
  skip
}

/* ---- Trade Spread Execution Chain Message: 62 bytes -------------------------- */

/* This message is sent whenever two resting orders of different contracts are executed in whole or in part at a price different from the initial display price(s) such as sweeping or spreading orders. Since the execution price is different than the display price of the original Add Order, a trade price field is included within the execution message. */
typedef TradeSpreadExecutionChainMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte buyer[4];
  byte side_of_buyer;
  byte buyer_order_number[8];
  byte buyer_quantity_remaining[4];
  byte seller_contract_number[4];
  byte side_of_seller;
  byte selling_order_number[8];
  byte seller_quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4];
  byte traded_contract_number[4];
  byte spread_trade_price[4];
  byte printable
};

int trade_spread_execution_chain_message_at;

/* every byte of Trade Spread Execution Chain Message set to one value */
inline fill_trade_spread_execution_chain_message(trade_spread_execution_chain_message_record, trade_spread_execution_chain_message_value) {
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.nanoseconds[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 2 -> trade_spread_execution_chain_message_record.trade_date[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_buyer = trade_spread_execution_chain_message_value;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.buyer_order_number[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer_quantity_remaining[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_contract_number[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_seller = trade_spread_execution_chain_message_value;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.selling_order_number[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_quantity_remaining[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.trade_type = trade_spread_execution_chain_message_value;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.match_number[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.executed_quantity[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.trade_price[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.traded_contract_number[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.spread_trade_price[trade_spread_execution_chain_message_at] = trade_spread_execution_chain_message_value; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.printable = trade_spread_execution_chain_message_value;
  skip
}

/* each byte of Trade Spread Execution Chain Message set to where it lies, so a field read out of place says so */
inline ramp_trade_spread_execution_chain_message(trade_spread_execution_chain_message_record, trade_spread_execution_chain_message_base) {
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.nanoseconds[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 0 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 2 -> trade_spread_execution_chain_message_record.trade_date[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 4 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 6 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_buyer = (trade_spread_execution_chain_message_base + 10 + 1) % 256;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.buyer_order_number[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 11 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer_quantity_remaining[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 19 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_contract_number[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 23 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_seller = (trade_spread_execution_chain_message_base + 27 + 1) % 256;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.selling_order_number[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 28 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_quantity_remaining[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 36 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.trade_type = (trade_spread_execution_chain_message_base + 40 + 1) % 256;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.match_number[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 41 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.executed_quantity[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 45 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.trade_price[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 49 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.traded_contract_number[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 53 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.spread_trade_price[trade_spread_execution_chain_message_at] = (trade_spread_execution_chain_message_base + 57 + trade_spread_execution_chain_message_at + 1) % 256; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.printable = (trade_spread_execution_chain_message_base + 61 + 1) % 256;
  skip
}

/* Trade Spread Execution Chain Message to the wire, 62 bytes from where the cursor stands */
inline encode_trade_spread_execution_chain_message(trade_spread_execution_chain_message_record) {
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.nanoseconds[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 2 -> wire[at] = trade_spread_execution_chain_message_record.trade_date[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.buyer[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_spread_execution_chain_message_record.side_of_buyer; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> wire[at] = trade_spread_execution_chain_message_record.buyer_order_number[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.buyer_quantity_remaining[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.seller_contract_number[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_spread_execution_chain_message_record.side_of_seller; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> wire[at] = trade_spread_execution_chain_message_record.selling_order_number[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.seller_quantity_remaining[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_spread_execution_chain_message_record.trade_type; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.match_number[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.executed_quantity[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.trade_price[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.traded_contract_number[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> wire[at] = trade_spread_execution_chain_message_record.spread_trade_price[trade_spread_execution_chain_message_at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_spread_execution_chain_message_record.printable; at = at + 1;
  skip
}

/* Trade Spread Execution Chain Message off the wire, 62 bytes from where the cursor stands */
inline decode_trade_spread_execution_chain_message(trade_spread_execution_chain_message_record) {
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.nanoseconds[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 2 -> trade_spread_execution_chain_message_record.trade_date[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_buyer = wire[at]; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.buyer_order_number[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.buyer_quantity_remaining[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_contract_number[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.side_of_seller = wire[at]; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> trade_spread_execution_chain_message_record.selling_order_number[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.seller_quantity_remaining[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.trade_type = wire[at]; at = at + 1;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.match_number[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.executed_quantity[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.trade_price[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.traded_contract_number[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> trade_spread_execution_chain_message_record.spread_trade_price[trade_spread_execution_chain_message_at] = wire[at]; at = at + 1; trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Trade Spread Execution Chain Message is what was written, byte for byte */
inline equal_trade_spread_execution_chain_message(trade_spread_execution_chain_message_read, trade_spread_execution_chain_message_written) {
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.nanoseconds[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.nanoseconds[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 2 -> assert(trade_spread_execution_chain_message_read.trade_date[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.trade_date[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.buyer[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.buyer[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  assert(trade_spread_execution_chain_message_read.side_of_buyer == trade_spread_execution_chain_message_written.side_of_buyer);
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> assert(trade_spread_execution_chain_message_read.buyer_order_number[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.buyer_order_number[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.buyer_quantity_remaining[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.buyer_quantity_remaining[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.seller_contract_number[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.seller_contract_number[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  assert(trade_spread_execution_chain_message_read.side_of_seller == trade_spread_execution_chain_message_written.side_of_seller);
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 8 -> assert(trade_spread_execution_chain_message_read.selling_order_number[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.selling_order_number[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.seller_quantity_remaining[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.seller_quantity_remaining[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  assert(trade_spread_execution_chain_message_read.trade_type == trade_spread_execution_chain_message_written.trade_type);
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.match_number[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.match_number[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.executed_quantity[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.executed_quantity[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.trade_price[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.trade_price[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.traded_contract_number[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.traded_contract_number[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  trade_spread_execution_chain_message_at = 0;
  do
  :: trade_spread_execution_chain_message_at < 4 -> assert(trade_spread_execution_chain_message_read.spread_trade_price[trade_spread_execution_chain_message_at] == trade_spread_execution_chain_message_written.spread_trade_price[trade_spread_execution_chain_message_at]); trade_spread_execution_chain_message_at = trade_spread_execution_chain_message_at + 1
  :: else -> break
  od;
  assert(trade_spread_execution_chain_message_read.printable == trade_spread_execution_chain_message_written.printable);
  skip
}

/* ---- Custom Market Executed Message: 37 bytes -------------------------------- */

/* This message is sent whenever the open leg of a resting custom market order is traded in whole or in part. */
typedef CustomMarketExecutedMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte order_number[8];
  byte quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4];
  byte traded_contract_number[4];
  byte trade_side_of_leg;
  byte printable
};

int custom_market_executed_message_at;

/* every byte of Custom Market Executed Message set to one value */
inline fill_custom_market_executed_message(custom_market_executed_message_record, custom_market_executed_message_value) {
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.nanoseconds[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 2 -> custom_market_executed_message_record.trade_date[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 8 -> custom_market_executed_message_record.order_number[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.quantity_remaining[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_type = custom_market_executed_message_value;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.match_number[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.executed_quantity[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.trade_price[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.traded_contract_number[custom_market_executed_message_at] = custom_market_executed_message_value; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_side_of_leg = custom_market_executed_message_value;
  custom_market_executed_message_record.printable = custom_market_executed_message_value;
  skip
}

/* each byte of Custom Market Executed Message set to where it lies, so a field read out of place says so */
inline ramp_custom_market_executed_message(custom_market_executed_message_record, custom_market_executed_message_base) {
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.nanoseconds[custom_market_executed_message_at] = (custom_market_executed_message_base + 0 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 2 -> custom_market_executed_message_record.trade_date[custom_market_executed_message_at] = (custom_market_executed_message_base + 4 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 8 -> custom_market_executed_message_record.order_number[custom_market_executed_message_at] = (custom_market_executed_message_base + 6 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.quantity_remaining[custom_market_executed_message_at] = (custom_market_executed_message_base + 14 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_type = (custom_market_executed_message_base + 18 + 1) % 256;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.match_number[custom_market_executed_message_at] = (custom_market_executed_message_base + 19 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.executed_quantity[custom_market_executed_message_at] = (custom_market_executed_message_base + 23 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.trade_price[custom_market_executed_message_at] = (custom_market_executed_message_base + 27 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.traded_contract_number[custom_market_executed_message_at] = (custom_market_executed_message_base + 31 + custom_market_executed_message_at + 1) % 256; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_side_of_leg = (custom_market_executed_message_base + 35 + 1) % 256;
  custom_market_executed_message_record.printable = (custom_market_executed_message_base + 36 + 1) % 256;
  skip
}

/* Custom Market Executed Message to the wire, 37 bytes from where the cursor stands */
inline encode_custom_market_executed_message(custom_market_executed_message_record) {
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.nanoseconds[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 2 -> wire[at] = custom_market_executed_message_record.trade_date[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 8 -> wire[at] = custom_market_executed_message_record.order_number[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.quantity_remaining[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = custom_market_executed_message_record.trade_type; at = at + 1;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.match_number[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.executed_quantity[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.trade_price[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> wire[at] = custom_market_executed_message_record.traded_contract_number[custom_market_executed_message_at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = custom_market_executed_message_record.trade_side_of_leg; at = at + 1;
  wire[at] = custom_market_executed_message_record.printable; at = at + 1;
  skip
}

/* Custom Market Executed Message off the wire, 37 bytes from where the cursor stands */
inline decode_custom_market_executed_message(custom_market_executed_message_record) {
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.nanoseconds[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 2 -> custom_market_executed_message_record.trade_date[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 8 -> custom_market_executed_message_record.order_number[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.quantity_remaining[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_type = wire[at]; at = at + 1;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.match_number[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.executed_quantity[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.trade_price[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> custom_market_executed_message_record.traded_contract_number[custom_market_executed_message_at] = wire[at]; at = at + 1; custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_record.trade_side_of_leg = wire[at]; at = at + 1;
  custom_market_executed_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Custom Market Executed Message is what was written, byte for byte */
inline equal_custom_market_executed_message(custom_market_executed_message_read, custom_market_executed_message_written) {
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.nanoseconds[custom_market_executed_message_at] == custom_market_executed_message_written.nanoseconds[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 2 -> assert(custom_market_executed_message_read.trade_date[custom_market_executed_message_at] == custom_market_executed_message_written.trade_date[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 8 -> assert(custom_market_executed_message_read.order_number[custom_market_executed_message_at] == custom_market_executed_message_written.order_number[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.quantity_remaining[custom_market_executed_message_at] == custom_market_executed_message_written.quantity_remaining[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  assert(custom_market_executed_message_read.trade_type == custom_market_executed_message_written.trade_type);
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.match_number[custom_market_executed_message_at] == custom_market_executed_message_written.match_number[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.executed_quantity[custom_market_executed_message_at] == custom_market_executed_message_written.executed_quantity[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.trade_price[custom_market_executed_message_at] == custom_market_executed_message_written.trade_price[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  custom_market_executed_message_at = 0;
  do
  :: custom_market_executed_message_at < 4 -> assert(custom_market_executed_message_read.traded_contract_number[custom_market_executed_message_at] == custom_market_executed_message_written.traded_contract_number[custom_market_executed_message_at]); custom_market_executed_message_at = custom_market_executed_message_at + 1
  :: else -> break
  od;
  assert(custom_market_executed_message_read.trade_side_of_leg == custom_market_executed_message_written.trade_side_of_leg);
  assert(custom_market_executed_message_read.printable == custom_market_executed_message_written.printable);
  skip
}

/* ---- Custom Market Trade Message: 54 bytes ----------------------------------- */

/* This message is sent whenever a resting custom market order is matched with a resting non-custom market order executed in whole or in part at a price that could be different from the initial display price(s) such as spreading orders. Since the execution price could be different than the display price of the original Order Added, a trade price field is included within the execution message. */
typedef CustomMarketTradeMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte side;
  byte order_number[8];
  byte quantity_remaining[4];
  byte custom_market_order_number[8];
  byte custom_market_quantity_remaining[4];
  byte trade_type;
  byte match_number[4];
  byte executed_quantity[4];
  byte trade_price[4];
  byte traded_contract_number[4];
  byte trade_side_of_non_custom_order;
  byte printable
};

int custom_market_trade_message_at;

/* every byte of Custom Market Trade Message set to one value */
inline fill_custom_market_trade_message(custom_market_trade_message_record, custom_market_trade_message_value) {
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.nanoseconds[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 2 -> custom_market_trade_message_record.trade_date[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.contract_number[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.side = custom_market_trade_message_value;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.order_number[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.quantity_remaining[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.custom_market_order_number[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.custom_market_quantity_remaining[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_type = custom_market_trade_message_value;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.match_number[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.executed_quantity[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.trade_price[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.traded_contract_number[custom_market_trade_message_at] = custom_market_trade_message_value; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_side_of_non_custom_order = custom_market_trade_message_value;
  custom_market_trade_message_record.printable = custom_market_trade_message_value;
  skip
}

/* each byte of Custom Market Trade Message set to where it lies, so a field read out of place says so */
inline ramp_custom_market_trade_message(custom_market_trade_message_record, custom_market_trade_message_base) {
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.nanoseconds[custom_market_trade_message_at] = (custom_market_trade_message_base + 0 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 2 -> custom_market_trade_message_record.trade_date[custom_market_trade_message_at] = (custom_market_trade_message_base + 4 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.contract_number[custom_market_trade_message_at] = (custom_market_trade_message_base + 6 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.side = (custom_market_trade_message_base + 10 + 1) % 256;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.order_number[custom_market_trade_message_at] = (custom_market_trade_message_base + 11 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.quantity_remaining[custom_market_trade_message_at] = (custom_market_trade_message_base + 19 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.custom_market_order_number[custom_market_trade_message_at] = (custom_market_trade_message_base + 23 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.custom_market_quantity_remaining[custom_market_trade_message_at] = (custom_market_trade_message_base + 31 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_type = (custom_market_trade_message_base + 35 + 1) % 256;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.match_number[custom_market_trade_message_at] = (custom_market_trade_message_base + 36 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.executed_quantity[custom_market_trade_message_at] = (custom_market_trade_message_base + 40 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.trade_price[custom_market_trade_message_at] = (custom_market_trade_message_base + 44 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.traded_contract_number[custom_market_trade_message_at] = (custom_market_trade_message_base + 48 + custom_market_trade_message_at + 1) % 256; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_side_of_non_custom_order = (custom_market_trade_message_base + 52 + 1) % 256;
  custom_market_trade_message_record.printable = (custom_market_trade_message_base + 53 + 1) % 256;
  skip
}

/* Custom Market Trade Message to the wire, 54 bytes from where the cursor stands */
inline encode_custom_market_trade_message(custom_market_trade_message_record) {
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.nanoseconds[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 2 -> wire[at] = custom_market_trade_message_record.trade_date[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.contract_number[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = custom_market_trade_message_record.side; at = at + 1;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> wire[at] = custom_market_trade_message_record.order_number[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.quantity_remaining[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> wire[at] = custom_market_trade_message_record.custom_market_order_number[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.custom_market_quantity_remaining[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = custom_market_trade_message_record.trade_type; at = at + 1;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.match_number[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.executed_quantity[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.trade_price[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> wire[at] = custom_market_trade_message_record.traded_contract_number[custom_market_trade_message_at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = custom_market_trade_message_record.trade_side_of_non_custom_order; at = at + 1;
  wire[at] = custom_market_trade_message_record.printable; at = at + 1;
  skip
}

/* Custom Market Trade Message off the wire, 54 bytes from where the cursor stands */
inline decode_custom_market_trade_message(custom_market_trade_message_record) {
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.nanoseconds[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 2 -> custom_market_trade_message_record.trade_date[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.contract_number[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.side = wire[at]; at = at + 1;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.order_number[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.quantity_remaining[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> custom_market_trade_message_record.custom_market_order_number[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.custom_market_quantity_remaining[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_type = wire[at]; at = at + 1;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.match_number[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.executed_quantity[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.trade_price[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> custom_market_trade_message_record.traded_contract_number[custom_market_trade_message_at] = wire[at]; at = at + 1; custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_record.trade_side_of_non_custom_order = wire[at]; at = at + 1;
  custom_market_trade_message_record.printable = wire[at]; at = at + 1;
  skip
}

/* what was read of Custom Market Trade Message is what was written, byte for byte */
inline equal_custom_market_trade_message(custom_market_trade_message_read, custom_market_trade_message_written) {
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.nanoseconds[custom_market_trade_message_at] == custom_market_trade_message_written.nanoseconds[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 2 -> assert(custom_market_trade_message_read.trade_date[custom_market_trade_message_at] == custom_market_trade_message_written.trade_date[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.contract_number[custom_market_trade_message_at] == custom_market_trade_message_written.contract_number[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  assert(custom_market_trade_message_read.side == custom_market_trade_message_written.side);
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> assert(custom_market_trade_message_read.order_number[custom_market_trade_message_at] == custom_market_trade_message_written.order_number[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.quantity_remaining[custom_market_trade_message_at] == custom_market_trade_message_written.quantity_remaining[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 8 -> assert(custom_market_trade_message_read.custom_market_order_number[custom_market_trade_message_at] == custom_market_trade_message_written.custom_market_order_number[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.custom_market_quantity_remaining[custom_market_trade_message_at] == custom_market_trade_message_written.custom_market_quantity_remaining[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  assert(custom_market_trade_message_read.trade_type == custom_market_trade_message_written.trade_type);
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.match_number[custom_market_trade_message_at] == custom_market_trade_message_written.match_number[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.executed_quantity[custom_market_trade_message_at] == custom_market_trade_message_written.executed_quantity[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.trade_price[custom_market_trade_message_at] == custom_market_trade_message_written.trade_price[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  custom_market_trade_message_at = 0;
  do
  :: custom_market_trade_message_at < 4 -> assert(custom_market_trade_message_read.traded_contract_number[custom_market_trade_message_at] == custom_market_trade_message_written.traded_contract_number[custom_market_trade_message_at]); custom_market_trade_message_at = custom_market_trade_message_at + 1
  :: else -> break
  od;
  assert(custom_market_trade_message_read.trade_side_of_non_custom_order == custom_market_trade_message_written.trade_side_of_non_custom_order);
  assert(custom_market_trade_message_read.printable == custom_market_trade_message_written.printable);
  skip
}

/* ---- Trade Cancellation Message: 10 bytes ------------------------------------ */

/* This message is sent whenever a trade is cancelled by exchange operations. This message does not affect any resting orders and is more for Information purposes. Adjustments to the Open, High, Low, Last will be performed as separate action using the Open, High, Low, Last Trade Adjustment message. */
typedef TradeCancellationMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte match_number[4]
};

int trade_cancellation_message_at;

/* every byte of Trade Cancellation Message set to one value */
inline fill_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_value) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.match_number[trade_cancellation_message_at] = trade_cancellation_message_value; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Cancellation Message set to where it lies, so a field read out of place says so */
inline ramp_trade_cancellation_message(trade_cancellation_message_record, trade_cancellation_message_base) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = (trade_cancellation_message_base + 0 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = (trade_cancellation_message_base + 4 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.match_number[trade_cancellation_message_at] = (trade_cancellation_message_base + 6 + trade_cancellation_message_at + 1) % 256; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message to the wire, 10 bytes from where the cursor stands */
inline encode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> wire[at] = trade_cancellation_message_record.trade_date[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> wire[at] = trade_cancellation_message_record.match_number[trade_cancellation_message_at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Cancellation Message off the wire, 10 bytes from where the cursor stands */
inline decode_trade_cancellation_message(trade_cancellation_message_record) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.nanoseconds[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> trade_cancellation_message_record.trade_date[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> trade_cancellation_message_record.match_number[trade_cancellation_message_at] = wire[at]; at = at + 1; trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Cancellation Message is what was written, byte for byte */
inline equal_trade_cancellation_message(trade_cancellation_message_read, trade_cancellation_message_written) {
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.nanoseconds[trade_cancellation_message_at] == trade_cancellation_message_written.nanoseconds[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 2 -> assert(trade_cancellation_message_read.trade_date[trade_cancellation_message_at] == trade_cancellation_message_written.trade_date[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  trade_cancellation_message_at = 0;
  do
  :: trade_cancellation_message_at < 4 -> assert(trade_cancellation_message_read.match_number[trade_cancellation_message_at] == trade_cancellation_message_written.match_number[trade_cancellation_message_at]); trade_cancellation_message_at = trade_cancellation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Equilibrium Price Auction Info Message: 30 bytes ------------------------ */

/* ASX Trade24 disseminates equilibrium prices during a price discovery period. As orders are added, modified, cancelled or deleted a message will be reported informing the market the potential opening price. */
typedef EquilibriumPriceAuctionInfoMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte equilibrium_price[4];
  byte best_bid_price[4];
  byte best_ask_price[4];
  byte best_bid_quantity[4];
  byte best_ask_quantity[4]
};

int equilibrium_price_auction_info_message_at;

/* every byte of Equilibrium Price Auction Info Message set to one value */
inline fill_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_record, equilibrium_price_auction_info_message_value) {
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.nanoseconds[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 2 -> equilibrium_price_auction_info_message_record.trade_date[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.contract_number[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.equilibrium_price[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_price[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_price[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_quantity[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_quantity[equilibrium_price_auction_info_message_at] = equilibrium_price_auction_info_message_value; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Equilibrium Price Auction Info Message set to where it lies, so a field read out of place says so */
inline ramp_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_record, equilibrium_price_auction_info_message_base) {
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.nanoseconds[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 0 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 2 -> equilibrium_price_auction_info_message_record.trade_date[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 4 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.contract_number[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 6 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.equilibrium_price[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 10 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_price[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 14 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_price[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 18 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_quantity[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 22 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_quantity[equilibrium_price_auction_info_message_at] = (equilibrium_price_auction_info_message_base + 26 + equilibrium_price_auction_info_message_at + 1) % 256; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Auction Info Message to the wire, 30 bytes from where the cursor stands */
inline encode_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_record) {
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.nanoseconds[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 2 -> wire[at] = equilibrium_price_auction_info_message_record.trade_date[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.contract_number[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.equilibrium_price[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.best_bid_price[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.best_ask_price[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.best_bid_quantity[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> wire[at] = equilibrium_price_auction_info_message_record.best_ask_quantity[equilibrium_price_auction_info_message_at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Equilibrium Price Auction Info Message off the wire, 30 bytes from where the cursor stands */
inline decode_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_record) {
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.nanoseconds[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 2 -> equilibrium_price_auction_info_message_record.trade_date[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.contract_number[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.equilibrium_price[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_price[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_price[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_bid_quantity[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> equilibrium_price_auction_info_message_record.best_ask_quantity[equilibrium_price_auction_info_message_at] = wire[at]; at = at + 1; equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Equilibrium Price Auction Info Message is what was written, byte for byte */
inline equal_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_read, equilibrium_price_auction_info_message_written) {
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.nanoseconds[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.nanoseconds[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 2 -> assert(equilibrium_price_auction_info_message_read.trade_date[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.trade_date[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.contract_number[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.contract_number[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.equilibrium_price[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.equilibrium_price[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.best_bid_price[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.best_bid_price[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.best_ask_price[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.best_ask_price[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.best_bid_quantity[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.best_bid_quantity[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  equilibrium_price_auction_info_message_at = 0;
  do
  :: equilibrium_price_auction_info_message_at < 4 -> assert(equilibrium_price_auction_info_message_read.best_ask_quantity[equilibrium_price_auction_info_message_at] == equilibrium_price_auction_info_message_written.best_ask_quantity[equilibrium_price_auction_info_message_at]); equilibrium_price_auction_info_message_at = equilibrium_price_auction_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Settlement Message: 19 bytes ------------------------------------- */

/* ASX Trade24 disseminates settlement prices for all future and option contracts in two instalments, an interim and then a final. When the contract moves to the next trade date, the Future Symbol Directory or Option Symbol Directory message will reflect the final settlement price reported from the previous trade date in the prior day settlement field. */
typedef MarketSettlementMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte settlement_price[4];
  byte volatility[4];
  byte settlement_type
};

int market_settlement_message_at;

/* every byte of Market Settlement Message set to one value */
inline fill_market_settlement_message(market_settlement_message_record, market_settlement_message_value) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.contract_number[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.settlement_price[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.volatility[market_settlement_message_at] = market_settlement_message_value; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_record.settlement_type = market_settlement_message_value;
  skip
}

/* each byte of Market Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_market_settlement_message(market_settlement_message_record, market_settlement_message_base) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = (market_settlement_message_base + 0 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = (market_settlement_message_base + 4 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.contract_number[market_settlement_message_at] = (market_settlement_message_base + 6 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.settlement_price[market_settlement_message_at] = (market_settlement_message_base + 10 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.volatility[market_settlement_message_at] = (market_settlement_message_base + 14 + market_settlement_message_at + 1) % 256; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_record.settlement_type = (market_settlement_message_base + 18 + 1) % 256;
  skip
}

/* Market Settlement Message to the wire, 19 bytes from where the cursor stands */
inline encode_market_settlement_message(market_settlement_message_record) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.nanoseconds[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> wire[at] = market_settlement_message_record.trade_date[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.contract_number[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.settlement_price[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> wire[at] = market_settlement_message_record.volatility[market_settlement_message_at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  wire[at] = market_settlement_message_record.settlement_type; at = at + 1;
  skip
}

/* Market Settlement Message off the wire, 19 bytes from where the cursor stands */
inline decode_market_settlement_message(market_settlement_message_record) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.nanoseconds[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> market_settlement_message_record.trade_date[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.contract_number[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.settlement_price[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> market_settlement_message_record.volatility[market_settlement_message_at] = wire[at]; at = at + 1; market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_record.settlement_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Settlement Message is what was written, byte for byte */
inline equal_market_settlement_message(market_settlement_message_read, market_settlement_message_written) {
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.nanoseconds[market_settlement_message_at] == market_settlement_message_written.nanoseconds[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 2 -> assert(market_settlement_message_read.trade_date[market_settlement_message_at] == market_settlement_message_written.trade_date[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.contract_number[market_settlement_message_at] == market_settlement_message_written.contract_number[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.settlement_price[market_settlement_message_at] == market_settlement_message_written.settlement_price[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  market_settlement_message_at = 0;
  do
  :: market_settlement_message_at < 4 -> assert(market_settlement_message_read.volatility[market_settlement_message_at] == market_settlement_message_written.volatility[market_settlement_message_at]); market_settlement_message_at = market_settlement_message_at + 1
  :: else -> break
  od;
  assert(market_settlement_message_read.settlement_type == market_settlement_message_written.settlement_type);
  skip
}

/* ---- Ad Hoc Text Message: 112 bytes ------------------------------------------ */

/* ASX Trade24 disseminates text messages to inform the market of ad hoc events. */
typedef AdHocTextMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte source_id[6];
  byte text_message[100]
};

int ad_hoc_text_message_at;

/* every byte of Ad Hoc Text Message set to one value */
inline fill_ad_hoc_text_message(ad_hoc_text_message_record, ad_hoc_text_message_value) {
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 4 -> ad_hoc_text_message_record.nanoseconds[ad_hoc_text_message_at] = ad_hoc_text_message_value; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 2 -> ad_hoc_text_message_record.trade_date[ad_hoc_text_message_at] = ad_hoc_text_message_value; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 6 -> ad_hoc_text_message_record.source_id[ad_hoc_text_message_at] = ad_hoc_text_message_value; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 100 -> ad_hoc_text_message_record.text_message[ad_hoc_text_message_at] = ad_hoc_text_message_value; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ad Hoc Text Message set to where it lies, so a field read out of place says so */
inline ramp_ad_hoc_text_message(ad_hoc_text_message_record, ad_hoc_text_message_base) {
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 4 -> ad_hoc_text_message_record.nanoseconds[ad_hoc_text_message_at] = (ad_hoc_text_message_base + 0 + ad_hoc_text_message_at + 1) % 256; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 2 -> ad_hoc_text_message_record.trade_date[ad_hoc_text_message_at] = (ad_hoc_text_message_base + 4 + ad_hoc_text_message_at + 1) % 256; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 6 -> ad_hoc_text_message_record.source_id[ad_hoc_text_message_at] = (ad_hoc_text_message_base + 6 + ad_hoc_text_message_at + 1) % 256; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 100 -> ad_hoc_text_message_record.text_message[ad_hoc_text_message_at] = (ad_hoc_text_message_base + 12 + ad_hoc_text_message_at + 1) % 256; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ad Hoc Text Message to the wire, 112 bytes from where the cursor stands */
inline encode_ad_hoc_text_message(ad_hoc_text_message_record) {
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 4 -> wire[at] = ad_hoc_text_message_record.nanoseconds[ad_hoc_text_message_at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 2 -> wire[at] = ad_hoc_text_message_record.trade_date[ad_hoc_text_message_at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 6 -> wire[at] = ad_hoc_text_message_record.source_id[ad_hoc_text_message_at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 100 -> wire[at] = ad_hoc_text_message_record.text_message[ad_hoc_text_message_at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ad Hoc Text Message off the wire, 112 bytes from where the cursor stands */
inline decode_ad_hoc_text_message(ad_hoc_text_message_record) {
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 4 -> ad_hoc_text_message_record.nanoseconds[ad_hoc_text_message_at] = wire[at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 2 -> ad_hoc_text_message_record.trade_date[ad_hoc_text_message_at] = wire[at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 6 -> ad_hoc_text_message_record.source_id[ad_hoc_text_message_at] = wire[at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 100 -> ad_hoc_text_message_record.text_message[ad_hoc_text_message_at] = wire[at]; at = at + 1; ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ad Hoc Text Message is what was written, byte for byte */
inline equal_ad_hoc_text_message(ad_hoc_text_message_read, ad_hoc_text_message_written) {
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 4 -> assert(ad_hoc_text_message_read.nanoseconds[ad_hoc_text_message_at] == ad_hoc_text_message_written.nanoseconds[ad_hoc_text_message_at]); ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 2 -> assert(ad_hoc_text_message_read.trade_date[ad_hoc_text_message_at] == ad_hoc_text_message_written.trade_date[ad_hoc_text_message_at]); ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 6 -> assert(ad_hoc_text_message_read.source_id[ad_hoc_text_message_at] == ad_hoc_text_message_written.source_id[ad_hoc_text_message_at]); ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  ad_hoc_text_message_at = 0;
  do
  :: ad_hoc_text_message_at < 100 -> assert(ad_hoc_text_message_read.text_message[ad_hoc_text_message_at] == ad_hoc_text_message_written.text_message[ad_hoc_text_message_at]); ad_hoc_text_message_at = ad_hoc_text_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Request For Quote Message: 18 bytes ------------------------------------- */

/* ASX Trade24 disseminates anonymous non-custom RFQs from the market. */
typedef RequestForQuoteMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte price[4];
  byte quantity[4]
};

int request_for_quote_message_at;

/* every byte of Request For Quote Message set to one value */
inline fill_request_for_quote_message(request_for_quote_message_record, request_for_quote_message_value) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.contract_number[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.price[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = request_for_quote_message_value; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Request For Quote Message set to where it lies, so a field read out of place says so */
inline ramp_request_for_quote_message(request_for_quote_message_record, request_for_quote_message_base) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = (request_for_quote_message_base + 0 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = (request_for_quote_message_base + 4 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.contract_number[request_for_quote_message_at] = (request_for_quote_message_base + 6 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.price[request_for_quote_message_at] = (request_for_quote_message_base + 10 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = (request_for_quote_message_base + 14 + request_for_quote_message_at + 1) % 256; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote Message to the wire, 18 bytes from where the cursor stands */
inline encode_request_for_quote_message(request_for_quote_message_record) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.nanoseconds[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> wire[at] = request_for_quote_message_record.trade_date[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.contract_number[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.price[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> wire[at] = request_for_quote_message_record.quantity[request_for_quote_message_at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Request For Quote Message off the wire, 18 bytes from where the cursor stands */
inline decode_request_for_quote_message(request_for_quote_message_record) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.nanoseconds[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> request_for_quote_message_record.trade_date[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.contract_number[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.price[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> request_for_quote_message_record.quantity[request_for_quote_message_at] = wire[at]; at = at + 1; request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Request For Quote Message is what was written, byte for byte */
inline equal_request_for_quote_message(request_for_quote_message_read, request_for_quote_message_written) {
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.nanoseconds[request_for_quote_message_at] == request_for_quote_message_written.nanoseconds[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 2 -> assert(request_for_quote_message_read.trade_date[request_for_quote_message_at] == request_for_quote_message_written.trade_date[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.contract_number[request_for_quote_message_at] == request_for_quote_message_written.contract_number[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.price[request_for_quote_message_at] == request_for_quote_message_written.price[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  request_for_quote_message_at = 0;
  do
  :: request_for_quote_message_at < 4 -> assert(request_for_quote_message_read.quantity[request_for_quote_message_at] == request_for_quote_message_written.quantity[request_for_quote_message_at]); request_for_quote_message_at = request_for_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Anomalous Order Threshold Publish Message: 34 bytes --------------------- */

/* ASX Trade24 reports this message to inform the market of setting, zeroing or adjusting the Extreme Trade Range price (ETR), the Anomalous Order Threshold price (AOT) and the associated ranges for a contract that requires Market Integrity Rules enforcement. */
typedef AnomalousOrderThresholdPublishMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte aot_price[4];
  byte aot_upper_price[4];
  byte aot_lower_price[4];
  byte etr_price[4];
  byte etr_upper_price[4];
  byte etr_lower_price[4]
};

int anomalous_order_threshold_publish_message_at;

/* every byte of Anomalous Order Threshold Publish Message set to one value */
inline fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record, anomalous_order_threshold_publish_message_value) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.contract_number[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = anomalous_order_threshold_publish_message_value; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Anomalous Order Threshold Publish Message set to where it lies, so a field read out of place says so */
inline ramp_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record, anomalous_order_threshold_publish_message_base) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 0 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 4 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.contract_number[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 6 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 10 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 14 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 18 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 22 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 26 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = (anomalous_order_threshold_publish_message_base + 30 + anomalous_order_threshold_publish_message_at + 1) % 256; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Anomalous Order Threshold Publish Message to the wire, 34 bytes from where the cursor stands */
inline encode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> wire[at] = anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.contract_number[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> wire[at] = anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* Anomalous Order Threshold Publish Message off the wire, 34 bytes from where the cursor stands */
inline decode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_record) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.nanoseconds[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> anomalous_order_threshold_publish_message_record.trade_date[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.contract_number[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_upper_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.aot_lower_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_upper_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> anomalous_order_threshold_publish_message_record.etr_lower_price[anomalous_order_threshold_publish_message_at] = wire[at]; at = at + 1; anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Anomalous Order Threshold Publish Message is what was written, byte for byte */
inline equal_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_read, anomalous_order_threshold_publish_message_written) {
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.nanoseconds[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.nanoseconds[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 2 -> assert(anomalous_order_threshold_publish_message_read.trade_date[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.trade_date[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.contract_number[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.contract_number[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.aot_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.aot_upper_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_upper_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.aot_lower_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.aot_lower_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.etr_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.etr_upper_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_upper_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  anomalous_order_threshold_publish_message_at = 0;
  do
  :: anomalous_order_threshold_publish_message_at < 4 -> assert(anomalous_order_threshold_publish_message_read.etr_lower_price[anomalous_order_threshold_publish_message_at] == anomalous_order_threshold_publish_message_written.etr_lower_price[anomalous_order_threshold_publish_message_at]); anomalous_order_threshold_publish_message_at = anomalous_order_threshold_publish_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Volume And Open Interest Message: 20 bytes ------------------------------ */

/* ASX Trade24 disseminates volume and open interest information for each trade date. The VOI Trade Date indicates the trade date to which the information applies. */
typedef VolumeAndOpenInterestMessage {
  byte nanoseconds[4];
  byte trade_date[2];
  byte contract_number[4];
  byte cumulative_volume[4];
  byte open_interest[4];
  byte voi_trade_date[2]
};

int volume_and_open_interest_message_at;

/* every byte of Volume And Open Interest Message set to one value */
inline fill_volume_and_open_interest_message(volume_and_open_interest_message_record, volume_and_open_interest_message_value) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.contract_number[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = volume_and_open_interest_message_value; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Volume And Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_volume_and_open_interest_message(volume_and_open_interest_message_record, volume_and_open_interest_message_base) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 0 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 4 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.contract_number[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 6 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 10 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 14 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = (volume_and_open_interest_message_base + 18 + volume_and_open_interest_message_at + 1) % 256; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Volume And Open Interest Message to the wire, 20 bytes from where the cursor stands */
inline encode_volume_and_open_interest_message(volume_and_open_interest_message_record) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> wire[at] = volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.contract_number[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> wire[at] = volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> wire[at] = volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Volume And Open Interest Message off the wire, 20 bytes from where the cursor stands */
inline decode_volume_and_open_interest_message(volume_and_open_interest_message_record) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.nanoseconds[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.trade_date[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.contract_number[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.cumulative_volume[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> volume_and_open_interest_message_record.open_interest[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> volume_and_open_interest_message_record.voi_trade_date[volume_and_open_interest_message_at] = wire[at]; at = at + 1; volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Volume And Open Interest Message is what was written, byte for byte */
inline equal_volume_and_open_interest_message(volume_and_open_interest_message_read, volume_and_open_interest_message_written) {
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.nanoseconds[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.nanoseconds[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> assert(volume_and_open_interest_message_read.trade_date[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.trade_date[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.contract_number[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.contract_number[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.cumulative_volume[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.cumulative_volume[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 4 -> assert(volume_and_open_interest_message_read.open_interest[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.open_interest[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  volume_and_open_interest_message_at = 0;
  do
  :: volume_and_open_interest_message_at < 2 -> assert(volume_and_open_interest_message_read.voi_trade_date[volume_and_open_interest_message_at] == volume_and_open_interest_message_written.voi_trade_date[volume_and_open_interest_message_at]); volume_and_open_interest_message_at = volume_and_open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Session: encoded, read back, and compared */
proctype check_session() {
  Session session_sent;
  Session session_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_session(session_sent, 0)
  :: pattern == 1 -> fill_session(session_sent, 32)
  :: pattern == 2 -> fill_session(session_sent, 255)
  :: else -> ramp_session(session_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_session(session_sent);
    assert(at == 10);
    at = 0;
    decode_session(session_got);
    assert(at == 10);
    equal_session(session_got, session_sent)
  }
}

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

/* Time Message: encoded, read back, and compared */
proctype check_time_message() {
  TimeMessage time_message_sent;
  TimeMessage time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_message(time_message_sent, 0)
  :: pattern == 1 -> fill_time_message(time_message_sent, 32)
  :: pattern == 2 -> fill_time_message(time_message_sent, 255)
  :: else -> ramp_time_message(time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_message(time_message_sent);
    assert(at == 4);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 4);
    equal_time_message(time_message_got, time_message_sent)
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
    assert(at == 7);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 7);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
  }
}

/* Future Symbol Directory Message: encoded, read back, and compared */
proctype check_future_symbol_directory_message() {
  FutureSymbolDirectoryMessage future_symbol_directory_message_sent;
  FutureSymbolDirectoryMessage future_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_future_symbol_directory_message(future_symbol_directory_message_sent, 255)
  :: else -> ramp_future_symbol_directory_message(future_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_future_symbol_directory_message(future_symbol_directory_message_sent);
    assert(at == 53);
    at = 0;
    decode_future_symbol_directory_message(future_symbol_directory_message_got);
    assert(at == 53);
    equal_future_symbol_directory_message(future_symbol_directory_message_got, future_symbol_directory_message_sent)
  }
}

/* Spread Symbol Directory Message: encoded, read back, and compared */
proctype check_spread_symbol_directory_message() {
  SpreadSymbolDirectoryMessage spread_symbol_directory_message_sent;
  SpreadSymbolDirectoryMessage spread_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_symbol_directory_message(spread_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_spread_symbol_directory_message(spread_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_spread_symbol_directory_message(spread_symbol_directory_message_sent, 255)
  :: else -> ramp_spread_symbol_directory_message(spread_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_symbol_directory_message(spread_symbol_directory_message_sent);
    assert(at == 34);
    at = 0;
    decode_spread_symbol_directory_message(spread_symbol_directory_message_got);
    assert(at == 34);
    equal_spread_symbol_directory_message(spread_symbol_directory_message_got, spread_symbol_directory_message_sent)
  }
}

/* Option Symbol Directory Message: encoded, read back, and compared */
proctype check_option_symbol_directory_message() {
  OptionSymbolDirectoryMessage option_symbol_directory_message_sent;
  OptionSymbolDirectoryMessage option_symbol_directory_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_option_symbol_directory_message(option_symbol_directory_message_sent, 0)
  :: pattern == 1 -> fill_option_symbol_directory_message(option_symbol_directory_message_sent, 32)
  :: pattern == 2 -> fill_option_symbol_directory_message(option_symbol_directory_message_sent, 255)
  :: else -> ramp_option_symbol_directory_message(option_symbol_directory_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_option_symbol_directory_message(option_symbol_directory_message_sent);
    assert(at == 74);
    at = 0;
    decode_option_symbol_directory_message(option_symbol_directory_message_got);
    assert(at == 74);
    equal_option_symbol_directory_message(option_symbol_directory_message_got, option_symbol_directory_message_sent)
  }
}

/* Order Book State Message: encoded, read back, and compared */
proctype check_order_book_state_message() {
  OrderBookStateMessage order_book_state_message_sent;
  OrderBookStateMessage order_book_state_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_book_state_message(order_book_state_message_sent, 0)
  :: pattern == 1 -> fill_order_book_state_message(order_book_state_message_sent, 32)
  :: pattern == 2 -> fill_order_book_state_message(order_book_state_message_sent, 255)
  :: else -> ramp_order_book_state_message(order_book_state_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_book_state_message(order_book_state_message_sent);
    assert(at == 11);
    at = 0;
    decode_order_book_state_message(order_book_state_message_got);
    assert(at == 11);
    equal_order_book_state_message(order_book_state_message_got, order_book_state_message_sent)
  }
}

/* Order Added Message: encoded, read back, and compared */
proctype check_order_added_message() {
  OrderAddedMessage order_added_message_sent;
  OrderAddedMessage order_added_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_added_message(order_added_message_sent, 0)
  :: pattern == 1 -> fill_order_added_message(order_added_message_sent, 32)
  :: pattern == 2 -> fill_order_added_message(order_added_message_sent, 255)
  :: else -> ramp_order_added_message(order_added_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_added_message(order_added_message_sent);
    assert(at == 31);
    at = 0;
    decode_order_added_message(order_added_message_got);
    assert(at == 31);
    equal_order_added_message(order_added_message_got, order_added_message_sent)
  }
}

/* Order Replaced Message: encoded, read back, and compared */
proctype check_order_replaced_message() {
  OrderReplacedMessage order_replaced_message_sent;
  OrderReplacedMessage order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_replaced_message(order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_order_replaced_message(order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_order_replaced_message(order_replaced_message_sent, 255)
  :: else -> ramp_order_replaced_message(order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_replaced_message(order_replaced_message_sent);
    assert(at == 31);
    at = 0;
    decode_order_replaced_message(order_replaced_message_got);
    assert(at == 31);
    equal_order_replaced_message(order_replaced_message_got, order_replaced_message_sent)
  }
}

/* Order Volume Cancelled Message: encoded, read back, and compared */
proctype check_order_volume_cancelled_message() {
  OrderVolumeCancelledMessage order_volume_cancelled_message_sent;
  OrderVolumeCancelledMessage order_volume_cancelled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 0)
  :: pattern == 1 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 32)
  :: pattern == 2 -> fill_order_volume_cancelled_message(order_volume_cancelled_message_sent, 255)
  :: else -> ramp_order_volume_cancelled_message(order_volume_cancelled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_volume_cancelled_message(order_volume_cancelled_message_sent);
    assert(at == 23);
    at = 0;
    decode_order_volume_cancelled_message(order_volume_cancelled_message_got);
    assert(at == 23);
    equal_order_volume_cancelled_message(order_volume_cancelled_message_got, order_volume_cancelled_message_sent)
  }
}

/* Order Deleted Message: encoded, read back, and compared */
proctype check_order_deleted_message() {
  OrderDeletedMessage order_deleted_message_sent;
  OrderDeletedMessage order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_deleted_message(order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_order_deleted_message(order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_order_deleted_message(order_deleted_message_sent, 255)
  :: else -> ramp_order_deleted_message(order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_deleted_message(order_deleted_message_sent);
    assert(at == 19);
    at = 0;
    decode_order_deleted_message(order_deleted_message_got);
    assert(at == 19);
    equal_order_deleted_message(order_deleted_message_got, order_deleted_message_sent)
  }
}

/* Implied Order Added Message: encoded, read back, and compared */
proctype check_implied_order_added_message() {
  ImpliedOrderAddedMessage implied_order_added_message_sent;
  ImpliedOrderAddedMessage implied_order_added_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_added_message(implied_order_added_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_added_message(implied_order_added_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_added_message(implied_order_added_message_sent, 255)
  :: else -> ramp_implied_order_added_message(implied_order_added_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_added_message(implied_order_added_message_sent);
    assert(at == 31);
    at = 0;
    decode_implied_order_added_message(implied_order_added_message_got);
    assert(at == 31);
    equal_implied_order_added_message(implied_order_added_message_got, implied_order_added_message_sent)
  }
}

/* Implied Order Replaced Message: encoded, read back, and compared */
proctype check_implied_order_replaced_message() {
  ImpliedOrderReplacedMessage implied_order_replaced_message_sent;
  ImpliedOrderReplacedMessage implied_order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_replaced_message(implied_order_replaced_message_sent, 255)
  :: else -> ramp_implied_order_replaced_message(implied_order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_replaced_message(implied_order_replaced_message_sent);
    assert(at == 31);
    at = 0;
    decode_implied_order_replaced_message(implied_order_replaced_message_got);
    assert(at == 31);
    equal_implied_order_replaced_message(implied_order_replaced_message_got, implied_order_replaced_message_sent)
  }
}

/* Implied Order Deleted Message: encoded, read back, and compared */
proctype check_implied_order_deleted_message() {
  ImpliedOrderDeletedMessage implied_order_deleted_message_sent;
  ImpliedOrderDeletedMessage implied_order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_implied_order_deleted_message(implied_order_deleted_message_sent, 255)
  :: else -> ramp_implied_order_deleted_message(implied_order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_implied_order_deleted_message(implied_order_deleted_message_sent);
    assert(at == 19);
    at = 0;
    decode_implied_order_deleted_message(implied_order_deleted_message_got);
    assert(at == 19);
    equal_implied_order_deleted_message(implied_order_deleted_message_got, implied_order_deleted_message_sent)
  }
}

/* Custom Market Order Replaced Message: encoded, read back, and compared */
proctype check_custom_market_order_replaced_message() {
  CustomMarketOrderReplacedMessage custom_market_order_replaced_message_sent;
  CustomMarketOrderReplacedMessage custom_market_order_replaced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custom_market_order_replaced_message(custom_market_order_replaced_message_sent, 0)
  :: pattern == 1 -> fill_custom_market_order_replaced_message(custom_market_order_replaced_message_sent, 32)
  :: pattern == 2 -> fill_custom_market_order_replaced_message(custom_market_order_replaced_message_sent, 255)
  :: else -> ramp_custom_market_order_replaced_message(custom_market_order_replaced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custom_market_order_replaced_message(custom_market_order_replaced_message_sent);
    assert(at == 22);
    at = 0;
    decode_custom_market_order_replaced_message(custom_market_order_replaced_message_got);
    assert(at == 22);
    equal_custom_market_order_replaced_message(custom_market_order_replaced_message_got, custom_market_order_replaced_message_sent)
  }
}

/* Custom Market Order Deleted Message: encoded, read back, and compared */
proctype check_custom_market_order_deleted_message() {
  CustomMarketOrderDeletedMessage custom_market_order_deleted_message_sent;
  CustomMarketOrderDeletedMessage custom_market_order_deleted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custom_market_order_deleted_message(custom_market_order_deleted_message_sent, 0)
  :: pattern == 1 -> fill_custom_market_order_deleted_message(custom_market_order_deleted_message_sent, 32)
  :: pattern == 2 -> fill_custom_market_order_deleted_message(custom_market_order_deleted_message_sent, 255)
  :: else -> ramp_custom_market_order_deleted_message(custom_market_order_deleted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custom_market_order_deleted_message(custom_market_order_deleted_message_sent);
    assert(at == 14);
    at = 0;
    decode_custom_market_order_deleted_message(custom_market_order_deleted_message_got);
    assert(at == 14);
    equal_custom_market_order_deleted_message(custom_market_order_deleted_message_got, custom_market_order_deleted_message_sent)
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
    assert(at == 36);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 36);
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
    assert(at == 47);
    at = 0;
    decode_order_executed_with_price_message(order_executed_with_price_message_got);
    assert(at == 47);
    equal_order_executed_with_price_message(order_executed_with_price_message_got, order_executed_with_price_message_sent)
  }
}

/* Spread Executed Message: encoded, read back, and compared */
proctype check_spread_executed_message() {
  SpreadExecutedMessage spread_executed_message_sent;
  SpreadExecutedMessage spread_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spread_executed_message(spread_executed_message_sent, 0)
  :: pattern == 1 -> fill_spread_executed_message(spread_executed_message_sent, 32)
  :: pattern == 2 -> fill_spread_executed_message(spread_executed_message_sent, 255)
  :: else -> ramp_spread_executed_message(spread_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spread_executed_message(spread_executed_message_sent);
    assert(at == 46);
    at = 0;
    decode_spread_executed_message(spread_executed_message_got);
    assert(at == 46);
    equal_spread_executed_message(spread_executed_message_got, spread_executed_message_sent)
  }
}

/* Trade Spread Execution Chain Message: encoded, read back, and compared */
proctype check_trade_spread_execution_chain_message() {
  TradeSpreadExecutionChainMessage trade_spread_execution_chain_message_sent;
  TradeSpreadExecutionChainMessage trade_spread_execution_chain_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_spread_execution_chain_message(trade_spread_execution_chain_message_sent, 0)
  :: pattern == 1 -> fill_trade_spread_execution_chain_message(trade_spread_execution_chain_message_sent, 32)
  :: pattern == 2 -> fill_trade_spread_execution_chain_message(trade_spread_execution_chain_message_sent, 255)
  :: else -> ramp_trade_spread_execution_chain_message(trade_spread_execution_chain_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_spread_execution_chain_message(trade_spread_execution_chain_message_sent);
    assert(at == 62);
    at = 0;
    decode_trade_spread_execution_chain_message(trade_spread_execution_chain_message_got);
    assert(at == 62);
    equal_trade_spread_execution_chain_message(trade_spread_execution_chain_message_got, trade_spread_execution_chain_message_sent)
  }
}

/* Custom Market Executed Message: encoded, read back, and compared */
proctype check_custom_market_executed_message() {
  CustomMarketExecutedMessage custom_market_executed_message_sent;
  CustomMarketExecutedMessage custom_market_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custom_market_executed_message(custom_market_executed_message_sent, 0)
  :: pattern == 1 -> fill_custom_market_executed_message(custom_market_executed_message_sent, 32)
  :: pattern == 2 -> fill_custom_market_executed_message(custom_market_executed_message_sent, 255)
  :: else -> ramp_custom_market_executed_message(custom_market_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custom_market_executed_message(custom_market_executed_message_sent);
    assert(at == 37);
    at = 0;
    decode_custom_market_executed_message(custom_market_executed_message_got);
    assert(at == 37);
    equal_custom_market_executed_message(custom_market_executed_message_got, custom_market_executed_message_sent)
  }
}

/* Custom Market Trade Message: encoded, read back, and compared */
proctype check_custom_market_trade_message() {
  CustomMarketTradeMessage custom_market_trade_message_sent;
  CustomMarketTradeMessage custom_market_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_custom_market_trade_message(custom_market_trade_message_sent, 0)
  :: pattern == 1 -> fill_custom_market_trade_message(custom_market_trade_message_sent, 32)
  :: pattern == 2 -> fill_custom_market_trade_message(custom_market_trade_message_sent, 255)
  :: else -> ramp_custom_market_trade_message(custom_market_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_custom_market_trade_message(custom_market_trade_message_sent);
    assert(at == 54);
    at = 0;
    decode_custom_market_trade_message(custom_market_trade_message_got);
    assert(at == 54);
    equal_custom_market_trade_message(custom_market_trade_message_got, custom_market_trade_message_sent)
  }
}

/* Trade Cancellation Message: encoded, read back, and compared */
proctype check_trade_cancellation_message() {
  TradeCancellationMessage trade_cancellation_message_sent;
  TradeCancellationMessage trade_cancellation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 0)
  :: pattern == 1 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 32)
  :: pattern == 2 -> fill_trade_cancellation_message(trade_cancellation_message_sent, 255)
  :: else -> ramp_trade_cancellation_message(trade_cancellation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_cancellation_message(trade_cancellation_message_sent);
    assert(at == 10);
    at = 0;
    decode_trade_cancellation_message(trade_cancellation_message_got);
    assert(at == 10);
    equal_trade_cancellation_message(trade_cancellation_message_got, trade_cancellation_message_sent)
  }
}

/* Equilibrium Price Auction Info Message: encoded, read back, and compared */
proctype check_equilibrium_price_auction_info_message() {
  EquilibriumPriceAuctionInfoMessage equilibrium_price_auction_info_message_sent;
  EquilibriumPriceAuctionInfoMessage equilibrium_price_auction_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_sent, 0)
  :: pattern == 1 -> fill_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_sent, 32)
  :: pattern == 2 -> fill_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_sent, 255)
  :: else -> ramp_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_sent);
    assert(at == 30);
    at = 0;
    decode_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_got);
    assert(at == 30);
    equal_equilibrium_price_auction_info_message(equilibrium_price_auction_info_message_got, equilibrium_price_auction_info_message_sent)
  }
}

/* Market Settlement Message: encoded, read back, and compared */
proctype check_market_settlement_message() {
  MarketSettlementMessage market_settlement_message_sent;
  MarketSettlementMessage market_settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_settlement_message(market_settlement_message_sent, 0)
  :: pattern == 1 -> fill_market_settlement_message(market_settlement_message_sent, 32)
  :: pattern == 2 -> fill_market_settlement_message(market_settlement_message_sent, 255)
  :: else -> ramp_market_settlement_message(market_settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_settlement_message(market_settlement_message_sent);
    assert(at == 19);
    at = 0;
    decode_market_settlement_message(market_settlement_message_got);
    assert(at == 19);
    equal_market_settlement_message(market_settlement_message_got, market_settlement_message_sent)
  }
}

/* Ad Hoc Text Message: encoded, read back, and compared */
proctype check_ad_hoc_text_message() {
  AdHocTextMessage ad_hoc_text_message_sent;
  AdHocTextMessage ad_hoc_text_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ad_hoc_text_message(ad_hoc_text_message_sent, 0)
  :: pattern == 1 -> fill_ad_hoc_text_message(ad_hoc_text_message_sent, 32)
  :: pattern == 2 -> fill_ad_hoc_text_message(ad_hoc_text_message_sent, 255)
  :: else -> ramp_ad_hoc_text_message(ad_hoc_text_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ad_hoc_text_message(ad_hoc_text_message_sent);
    assert(at == 112);
    at = 0;
    decode_ad_hoc_text_message(ad_hoc_text_message_got);
    assert(at == 112);
    equal_ad_hoc_text_message(ad_hoc_text_message_got, ad_hoc_text_message_sent)
  }
}

/* Request For Quote Message: encoded, read back, and compared */
proctype check_request_for_quote_message() {
  RequestForQuoteMessage request_for_quote_message_sent;
  RequestForQuoteMessage request_for_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_request_for_quote_message(request_for_quote_message_sent, 0)
  :: pattern == 1 -> fill_request_for_quote_message(request_for_quote_message_sent, 32)
  :: pattern == 2 -> fill_request_for_quote_message(request_for_quote_message_sent, 255)
  :: else -> ramp_request_for_quote_message(request_for_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_request_for_quote_message(request_for_quote_message_sent);
    assert(at == 18);
    at = 0;
    decode_request_for_quote_message(request_for_quote_message_got);
    assert(at == 18);
    equal_request_for_quote_message(request_for_quote_message_got, request_for_quote_message_sent)
  }
}

/* Anomalous Order Threshold Publish Message: encoded, read back, and compared */
proctype check_anomalous_order_threshold_publish_message() {
  AnomalousOrderThresholdPublishMessage anomalous_order_threshold_publish_message_sent;
  AnomalousOrderThresholdPublishMessage anomalous_order_threshold_publish_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 0)
  :: pattern == 1 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 32)
  :: pattern == 2 -> fill_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 255)
  :: else -> ramp_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_sent);
    assert(at == 34);
    at = 0;
    decode_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_got);
    assert(at == 34);
    equal_anomalous_order_threshold_publish_message(anomalous_order_threshold_publish_message_got, anomalous_order_threshold_publish_message_sent)
  }
}

/* Volume And Open Interest Message: encoded, read back, and compared */
proctype check_volume_and_open_interest_message() {
  VolumeAndOpenInterestMessage volume_and_open_interest_message_sent;
  VolumeAndOpenInterestMessage volume_and_open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 0)
  :: pattern == 1 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 32)
  :: pattern == 2 -> fill_volume_and_open_interest_message(volume_and_open_interest_message_sent, 255)
  :: else -> ramp_volume_and_open_interest_message(volume_and_open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_volume_and_open_interest_message(volume_and_open_interest_message_sent);
    assert(at == 20);
    at = 0;
    decode_volume_and_open_interest_message(volume_and_open_interest_message_got);
    assert(at == 20);
    equal_volume_and_open_interest_message(volume_and_open_interest_message_got, volume_and_open_interest_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_session()
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_message()
  :: run check_system_event_message()
  :: run check_future_symbol_directory_message()
  :: run check_spread_symbol_directory_message()
  :: run check_option_symbol_directory_message()
  :: run check_order_book_state_message()
  :: run check_order_added_message()
  :: run check_order_replaced_message()
  :: run check_order_volume_cancelled_message()
  :: run check_order_deleted_message()
  :: run check_implied_order_added_message()
  :: run check_implied_order_replaced_message()
  :: run check_implied_order_deleted_message()
  :: run check_custom_market_order_replaced_message()
  :: run check_custom_market_order_deleted_message()
  :: run check_order_executed_message()
  :: run check_order_executed_with_price_message()
  :: run check_spread_executed_message()
  :: run check_trade_spread_execution_chain_message()
  :: run check_custom_market_executed_message()
  :: run check_custom_market_trade_message()
  :: run check_trade_cancellation_message()
  :: run check_equilibrium_price_auction_info_message()
  :: run check_market_settlement_message()
  :: run check_ad_hoc_text_message()
  :: run check_request_for_quote_message()
  :: run check_anomalous_order_threshold_publish_message()
  :: run check_volume_and_open_interest_message()
  fi
}
