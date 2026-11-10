/*
 * Chicago Board Options Exchange Multicast Top
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
 *   - a run filling what frames it
 *   - a field read in bits
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

/* ---- Packet Header: 8 bytes -------------------------------------------------- */

typedef PacketHeader {
  byte length[2];
  byte message_count;
  byte unit;
  byte sequence[4]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = packet_header_value;
  packet_header_record.unit = packet_header_value;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = (packet_header_base + 2 + 1) % 256;
  packet_header_record.unit = (packet_header_base + 3 + 1) % 256;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = (packet_header_base + 4 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 8 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.length[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  wire[at] = packet_header_record.message_count; at = at + 1;
  wire[at] = packet_header_record.unit; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 8 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.length[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_record.message_count = wire[at]; at = at + 1;
  packet_header_record.unit = wire[at]; at = at + 1;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.length[packet_header_at] == packet_header_written.length[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  assert(packet_header_read.message_count == packet_header_written.message_count);
  assert(packet_header_read.unit == packet_header_written.unit);
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence[packet_header_at] == packet_header_written.sequence[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 2 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte message_length;
  byte message_type
};

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_record.message_length = message_header_value;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_record.message_length = (message_header_base + 0 + 1) % 256;
  message_header_record.message_type = (message_header_base + 1 + 1) % 256;
  skip
}

/* Message Header to the wire, 2 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  wire[at] = message_header_record.message_length; at = at + 1;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 2 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_record.message_length = wire[at]; at = at + 1;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  assert(message_header_read.message_length == message_header_written.message_length);
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Time Reference Message: 16 bytes ---------------------------------------- */

/* C1 Options Only. The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Time messages for the same unit will use the last Midnight Reference until another Time Reference message is received for that unit. The Time Reference message includes the Trade Date, so most other sequenced messages will not include that information. Time Reference messages will be included in a spin response. */
typedef TimeReferenceMessage {
  byte midnight_reference[4];
  byte time[4];
  byte time_offset[4];
  byte trade_date[4]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_time_reference_message(time_reference_message_record, time_reference_message_base) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = (time_reference_message_base + 8 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = (time_reference_message_base + 12 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 16 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.midnight_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_offset[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.trade_date[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message off the wire, 16 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.midnight_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.time_offset[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> time_reference_message_record.trade_date[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Reference Message is what was written, byte for byte */
inline equal_time_reference_message(time_reference_message_read, time_reference_message_written) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.midnight_reference[time_reference_message_at] == time_reference_message_written.midnight_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time[time_reference_message_at] == time_reference_message_written.time[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_offset[time_reference_message_at] == time_reference_message_written.time_offset[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.trade_date[time_reference_message_at] == time_reference_message_written.trade_date[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time Message: 8 bytes --------------------------------------------------- */

/* A Time message is immediately generated and sent when there is a Top event for a given clock second. If there is no Top event for a given clock second, then no Time message is sent for that second. All subsequent time offset fields for the same unit will use the new Time value as the base until another Time message is received for the same unit. The Time field is the number of seconds relative to midnight Eastern Time, which is provided in the Time Reference message. On C1 only, the Time message will also include the Epoch Time field, which is the current time represented as the number of whole seconds since the Epoch (midnight January 1, 1970). */
typedef TimeMessage {
  byte time[4];
  byte epoch_time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = time_message_value; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Message set to where it lies, so a field read out of place says so */
inline ramp_time_message(time_message_record, time_message_base) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = (time_message_base + 4 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message to the wire, 8 bytes from where the cursor stands */
inline encode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> wire[at] = time_message_record.epoch_time[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Message off the wire, 8 bytes from where the cursor stands */
inline decode_time_message(time_message_record) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.epoch_time[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Message is what was written, byte for byte */
inline equal_time_message(time_message_read, time_message_written) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.time[time_message_at] == time_message_written.time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  time_message_at = 0;
  do
  :: time_message_at < 4 -> assert(time_message_read.epoch_time[time_message_at] == time_message_written.epoch_time[time_message_at]); time_message_at = time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Unit Clear Message: 4 bytes --------------------------------------------- */

/* The Unit Clear message instructs feed recipients to clear all market snapshots for the book in the unit specified in the Sequenced Unit Header. This message will be sent at startup each day. It would also be distributed in certain recovery events such as a data center fail-over. */
typedef UnitClearMessage {
  byte time_offset[4]
};

int unit_clear_message_at;

/* every byte of Unit Clear Message set to one value */
inline fill_unit_clear_message(unit_clear_message_record, unit_clear_message_value) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = unit_clear_message_value; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Unit Clear Message set to where it lies, so a field read out of place says so */
inline ramp_unit_clear_message(unit_clear_message_record, unit_clear_message_base) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = (unit_clear_message_base + 0 + unit_clear_message_at + 1) % 256; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message to the wire, 4 bytes from where the cursor stands */
inline encode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> wire[at] = unit_clear_message_record.time_offset[unit_clear_message_at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Unit Clear Message off the wire, 4 bytes from where the cursor stands */
inline decode_unit_clear_message(unit_clear_message_record) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> unit_clear_message_record.time_offset[unit_clear_message_at] = wire[at]; at = at + 1; unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Unit Clear Message is what was written, byte for byte */
inline equal_unit_clear_message(unit_clear_message_read, unit_clear_message_written) {
  unit_clear_message_at = 0;
  do
  :: unit_clear_message_at < 4 -> assert(unit_clear_message_read.time_offset[unit_clear_message_at] == unit_clear_message_written.time_offset[unit_clear_message_at]); unit_clear_message_at = unit_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Mapping Message: 36 bytes ---------------------------------------- */

/* A Symbol Mapping message is sent as an unsequenced message. One unsequenced Symbol Mapping message for each Symbol is sent in a continuous loop as bandwidth allows. */
typedef SymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8]
};

int symbol_mapping_message_at;

/* every byte of Symbol Mapping Message set to one value */
inline fill_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_value) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = symbol_mapping_message_value;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = symbol_mapping_message_value; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_mapping_message(symbol_mapping_message_record, symbol_mapping_message_base) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = (symbol_mapping_message_base + 0 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = (symbol_mapping_message_base + 6 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = (symbol_mapping_message_base + 27 + 1) % 256;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = (symbol_mapping_message_base + 28 + symbol_mapping_message_at + 1) % 256; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Message to the wire, 36 bytes from where the cursor stands */
inline encode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> wire[at] = symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> wire[at] = symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_message_record.symbol_condition; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> wire[at] = symbol_mapping_message_record.underlying[symbol_mapping_message_at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Message off the wire, 36 bytes from where the cursor stands */
inline decode_symbol_mapping_message(symbol_mapping_message_record) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> symbol_mapping_message_record.feed_symbol[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> symbol_mapping_message_record.osi_symbol[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> symbol_mapping_message_record.underlying[symbol_mapping_message_at] = wire[at]; at = at + 1; symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Mapping Message is what was written, byte for byte */
inline equal_symbol_mapping_message(symbol_mapping_message_read, symbol_mapping_message_written) {
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 6 -> assert(symbol_mapping_message_read.feed_symbol[symbol_mapping_message_at] == symbol_mapping_message_written.feed_symbol[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 21 -> assert(symbol_mapping_message_read.osi_symbol[symbol_mapping_message_at] == symbol_mapping_message_written.osi_symbol[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_message_read.symbol_condition == symbol_mapping_message_written.symbol_condition);
  symbol_mapping_message_at = 0;
  do
  :: symbol_mapping_message_at < 8 -> assert(symbol_mapping_message_read.underlying[symbol_mapping_message_at] == symbol_mapping_message_written.underlying[symbol_mapping_message_at]); symbol_mapping_message_at = symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Trade Message: 35 bytes --------------------------------------------- */

/* The Top Trade message provides information about executions of orders on the book. Top Trade messages are necessary to calculate execution-based data. Top Trade messages do not alter the book. One or more Single Side Update Expanded or Two Side Update Expanded messages will follow a Top Trade message to reflect the updated book. The Top Trade message sends the trade price, trade quantity, execution id, and trade condition of a trade as well as the cumulative volume for the trading session. The Trade Condition value of X (Trade Break) is sent whenever an execution is broken. Trade breaks will contain the Symbol, Quantity, Price, and Execution Id of the original trade. */
typedef TopTradeMessage {
  byte time_offset[4];
  byte symbol[6];
  byte quantity_long[4];
  byte price_long[8];
  byte execution_id[8];
  byte total_volume[4];
  byte trade_condition
};

int top_trade_message_at;

/* every byte of Top Trade Message set to one value */
inline fill_top_trade_message(top_trade_message_record, top_trade_message_value) {
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.time_offset[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 6 -> top_trade_message_record.symbol[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.quantity_long[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.price_long[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.execution_id[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.total_volume[top_trade_message_at] = top_trade_message_value; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_record.trade_condition = top_trade_message_value;
  skip
}

/* each byte of Top Trade Message set to where it lies, so a field read out of place says so */
inline ramp_top_trade_message(top_trade_message_record, top_trade_message_base) {
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.time_offset[top_trade_message_at] = (top_trade_message_base + 0 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 6 -> top_trade_message_record.symbol[top_trade_message_at] = (top_trade_message_base + 4 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.quantity_long[top_trade_message_at] = (top_trade_message_base + 10 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.price_long[top_trade_message_at] = (top_trade_message_base + 14 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.execution_id[top_trade_message_at] = (top_trade_message_base + 22 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.total_volume[top_trade_message_at] = (top_trade_message_base + 30 + top_trade_message_at + 1) % 256; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_record.trade_condition = (top_trade_message_base + 34 + 1) % 256;
  skip
}

/* Top Trade Message to the wire, 35 bytes from where the cursor stands */
inline encode_top_trade_message(top_trade_message_record) {
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> wire[at] = top_trade_message_record.time_offset[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 6 -> wire[at] = top_trade_message_record.symbol[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> wire[at] = top_trade_message_record.quantity_long[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> wire[at] = top_trade_message_record.price_long[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> wire[at] = top_trade_message_record.execution_id[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> wire[at] = top_trade_message_record.total_volume[top_trade_message_at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = top_trade_message_record.trade_condition; at = at + 1;
  skip
}

/* Top Trade Message off the wire, 35 bytes from where the cursor stands */
inline decode_top_trade_message(top_trade_message_record) {
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.time_offset[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 6 -> top_trade_message_record.symbol[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.quantity_long[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.price_long[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> top_trade_message_record.execution_id[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> top_trade_message_record.total_volume[top_trade_message_at] = wire[at]; at = at + 1; top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_record.trade_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Trade Message is what was written, byte for byte */
inline equal_top_trade_message(top_trade_message_read, top_trade_message_written) {
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> assert(top_trade_message_read.time_offset[top_trade_message_at] == top_trade_message_written.time_offset[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 6 -> assert(top_trade_message_read.symbol[top_trade_message_at] == top_trade_message_written.symbol[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> assert(top_trade_message_read.quantity_long[top_trade_message_at] == top_trade_message_written.quantity_long[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> assert(top_trade_message_read.price_long[top_trade_message_at] == top_trade_message_written.price_long[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 8 -> assert(top_trade_message_read.execution_id[top_trade_message_at] == top_trade_message_written.execution_id[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  top_trade_message_at = 0;
  do
  :: top_trade_message_at < 4 -> assert(top_trade_message_read.total_volume[top_trade_message_at] == top_trade_message_written.total_volume[top_trade_message_at]); top_trade_message_at = top_trade_message_at + 1
  :: else -> break
  od;
  assert(top_trade_message_read.trade_condition == top_trade_message_written.trade_condition);
  skip
}

/* ---- Options Auction Update Message: 62 bytes -------------------------------- */

/* Options Auction Update messages are used to disseminate price and size information and Composite Market bid and offer prices during Opening and Re-Opening (halt) auctions. The Auction Update messages are sent every five seconds during an opening period. */
typedef OptionsAuctionUpdateMessage {
  byte time_offset[4];
  byte expanded_symbol[8];
  byte auction_type;
  byte reference_price[8];
  byte buy_contracts[4];
  byte sell_contracts[4];
  byte indicative_price[8];
  byte auction_only_price[8];
  byte opening_condition;
  byte composite_market_bid_price[8];
  byte composite_market_offer_price[8]
};

int options_auction_update_message_at;

/* every byte of Options Auction Update Message set to one value */
inline fill_options_auction_update_message(options_auction_update_message_record, options_auction_update_message_value) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = options_auction_update_message_value;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = options_auction_update_message_value;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = options_auction_update_message_value; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Options Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_options_auction_update_message(options_auction_update_message_record, options_auction_update_message_base) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = (options_auction_update_message_base + 0 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = (options_auction_update_message_base + 4 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = (options_auction_update_message_base + 12 + 1) % 256;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = (options_auction_update_message_base + 13 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = (options_auction_update_message_base + 21 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = (options_auction_update_message_base + 25 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = (options_auction_update_message_base + 29 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = (options_auction_update_message_base + 37 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = (options_auction_update_message_base + 45 + 1) % 256;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = (options_auction_update_message_base + 46 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = (options_auction_update_message_base + 54 + options_auction_update_message_at + 1) % 256; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Update Message to the wire, 62 bytes from where the cursor stands */
inline encode_options_auction_update_message(options_auction_update_message_record) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.time_offset[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.expanded_symbol[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_update_message_record.auction_type; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.reference_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.buy_contracts[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> wire[at] = options_auction_update_message_record.sell_contracts[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.indicative_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.auction_only_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = options_auction_update_message_record.opening_condition; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> wire[at] = options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Options Auction Update Message off the wire, 62 bytes from where the cursor stands */
inline decode_options_auction_update_message(options_auction_update_message_record) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.time_offset[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.expanded_symbol[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.reference_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.buy_contracts[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> options_auction_update_message_record.sell_contracts[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.indicative_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.auction_only_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_record.opening_condition = wire[at]; at = at + 1;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_bid_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> options_auction_update_message_record.composite_market_offer_price[options_auction_update_message_at] = wire[at]; at = at + 1; options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Options Auction Update Message is what was written, byte for byte */
inline equal_options_auction_update_message(options_auction_update_message_read, options_auction_update_message_written) {
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.time_offset[options_auction_update_message_at] == options_auction_update_message_written.time_offset[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.expanded_symbol[options_auction_update_message_at] == options_auction_update_message_written.expanded_symbol[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_update_message_read.auction_type == options_auction_update_message_written.auction_type);
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.reference_price[options_auction_update_message_at] == options_auction_update_message_written.reference_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.buy_contracts[options_auction_update_message_at] == options_auction_update_message_written.buy_contracts[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 4 -> assert(options_auction_update_message_read.sell_contracts[options_auction_update_message_at] == options_auction_update_message_written.sell_contracts[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.indicative_price[options_auction_update_message_at] == options_auction_update_message_written.indicative_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.auction_only_price[options_auction_update_message_at] == options_auction_update_message_written.auction_only_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  assert(options_auction_update_message_read.opening_condition == options_auction_update_message_written.opening_condition);
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.composite_market_bid_price[options_auction_update_message_at] == options_auction_update_message_written.composite_market_bid_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  options_auction_update_message_at = 0;
  do
  :: options_auction_update_message_at < 8 -> assert(options_auction_update_message_read.composite_market_offer_price[options_auction_update_message_at] == options_auction_update_message_written.composite_market_offer_price[options_auction_update_message_at]); options_auction_update_message_at = options_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Summary Message: 25 bytes --------------------------------------- */

/* Auction Summary messages are used to disseminate the results of an auction. An Opening or Re-Opening Auction Summary message for each symbol is sent at the conclusion of its Opening or Re-Opening auction and represents the Cboe opening price. */
typedef AuctionSummaryMessage {
  byte time_offset[4];
  byte symbol_id[8];
  byte auction_type;
  byte price_long[8];
  byte quantity_long[4]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_id[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_id[auction_summary_message_at] = (auction_summary_message_base + 4 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 12 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = (auction_summary_message_base + 13 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity_long[auction_summary_message_at] = (auction_summary_message_base + 21 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 25 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.time_offset[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.symbol_id[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.price_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> wire[at] = auction_summary_message_record.quantity_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 25 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.time_offset[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_id[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.price_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> auction_summary_message_record.quantity_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.time_offset[auction_summary_message_at] == auction_summary_message_written.time_offset[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.symbol_id[auction_summary_message_at] == auction_summary_message_written.symbol_id[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.price_long[auction_summary_message_at] == auction_summary_message_written.price_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 4 -> assert(auction_summary_message_read.quantity_long[auction_summary_message_at] == auction_summary_message_written.quantity_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of an options contract. A Trading Status message will be sent whenever a security's trading status changes. The Trading Status field will be used to represent the status of the RTH (9:30 a.m. ET - 4:15 p.m. ET) and Curb sessions. The GTH Trading Status field will be used to represent the status of series that trade during the GTH session. The GTH session runs from 8:15 p.m. to 9:25 a.m. ET for GTH-eligible Products (C1 only). */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_1;
  byte gth_trading_status;
  byte second_reserved_1
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  trading_status_message_record.gth_trading_status = trading_status_message_value;
  trading_status_message_record.second_reserved_1 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 4 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = (trading_status_message_base + 10 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = (trading_status_message_base + 12 + 1) % 256;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 13 + 1) % 256;
  trading_status_message_record.gth_trading_status = (trading_status_message_base + 14 + 1) % 256;
  trading_status_message_record.second_reserved_1 = (trading_status_message_base + 15 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.time_offset[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> wire[at] = trading_status_message_record.reserved_2[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = trading_status_message_record.gth_trading_status; at = at + 1;
  wire[at] = trading_status_message_record.second_reserved_1; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.time_offset[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> trading_status_message_record.reserved_2[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  trading_status_message_record.gth_trading_status = wire[at]; at = at + 1;
  trading_status_message_record.second_reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.time_offset[trading_status_message_at] == trading_status_message_written.time_offset[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 6 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 2 -> assert(trading_status_message_read.reserved_2[trading_status_message_at] == trading_status_message_written.reserved_2[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  assert(trading_status_message_read.gth_trading_status == trading_status_message_written.gth_trading_status);
  assert(trading_status_message_read.second_reserved_1 == trading_status_message_written.second_reserved_1);
  skip
}

/* ---- Width Update Message: 17 bytes ------------------------------------------ */

/* The Width Update message is used to communicate the quote width multiplier for opening collars and for maximum quote width requirements. This message is sent whenever the exchange changes the multiplier intraday on a per-underlying basis. */
typedef WidthUpdateMessage {
  byte time_offset[4];
  byte underlying[8];
  byte width_type;
  byte multiplier[4]
};

int width_update_message_at;

/* every byte of Width Update Message set to one value */
inline fill_width_update_message(width_update_message_record, width_update_message_value) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = width_update_message_value;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = width_update_message_value; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Width Update Message set to where it lies, so a field read out of place says so */
inline ramp_width_update_message(width_update_message_record, width_update_message_base) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = (width_update_message_base + 0 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = (width_update_message_base + 4 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = (width_update_message_base + 12 + 1) % 256;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = (width_update_message_base + 13 + width_update_message_at + 1) % 256; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message to the wire, 17 bytes from where the cursor stands */
inline encode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.time_offset[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> wire[at] = width_update_message_record.underlying[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  wire[at] = width_update_message_record.width_type; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> wire[at] = width_update_message_record.multiplier[width_update_message_at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Width Update Message off the wire, 17 bytes from where the cursor stands */
inline decode_width_update_message(width_update_message_record) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.time_offset[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> width_update_message_record.underlying[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_record.width_type = wire[at]; at = at + 1;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> width_update_message_record.multiplier[width_update_message_at] = wire[at]; at = at + 1; width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Width Update Message is what was written, byte for byte */
inline equal_width_update_message(width_update_message_read, width_update_message_written) {
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.time_offset[width_update_message_at] == width_update_message_written.time_offset[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  width_update_message_at = 0;
  do
  :: width_update_message_at < 8 -> assert(width_update_message_read.underlying[width_update_message_at] == width_update_message_written.underlying[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  assert(width_update_message_read.width_type == width_update_message_written.width_type);
  width_update_message_at = 0;
  do
  :: width_update_message_at < 4 -> assert(width_update_message_read.multiplier[width_update_message_at] == width_update_message_written.multiplier[width_update_message_at]); width_update_message_at = width_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down. No more sequenced messages will be delivered for this unit, but heartbeats from the unit may be received. */
typedef EndOfSessionMessage {
  byte time_offset[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.time_offset[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.time_offset[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.time_offset[end_of_session_message_at] == end_of_session_message_written.time_offset[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Soq Strike Range Update Message: 40 bytes ------------------------------- */

/* C1 Options Only. The SOQ Strike Range Update message is only available on the C1 Exchange. This message disseminates the minimum and maximum strike prices of the price range used to calculate the Special Opening Quote (SOQ) on a Volatility Settlement date. In the event that multiple distinct SOQ calculations occur on the same day, the applicable SOQ is differentiated by the SOQ Identifier field, which is set to the CSMi symbol on which the final settlement SOQ value is disseminated. */
typedef SoqStrikeRangeUpdateMessage {
  byte time_offset[4];
  byte soq_identifier[20];
  byte lower_strike_price[8];
  byte upper_strike_price[8]
};

int soq_strike_range_update_message_at;

/* every byte of Soq Strike Range Update Message set to one value */
inline fill_soq_strike_range_update_message(soq_strike_range_update_message_record, soq_strike_range_update_message_value) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = soq_strike_range_update_message_value; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Soq Strike Range Update Message set to where it lies, so a field read out of place says so */
inline ramp_soq_strike_range_update_message(soq_strike_range_update_message_record, soq_strike_range_update_message_base) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 0 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 4 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 24 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = (soq_strike_range_update_message_base + 32 + soq_strike_range_update_message_at + 1) % 256; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Soq Strike Range Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_soq_strike_range_update_message(soq_strike_range_update_message_record) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> wire[at] = soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> wire[at] = soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> wire[at] = soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> wire[at] = soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Soq Strike Range Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_soq_strike_range_update_message(soq_strike_range_update_message_record) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> soq_strike_range_update_message_record.time_offset[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> soq_strike_range_update_message_record.soq_identifier[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.lower_strike_price[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> soq_strike_range_update_message_record.upper_strike_price[soq_strike_range_update_message_at] = wire[at]; at = at + 1; soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Soq Strike Range Update Message is what was written, byte for byte */
inline equal_soq_strike_range_update_message(soq_strike_range_update_message_read, soq_strike_range_update_message_written) {
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 4 -> assert(soq_strike_range_update_message_read.time_offset[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.time_offset[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 20 -> assert(soq_strike_range_update_message_read.soq_identifier[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.soq_identifier[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> assert(soq_strike_range_update_message_read.lower_strike_price[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.lower_strike_price[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  soq_strike_range_update_message_at = 0;
  do
  :: soq_strike_range_update_message_at < 8 -> assert(soq_strike_range_update_message_read.upper_strike_price[soq_strike_range_update_message_at] == soq_strike_range_update_message_written.upper_strike_price[soq_strike_range_update_message_at]); soq_strike_range_update_message_at = soq_strike_range_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Constituent Symbol Mapping Message: 56 bytes ---------------------------- */

/* C1 Options Only. The Constituent Symbol Mapping message is used to communicate which options series (if any) are Constituent Series in a Volatility Settlement Special Opening Quote (SOQ). The message is identical to the Symbol Mapping message with the addition of the SOQ Identifier field, which is set to the CSMi symbol on which the final settlement SOQ value is disseminated. The Constituent Symbol Mapping message is sent as an unsequenced message with one message sent for each Constituent Series in a continuous loop as bandwidth allows. */
typedef ConstituentSymbolMappingMessage {
  byte feed_symbol[6];
  byte osi_symbol[21];
  byte symbol_condition;
  byte underlying[8];
  byte soq_identifier[20]
};

int constituent_symbol_mapping_message_at;

/* every byte of Constituent Symbol Mapping Message set to one value */
inline fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record, constituent_symbol_mapping_message_value) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = constituent_symbol_mapping_message_value;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = constituent_symbol_mapping_message_value; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Constituent Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record, constituent_symbol_mapping_message_base) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 0 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 6 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = (constituent_symbol_mapping_message_base + 27 + 1) % 256;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 28 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = (constituent_symbol_mapping_message_base + 36 + constituent_symbol_mapping_message_at + 1) % 256; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Constituent Symbol Mapping Message to the wire, 56 bytes from where the cursor stands */
inline encode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> wire[at] = constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> wire[at] = constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = constituent_symbol_mapping_message_record.symbol_condition; at = at + 1;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> wire[at] = constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> wire[at] = constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Constituent Symbol Mapping Message off the wire, 56 bytes from where the cursor stands */
inline decode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_record) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> constituent_symbol_mapping_message_record.feed_symbol[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> constituent_symbol_mapping_message_record.osi_symbol[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> constituent_symbol_mapping_message_record.underlying[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> constituent_symbol_mapping_message_record.soq_identifier[constituent_symbol_mapping_message_at] = wire[at]; at = at + 1; constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Constituent Symbol Mapping Message is what was written, byte for byte */
inline equal_constituent_symbol_mapping_message(constituent_symbol_mapping_message_read, constituent_symbol_mapping_message_written) {
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 6 -> assert(constituent_symbol_mapping_message_read.feed_symbol[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.feed_symbol[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 21 -> assert(constituent_symbol_mapping_message_read.osi_symbol[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.osi_symbol[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(constituent_symbol_mapping_message_read.symbol_condition == constituent_symbol_mapping_message_written.symbol_condition);
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 8 -> assert(constituent_symbol_mapping_message_read.underlying[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.underlying[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
  :: else -> break
  od;
  constituent_symbol_mapping_message_at = 0;
  do
  :: constituent_symbol_mapping_message_at < 20 -> assert(constituent_symbol_mapping_message_read.soq_identifier[constituent_symbol_mapping_message_at] == constituent_symbol_mapping_message_written.soq_identifier[constituent_symbol_mapping_message_at]); constituent_symbol_mapping_message_at = constituent_symbol_mapping_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 8);
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
    assert(at == 2);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 2);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Time Reference Message: encoded, read back, and compared */
proctype check_time_reference_message() {
  TimeReferenceMessage time_reference_message_sent;
  TimeReferenceMessage time_reference_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_time_reference_message(time_reference_message_sent, 0)
  :: pattern == 1 -> fill_time_reference_message(time_reference_message_sent, 32)
  :: pattern == 2 -> fill_time_reference_message(time_reference_message_sent, 255)
  :: else -> ramp_time_reference_message(time_reference_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_time_reference_message(time_reference_message_sent);
    assert(at == 16);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 16);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
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
    assert(at == 8);
    at = 0;
    decode_time_message(time_message_got);
    assert(at == 8);
    equal_time_message(time_message_got, time_message_sent)
  }
}

/* Unit Clear Message: encoded, read back, and compared */
proctype check_unit_clear_message() {
  UnitClearMessage unit_clear_message_sent;
  UnitClearMessage unit_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_unit_clear_message(unit_clear_message_sent, 0)
  :: pattern == 1 -> fill_unit_clear_message(unit_clear_message_sent, 32)
  :: pattern == 2 -> fill_unit_clear_message(unit_clear_message_sent, 255)
  :: else -> ramp_unit_clear_message(unit_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_unit_clear_message(unit_clear_message_sent);
    assert(at == 4);
    at = 0;
    decode_unit_clear_message(unit_clear_message_got);
    assert(at == 4);
    equal_unit_clear_message(unit_clear_message_got, unit_clear_message_sent)
  }
}

/* Symbol Mapping Message: encoded, read back, and compared */
proctype check_symbol_mapping_message() {
  SymbolMappingMessage symbol_mapping_message_sent;
  SymbolMappingMessage symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_symbol_mapping_message(symbol_mapping_message_sent, 255)
  :: else -> ramp_symbol_mapping_message(symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_mapping_message(symbol_mapping_message_sent);
    assert(at == 36);
    at = 0;
    decode_symbol_mapping_message(symbol_mapping_message_got);
    assert(at == 36);
    equal_symbol_mapping_message(symbol_mapping_message_got, symbol_mapping_message_sent)
  }
}

/* Top Trade Message: encoded, read back, and compared */
proctype check_top_trade_message() {
  TopTradeMessage top_trade_message_sent;
  TopTradeMessage top_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_trade_message(top_trade_message_sent, 0)
  :: pattern == 1 -> fill_top_trade_message(top_trade_message_sent, 32)
  :: pattern == 2 -> fill_top_trade_message(top_trade_message_sent, 255)
  :: else -> ramp_top_trade_message(top_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_trade_message(top_trade_message_sent);
    assert(at == 35);
    at = 0;
    decode_top_trade_message(top_trade_message_got);
    assert(at == 35);
    equal_top_trade_message(top_trade_message_got, top_trade_message_sent)
  }
}

/* Options Auction Update Message: encoded, read back, and compared */
proctype check_options_auction_update_message() {
  OptionsAuctionUpdateMessage options_auction_update_message_sent;
  OptionsAuctionUpdateMessage options_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_options_auction_update_message(options_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_options_auction_update_message(options_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_options_auction_update_message(options_auction_update_message_sent, 255)
  :: else -> ramp_options_auction_update_message(options_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_options_auction_update_message(options_auction_update_message_sent);
    assert(at == 62);
    at = 0;
    decode_options_auction_update_message(options_auction_update_message_got);
    assert(at == 62);
    equal_options_auction_update_message(options_auction_update_message_got, options_auction_update_message_sent)
  }
}

/* Auction Summary Message: encoded, read back, and compared */
proctype check_auction_summary_message() {
  AuctionSummaryMessage auction_summary_message_sent;
  AuctionSummaryMessage auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary_message(auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_auction_summary_message(auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_auction_summary_message(auction_summary_message_sent, 255)
  :: else -> ramp_auction_summary_message(auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary_message(auction_summary_message_sent);
    assert(at == 25);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 25);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Trading Status Message: encoded, read back, and compared */
proctype check_trading_status_message() {
  TradingStatusMessage trading_status_message_sent;
  TradingStatusMessage trading_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_message(trading_status_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_message(trading_status_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_message(trading_status_message_sent, 255)
  :: else -> ramp_trading_status_message(trading_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_message(trading_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 16);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Width Update Message: encoded, read back, and compared */
proctype check_width_update_message() {
  WidthUpdateMessage width_update_message_sent;
  WidthUpdateMessage width_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_width_update_message(width_update_message_sent, 0)
  :: pattern == 1 -> fill_width_update_message(width_update_message_sent, 32)
  :: pattern == 2 -> fill_width_update_message(width_update_message_sent, 255)
  :: else -> ramp_width_update_message(width_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_width_update_message(width_update_message_sent);
    assert(at == 17);
    at = 0;
    decode_width_update_message(width_update_message_got);
    assert(at == 17);
    equal_width_update_message(width_update_message_got, width_update_message_sent)
  }
}

/* End Of Session Message: encoded, read back, and compared */
proctype check_end_of_session_message() {
  EndOfSessionMessage end_of_session_message_sent;
  EndOfSessionMessage end_of_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_session_message(end_of_session_message_sent, 0)
  :: pattern == 1 -> fill_end_of_session_message(end_of_session_message_sent, 32)
  :: pattern == 2 -> fill_end_of_session_message(end_of_session_message_sent, 255)
  :: else -> ramp_end_of_session_message(end_of_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_session_message(end_of_session_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_session_message(end_of_session_message_got);
    assert(at == 4);
    equal_end_of_session_message(end_of_session_message_got, end_of_session_message_sent)
  }
}

/* Soq Strike Range Update Message: encoded, read back, and compared */
proctype check_soq_strike_range_update_message() {
  SoqStrikeRangeUpdateMessage soq_strike_range_update_message_sent;
  SoqStrikeRangeUpdateMessage soq_strike_range_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 0)
  :: pattern == 1 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 32)
  :: pattern == 2 -> fill_soq_strike_range_update_message(soq_strike_range_update_message_sent, 255)
  :: else -> ramp_soq_strike_range_update_message(soq_strike_range_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_soq_strike_range_update_message(soq_strike_range_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_soq_strike_range_update_message(soq_strike_range_update_message_got);
    assert(at == 40);
    equal_soq_strike_range_update_message(soq_strike_range_update_message_got, soq_strike_range_update_message_sent)
  }
}

/* Constituent Symbol Mapping Message: encoded, read back, and compared */
proctype check_constituent_symbol_mapping_message() {
  ConstituentSymbolMappingMessage constituent_symbol_mapping_message_sent;
  ConstituentSymbolMappingMessage constituent_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 255)
  :: else -> ramp_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_sent);
    assert(at == 56);
    at = 0;
    decode_constituent_symbol_mapping_message(constituent_symbol_mapping_message_got);
    assert(at == 56);
    equal_constituent_symbol_mapping_message(constituent_symbol_mapping_message_got, constituent_symbol_mapping_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_unit_clear_message()
  :: run check_symbol_mapping_message()
  :: run check_top_trade_message()
  :: run check_options_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_trading_status_message()
  :: run check_width_update_message()
  :: run check_end_of_session_message()
  :: run check_soq_strike_range_update_message()
  :: run check_constituent_symbol_mapping_message()
  fi
}
