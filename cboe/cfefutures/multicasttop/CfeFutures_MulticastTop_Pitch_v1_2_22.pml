/*
 * Chicago Board Options Exchange Futures Multicast Top
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
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 59

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

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. */
typedef TimeReferenceMessage {
  byte midnight_reference[4];
  byte time_reference[4];
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = (time_reference_message_base + 4 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> wire[at] = time_reference_message_record.time_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> time_reference_message_record.time_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
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
  :: time_reference_message_at < 4 -> assert(time_reference_message_read.time_reference[time_reference_message_at] == time_reference_message_written.time_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
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

/* A Time message is immediately generated and sent when there is a TOP event for a given clock second. */
typedef TimeMessage {
  byte time_reference[4];
  byte epoch_time[4]
};

int time_message_at;

/* every byte of Time Message set to one value */
inline fill_time_message(time_message_record, time_message_value) {
  time_message_at = 0;
  do
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = time_message_value; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = (time_message_base + 0 + time_message_at + 1) % 256; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> wire[at] = time_message_record.time_reference[time_message_at]; at = at + 1; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> time_message_record.time_reference[time_message_at] = wire[at]; at = at + 1; time_message_at = time_message_at + 1
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
  :: time_message_at < 4 -> assert(time_message_read.time_reference[time_message_at] == time_message_written.time_reference[time_message_at]); time_message_at = time_message_at + 1
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

/* The Unit Clear message instructs feed recipients to clear all market snapshots for the CFE book in the unit specified in the Sequenced Unit Header message header. */
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

/* ---- Futures Variance Symbol Mapping Message: 38 bytes ----------------------- */

/* The Futures Variance Symbol Mapping message is used to disseminate symbol reference data for S&P 500 Variance Futures (VA Futures) symbols. */
typedef FuturesVarianceSymbolMappingMessage {
  byte time_offset[4];
  byte unit_timestamp[4];
  byte feed_symbol[6];
  byte futures_symbol[12];
  byte accrued_day_variance[8];
  byte num_final_returns[2];
  byte num_elapsed_returns[2]
};

int futures_variance_symbol_mapping_message_at;

/* every byte of Futures Variance Symbol Mapping Message set to one value */
inline fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record, futures_variance_symbol_mapping_message_value) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = futures_variance_symbol_mapping_message_value; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Futures Variance Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record, futures_variance_symbol_mapping_message_base) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 0 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 4 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 8 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 14 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 26 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 34 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = (futures_variance_symbol_mapping_message_base + 36 + futures_variance_symbol_mapping_message_at + 1) % 256; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Variance Symbol Mapping Message to the wire, 38 bytes from where the cursor stands */
inline encode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> wire[at] = futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> wire[at] = futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> wire[at] = futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> wire[at] = futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> wire[at] = futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> wire[at] = futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> wire[at] = futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Futures Variance Symbol Mapping Message off the wire, 38 bytes from where the cursor stands */
inline decode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_record) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.time_offset[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> futures_variance_symbol_mapping_message_record.unit_timestamp[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> futures_variance_symbol_mapping_message_record.feed_symbol[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> futures_variance_symbol_mapping_message_record.futures_symbol[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> futures_variance_symbol_mapping_message_record.accrued_day_variance[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_final_returns[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> futures_variance_symbol_mapping_message_record.num_elapsed_returns[futures_variance_symbol_mapping_message_at] = wire[at]; at = at + 1; futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Futures Variance Symbol Mapping Message is what was written, byte for byte */
inline equal_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_read, futures_variance_symbol_mapping_message_written) {
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> assert(futures_variance_symbol_mapping_message_read.time_offset[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.time_offset[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 4 -> assert(futures_variance_symbol_mapping_message_read.unit_timestamp[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.unit_timestamp[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 6 -> assert(futures_variance_symbol_mapping_message_read.feed_symbol[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.feed_symbol[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 12 -> assert(futures_variance_symbol_mapping_message_read.futures_symbol[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.futures_symbol[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 8 -> assert(futures_variance_symbol_mapping_message_read.accrued_day_variance[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.accrued_day_variance[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> assert(futures_variance_symbol_mapping_message_read.num_final_returns[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.num_final_returns[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  futures_variance_symbol_mapping_message_at = 0;
  do
  :: futures_variance_symbol_mapping_message_at < 2 -> assert(futures_variance_symbol_mapping_message_read.num_elapsed_returns[futures_variance_symbol_mapping_message_at] == futures_variance_symbol_mapping_message_written.num_elapsed_returns[futures_variance_symbol_mapping_message_at]); futures_variance_symbol_mapping_message_at = futures_variance_symbol_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Limits Message: 26 bytes ------------------------------------------ */

/* The Price Limits message can be sent as a sequenced or un-sequenced message. It is sent out at the start of the session for products subject to price limits per the contract specifications. */
typedef PriceLimitsMessage {
  byte time_offset[4];
  byte symbol[6];
  byte upper_price_limit[8];
  byte lower_price_limit[8]
};

int price_limits_message_at;

/* every byte of Price Limits Message set to one value */
inline fill_price_limits_message(price_limits_message_record, price_limits_message_value) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = price_limits_message_value; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Limits Message set to where it lies, so a field read out of place says so */
inline ramp_price_limits_message(price_limits_message_record, price_limits_message_base) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = (price_limits_message_base + 0 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = (price_limits_message_base + 4 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = (price_limits_message_base + 10 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = (price_limits_message_base + 18 + price_limits_message_at + 1) % 256; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message to the wire, 26 bytes from where the cursor stands */
inline encode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> wire[at] = price_limits_message_record.time_offset[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> wire[at] = price_limits_message_record.symbol[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.upper_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> wire[at] = price_limits_message_record.lower_price_limit[price_limits_message_at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Limits Message off the wire, 26 bytes from where the cursor stands */
inline decode_price_limits_message(price_limits_message_record) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> price_limits_message_record.time_offset[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> price_limits_message_record.symbol[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.upper_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> price_limits_message_record.lower_price_limit[price_limits_message_at] = wire[at]; at = at + 1; price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Limits Message is what was written, byte for byte */
inline equal_price_limits_message(price_limits_message_read, price_limits_message_written) {
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 4 -> assert(price_limits_message_read.time_offset[price_limits_message_at] == price_limits_message_written.time_offset[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 6 -> assert(price_limits_message_read.symbol[price_limits_message_at] == price_limits_message_written.symbol[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.upper_price_limit[price_limits_message_at] == price_limits_message_written.upper_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  price_limits_message_at = 0;
  do
  :: price_limits_message_at < 8 -> assert(price_limits_message_read.lower_price_limit[price_limits_message_at] == price_limits_message_written.lower_price_limit[price_limits_message_at]); price_limits_message_at = price_limits_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Snapshot Short Message: 35 bytes --------------------------------- */

/* A Market Snapshot message provides a snapshot of the price and size for the bid and ask, last trade price, total number of contracts traded, and the current trading status of a single symbol. */
typedef MarketSnapshotShortMessage {
  byte time_offset[4];
  byte symbol[6];
  byte unit_timestamp[4];
  byte bid_price_short[2];
  byte bid_quantity_short[2];
  byte ask_price_short[2];
  byte ask_quantity_short[2];
  byte last_trade_price_short[2];
  byte last_trade_size_short[2];
  byte last_trade_condition;
  byte total_volume[4];
  byte trading_status;
  byte reserved_3[3]
};

int market_snapshot_short_message_at;

/* every byte of Market Snapshot Short Message set to one value */
inline fill_market_snapshot_short_message(market_snapshot_short_message_record, market_snapshot_short_message_value) {
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.time_offset[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 6 -> market_snapshot_short_message_record.symbol[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.unit_timestamp[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_price_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_quantity_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_price_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_quantity_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_price_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_size_short[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.last_trade_condition = market_snapshot_short_message_value;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.total_volume[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.trading_status = market_snapshot_short_message_value;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 3 -> market_snapshot_short_message_record.reserved_3[market_snapshot_short_message_at] = market_snapshot_short_message_value; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Snapshot Short Message set to where it lies, so a field read out of place says so */
inline ramp_market_snapshot_short_message(market_snapshot_short_message_record, market_snapshot_short_message_base) {
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.time_offset[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 0 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 6 -> market_snapshot_short_message_record.symbol[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 4 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.unit_timestamp[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 10 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_price_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 14 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_quantity_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 16 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_price_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 18 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_quantity_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 20 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_price_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 22 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_size_short[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 24 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.last_trade_condition = (market_snapshot_short_message_base + 26 + 1) % 256;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.total_volume[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 27 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.trading_status = (market_snapshot_short_message_base + 31 + 1) % 256;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 3 -> market_snapshot_short_message_record.reserved_3[market_snapshot_short_message_at] = (market_snapshot_short_message_base + 32 + market_snapshot_short_message_at + 1) % 256; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Short Message to the wire, 35 bytes from where the cursor stands */
inline encode_market_snapshot_short_message(market_snapshot_short_message_record) {
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> wire[at] = market_snapshot_short_message_record.time_offset[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 6 -> wire[at] = market_snapshot_short_message_record.symbol[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> wire[at] = market_snapshot_short_message_record.unit_timestamp[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.bid_price_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.bid_quantity_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.ask_price_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.ask_quantity_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.last_trade_price_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> wire[at] = market_snapshot_short_message_record.last_trade_size_short[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_short_message_record.last_trade_condition; at = at + 1;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> wire[at] = market_snapshot_short_message_record.total_volume[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_short_message_record.trading_status; at = at + 1;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 3 -> wire[at] = market_snapshot_short_message_record.reserved_3[market_snapshot_short_message_at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Short Message off the wire, 35 bytes from where the cursor stands */
inline decode_market_snapshot_short_message(market_snapshot_short_message_record) {
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.time_offset[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 6 -> market_snapshot_short_message_record.symbol[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.unit_timestamp[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_price_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.bid_quantity_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_price_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.ask_quantity_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_price_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> market_snapshot_short_message_record.last_trade_size_short[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.last_trade_condition = wire[at]; at = at + 1;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> market_snapshot_short_message_record.total_volume[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_record.trading_status = wire[at]; at = at + 1;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 3 -> market_snapshot_short_message_record.reserved_3[market_snapshot_short_message_at] = wire[at]; at = at + 1; market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Snapshot Short Message is what was written, byte for byte */
inline equal_market_snapshot_short_message(market_snapshot_short_message_read, market_snapshot_short_message_written) {
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> assert(market_snapshot_short_message_read.time_offset[market_snapshot_short_message_at] == market_snapshot_short_message_written.time_offset[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 6 -> assert(market_snapshot_short_message_read.symbol[market_snapshot_short_message_at] == market_snapshot_short_message_written.symbol[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> assert(market_snapshot_short_message_read.unit_timestamp[market_snapshot_short_message_at] == market_snapshot_short_message_written.unit_timestamp[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.bid_price_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.bid_price_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.bid_quantity_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.bid_quantity_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.ask_price_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.ask_price_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.ask_quantity_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.ask_quantity_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.last_trade_price_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.last_trade_price_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 2 -> assert(market_snapshot_short_message_read.last_trade_size_short[market_snapshot_short_message_at] == market_snapshot_short_message_written.last_trade_size_short[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_short_message_read.last_trade_condition == market_snapshot_short_message_written.last_trade_condition);
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 4 -> assert(market_snapshot_short_message_read.total_volume[market_snapshot_short_message_at] == market_snapshot_short_message_written.total_volume[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_short_message_read.trading_status == market_snapshot_short_message_written.trading_status);
  market_snapshot_short_message_at = 0;
  do
  :: market_snapshot_short_message_at < 3 -> assert(market_snapshot_short_message_read.reserved_3[market_snapshot_short_message_at] == market_snapshot_short_message_written.reserved_3[market_snapshot_short_message_at]); market_snapshot_short_message_at = market_snapshot_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Snapshot Long Message: 59 bytes ---------------------------------- */

/* A Market Snapshot message provides a snapshot of the price and size for the bid and ask, last trade price, total number of contracts traded, and the current trading status of a single symbol. */
typedef MarketSnapshotLongMessage {
  byte time_offset[4];
  byte symbol[6];
  byte unit_timestamp[4];
  byte bid_price_long[8];
  byte bid_quantity_long[4];
  byte ask_price_long[8];
  byte ask_quantity_long[4];
  byte last_trade_price_long[8];
  byte last_trade_size_long[4];
  byte last_trade_condition;
  byte total_volume[4];
  byte trading_status;
  byte reserved_3[3]
};

int market_snapshot_long_message_at;

/* every byte of Market Snapshot Long Message set to one value */
inline fill_market_snapshot_long_message(market_snapshot_long_message_record, market_snapshot_long_message_value) {
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.time_offset[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 6 -> market_snapshot_long_message_record.symbol[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.unit_timestamp[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.bid_price_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.bid_quantity_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.ask_price_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.ask_quantity_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.last_trade_price_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.last_trade_size_long[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.last_trade_condition = market_snapshot_long_message_value;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.total_volume[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.trading_status = market_snapshot_long_message_value;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 3 -> market_snapshot_long_message_record.reserved_3[market_snapshot_long_message_at] = market_snapshot_long_message_value; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Snapshot Long Message set to where it lies, so a field read out of place says so */
inline ramp_market_snapshot_long_message(market_snapshot_long_message_record, market_snapshot_long_message_base) {
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.time_offset[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 0 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 6 -> market_snapshot_long_message_record.symbol[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 4 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.unit_timestamp[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 10 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.bid_price_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 14 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.bid_quantity_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 22 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.ask_price_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 26 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.ask_quantity_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 34 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.last_trade_price_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 38 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.last_trade_size_long[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 46 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.last_trade_condition = (market_snapshot_long_message_base + 50 + 1) % 256;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.total_volume[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 51 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.trading_status = (market_snapshot_long_message_base + 55 + 1) % 256;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 3 -> market_snapshot_long_message_record.reserved_3[market_snapshot_long_message_at] = (market_snapshot_long_message_base + 56 + market_snapshot_long_message_at + 1) % 256; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Long Message to the wire, 59 bytes from where the cursor stands */
inline encode_market_snapshot_long_message(market_snapshot_long_message_record) {
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.time_offset[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 6 -> wire[at] = market_snapshot_long_message_record.symbol[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.unit_timestamp[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> wire[at] = market_snapshot_long_message_record.bid_price_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.bid_quantity_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> wire[at] = market_snapshot_long_message_record.ask_price_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.ask_quantity_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> wire[at] = market_snapshot_long_message_record.last_trade_price_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.last_trade_size_long[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_long_message_record.last_trade_condition; at = at + 1;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> wire[at] = market_snapshot_long_message_record.total_volume[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  wire[at] = market_snapshot_long_message_record.trading_status; at = at + 1;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 3 -> wire[at] = market_snapshot_long_message_record.reserved_3[market_snapshot_long_message_at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Snapshot Long Message off the wire, 59 bytes from where the cursor stands */
inline decode_market_snapshot_long_message(market_snapshot_long_message_record) {
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.time_offset[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 6 -> market_snapshot_long_message_record.symbol[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.unit_timestamp[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.bid_price_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.bid_quantity_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.ask_price_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.ask_quantity_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> market_snapshot_long_message_record.last_trade_price_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.last_trade_size_long[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.last_trade_condition = wire[at]; at = at + 1;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> market_snapshot_long_message_record.total_volume[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_record.trading_status = wire[at]; at = at + 1;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 3 -> market_snapshot_long_message_record.reserved_3[market_snapshot_long_message_at] = wire[at]; at = at + 1; market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Snapshot Long Message is what was written, byte for byte */
inline equal_market_snapshot_long_message(market_snapshot_long_message_read, market_snapshot_long_message_written) {
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.time_offset[market_snapshot_long_message_at] == market_snapshot_long_message_written.time_offset[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 6 -> assert(market_snapshot_long_message_read.symbol[market_snapshot_long_message_at] == market_snapshot_long_message_written.symbol[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.unit_timestamp[market_snapshot_long_message_at] == market_snapshot_long_message_written.unit_timestamp[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> assert(market_snapshot_long_message_read.bid_price_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.bid_price_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.bid_quantity_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.bid_quantity_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> assert(market_snapshot_long_message_read.ask_price_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.ask_price_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.ask_quantity_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.ask_quantity_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 8 -> assert(market_snapshot_long_message_read.last_trade_price_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.last_trade_price_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.last_trade_size_long[market_snapshot_long_message_at] == market_snapshot_long_message_written.last_trade_size_long[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_long_message_read.last_trade_condition == market_snapshot_long_message_written.last_trade_condition);
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 4 -> assert(market_snapshot_long_message_read.total_volume[market_snapshot_long_message_at] == market_snapshot_long_message_written.total_volume[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  assert(market_snapshot_long_message_read.trading_status == market_snapshot_long_message_written.trading_status);
  market_snapshot_long_message_at = 0;
  do
  :: market_snapshot_long_message_at < 3 -> assert(market_snapshot_long_message_read.reserved_3[market_snapshot_long_message_at] == market_snapshot_long_message_written.reserved_3[market_snapshot_long_message_at]); market_snapshot_long_message_at = market_snapshot_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Update Short Message: 15 bytes ------------------------------ */

/* Single Side Update messages provide an updated price and size for a single side of a Symbol. */
typedef SingleSideUpdateShortMessage {
  byte time_offset[4];
  byte symbol[6];
  byte side;
  byte price_short[2];
  byte quantity_short[2]
};

int single_side_update_short_message_at;

/* every byte of Single Side Update Short Message set to one value */
inline fill_single_side_update_short_message(single_side_update_short_message_record, single_side_update_short_message_value) {
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 4 -> single_side_update_short_message_record.time_offset[single_side_update_short_message_at] = single_side_update_short_message_value; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 6 -> single_side_update_short_message_record.symbol[single_side_update_short_message_at] = single_side_update_short_message_value; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_record.side = single_side_update_short_message_value;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.price_short[single_side_update_short_message_at] = single_side_update_short_message_value; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.quantity_short[single_side_update_short_message_at] = single_side_update_short_message_value; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Update Short Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_short_message(single_side_update_short_message_record, single_side_update_short_message_base) {
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 4 -> single_side_update_short_message_record.time_offset[single_side_update_short_message_at] = (single_side_update_short_message_base + 0 + single_side_update_short_message_at + 1) % 256; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 6 -> single_side_update_short_message_record.symbol[single_side_update_short_message_at] = (single_side_update_short_message_base + 4 + single_side_update_short_message_at + 1) % 256; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_record.side = (single_side_update_short_message_base + 10 + 1) % 256;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.price_short[single_side_update_short_message_at] = (single_side_update_short_message_base + 11 + single_side_update_short_message_at + 1) % 256; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.quantity_short[single_side_update_short_message_at] = (single_side_update_short_message_base + 13 + single_side_update_short_message_at + 1) % 256; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Short Message to the wire, 15 bytes from where the cursor stands */
inline encode_single_side_update_short_message(single_side_update_short_message_record) {
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 4 -> wire[at] = single_side_update_short_message_record.time_offset[single_side_update_short_message_at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 6 -> wire[at] = single_side_update_short_message_record.symbol[single_side_update_short_message_at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_short_message_record.side; at = at + 1;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> wire[at] = single_side_update_short_message_record.price_short[single_side_update_short_message_at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> wire[at] = single_side_update_short_message_record.quantity_short[single_side_update_short_message_at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Short Message off the wire, 15 bytes from where the cursor stands */
inline decode_single_side_update_short_message(single_side_update_short_message_record) {
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 4 -> single_side_update_short_message_record.time_offset[single_side_update_short_message_at] = wire[at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 6 -> single_side_update_short_message_record.symbol[single_side_update_short_message_at] = wire[at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_record.side = wire[at]; at = at + 1;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.price_short[single_side_update_short_message_at] = wire[at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> single_side_update_short_message_record.quantity_short[single_side_update_short_message_at] = wire[at]; at = at + 1; single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Update Short Message is what was written, byte for byte */
inline equal_single_side_update_short_message(single_side_update_short_message_read, single_side_update_short_message_written) {
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 4 -> assert(single_side_update_short_message_read.time_offset[single_side_update_short_message_at] == single_side_update_short_message_written.time_offset[single_side_update_short_message_at]); single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 6 -> assert(single_side_update_short_message_read.symbol[single_side_update_short_message_at] == single_side_update_short_message_written.symbol[single_side_update_short_message_at]); single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_short_message_read.side == single_side_update_short_message_written.side);
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> assert(single_side_update_short_message_read.price_short[single_side_update_short_message_at] == single_side_update_short_message_written.price_short[single_side_update_short_message_at]); single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  single_side_update_short_message_at = 0;
  do
  :: single_side_update_short_message_at < 2 -> assert(single_side_update_short_message_read.quantity_short[single_side_update_short_message_at] == single_side_update_short_message_written.quantity_short[single_side_update_short_message_at]); single_side_update_short_message_at = single_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Single Side Update Long Message: 23 bytes ------------------------------- */

/* Single Side Update messages provide an updated price and size for a single side of a Symbol. */
typedef SingleSideUpdateLongMessage {
  byte time_offset[4];
  byte symbol[6];
  byte side;
  byte price_long[8];
  byte quantity_long[4]
};

int single_side_update_long_message_at;

/* every byte of Single Side Update Long Message set to one value */
inline fill_single_side_update_long_message(single_side_update_long_message_record, single_side_update_long_message_value) {
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.time_offset[single_side_update_long_message_at] = single_side_update_long_message_value; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 6 -> single_side_update_long_message_record.symbol[single_side_update_long_message_at] = single_side_update_long_message_value; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_record.side = single_side_update_long_message_value;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 8 -> single_side_update_long_message_record.price_long[single_side_update_long_message_at] = single_side_update_long_message_value; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.quantity_long[single_side_update_long_message_at] = single_side_update_long_message_value; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Single Side Update Long Message set to where it lies, so a field read out of place says so */
inline ramp_single_side_update_long_message(single_side_update_long_message_record, single_side_update_long_message_base) {
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.time_offset[single_side_update_long_message_at] = (single_side_update_long_message_base + 0 + single_side_update_long_message_at + 1) % 256; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 6 -> single_side_update_long_message_record.symbol[single_side_update_long_message_at] = (single_side_update_long_message_base + 4 + single_side_update_long_message_at + 1) % 256; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_record.side = (single_side_update_long_message_base + 10 + 1) % 256;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 8 -> single_side_update_long_message_record.price_long[single_side_update_long_message_at] = (single_side_update_long_message_base + 11 + single_side_update_long_message_at + 1) % 256; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.quantity_long[single_side_update_long_message_at] = (single_side_update_long_message_base + 19 + single_side_update_long_message_at + 1) % 256; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Long Message to the wire, 23 bytes from where the cursor stands */
inline encode_single_side_update_long_message(single_side_update_long_message_record) {
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> wire[at] = single_side_update_long_message_record.time_offset[single_side_update_long_message_at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 6 -> wire[at] = single_side_update_long_message_record.symbol[single_side_update_long_message_at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  wire[at] = single_side_update_long_message_record.side; at = at + 1;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 8 -> wire[at] = single_side_update_long_message_record.price_long[single_side_update_long_message_at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> wire[at] = single_side_update_long_message_record.quantity_long[single_side_update_long_message_at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Single Side Update Long Message off the wire, 23 bytes from where the cursor stands */
inline decode_single_side_update_long_message(single_side_update_long_message_record) {
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.time_offset[single_side_update_long_message_at] = wire[at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 6 -> single_side_update_long_message_record.symbol[single_side_update_long_message_at] = wire[at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_record.side = wire[at]; at = at + 1;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 8 -> single_side_update_long_message_record.price_long[single_side_update_long_message_at] = wire[at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> single_side_update_long_message_record.quantity_long[single_side_update_long_message_at] = wire[at]; at = at + 1; single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Single Side Update Long Message is what was written, byte for byte */
inline equal_single_side_update_long_message(single_side_update_long_message_read, single_side_update_long_message_written) {
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> assert(single_side_update_long_message_read.time_offset[single_side_update_long_message_at] == single_side_update_long_message_written.time_offset[single_side_update_long_message_at]); single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 6 -> assert(single_side_update_long_message_read.symbol[single_side_update_long_message_at] == single_side_update_long_message_written.symbol[single_side_update_long_message_at]); single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  assert(single_side_update_long_message_read.side == single_side_update_long_message_written.side);
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 8 -> assert(single_side_update_long_message_read.price_long[single_side_update_long_message_at] == single_side_update_long_message_written.price_long[single_side_update_long_message_at]); single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  single_side_update_long_message_at = 0;
  do
  :: single_side_update_long_message_at < 4 -> assert(single_side_update_long_message_read.quantity_long[single_side_update_long_message_at] == single_side_update_long_message_written.quantity_long[single_side_update_long_message_at]); single_side_update_long_message_at = single_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Two Side Update Short Message: 18 bytes --------------------------------- */

/* Two Side Update messages provide an updated price and size for both sides of a Symbol. */
typedef TwoSideUpdateShortMessage {
  byte time_offset[4];
  byte symbol[6];
  byte bid_price_short[2];
  byte bid_quantity_short[2];
  byte ask_price_short[2];
  byte ask_quantity_short[2]
};

int two_side_update_short_message_at;

/* every byte of Two Side Update Short Message set to one value */
inline fill_two_side_update_short_message(two_side_update_short_message_record, two_side_update_short_message_value) {
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 4 -> two_side_update_short_message_record.time_offset[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 6 -> two_side_update_short_message_record.symbol[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_price_short[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_quantity_short[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_price_short[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_quantity_short[two_side_update_short_message_at] = two_side_update_short_message_value; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Two Side Update Short Message set to where it lies, so a field read out of place says so */
inline ramp_two_side_update_short_message(two_side_update_short_message_record, two_side_update_short_message_base) {
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 4 -> two_side_update_short_message_record.time_offset[two_side_update_short_message_at] = (two_side_update_short_message_base + 0 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 6 -> two_side_update_short_message_record.symbol[two_side_update_short_message_at] = (two_side_update_short_message_base + 4 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_price_short[two_side_update_short_message_at] = (two_side_update_short_message_base + 10 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_quantity_short[two_side_update_short_message_at] = (two_side_update_short_message_base + 12 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_price_short[two_side_update_short_message_at] = (two_side_update_short_message_base + 14 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_quantity_short[two_side_update_short_message_at] = (two_side_update_short_message_base + 16 + two_side_update_short_message_at + 1) % 256; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Two Side Update Short Message to the wire, 18 bytes from where the cursor stands */
inline encode_two_side_update_short_message(two_side_update_short_message_record) {
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 4 -> wire[at] = two_side_update_short_message_record.time_offset[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 6 -> wire[at] = two_side_update_short_message_record.symbol[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> wire[at] = two_side_update_short_message_record.bid_price_short[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> wire[at] = two_side_update_short_message_record.bid_quantity_short[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> wire[at] = two_side_update_short_message_record.ask_price_short[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> wire[at] = two_side_update_short_message_record.ask_quantity_short[two_side_update_short_message_at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Two Side Update Short Message off the wire, 18 bytes from where the cursor stands */
inline decode_two_side_update_short_message(two_side_update_short_message_record) {
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 4 -> two_side_update_short_message_record.time_offset[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 6 -> two_side_update_short_message_record.symbol[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_price_short[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.bid_quantity_short[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_price_short[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> two_side_update_short_message_record.ask_quantity_short[two_side_update_short_message_at] = wire[at]; at = at + 1; two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Two Side Update Short Message is what was written, byte for byte */
inline equal_two_side_update_short_message(two_side_update_short_message_read, two_side_update_short_message_written) {
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 4 -> assert(two_side_update_short_message_read.time_offset[two_side_update_short_message_at] == two_side_update_short_message_written.time_offset[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 6 -> assert(two_side_update_short_message_read.symbol[two_side_update_short_message_at] == two_side_update_short_message_written.symbol[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> assert(two_side_update_short_message_read.bid_price_short[two_side_update_short_message_at] == two_side_update_short_message_written.bid_price_short[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> assert(two_side_update_short_message_read.bid_quantity_short[two_side_update_short_message_at] == two_side_update_short_message_written.bid_quantity_short[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> assert(two_side_update_short_message_read.ask_price_short[two_side_update_short_message_at] == two_side_update_short_message_written.ask_price_short[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  two_side_update_short_message_at = 0;
  do
  :: two_side_update_short_message_at < 2 -> assert(two_side_update_short_message_read.ask_quantity_short[two_side_update_short_message_at] == two_side_update_short_message_written.ask_quantity_short[two_side_update_short_message_at]); two_side_update_short_message_at = two_side_update_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Two Side Update Long Message: 34 bytes ---------------------------------- */

/* Two Side Update messages provide an updated price and size for both sides of a Symbol. */
typedef TwoSideUpdateLongMessage {
  byte time_offset[4];
  byte symbol[6];
  byte bid_price_long[8];
  byte bid_quantity_long[4];
  byte ask_price_long[8];
  byte ask_quantity_long[4]
};

int two_side_update_long_message_at;

/* every byte of Two Side Update Long Message set to one value */
inline fill_two_side_update_long_message(two_side_update_long_message_record, two_side_update_long_message_value) {
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.time_offset[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 6 -> two_side_update_long_message_record.symbol[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.bid_price_long[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.bid_quantity_long[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.ask_price_long[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.ask_quantity_long[two_side_update_long_message_at] = two_side_update_long_message_value; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Two Side Update Long Message set to where it lies, so a field read out of place says so */
inline ramp_two_side_update_long_message(two_side_update_long_message_record, two_side_update_long_message_base) {
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.time_offset[two_side_update_long_message_at] = (two_side_update_long_message_base + 0 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 6 -> two_side_update_long_message_record.symbol[two_side_update_long_message_at] = (two_side_update_long_message_base + 4 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.bid_price_long[two_side_update_long_message_at] = (two_side_update_long_message_base + 10 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.bid_quantity_long[two_side_update_long_message_at] = (two_side_update_long_message_base + 18 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.ask_price_long[two_side_update_long_message_at] = (two_side_update_long_message_base + 22 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.ask_quantity_long[two_side_update_long_message_at] = (two_side_update_long_message_base + 30 + two_side_update_long_message_at + 1) % 256; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Two Side Update Long Message to the wire, 34 bytes from where the cursor stands */
inline encode_two_side_update_long_message(two_side_update_long_message_record) {
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> wire[at] = two_side_update_long_message_record.time_offset[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 6 -> wire[at] = two_side_update_long_message_record.symbol[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> wire[at] = two_side_update_long_message_record.bid_price_long[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> wire[at] = two_side_update_long_message_record.bid_quantity_long[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> wire[at] = two_side_update_long_message_record.ask_price_long[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> wire[at] = two_side_update_long_message_record.ask_quantity_long[two_side_update_long_message_at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Two Side Update Long Message off the wire, 34 bytes from where the cursor stands */
inline decode_two_side_update_long_message(two_side_update_long_message_record) {
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.time_offset[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 6 -> two_side_update_long_message_record.symbol[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.bid_price_long[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.bid_quantity_long[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> two_side_update_long_message_record.ask_price_long[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> two_side_update_long_message_record.ask_quantity_long[two_side_update_long_message_at] = wire[at]; at = at + 1; two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Two Side Update Long Message is what was written, byte for byte */
inline equal_two_side_update_long_message(two_side_update_long_message_read, two_side_update_long_message_written) {
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> assert(two_side_update_long_message_read.time_offset[two_side_update_long_message_at] == two_side_update_long_message_written.time_offset[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 6 -> assert(two_side_update_long_message_read.symbol[two_side_update_long_message_at] == two_side_update_long_message_written.symbol[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> assert(two_side_update_long_message_read.bid_price_long[two_side_update_long_message_at] == two_side_update_long_message_written.bid_price_long[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> assert(two_side_update_long_message_read.bid_quantity_long[two_side_update_long_message_at] == two_side_update_long_message_written.bid_quantity_long[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 8 -> assert(two_side_update_long_message_read.ask_price_long[two_side_update_long_message_at] == two_side_update_long_message_written.ask_price_long[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  two_side_update_long_message_at = 0;
  do
  :: two_side_update_long_message_at < 4 -> assert(two_side_update_long_message_read.ask_quantity_long[two_side_update_long_message_at] == two_side_update_long_message_written.ask_quantity_long[two_side_update_long_message_at]); two_side_update_long_message_at = two_side_update_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Trade Message: 35 bytes --------------------------------------------- */

/* The TOP Trade message provides information about executions of orders on the CFE book. TOP Trade messages are necessary to calculate CFE execution-based data. */
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

/* ---- Settlement Message: 23 bytes -------------------------------------------- */

/* Settlement messages are used to provide information concerning indicative, approved, or corrected daily and final settlement prices for CFE products. */
typedef SettlementMessage {
  byte time_offset[4];
  byte symbol[6];
  byte trade_date[4];
  byte settlement_price[8];
  byte issue
};

int settlement_message_at;

/* every byte of Settlement Message set to one value */
inline fill_settlement_message(settlement_message_record, settlement_message_value) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = settlement_message_value; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = settlement_message_value;
  skip
}

/* each byte of Settlement Message set to where it lies, so a field read out of place says so */
inline ramp_settlement_message(settlement_message_record, settlement_message_base) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = (settlement_message_base + 0 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = (settlement_message_base + 4 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = (settlement_message_base + 10 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = (settlement_message_base + 14 + settlement_message_at + 1) % 256; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = (settlement_message_base + 22 + 1) % 256;
  skip
}

/* Settlement Message to the wire, 23 bytes from where the cursor stands */
inline encode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.time_offset[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> wire[at] = settlement_message_record.symbol[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> wire[at] = settlement_message_record.trade_date[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> wire[at] = settlement_message_record.settlement_price[settlement_message_at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  wire[at] = settlement_message_record.issue; at = at + 1;
  skip
}

/* Settlement Message off the wire, 23 bytes from where the cursor stands */
inline decode_settlement_message(settlement_message_record) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.time_offset[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> settlement_message_record.symbol[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> settlement_message_record.trade_date[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> settlement_message_record.settlement_price[settlement_message_at] = wire[at]; at = at + 1; settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_record.issue = wire[at]; at = at + 1;
  skip
}

/* what was read of Settlement Message is what was written, byte for byte */
inline equal_settlement_message(settlement_message_read, settlement_message_written) {
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.time_offset[settlement_message_at] == settlement_message_written.time_offset[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 6 -> assert(settlement_message_read.symbol[settlement_message_at] == settlement_message_written.symbol[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 4 -> assert(settlement_message_read.trade_date[settlement_message_at] == settlement_message_written.trade_date[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  settlement_message_at = 0;
  do
  :: settlement_message_at < 8 -> assert(settlement_message_read.settlement_price[settlement_message_at] == settlement_message_written.settlement_price[settlement_message_at]); settlement_message_at = settlement_message_at + 1
  :: else -> break
  od;
  assert(settlement_message_read.issue == settlement_message_written.issue);
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a Futures contract. */
typedef TradingStatusMessage {
  byte time_offset[4];
  byte symbol[6];
  byte reserved_2[2];
  byte trading_status;
  byte reserved_3[3]
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = (trading_status_message_base + 13 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved_3[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved_3[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
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
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved_3[trading_status_message_at] == trading_status_message_written.reserved_3[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Open Interest Message: 18 bytes ----------------------------------------- */

/* The Open Interest message is sent to communicate a symbol's open interest, usually for the prior trading date. */
typedef OpenInterestMessage {
  byte time_offset[4];
  byte symbol[6];
  byte trade_date[4];
  byte open_interest[4]
};

int open_interest_message_at;

/* every byte of Open Interest Message set to one value */
inline fill_open_interest_message(open_interest_message_record, open_interest_message_value) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.time_offset[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.symbol[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.trade_date[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = open_interest_message_value; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Open Interest Message set to where it lies, so a field read out of place says so */
inline ramp_open_interest_message(open_interest_message_record, open_interest_message_base) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.time_offset[open_interest_message_at] = (open_interest_message_base + 0 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.symbol[open_interest_message_at] = (open_interest_message_base + 4 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.trade_date[open_interest_message_at] = (open_interest_message_base + 10 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = (open_interest_message_base + 14 + open_interest_message_at + 1) % 256; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message to the wire, 18 bytes from where the cursor stands */
inline encode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.time_offset[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> wire[at] = open_interest_message_record.symbol[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.trade_date[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> wire[at] = open_interest_message_record.open_interest[open_interest_message_at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* Open Interest Message off the wire, 18 bytes from where the cursor stands */
inline decode_open_interest_message(open_interest_message_record) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.time_offset[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> open_interest_message_record.symbol[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.trade_date[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> open_interest_message_record.open_interest[open_interest_message_at] = wire[at]; at = at + 1; open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Open Interest Message is what was written, byte for byte */
inline equal_open_interest_message(open_interest_message_read, open_interest_message_written) {
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.time_offset[open_interest_message_at] == open_interest_message_written.time_offset[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 6 -> assert(open_interest_message_read.symbol[open_interest_message_at] == open_interest_message_written.symbol[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.trade_date[open_interest_message_at] == open_interest_message_written.trade_date[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  open_interest_message_at = 0;
  do
  :: open_interest_message_at < 4 -> assert(open_interest_message_read.open_interest[open_interest_message_at] == open_interest_message_written.open_interest[open_interest_message_at]); open_interest_message_at = open_interest_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Session Message: 4 bytes ----------------------------------------- */

/* The End of Session message is sent for each unit when the unit shuts down. No more sequenced messages will be delivered for this unit, but heartbeats from the unit may be received. */
typedef EndOfSessionMessage {
  byte timestamp[4]
};

int end_of_session_message_at;

/* every byte of End Of Session Message set to one value */
inline fill_end_of_session_message(end_of_session_message_record, end_of_session_message_value) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.timestamp[end_of_session_message_at] = end_of_session_message_value; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Session Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_session_message(end_of_session_message_record, end_of_session_message_base) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.timestamp[end_of_session_message_at] = (end_of_session_message_base + 0 + end_of_session_message_at + 1) % 256; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> wire[at] = end_of_session_message_record.timestamp[end_of_session_message_at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Session Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_session_message(end_of_session_message_record) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> end_of_session_message_record.timestamp[end_of_session_message_at] = wire[at]; at = at + 1; end_of_session_message_at = end_of_session_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Session Message is what was written, byte for byte */
inline equal_end_of_session_message(end_of_session_message_read, end_of_session_message_written) {
  end_of_session_message_at = 0;
  do
  :: end_of_session_message_at < 4 -> assert(end_of_session_message_read.timestamp[end_of_session_message_at] == end_of_session_message_written.timestamp[end_of_session_message_at]); end_of_session_message_at = end_of_session_message_at + 1
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

/* Futures Variance Symbol Mapping Message: encoded, read back, and compared */
proctype check_futures_variance_symbol_mapping_message() {
  FuturesVarianceSymbolMappingMessage futures_variance_symbol_mapping_message_sent;
  FuturesVarianceSymbolMappingMessage futures_variance_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 255)
  :: else -> ramp_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_sent);
    assert(at == 38);
    at = 0;
    decode_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_got);
    assert(at == 38);
    equal_futures_variance_symbol_mapping_message(futures_variance_symbol_mapping_message_got, futures_variance_symbol_mapping_message_sent)
  }
}

/* Price Limits Message: encoded, read back, and compared */
proctype check_price_limits_message() {
  PriceLimitsMessage price_limits_message_sent;
  PriceLimitsMessage price_limits_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_limits_message(price_limits_message_sent, 0)
  :: pattern == 1 -> fill_price_limits_message(price_limits_message_sent, 32)
  :: pattern == 2 -> fill_price_limits_message(price_limits_message_sent, 255)
  :: else -> ramp_price_limits_message(price_limits_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_limits_message(price_limits_message_sent);
    assert(at == 26);
    at = 0;
    decode_price_limits_message(price_limits_message_got);
    assert(at == 26);
    equal_price_limits_message(price_limits_message_got, price_limits_message_sent)
  }
}

/* Market Snapshot Short Message: encoded, read back, and compared */
proctype check_market_snapshot_short_message() {
  MarketSnapshotShortMessage market_snapshot_short_message_sent;
  MarketSnapshotShortMessage market_snapshot_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_snapshot_short_message(market_snapshot_short_message_sent, 0)
  :: pattern == 1 -> fill_market_snapshot_short_message(market_snapshot_short_message_sent, 32)
  :: pattern == 2 -> fill_market_snapshot_short_message(market_snapshot_short_message_sent, 255)
  :: else -> ramp_market_snapshot_short_message(market_snapshot_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_snapshot_short_message(market_snapshot_short_message_sent);
    assert(at == 35);
    at = 0;
    decode_market_snapshot_short_message(market_snapshot_short_message_got);
    assert(at == 35);
    equal_market_snapshot_short_message(market_snapshot_short_message_got, market_snapshot_short_message_sent)
  }
}

/* Market Snapshot Long Message: encoded, read back, and compared */
proctype check_market_snapshot_long_message() {
  MarketSnapshotLongMessage market_snapshot_long_message_sent;
  MarketSnapshotLongMessage market_snapshot_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_snapshot_long_message(market_snapshot_long_message_sent, 0)
  :: pattern == 1 -> fill_market_snapshot_long_message(market_snapshot_long_message_sent, 32)
  :: pattern == 2 -> fill_market_snapshot_long_message(market_snapshot_long_message_sent, 255)
  :: else -> ramp_market_snapshot_long_message(market_snapshot_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_snapshot_long_message(market_snapshot_long_message_sent);
    assert(at == 59);
    at = 0;
    decode_market_snapshot_long_message(market_snapshot_long_message_got);
    assert(at == 59);
    equal_market_snapshot_long_message(market_snapshot_long_message_got, market_snapshot_long_message_sent)
  }
}

/* Single Side Update Short Message: encoded, read back, and compared */
proctype check_single_side_update_short_message() {
  SingleSideUpdateShortMessage single_side_update_short_message_sent;
  SingleSideUpdateShortMessage single_side_update_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_short_message(single_side_update_short_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_short_message(single_side_update_short_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_short_message(single_side_update_short_message_sent, 255)
  :: else -> ramp_single_side_update_short_message(single_side_update_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_short_message(single_side_update_short_message_sent);
    assert(at == 15);
    at = 0;
    decode_single_side_update_short_message(single_side_update_short_message_got);
    assert(at == 15);
    equal_single_side_update_short_message(single_side_update_short_message_got, single_side_update_short_message_sent)
  }
}

/* Single Side Update Long Message: encoded, read back, and compared */
proctype check_single_side_update_long_message() {
  SingleSideUpdateLongMessage single_side_update_long_message_sent;
  SingleSideUpdateLongMessage single_side_update_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_single_side_update_long_message(single_side_update_long_message_sent, 0)
  :: pattern == 1 -> fill_single_side_update_long_message(single_side_update_long_message_sent, 32)
  :: pattern == 2 -> fill_single_side_update_long_message(single_side_update_long_message_sent, 255)
  :: else -> ramp_single_side_update_long_message(single_side_update_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_single_side_update_long_message(single_side_update_long_message_sent);
    assert(at == 23);
    at = 0;
    decode_single_side_update_long_message(single_side_update_long_message_got);
    assert(at == 23);
    equal_single_side_update_long_message(single_side_update_long_message_got, single_side_update_long_message_sent)
  }
}

/* Two Side Update Short Message: encoded, read back, and compared */
proctype check_two_side_update_short_message() {
  TwoSideUpdateShortMessage two_side_update_short_message_sent;
  TwoSideUpdateShortMessage two_side_update_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_two_side_update_short_message(two_side_update_short_message_sent, 0)
  :: pattern == 1 -> fill_two_side_update_short_message(two_side_update_short_message_sent, 32)
  :: pattern == 2 -> fill_two_side_update_short_message(two_side_update_short_message_sent, 255)
  :: else -> ramp_two_side_update_short_message(two_side_update_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_two_side_update_short_message(two_side_update_short_message_sent);
    assert(at == 18);
    at = 0;
    decode_two_side_update_short_message(two_side_update_short_message_got);
    assert(at == 18);
    equal_two_side_update_short_message(two_side_update_short_message_got, two_side_update_short_message_sent)
  }
}

/* Two Side Update Long Message: encoded, read back, and compared */
proctype check_two_side_update_long_message() {
  TwoSideUpdateLongMessage two_side_update_long_message_sent;
  TwoSideUpdateLongMessage two_side_update_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_two_side_update_long_message(two_side_update_long_message_sent, 0)
  :: pattern == 1 -> fill_two_side_update_long_message(two_side_update_long_message_sent, 32)
  :: pattern == 2 -> fill_two_side_update_long_message(two_side_update_long_message_sent, 255)
  :: else -> ramp_two_side_update_long_message(two_side_update_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_two_side_update_long_message(two_side_update_long_message_sent);
    assert(at == 34);
    at = 0;
    decode_two_side_update_long_message(two_side_update_long_message_got);
    assert(at == 34);
    equal_two_side_update_long_message(two_side_update_long_message_got, two_side_update_long_message_sent)
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

/* Settlement Message: encoded, read back, and compared */
proctype check_settlement_message() {
  SettlementMessage settlement_message_sent;
  SettlementMessage settlement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_settlement_message(settlement_message_sent, 0)
  :: pattern == 1 -> fill_settlement_message(settlement_message_sent, 32)
  :: pattern == 2 -> fill_settlement_message(settlement_message_sent, 255)
  :: else -> ramp_settlement_message(settlement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_settlement_message(settlement_message_sent);
    assert(at == 23);
    at = 0;
    decode_settlement_message(settlement_message_got);
    assert(at == 23);
    equal_settlement_message(settlement_message_got, settlement_message_sent)
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

/* Open Interest Message: encoded, read back, and compared */
proctype check_open_interest_message() {
  OpenInterestMessage open_interest_message_sent;
  OpenInterestMessage open_interest_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_open_interest_message(open_interest_message_sent, 0)
  :: pattern == 1 -> fill_open_interest_message(open_interest_message_sent, 32)
  :: pattern == 2 -> fill_open_interest_message(open_interest_message_sent, 255)
  :: else -> ramp_open_interest_message(open_interest_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_open_interest_message(open_interest_message_sent);
    assert(at == 18);
    at = 0;
    decode_open_interest_message(open_interest_message_got);
    assert(at == 18);
    equal_open_interest_message(open_interest_message_got, open_interest_message_sent)
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_unit_clear_message()
  :: run check_futures_variance_symbol_mapping_message()
  :: run check_price_limits_message()
  :: run check_market_snapshot_short_message()
  :: run check_market_snapshot_long_message()
  :: run check_single_side_update_short_message()
  :: run check_single_side_update_long_message()
  :: run check_two_side_update_short_message()
  :: run check_two_side_update_long_message()
  :: run check_top_trade_message()
  :: run check_settlement_message()
  :: run check_trading_status_message()
  :: run check_open_interest_message()
  :: run check_end_of_session_message()
  fi
}
