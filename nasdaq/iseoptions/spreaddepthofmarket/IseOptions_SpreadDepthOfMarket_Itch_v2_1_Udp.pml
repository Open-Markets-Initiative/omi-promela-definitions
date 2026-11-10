/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) ISE Options Spread Depth
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
#define WIRE 58

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

/* ---- Add Order Short Form Message: 32 bytes ---------------------------------- */

/* A Complex Add Order Message indicates that a new order has been accepted and was added to the displayable book. */
typedef AddOrderShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte depth_side;
  byte depth_order_capacity;
  byte price_short[2];
  byte volume_short[2];
  byte scope;
  byte reserved_3[3]
};

int add_order_short_form_message_at;

/* every byte of Add Order Short Form Message set to one value */
inline fill_add_order_short_form_message(add_order_short_form_message_record, add_order_short_form_message_value) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.strategy_id[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.depth_side = add_order_short_form_message_value;
  add_order_short_form_message_record.depth_order_capacity = add_order_short_form_message_value;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.scope = add_order_short_form_message_value;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 3 -> add_order_short_form_message_record.reserved_3[add_order_short_form_message_at] = add_order_short_form_message_value; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_form_message(add_order_short_form_message_record, add_order_short_form_message_base) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = (add_order_short_form_message_base + 0 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = (add_order_short_form_message_base + 2 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.strategy_id[add_order_short_form_message_at] = (add_order_short_form_message_base + 10 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = (add_order_short_form_message_base + 14 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.depth_side = (add_order_short_form_message_base + 22 + 1) % 256;
  add_order_short_form_message_record.depth_order_capacity = (add_order_short_form_message_base + 23 + 1) % 256;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = (add_order_short_form_message_base + 24 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = (add_order_short_form_message_base + 26 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.scope = (add_order_short_form_message_base + 28 + 1) % 256;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 3 -> add_order_short_form_message_record.reserved_3[add_order_short_form_message_at] = (add_order_short_form_message_base + 29 + add_order_short_form_message_at + 1) % 256; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message to the wire, 32 bytes from where the cursor stands */
inline encode_add_order_short_form_message(add_order_short_form_message_record) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.tracking_number[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> wire[at] = add_order_short_form_message_record.timestamp[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> wire[at] = add_order_short_form_message_record.strategy_id[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> wire[at] = add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_form_message_record.depth_side; at = at + 1;
  wire[at] = add_order_short_form_message_record.depth_order_capacity; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.price_short[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> wire[at] = add_order_short_form_message_record.volume_short[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_form_message_record.scope; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 3 -> wire[at] = add_order_short_form_message_record.reserved_3[add_order_short_form_message_at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Short Form Message off the wire, 32 bytes from where the cursor stands */
inline decode_add_order_short_form_message(add_order_short_form_message_record) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.tracking_number[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.timestamp[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> add_order_short_form_message_record.strategy_id[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> add_order_short_form_message_record.order_reference_number[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.depth_side = wire[at]; at = at + 1;
  add_order_short_form_message_record.depth_order_capacity = wire[at]; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.price_short[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> add_order_short_form_message_record.volume_short[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_record.scope = wire[at]; at = at + 1;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 3 -> add_order_short_form_message_record.reserved_3[add_order_short_form_message_at] = wire[at]; at = at + 1; add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Short Form Message is what was written, byte for byte */
inline equal_add_order_short_form_message(add_order_short_form_message_read, add_order_short_form_message_written) {
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.tracking_number[add_order_short_form_message_at] == add_order_short_form_message_written.tracking_number[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> assert(add_order_short_form_message_read.timestamp[add_order_short_form_message_at] == add_order_short_form_message_written.timestamp[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 4 -> assert(add_order_short_form_message_read.strategy_id[add_order_short_form_message_at] == add_order_short_form_message_written.strategy_id[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 8 -> assert(add_order_short_form_message_read.order_reference_number[add_order_short_form_message_at] == add_order_short_form_message_written.order_reference_number[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_form_message_read.depth_side == add_order_short_form_message_written.depth_side);
  assert(add_order_short_form_message_read.depth_order_capacity == add_order_short_form_message_written.depth_order_capacity);
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.price_short[add_order_short_form_message_at] == add_order_short_form_message_written.price_short[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 2 -> assert(add_order_short_form_message_read.volume_short[add_order_short_form_message_at] == add_order_short_form_message_written.volume_short[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_form_message_read.scope == add_order_short_form_message_written.scope);
  add_order_short_form_message_at = 0;
  do
  :: add_order_short_form_message_at < 3 -> assert(add_order_short_form_message_read.reserved_3[add_order_short_form_message_at] == add_order_short_form_message_written.reserved_3[add_order_short_form_message_at]); add_order_short_form_message_at = add_order_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Long Form Message: 36 bytes ----------------------------------- */

/* A Complex Add Order Message indicates that a new order has been accepted and was added to the displayable book. Long form. */
typedef AddOrderLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte depth_side;
  byte depth_order_capacity;
  byte price_long[4];
  byte volume_long[4];
  byte scope;
  byte reserved_3[3]
};

int add_order_long_form_message_at;

/* every byte of Add Order Long Form Message set to one value */
inline fill_add_order_long_form_message(add_order_long_form_message_record, add_order_long_form_message_value) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.strategy_id[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.depth_side = add_order_long_form_message_value;
  add_order_long_form_message_record.depth_order_capacity = add_order_long_form_message_value;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.scope = add_order_long_form_message_value;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 3 -> add_order_long_form_message_record.reserved_3[add_order_long_form_message_at] = add_order_long_form_message_value; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Add Order Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_form_message(add_order_long_form_message_record, add_order_long_form_message_base) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = (add_order_long_form_message_base + 0 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = (add_order_long_form_message_base + 2 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.strategy_id[add_order_long_form_message_at] = (add_order_long_form_message_base + 10 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = (add_order_long_form_message_base + 14 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.depth_side = (add_order_long_form_message_base + 22 + 1) % 256;
  add_order_long_form_message_record.depth_order_capacity = (add_order_long_form_message_base + 23 + 1) % 256;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = (add_order_long_form_message_base + 24 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = (add_order_long_form_message_base + 28 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.scope = (add_order_long_form_message_base + 32 + 1) % 256;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 3 -> add_order_long_form_message_record.reserved_3[add_order_long_form_message_at] = (add_order_long_form_message_base + 33 + add_order_long_form_message_at + 1) % 256; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message to the wire, 36 bytes from where the cursor stands */
inline encode_add_order_long_form_message(add_order_long_form_message_record) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> wire[at] = add_order_long_form_message_record.tracking_number[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> wire[at] = add_order_long_form_message_record.timestamp[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.strategy_id[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> wire[at] = add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_form_message_record.depth_side; at = at + 1;
  wire[at] = add_order_long_form_message_record.depth_order_capacity; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.price_long[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> wire[at] = add_order_long_form_message_record.volume_long[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_form_message_record.scope; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 3 -> wire[at] = add_order_long_form_message_record.reserved_3[add_order_long_form_message_at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Add Order Long Form Message off the wire, 36 bytes from where the cursor stands */
inline decode_add_order_long_form_message(add_order_long_form_message_record) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> add_order_long_form_message_record.tracking_number[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.timestamp[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.strategy_id[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> add_order_long_form_message_record.order_reference_number[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.depth_side = wire[at]; at = at + 1;
  add_order_long_form_message_record.depth_order_capacity = wire[at]; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.price_long[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> add_order_long_form_message_record.volume_long[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_record.scope = wire[at]; at = at + 1;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 3 -> add_order_long_form_message_record.reserved_3[add_order_long_form_message_at] = wire[at]; at = at + 1; add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Add Order Long Form Message is what was written, byte for byte */
inline equal_add_order_long_form_message(add_order_long_form_message_read, add_order_long_form_message_written) {
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 2 -> assert(add_order_long_form_message_read.tracking_number[add_order_long_form_message_at] == add_order_long_form_message_written.tracking_number[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> assert(add_order_long_form_message_read.timestamp[add_order_long_form_message_at] == add_order_long_form_message_written.timestamp[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.strategy_id[add_order_long_form_message_at] == add_order_long_form_message_written.strategy_id[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 8 -> assert(add_order_long_form_message_read.order_reference_number[add_order_long_form_message_at] == add_order_long_form_message_written.order_reference_number[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_form_message_read.depth_side == add_order_long_form_message_written.depth_side);
  assert(add_order_long_form_message_read.depth_order_capacity == add_order_long_form_message_written.depth_order_capacity);
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.price_long[add_order_long_form_message_at] == add_order_long_form_message_written.price_long[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 4 -> assert(add_order_long_form_message_read.volume_long[add_order_long_form_message_at] == add_order_long_form_message_written.volume_long[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_form_message_read.scope == add_order_long_form_message_written.scope);
  add_order_long_form_message_at = 0;
  do
  :: add_order_long_form_message_at < 3 -> assert(add_order_long_form_message_read.reserved_3[add_order_long_form_message_at] == add_order_long_form_message_written.reserved_3[add_order_long_form_message_at]); add_order_long_form_message_at = add_order_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed Message: 39 bytes ---------------------------------- */

/* This message is sent whenever a Side order is executed in whole or in part. */
typedef SingleSideExecutedMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte executed_volume[4];
  byte trade_condition;
  byte auction_id[4];
  byte cross_number[4];
  byte match_number[4]
};

int single_side_executed_message_at;

/* every byte of Single Side Executed Message set to one value */
inline fill_single_side_executed_message(single_side_executed_message_record, single_side_executed_message_value) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = single_side_executed_message_value;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = single_side_executed_message_value; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Executed Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_executed_message(single_side_executed_message_record, single_side_executed_message_base) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = (single_side_executed_message_base + 0 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = (single_side_executed_message_base + 2 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = (single_side_executed_message_base + 10 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = (single_side_executed_message_base + 14 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = (single_side_executed_message_base + 22 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = (single_side_executed_message_base + 26 + 1) % 256;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = (single_side_executed_message_base + 27 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = (single_side_executed_message_base + 31 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = (single_side_executed_message_base + 35 + single_side_executed_message_at + 1) % 256; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message to the wire, 39 bytes from where the cursor stands */
inline encode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> wire[at] = single_side_executed_message_record.tracking_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> wire[at] = single_side_executed_message_record.timestamp[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.strategy_id[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> wire[at] = single_side_executed_message_record.order_reference_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.executed_volume[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_executed_message_record.trade_condition; at = at + 1;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.auction_id[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.cross_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> wire[at] = single_side_executed_message_record.match_number[single_side_executed_message_at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed Message off the wire, 39 bytes from where the cursor stands */
inline decode_single_side_executed_message(single_side_executed_message_record) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> single_side_executed_message_record.tracking_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.timestamp[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.strategy_id[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> single_side_executed_message_record.order_reference_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.executed_volume[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_record.trade_condition = wire[at]; at = at + 1;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.auction_id[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.cross_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> single_side_executed_message_record.match_number[single_side_executed_message_at] = wire[at]; at = at + 1; single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Executed Message is what was written, byte for byte */
inline equal_single_side_executed_message(single_side_executed_message_read, single_side_executed_message_written) {
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 2 -> assert(single_side_executed_message_read.tracking_number[single_side_executed_message_at] == single_side_executed_message_written.tracking_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> assert(single_side_executed_message_read.timestamp[single_side_executed_message_at] == single_side_executed_message_written.timestamp[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.strategy_id[single_side_executed_message_at] == single_side_executed_message_written.strategy_id[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 8 -> assert(single_side_executed_message_read.order_reference_number[single_side_executed_message_at] == single_side_executed_message_written.order_reference_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.executed_volume[single_side_executed_message_at] == single_side_executed_message_written.executed_volume[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  assert(single_side_executed_message_read.trade_condition == single_side_executed_message_written.trade_condition);
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.auction_id[single_side_executed_message_at] == single_side_executed_message_written.auction_id[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.cross_number[single_side_executed_message_at] == single_side_executed_message_written.cross_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  single_side_executed_message_at = 0;
  do
  :: single_side_executed_message_at < 4 -> assert(single_side_executed_message_read.match_number[single_side_executed_message_at] == single_side_executed_message_written.match_number[single_side_executed_message_at]); single_side_executed_message_at = single_side_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Executed With Price Message: 44 bytes ----------------------- */

/* This message is sent whenever an incoming Side order is executed against the book in whole or in part at a price different from the initial display price. */
typedef SingleSideExecutedWithPriceMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte cross_number[4];
  byte match_number[4];
  byte reserved_1;
  byte price_long[4];
  byte volume_long[4];
  byte trade_condition;
  byte auction_id[4]
};

int single_side_executed_with_price_message_at;

/* every byte of Single Side Executed With Price Message set to one value */
inline fill_single_side_executed_with_price_message(single_side_executed_with_price_message_record, single_side_executed_with_price_message_value) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.reserved_1 = single_side_executed_with_price_message_value;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.trade_condition = single_side_executed_with_price_message_value;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = single_side_executed_with_price_message_value; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Executed With Price Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_executed_with_price_message(single_side_executed_with_price_message_record, single_side_executed_with_price_message_base) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 0 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 2 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 10 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 14 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 22 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 26 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.reserved_1 = (single_side_executed_with_price_message_base + 30 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 31 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 35 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.trade_condition = (single_side_executed_with_price_message_base + 39 + 1) % 256;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = (single_side_executed_with_price_message_base + 40 + single_side_executed_with_price_message_at + 1) % 256; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message to the wire, 44 bytes from where the cursor stands */
inline encode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> wire[at] = single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> wire[at] = single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> wire[at] = single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_executed_with_price_message_record.reserved_1; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_executed_with_price_message_record.trade_condition; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> wire[at] = single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Executed With Price Message off the wire, 44 bytes from where the cursor stands */
inline decode_single_side_executed_with_price_message(single_side_executed_with_price_message_record) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> single_side_executed_with_price_message_record.tracking_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.timestamp[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.strategy_id[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> single_side_executed_with_price_message_record.order_reference_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.cross_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.match_number[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.reserved_1 = wire[at]; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.price_long[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.volume_long[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_record.trade_condition = wire[at]; at = at + 1;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> single_side_executed_with_price_message_record.auction_id[single_side_executed_with_price_message_at] = wire[at]; at = at + 1; single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Executed With Price Message is what was written, byte for byte */
inline equal_single_side_executed_with_price_message(single_side_executed_with_price_message_read, single_side_executed_with_price_message_written) {
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 2 -> assert(single_side_executed_with_price_message_read.tracking_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.tracking_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> assert(single_side_executed_with_price_message_read.timestamp[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.timestamp[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.strategy_id[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.strategy_id[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 8 -> assert(single_side_executed_with_price_message_read.order_reference_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.order_reference_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.cross_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.cross_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.match_number[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.match_number[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(single_side_executed_with_price_message_read.reserved_1 == single_side_executed_with_price_message_written.reserved_1);
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.price_long[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.price_long[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.volume_long[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.volume_long[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  assert(single_side_executed_with_price_message_read.trade_condition == single_side_executed_with_price_message_written.trade_condition);
  single_side_executed_with_price_message_at = 0;
  do
  :: single_side_executed_with_price_message_at < 4 -> assert(single_side_executed_with_price_message_read.auction_id[single_side_executed_with_price_message_at] == single_side_executed_with_price_message_written.auction_id[single_side_executed_with_price_message_at]); single_side_executed_with_price_message_at = single_side_executed_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Short Form Message: 39 bytes ------------------------ */

/* This message is sent whenever an order on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. */
typedef SingleSideReplaceShortFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte original_order_reference_number[8];
  byte new_order_reference_number[8];
  byte price_short[2];
  byte volume_short[2];
  byte order_type;
  byte scope;
  byte reserved_3[3]
};

int single_side_replace_short_form_message_at;

/* every byte of Single Side Replace Short Form Message set to one value */
inline fill_single_side_replace_short_form_message(single_side_replace_short_form_message_record, single_side_replace_short_form_message_value) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.strategy_id[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.original_order_reference_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_order_reference_number[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_record.order_type = single_side_replace_short_form_message_value;
  single_side_replace_short_form_message_record.scope = single_side_replace_short_form_message_value;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 3 -> single_side_replace_short_form_message_record.reserved_3[single_side_replace_short_form_message_at] = single_side_replace_short_form_message_value; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Short Form Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_short_form_message(single_side_replace_short_form_message_record, single_side_replace_short_form_message_base) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 0 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 2 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.strategy_id[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 10 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.original_order_reference_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 14 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_order_reference_number[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 22 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 30 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 32 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_record.order_type = (single_side_replace_short_form_message_base + 34 + 1) % 256;
  single_side_replace_short_form_message_record.scope = (single_side_replace_short_form_message_base + 35 + 1) % 256;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 3 -> single_side_replace_short_form_message_record.reserved_3[single_side_replace_short_form_message_at] = (single_side_replace_short_form_message_base + 36 + single_side_replace_short_form_message_at + 1) % 256; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Form Message to the wire, 39 bytes from where the cursor stands */
inline encode_single_side_replace_short_form_message(single_side_replace_short_form_message_record) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> wire[at] = single_side_replace_short_form_message_record.strategy_id[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.original_order_reference_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> wire[at] = single_side_replace_short_form_message_record.new_order_reference_number[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> wire[at] = single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_replace_short_form_message_record.order_type; at = at + 1;
  wire[at] = single_side_replace_short_form_message_record.scope; at = at + 1;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 3 -> wire[at] = single_side_replace_short_form_message_record.reserved_3[single_side_replace_short_form_message_at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Short Form Message off the wire, 39 bytes from where the cursor stands */
inline decode_single_side_replace_short_form_message(single_side_replace_short_form_message_record) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.tracking_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.timestamp[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> single_side_replace_short_form_message_record.strategy_id[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.original_order_reference_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> single_side_replace_short_form_message_record.new_order_reference_number[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.price_short[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> single_side_replace_short_form_message_record.volume_short[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_record.order_type = wire[at]; at = at + 1;
  single_side_replace_short_form_message_record.scope = wire[at]; at = at + 1;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 3 -> single_side_replace_short_form_message_record.reserved_3[single_side_replace_short_form_message_at] = wire[at]; at = at + 1; single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Short Form Message is what was written, byte for byte */
inline equal_single_side_replace_short_form_message(single_side_replace_short_form_message_read, single_side_replace_short_form_message_written) {
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.tracking_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.tracking_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.timestamp[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.timestamp[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 4 -> assert(single_side_replace_short_form_message_read.strategy_id[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.strategy_id[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.original_order_reference_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.original_order_reference_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 8 -> assert(single_side_replace_short_form_message_read.new_order_reference_number[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.new_order_reference_number[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.price_short[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.price_short[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 2 -> assert(single_side_replace_short_form_message_read.volume_short[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.volume_short[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  assert(single_side_replace_short_form_message_read.order_type == single_side_replace_short_form_message_written.order_type);
  assert(single_side_replace_short_form_message_read.scope == single_side_replace_short_form_message_written.scope);
  single_side_replace_short_form_message_at = 0;
  do
  :: single_side_replace_short_form_message_at < 3 -> assert(single_side_replace_short_form_message_read.reserved_3[single_side_replace_short_form_message_at] == single_side_replace_short_form_message_written.reserved_3[single_side_replace_short_form_message_at]); single_side_replace_short_form_message_at = single_side_replace_short_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Replace Long Form Message: 43 bytes ------------------------- */

/* This message is sent whenever an order on the book is replaced. The replacement has a new sequence number and replaces the prior sequence number. Long form. */
typedef SingleSideReplaceLongFormMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte original_order_reference_number[8];
  byte new_order_reference_number[8];
  byte price_long[4];
  byte volume_long[4];
  byte order_type;
  byte scope;
  byte reserved_3[3]
};

int single_side_replace_long_form_message_at;

/* every byte of Single Side Replace Long Form Message set to one value */
inline fill_single_side_replace_long_form_message(single_side_replace_long_form_message_record, single_side_replace_long_form_message_value) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.strategy_id[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.original_order_reference_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_order_reference_number[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_record.order_type = single_side_replace_long_form_message_value;
  single_side_replace_long_form_message_record.scope = single_side_replace_long_form_message_value;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 3 -> single_side_replace_long_form_message_record.reserved_3[single_side_replace_long_form_message_at] = single_side_replace_long_form_message_value; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Replace Long Form Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_replace_long_form_message(single_side_replace_long_form_message_record, single_side_replace_long_form_message_base) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 0 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 2 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.strategy_id[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 10 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.original_order_reference_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 14 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_order_reference_number[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 22 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 30 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 34 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_record.order_type = (single_side_replace_long_form_message_base + 38 + 1) % 256;
  single_side_replace_long_form_message_record.scope = (single_side_replace_long_form_message_base + 39 + 1) % 256;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 3 -> single_side_replace_long_form_message_record.reserved_3[single_side_replace_long_form_message_at] = (single_side_replace_long_form_message_base + 40 + single_side_replace_long_form_message_at + 1) % 256; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Form Message to the wire, 43 bytes from where the cursor stands */
inline encode_single_side_replace_long_form_message(single_side_replace_long_form_message_record) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> wire[at] = single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.strategy_id[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.original_order_reference_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> wire[at] = single_side_replace_long_form_message_record.new_order_reference_number[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> wire[at] = single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_replace_long_form_message_record.order_type; at = at + 1;
  wire[at] = single_side_replace_long_form_message_record.scope; at = at + 1;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 3 -> wire[at] = single_side_replace_long_form_message_record.reserved_3[single_side_replace_long_form_message_at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Replace Long Form Message off the wire, 43 bytes from where the cursor stands */
inline decode_single_side_replace_long_form_message(single_side_replace_long_form_message_record) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> single_side_replace_long_form_message_record.tracking_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.timestamp[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.strategy_id[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.original_order_reference_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> single_side_replace_long_form_message_record.new_order_reference_number[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.price_long[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> single_side_replace_long_form_message_record.volume_long[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_record.order_type = wire[at]; at = at + 1;
  single_side_replace_long_form_message_record.scope = wire[at]; at = at + 1;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 3 -> single_side_replace_long_form_message_record.reserved_3[single_side_replace_long_form_message_at] = wire[at]; at = at + 1; single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Replace Long Form Message is what was written, byte for byte */
inline equal_single_side_replace_long_form_message(single_side_replace_long_form_message_read, single_side_replace_long_form_message_written) {
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 2 -> assert(single_side_replace_long_form_message_read.tracking_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.tracking_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.timestamp[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.timestamp[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.strategy_id[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.strategy_id[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.original_order_reference_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.original_order_reference_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 8 -> assert(single_side_replace_long_form_message_read.new_order_reference_number[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.new_order_reference_number[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.price_long[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.price_long[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 4 -> assert(single_side_replace_long_form_message_read.volume_long[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.volume_long[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  assert(single_side_replace_long_form_message_read.order_type == single_side_replace_long_form_message_written.order_type);
  assert(single_side_replace_long_form_message_read.scope == single_side_replace_long_form_message_written.scope);
  single_side_replace_long_form_message_at = 0;
  do
  :: single_side_replace_long_form_message_at < 3 -> assert(single_side_replace_long_form_message_read.reserved_3[single_side_replace_long_form_message_at] == single_side_replace_long_form_message_written.reserved_3[single_side_replace_long_form_message_at]); single_side_replace_long_form_message_at = single_side_replace_long_form_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Delete Message: 22 bytes ------------------------------------ */

/* The message is sent when an order is being cancelled. All remaining contracts are no longer accessible so the side should be removed from the book. */
typedef SingleSideDeleteMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id_order_reference[4];
  byte order_reference_number[8]
};

int single_side_delete_message_at;

/* every byte of Single Side Delete Message set to one value */
inline fill_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_value) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.strategy_id_order_reference[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = single_side_delete_message_value; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Delete Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_delete_message(single_side_delete_message_record, single_side_delete_message_base) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = (single_side_delete_message_base + 0 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = (single_side_delete_message_base + 2 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.strategy_id_order_reference[single_side_delete_message_at] = (single_side_delete_message_base + 10 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = (single_side_delete_message_base + 14 + single_side_delete_message_at + 1) % 256; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message to the wire, 22 bytes from where the cursor stands */
inline encode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> wire[at] = single_side_delete_message_record.tracking_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> wire[at] = single_side_delete_message_record.timestamp[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> wire[at] = single_side_delete_message_record.strategy_id_order_reference[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> wire[at] = single_side_delete_message_record.order_reference_number[single_side_delete_message_at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Delete Message off the wire, 22 bytes from where the cursor stands */
inline decode_single_side_delete_message(single_side_delete_message_record) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> single_side_delete_message_record.tracking_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.timestamp[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> single_side_delete_message_record.strategy_id_order_reference[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> single_side_delete_message_record.order_reference_number[single_side_delete_message_at] = wire[at]; at = at + 1; single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Delete Message is what was written, byte for byte */
inline equal_single_side_delete_message(single_side_delete_message_read, single_side_delete_message_written) {
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 2 -> assert(single_side_delete_message_read.tracking_number[single_side_delete_message_at] == single_side_delete_message_written.tracking_number[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> assert(single_side_delete_message_read.timestamp[single_side_delete_message_at] == single_side_delete_message_written.timestamp[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 4 -> assert(single_side_delete_message_read.strategy_id_order_reference[single_side_delete_message_at] == single_side_delete_message_written.strategy_id_order_reference[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  single_side_delete_message_at = 0;
  do
  :: single_side_delete_message_at < 8 -> assert(single_side_delete_message_read.order_reference_number[single_side_delete_message_at] == single_side_delete_message_written.order_reference_number[single_side_delete_message_at]); single_side_delete_message_at = single_side_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Update Message: 32 bytes ------------------------------------ */

/* This message is sent whenever an order is being updated for price and (or) contracts. The reference number associated with the order is unchanged. */
typedef SingleSideUpdateMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte order_reference_number[8];
  byte change_reason;
  byte price_long[4];
  byte volume_long[4];
  byte order_type
};

int single_side_update_message_at;

/* every byte of Single Side Update Message set to one value */
inline fill_single_side_update_message(single_side_update_message_record, single_side_update_message_value) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.strategy_id[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = single_side_update_message_value;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = single_side_update_message_value; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.order_type = single_side_update_message_value;
  skip
}

/* each byte of Single Side Update Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_message(single_side_update_message_record, single_side_update_message_base) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = (single_side_update_message_base + 0 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = (single_side_update_message_base + 2 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.strategy_id[single_side_update_message_at] = (single_side_update_message_base + 10 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = (single_side_update_message_base + 14 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = (single_side_update_message_base + 22 + 1) % 256;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = (single_side_update_message_base + 23 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = (single_side_update_message_base + 27 + single_side_update_message_at + 1) % 256; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.order_type = (single_side_update_message_base + 31 + 1) % 256;
  skip
}

/* Single Side Update Message to the wire, 32 bytes from where the cursor stands */
inline encode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> wire[at] = single_side_update_message_record.tracking_number[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.timestamp[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.strategy_id[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> wire[at] = single_side_update_message_record.order_reference_number[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.change_reason; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.price_long[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> wire[at] = single_side_update_message_record.volume_long[single_side_update_message_at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_message_record.order_type; at = at + 1;
  skip
}

/* Single Side Update Message off the wire, 32 bytes from where the cursor stands */
inline decode_single_side_update_message(single_side_update_message_record) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> single_side_update_message_record.tracking_number[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.timestamp[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.strategy_id[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> single_side_update_message_record.order_reference_number[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.change_reason = wire[at]; at = at + 1;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.price_long[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> single_side_update_message_record.volume_long[single_side_update_message_at] = wire[at]; at = at + 1; single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_record.order_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Single Side Update Message is what was written, byte for byte */
inline equal_single_side_update_message(single_side_update_message_read, single_side_update_message_written) {
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 2 -> assert(single_side_update_message_read.tracking_number[single_side_update_message_at] == single_side_update_message_written.tracking_number[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.timestamp[single_side_update_message_at] == single_side_update_message_written.timestamp[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.strategy_id[single_side_update_message_at] == single_side_update_message_written.strategy_id[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 8 -> assert(single_side_update_message_read.order_reference_number[single_side_update_message_at] == single_side_update_message_written.order_reference_number[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.change_reason == single_side_update_message_written.change_reason);
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.price_long[single_side_update_message_at] == single_side_update_message_written.price_long[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  single_side_update_message_at = 0;
  do
  :: single_side_update_message_at < 4 -> assert(single_side_update_message_read.volume_long[single_side_update_message_at] == single_side_update_message_written.volume_long[single_side_update_message_at]); single_side_update_message_at = single_side_update_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_message_read.order_type == single_side_update_message_written.order_type);
  skip
}

/* ---- Complex Strategy Trade Message: 58 bytes -------------------------------- */

/* This Options Trade Message is designed to provide execution details for normal match events involving non-display able order types. */
typedef ComplexStrategyTradeMessage {
  byte tracking_number[2];
  byte timestamp[8];
  byte strategy_id[4];
  byte cross_number[4];
  byte match_number[4];
  byte reserved_4[4];
  byte cross_type;
  byte price_long[4];
  byte volume_long[4];
  byte trade_condition;
  byte auction_id[4];
  byte reserved_1;
  byte trade_type;
  byte reserved_16[16]
};

int complex_strategy_trade_message_at;

/* every byte of Complex Strategy Trade Message set to one value */
inline fill_complex_strategy_trade_message(complex_strategy_trade_message_record, complex_strategy_trade_message_value) {
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 2 -> complex_strategy_trade_message_record.tracking_number[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 8 -> complex_strategy_trade_message_record.timestamp[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.strategy_id[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.cross_number[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.match_number[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.reserved_4[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.cross_type = complex_strategy_trade_message_value;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.price_long[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.volume_long[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.trade_condition = complex_strategy_trade_message_value;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.auction_id[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.reserved_1 = complex_strategy_trade_message_value;
  complex_strategy_trade_message_record.trade_type = complex_strategy_trade_message_value;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 16 -> complex_strategy_trade_message_record.reserved_16[complex_strategy_trade_message_at] = complex_strategy_trade_message_value; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Complex Strategy Trade Message set to where it lies, so a field read out of place says so */
inline ramp_complex_strategy_trade_message(complex_strategy_trade_message_record, complex_strategy_trade_message_base) {
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 2 -> complex_strategy_trade_message_record.tracking_number[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 0 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 8 -> complex_strategy_trade_message_record.timestamp[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 2 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.strategy_id[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 10 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.cross_number[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 14 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.match_number[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 18 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.reserved_4[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 22 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.cross_type = (complex_strategy_trade_message_base + 26 + 1) % 256;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.price_long[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 27 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.volume_long[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 31 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.trade_condition = (complex_strategy_trade_message_base + 35 + 1) % 256;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.auction_id[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 36 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.reserved_1 = (complex_strategy_trade_message_base + 40 + 1) % 256;
  complex_strategy_trade_message_record.trade_type = (complex_strategy_trade_message_base + 41 + 1) % 256;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 16 -> complex_strategy_trade_message_record.reserved_16[complex_strategy_trade_message_at] = (complex_strategy_trade_message_base + 42 + complex_strategy_trade_message_at + 1) % 256; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Strategy Trade Message to the wire, 58 bytes from where the cursor stands */
inline encode_complex_strategy_trade_message(complex_strategy_trade_message_record) {
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 2 -> wire[at] = complex_strategy_trade_message_record.tracking_number[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 8 -> wire[at] = complex_strategy_trade_message_record.timestamp[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.strategy_id[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.cross_number[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.match_number[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.reserved_4[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_strategy_trade_message_record.cross_type; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.price_long[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.volume_long[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_strategy_trade_message_record.trade_condition; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> wire[at] = complex_strategy_trade_message_record.auction_id[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = complex_strategy_trade_message_record.reserved_1; at = at + 1;
  wire[at] = complex_strategy_trade_message_record.trade_type; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 16 -> wire[at] = complex_strategy_trade_message_record.reserved_16[complex_strategy_trade_message_at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Complex Strategy Trade Message off the wire, 58 bytes from where the cursor stands */
inline decode_complex_strategy_trade_message(complex_strategy_trade_message_record) {
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 2 -> complex_strategy_trade_message_record.tracking_number[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 8 -> complex_strategy_trade_message_record.timestamp[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.strategy_id[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.cross_number[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.match_number[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.reserved_4[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.cross_type = wire[at]; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.price_long[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.volume_long[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.trade_condition = wire[at]; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> complex_strategy_trade_message_record.auction_id[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_record.reserved_1 = wire[at]; at = at + 1;
  complex_strategy_trade_message_record.trade_type = wire[at]; at = at + 1;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 16 -> complex_strategy_trade_message_record.reserved_16[complex_strategy_trade_message_at] = wire[at]; at = at + 1; complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Complex Strategy Trade Message is what was written, byte for byte */
inline equal_complex_strategy_trade_message(complex_strategy_trade_message_read, complex_strategy_trade_message_written) {
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 2 -> assert(complex_strategy_trade_message_read.tracking_number[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.tracking_number[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 8 -> assert(complex_strategy_trade_message_read.timestamp[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.timestamp[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.strategy_id[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.strategy_id[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.cross_number[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.cross_number[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.match_number[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.match_number[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.reserved_4[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.reserved_4[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  assert(complex_strategy_trade_message_read.cross_type == complex_strategy_trade_message_written.cross_type);
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.price_long[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.price_long[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.volume_long[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.volume_long[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  assert(complex_strategy_trade_message_read.trade_condition == complex_strategy_trade_message_written.trade_condition);
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 4 -> assert(complex_strategy_trade_message_read.auction_id[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.auction_id[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
  assert(complex_strategy_trade_message_read.reserved_1 == complex_strategy_trade_message_written.reserved_1);
  assert(complex_strategy_trade_message_read.trade_type == complex_strategy_trade_message_written.trade_type);
  complex_strategy_trade_message_at = 0;
  do
  :: complex_strategy_trade_message_at < 16 -> assert(complex_strategy_trade_message_read.reserved_16[complex_strategy_trade_message_at] == complex_strategy_trade_message_written.reserved_16[complex_strategy_trade_message_at]); complex_strategy_trade_message_at = complex_strategy_trade_message_at + 1
  :: else -> break
  od;
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

/* Add Order Short Form Message: encoded, read back, and compared */
proctype check_add_order_short_form_message() {
  AddOrderShortFormMessage add_order_short_form_message_sent;
  AddOrderShortFormMessage add_order_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_form_message(add_order_short_form_message_sent, 255)
  :: else -> ramp_add_order_short_form_message(add_order_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_form_message(add_order_short_form_message_sent);
    assert(at == 32);
    at = 0;
    decode_add_order_short_form_message(add_order_short_form_message_got);
    assert(at == 32);
    equal_add_order_short_form_message(add_order_short_form_message_got, add_order_short_form_message_sent)
  }
}

/* Add Order Long Form Message: encoded, read back, and compared */
proctype check_add_order_long_form_message() {
  AddOrderLongFormMessage add_order_long_form_message_sent;
  AddOrderLongFormMessage add_order_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_form_message(add_order_long_form_message_sent, 255)
  :: else -> ramp_add_order_long_form_message(add_order_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_form_message(add_order_long_form_message_sent);
    assert(at == 36);
    at = 0;
    decode_add_order_long_form_message(add_order_long_form_message_got);
    assert(at == 36);
    equal_add_order_long_form_message(add_order_long_form_message_got, add_order_long_form_message_sent)
  }
}

/* Single Side Executed Message: encoded, read back, and compared */
proctype check_single_side_executed_message() {
  SingleSideExecutedMessage single_side_executed_message_sent;
  SingleSideExecutedMessage single_side_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_executed_message(single_side_executed_message_sent, 0)
  :: pattern == 1 -> fill_single_side_executed_message(single_side_executed_message_sent, 32)
  :: pattern == 2 -> fill_single_side_executed_message(single_side_executed_message_sent, 255)
  :: else -> ramp_single_side_executed_message(single_side_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_executed_message(single_side_executed_message_sent);
    assert(at == 39);
    at = 0;
    decode_single_side_executed_message(single_side_executed_message_got);
    assert(at == 39);
    equal_single_side_executed_message(single_side_executed_message_got, single_side_executed_message_sent)
  }
}

/* Single Side Executed With Price Message: encoded, read back, and compared */
proctype check_single_side_executed_with_price_message() {
  SingleSideExecutedWithPriceMessage single_side_executed_with_price_message_sent;
  SingleSideExecutedWithPriceMessage single_side_executed_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 0)
  :: pattern == 1 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 32)
  :: pattern == 2 -> fill_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 255)
  :: else -> ramp_single_side_executed_with_price_message(single_side_executed_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_executed_with_price_message(single_side_executed_with_price_message_sent);
    assert(at == 44);
    at = 0;
    decode_single_side_executed_with_price_message(single_side_executed_with_price_message_got);
    assert(at == 44);
    equal_single_side_executed_with_price_message(single_side_executed_with_price_message_got, single_side_executed_with_price_message_sent)
  }
}

/* Single Side Replace Short Form Message: encoded, read back, and compared */
proctype check_single_side_replace_short_form_message() {
  SingleSideReplaceShortFormMessage single_side_replace_short_form_message_sent;
  SingleSideReplaceShortFormMessage single_side_replace_short_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 255)
  :: else -> ramp_single_side_replace_short_form_message(single_side_replace_short_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_short_form_message(single_side_replace_short_form_message_sent);
    assert(at == 39);
    at = 0;
    decode_single_side_replace_short_form_message(single_side_replace_short_form_message_got);
    assert(at == 39);
    equal_single_side_replace_short_form_message(single_side_replace_short_form_message_got, single_side_replace_short_form_message_sent)
  }
}

/* Single Side Replace Long Form Message: encoded, read back, and compared */
proctype check_single_side_replace_long_form_message() {
  SingleSideReplaceLongFormMessage single_side_replace_long_form_message_sent;
  SingleSideReplaceLongFormMessage single_side_replace_long_form_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 0)
  :: pattern == 1 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 32)
  :: pattern == 2 -> fill_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 255)
  :: else -> ramp_single_side_replace_long_form_message(single_side_replace_long_form_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_replace_long_form_message(single_side_replace_long_form_message_sent);
    assert(at == 43);
    at = 0;
    decode_single_side_replace_long_form_message(single_side_replace_long_form_message_got);
    assert(at == 43);
    equal_single_side_replace_long_form_message(single_side_replace_long_form_message_got, single_side_replace_long_form_message_sent)
  }
}

/* Single Side Delete Message: encoded, read back, and compared */
proctype check_single_side_delete_message() {
  SingleSideDeleteMessage single_side_delete_message_sent;
  SingleSideDeleteMessage single_side_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_delete_message(single_side_delete_message_sent, 0)
  :: pattern == 1 -> fill_single_side_delete_message(single_side_delete_message_sent, 32)
  :: pattern == 2 -> fill_single_side_delete_message(single_side_delete_message_sent, 255)
  :: else -> ramp_single_side_delete_message(single_side_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_delete_message(single_side_delete_message_sent);
    assert(at == 22);
    at = 0;
    decode_single_side_delete_message(single_side_delete_message_got);
    assert(at == 22);
    equal_single_side_delete_message(single_side_delete_message_got, single_side_delete_message_sent)
  }
}

/* Single Side Update Message: encoded, read back, and compared */
proctype check_single_side_update_message() {
  SingleSideUpdateMessage single_side_update_message_sent;
  SingleSideUpdateMessage single_side_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_message(single_side_update_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_message(single_side_update_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_message(single_side_update_message_sent, 255)
  :: else -> ramp_single_side_update_message(single_side_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_message(single_side_update_message_sent);
    assert(at == 32);
    at = 0;
    decode_single_side_update_message(single_side_update_message_got);
    assert(at == 32);
    equal_single_side_update_message(single_side_update_message_got, single_side_update_message_sent)
  }
}

/* Complex Strategy Trade Message: encoded, read back, and compared */
proctype check_complex_strategy_trade_message() {
  ComplexStrategyTradeMessage complex_strategy_trade_message_sent;
  ComplexStrategyTradeMessage complex_strategy_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_complex_strategy_trade_message(complex_strategy_trade_message_sent, 0)
  :: pattern == 1 -> fill_complex_strategy_trade_message(complex_strategy_trade_message_sent, 32)
  :: pattern == 2 -> fill_complex_strategy_trade_message(complex_strategy_trade_message_sent, 255)
  :: else -> ramp_complex_strategy_trade_message(complex_strategy_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_complex_strategy_trade_message(complex_strategy_trade_message_sent);
    assert(at == 58);
    at = 0;
    decode_complex_strategy_trade_message(complex_strategy_trade_message_got);
    assert(at == 58);
    equal_complex_strategy_trade_message(complex_strategy_trade_message_got, complex_strategy_trade_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_strategy_trading_action_message()
  :: run check_add_order_short_form_message()
  :: run check_add_order_long_form_message()
  :: run check_single_side_executed_message()
  :: run check_single_side_executed_with_price_message()
  :: run check_single_side_replace_short_form_message()
  :: run check_single_side_replace_long_form_message()
  :: run check_single_side_delete_message()
  :: run check_single_side_update_message()
  :: run check_complex_strategy_trade_message()
  fi
}
