/*
 * Chicago Board Options Exchange OOF Multicast Top
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
 *   - a Reassemble rule
 *   - a run filling what frames it
 *   - a run counted by a field
 *   - a field read in bits
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

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Time messages for the same unit will the use the last Midnight Reference until another Time Reference message is received for that unit. The Time Reference message includes the Trade Date, so most other sequenced messages will not include that information. Time Reference messages will be included in a spin response. */
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

/* A Time message is immediately generated and sent when there is a TOP event for a given clock second. If there is no new sequenced TOP event for a given clock second, then no Time message is sent for that second. All subsequent Time Offset fields for the same unit will use the new Time value as the base until another Time message is received for the same unit. The Time field is the number of seconds relative to midnight Central Time, which is provided in the Time Reference message. The Time message also includes the Epoch Time field, which is the current time represented as the number of whole seconds since the Epoch (Midnight January 1, 1970). */
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

/* ---- Oof Symbol Mapping Message: 58 bytes ------------------------------------ */

/* An OOF Symbol Mapping message is used to map the 6 character multicast feed symbol field and options on futures name to the option contract and future underlying. The option contract is comprised of the strike price, put/call flag, options expiration date, and future underlying. The future underlying is comprised of the futures product and futures expiration date, which map to a futures symbol. This message can be sent either as a sequenced message or as an unsequenced message. It is sent as a sequenced message at system startup upon the beginning of a trading session or if an instrument is created or modified during a trading day. A new sequenced message may also be sent for a symbol that does not visibly change any attribute. A continuous loop of unsequenced symbol mapping messages (sequence = 0) is sent throughout the day at variable rates as bandwidth allows. The Time Offset field should be ignored on unsequenced messages. OOF Symbol Mapping messages are included in a spin response and will be disseminated before Complex Instrument Definition Expanded messages. */
typedef OofSymbolMappingMessage {
  byte time_offset[4];
  byte feed_symbol[6];
  byte futures_product[8];
  byte futures_expiration[4];
  byte futures_symbol[6];
  byte strike_price[8];
  byte call_put_indicator;
  byte options_expiration[4];
  byte options_on_futures_name[16];
  byte symbol_condition
};

int oof_symbol_mapping_message_at;

/* every byte of Oof Symbol Mapping Message set to one value */
inline fill_oof_symbol_mapping_message(oof_symbol_mapping_message_record, oof_symbol_mapping_message_value) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = oof_symbol_mapping_message_value;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = oof_symbol_mapping_message_value; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = oof_symbol_mapping_message_value;
  skip
}

/* each byte of Oof Symbol Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_oof_symbol_mapping_message(oof_symbol_mapping_message_record, oof_symbol_mapping_message_base) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 0 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 4 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 10 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 18 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 22 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 28 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = (oof_symbol_mapping_message_base + 36 + 1) % 256;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 37 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = (oof_symbol_mapping_message_base + 41 + oof_symbol_mapping_message_at + 1) % 256; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = (oof_symbol_mapping_message_base + 57 + 1) % 256;
  skip
}

/* Oof Symbol Mapping Message to the wire, 58 bytes from where the cursor stands */
inline encode_oof_symbol_mapping_message(oof_symbol_mapping_message_record) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> wire[at] = oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> wire[at] = oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> wire[at] = oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> wire[at] = oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = oof_symbol_mapping_message_record.call_put_indicator; at = at + 1;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> wire[at] = oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> wire[at] = oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  wire[at] = oof_symbol_mapping_message_record.symbol_condition; at = at + 1;
  skip
}

/* Oof Symbol Mapping Message off the wire, 58 bytes from where the cursor stands */
inline decode_oof_symbol_mapping_message(oof_symbol_mapping_message_record) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.time_offset[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.feed_symbol[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.futures_product[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.futures_expiration[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> oof_symbol_mapping_message_record.futures_symbol[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> oof_symbol_mapping_message_record.strike_price[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.call_put_indicator = wire[at]; at = at + 1;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> oof_symbol_mapping_message_record.options_expiration[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> oof_symbol_mapping_message_record.options_on_futures_name[oof_symbol_mapping_message_at] = wire[at]; at = at + 1; oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_record.symbol_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Oof Symbol Mapping Message is what was written, byte for byte */
inline equal_oof_symbol_mapping_message(oof_symbol_mapping_message_read, oof_symbol_mapping_message_written) {
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.time_offset[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.time_offset[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> assert(oof_symbol_mapping_message_read.feed_symbol[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.feed_symbol[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> assert(oof_symbol_mapping_message_read.futures_product[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_product[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.futures_expiration[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_expiration[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 6 -> assert(oof_symbol_mapping_message_read.futures_symbol[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.futures_symbol[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 8 -> assert(oof_symbol_mapping_message_read.strike_price[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.strike_price[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(oof_symbol_mapping_message_read.call_put_indicator == oof_symbol_mapping_message_written.call_put_indicator);
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 4 -> assert(oof_symbol_mapping_message_read.options_expiration[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.options_expiration[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  oof_symbol_mapping_message_at = 0;
  do
  :: oof_symbol_mapping_message_at < 16 -> assert(oof_symbol_mapping_message_read.options_on_futures_name[oof_symbol_mapping_message_at] == oof_symbol_mapping_message_written.options_on_futures_name[oof_symbol_mapping_message_at]); oof_symbol_mapping_message_at = oof_symbol_mapping_message_at + 1
  :: else -> break
  od;
  assert(oof_symbol_mapping_message_read.symbol_condition == oof_symbol_mapping_message_written.symbol_condition);
  skip
}

/* ---- Trading Status Message: 16 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a symbol. A Trading Status message will be sent for all symbols as they transition through various trading states. If a Trading Status message has not been received for a symbol, then the Trading Status for the symbol should be assumed to be H = Halted. The following summarizes the Trading Status values for options in the CFE system: H = Halted state. This state is used for Supervisory Halts initiated by the Trade Desk. Orders are not being accepted in this state. Q = Queuing state. This state is used when orders are being accepted for queuing. The Queuing state is used during the pre-open for all symbols. It is also used for spread instruments that may not be tradeable due to Threshold Width. T = Trading state. This state is used when the symbol is available for trading. CFE will send a Trading Status of Q once orders can be accepted for queuing in preparation for the open. At or after the opening time, CFE will send a Trading Status of T as symbols are opened for trading. Once trading is done for the day CFE will send a Trading Status of H indicating the symbol is Halted. */
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

/* ---- Single Side Update Short Message: 15 bytes ------------------------------ */

/* Single Side Update messages provide an updated price and size for a single side of a Symbol. The side is denoted by the Side field. One Single Side Update message may reflect one or more updates to the inside book that were processed at the same time, but will only be done so in a way that can be arbitrated between A/B feeds. Single Side Update messages come in two variants: Single Side Update (Long) message and Single Side Update (Short) message. The Single Side Update (Short) message is used whenever possible, but the Single Side Update (Long) message is used whenever the Price cannot be represented by a Binary Short Price or the Quantity cannot be represented by an unsigned 16-bit integer. */
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

/* Single Side Update messages provide an updated price and size for a single side of a Symbol. The side is denoted by the Side field. One Single Side Update message may reflect one or more updates to the inside book that were processed at the same time, but will only be done so in a way that can be arbitrated between A/B feeds. Single Side Update messages come in two variants: Single Side Update (Long) message and Single Side Update (Short) message. The Single Side Update (Short) message is used whenever possible, but the Single Side Update (Long) message is used whenever the Price cannot be represented by a Binary Short Price or the Quantity cannot be represented by an unsigned 16-bit integer. */
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

/* Two Side Update messages provide an updated price and size for both sides of a Symbol. One Two Side Update message may reflect one or more updates to the inside book that were processed at the same time, but will only be done so in a way that can be arbitrated between A/B feeds. Two Side Update messages come in two variants: Two Side Update (Long) message and Two Side Update (Short) message. The Two Side Update (Short) message is used whenever possible, but the Two Side Update (Long) message is used whenever the Price cannot be represented by a Binary Short Price or the Quantity cannot be represented by an unsigned 16-bit integer. */
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

/* Two Side Update messages provide an updated price and size for both sides of a Symbol. One Two Side Update message may reflect one or more updates to the inside book that were processed at the same time, but will only be done so in a way that can be arbitrated between A/B feeds. Two Side Update messages come in two variants: Two Side Update (Long) message and Two Side Update (Short) message. The Two Side Update (Short) message is used whenever possible, but the Two Side Update (Long) message is used whenever the Price cannot be represented by a Binary Short Price or the Quantity cannot be represented by an unsigned 16-bit integer. */
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

/* ---- Settlement Message: 23 bytes -------------------------------------------- */

/* Settlement messages are used to provide information concerning indicative, approved, or corrected daily and final settlement prices for CFE products. An indicative daily settlement price (Issue = I) is calculated by the system and sent immediately after an instrument closes trading but before the settlement price is approved. An approved settlement price (Issue = S) is sent once the CFE Trade Desk approves a settlement price for an instrument. If there is an error in the approved settlement price, then it may be re-issued (Issue = R). Settlement messages will be included in a spin response. */
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

/* ---- Login Message: 20 bytes ------------------------------------------------- */

/* The Login message is the first message sent to the GRP by a user's process after the connection to the GRP is established. Failure to login before sending any other message type will result in the connection being dropped by the GRP. */
typedef LoginMessage {
  byte session_sub_id[4];
  byte username[4];
  byte filler[2];
  byte password[10]
};

int login_message_at;

/* every byte of Login Message set to one value */
inline fill_login_message(login_message_record, login_message_value) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = login_message_value; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Message set to where it lies, so a field read out of place says so */
inline ramp_login_message(login_message_record, login_message_base) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = (login_message_base + 0 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = (login_message_base + 4 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = (login_message_base + 8 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = (login_message_base + 10 + login_message_at + 1) % 256; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message to the wire, 20 bytes from where the cursor stands */
inline encode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.session_sub_id[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> wire[at] = login_message_record.username[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> wire[at] = login_message_record.filler[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> wire[at] = login_message_record.password[login_message_at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Message off the wire, 20 bytes from where the cursor stands */
inline decode_login_message(login_message_record) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.session_sub_id[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> login_message_record.username[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> login_message_record.filler[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> login_message_record.password[login_message_at] = wire[at]; at = at + 1; login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Message is what was written, byte for byte */
inline equal_login_message(login_message_read, login_message_written) {
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.session_sub_id[login_message_at] == login_message_written.session_sub_id[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 4 -> assert(login_message_read.username[login_message_at] == login_message_written.username[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 2 -> assert(login_message_read.filler[login_message_at] == login_message_written.filler[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  login_message_at = 0;
  do
  :: login_message_at < 10 -> assert(login_message_read.password[login_message_at] == login_message_written.password[login_message_at]); login_message_at = login_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 1 bytes ----------------------------------------- */

/* The Login Response message is sent by the GRP to a user's process in response to a Login message. The status field is used to reflect an accepted login or the reason the session was not accepted. If login fails, the connection will be dropped after the Login Response message is sent. */
typedef LoginResponseMessage {
  byte login_response_status
};

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_record.login_response_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_record.login_response_status = (login_response_message_base + 0 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 1 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  wire[at] = login_response_message_record.login_response_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 1 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_record.login_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  assert(login_response_message_read.login_response_status == login_response_message_written.login_response_status);
  skip
}

/* ---- Spin Image Available Message: 4 bytes ----------------------------------- */

/* The Spin Image Available message is sent once per second and indicates through what sequence number a spin is available. */
typedef SpinImageAvailableMessage {
  byte sequence[4]
};

int spin_image_available_message_at;

/* every byte of Spin Image Available Message set to one value */
inline fill_spin_image_available_message(spin_image_available_message_record, spin_image_available_message_value) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = spin_image_available_message_value; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Image Available Message set to where it lies, so a field read out of place says so */
inline ramp_spin_image_available_message(spin_image_available_message_record, spin_image_available_message_base) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = (spin_image_available_message_base + 0 + spin_image_available_message_at + 1) % 256; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Image Available Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_image_available_message(spin_image_available_message_record) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> wire[at] = spin_image_available_message_record.sequence[spin_image_available_message_at]; at = at + 1; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Image Available Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_image_available_message(spin_image_available_message_record) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> spin_image_available_message_record.sequence[spin_image_available_message_at] = wire[at]; at = at + 1; spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Image Available Message is what was written, byte for byte */
inline equal_spin_image_available_message(spin_image_available_message_read, spin_image_available_message_written) {
  spin_image_available_message_at = 0;
  do
  :: spin_image_available_message_at < 4 -> assert(spin_image_available_message_read.sequence[spin_image_available_message_at] == spin_image_available_message_written.sequence[spin_image_available_message_at]); spin_image_available_message_at = spin_image_available_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spin Request Message: 4 bytes ------------------------------------------- */

/* The Spin Request message is used by a user's process to request transmission of a spin of the unit's order book. See to Spin Servers for more complete details regarding Sequence specification as well as buffering requirements. */
typedef SpinRequestMessage {
  byte sequence[4]
};

int spin_request_message_at;

/* every byte of Spin Request Message set to one value */
inline fill_spin_request_message(spin_request_message_record, spin_request_message_value) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = spin_request_message_value; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Request Message set to where it lies, so a field read out of place says so */
inline ramp_spin_request_message(spin_request_message_record, spin_request_message_base) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = (spin_request_message_base + 0 + spin_request_message_at + 1) % 256; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> wire[at] = spin_request_message_record.sequence[spin_request_message_at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.sequence[spin_request_message_at] = wire[at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Request Message is what was written, byte for byte */
inline equal_spin_request_message(spin_request_message_read, spin_request_message_written) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> assert(spin_request_message_read.sequence[spin_request_message_at] == spin_request_message_written.sequence[spin_request_message_at]); spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spin Response Message: 9 bytes ------------------------------------------ */

/* The Spin Response message is sent in response to a user's Spin Request message indicating whether a spin will be sent. */
typedef SpinResponseMessage {
  byte sequence[4];
  byte order_count[4];
  byte spin_response_status
};

int spin_response_message_at;

/* every byte of Spin Response Message set to one value */
inline fill_spin_response_message(spin_response_message_record, spin_response_message_value) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = spin_response_message_value; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = spin_response_message_value; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = spin_response_message_value;
  skip
}

/* each byte of Spin Response Message set to where it lies, so a field read out of place says so */
inline ramp_spin_response_message(spin_response_message_record, spin_response_message_base) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = (spin_response_message_base + 0 + spin_response_message_at + 1) % 256; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = (spin_response_message_base + 4 + spin_response_message_at + 1) % 256; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = (spin_response_message_base + 8 + 1) % 256;
  skip
}

/* Spin Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> wire[at] = spin_response_message_record.sequence[spin_response_message_at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> wire[at] = spin_response_message_record.order_count[spin_response_message_at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  wire[at] = spin_response_message_record.spin_response_status; at = at + 1;
  skip
}

/* Spin Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.sequence[spin_response_message_at] = wire[at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.order_count[spin_response_message_at] = wire[at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Spin Response Message is what was written, byte for byte */
inline equal_spin_response_message(spin_response_message_read, spin_response_message_written) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> assert(spin_response_message_read.sequence[spin_response_message_at] == spin_response_message_written.sequence[spin_response_message_at]); spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> assert(spin_response_message_read.order_count[spin_response_message_at] == spin_response_message_written.order_count[spin_response_message_at]); spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  assert(spin_response_message_read.spin_response_status == spin_response_message_written.spin_response_status);
  skip
}

/* ---- Spin Finished Message: 4 bytes ------------------------------------------ */

/* The Spin Finished message is sent to indicate that all messages for the spin requested have been sent. A Spin Finished message is only sent if a Spin Request message was not rejected. Upon receipt of a Spin Finished message, any buffered multicast messages should be applied to the participant's copy of the book to make it current. */
typedef SpinFinishedMessage {
  byte sequence[4]
};

int spin_finished_message_at;

/* every byte of Spin Finished Message set to one value */
inline fill_spin_finished_message(spin_finished_message_record, spin_finished_message_value) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = spin_finished_message_value; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Finished Message set to where it lies, so a field read out of place says so */
inline ramp_spin_finished_message(spin_finished_message_record, spin_finished_message_base) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = (spin_finished_message_base + 0 + spin_finished_message_at + 1) % 256; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Finished Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_finished_message(spin_finished_message_record) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> wire[at] = spin_finished_message_record.sequence[spin_finished_message_at]; at = at + 1; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Finished Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_finished_message(spin_finished_message_record) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> spin_finished_message_record.sequence[spin_finished_message_at] = wire[at]; at = at + 1; spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Finished Message is what was written, byte for byte */
inline equal_spin_finished_message(spin_finished_message_read, spin_finished_message_written) {
  spin_finished_message_at = 0;
  do
  :: spin_finished_message_at < 4 -> assert(spin_finished_message_read.sequence[spin_finished_message_at] == spin_finished_message_written.sequence[spin_finished_message_at]); spin_finished_message_at = spin_finished_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Definition Request Message: 4 bytes -------------------------- */

/* The Instrument Definition Request message is used to request transmission of this unit's OOF Symbol Mappings and Complex Instrument Definitions. All OOF Symbol Mapping messages will be sent before Complex Instrument Definition Expanded messages. Refer to Spin Servers for more complete details regarding Sequence specification as well as buffering requirements. */
typedef InstrumentDefinitionRequestMessage {
  byte sequence[4]
};

int instrument_definition_request_message_at;

/* every byte of Instrument Definition Request Message set to one value */
inline fill_instrument_definition_request_message(instrument_definition_request_message_record, instrument_definition_request_message_value) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = instrument_definition_request_message_value; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Definition Request Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition_request_message(instrument_definition_request_message_record, instrument_definition_request_message_base) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = (instrument_definition_request_message_base + 0 + instrument_definition_request_message_at + 1) % 256; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_instrument_definition_request_message(instrument_definition_request_message_record) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> wire[at] = instrument_definition_request_message_record.sequence[instrument_definition_request_message_at]; at = at + 1; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Definition Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_instrument_definition_request_message(instrument_definition_request_message_record) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> instrument_definition_request_message_record.sequence[instrument_definition_request_message_at] = wire[at]; at = at + 1; instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Definition Request Message is what was written, byte for byte */
inline equal_instrument_definition_request_message(instrument_definition_request_message_read, instrument_definition_request_message_written) {
  instrument_definition_request_message_at = 0;
  do
  :: instrument_definition_request_message_at < 4 -> assert(instrument_definition_request_message_read.sequence[instrument_definition_request_message_at] == instrument_definition_request_message_written.sequence[instrument_definition_request_message_at]); instrument_definition_request_message_at = instrument_definition_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Definition Response Message: 9 bytes ------------------------- */

/* The Instrument Definition Response message is sent in response to a user's Instrument Definition Request message indicating whether a spin will be sent. */
typedef InstrumentDefinitionResponseMessage {
  byte sequence[4];
  byte instrument_count[4];
  byte instrument_definition_response_status
};

int instrument_definition_response_message_at;

/* every byte of Instrument Definition Response Message set to one value */
inline fill_instrument_definition_response_message(instrument_definition_response_message_record, instrument_definition_response_message_value) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = instrument_definition_response_message_value; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = instrument_definition_response_message_value; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = instrument_definition_response_message_value;
  skip
}

/* each byte of Instrument Definition Response Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_definition_response_message(instrument_definition_response_message_record, instrument_definition_response_message_base) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = (instrument_definition_response_message_base + 0 + instrument_definition_response_message_at + 1) % 256; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = (instrument_definition_response_message_base + 4 + instrument_definition_response_message_at + 1) % 256; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = (instrument_definition_response_message_base + 8 + 1) % 256;
  skip
}

/* Instrument Definition Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_instrument_definition_response_message(instrument_definition_response_message_record) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> wire[at] = instrument_definition_response_message_record.sequence[instrument_definition_response_message_at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> wire[at] = instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  wire[at] = instrument_definition_response_message_record.instrument_definition_response_status; at = at + 1;
  skip
}

/* Instrument Definition Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_instrument_definition_response_message(instrument_definition_response_message_record) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.sequence[instrument_definition_response_message_at] = wire[at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> instrument_definition_response_message_record.instrument_count[instrument_definition_response_message_at] = wire[at]; at = at + 1; instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_record.instrument_definition_response_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Instrument Definition Response Message is what was written, byte for byte */
inline equal_instrument_definition_response_message(instrument_definition_response_message_read, instrument_definition_response_message_written) {
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> assert(instrument_definition_response_message_read.sequence[instrument_definition_response_message_at] == instrument_definition_response_message_written.sequence[instrument_definition_response_message_at]); instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  instrument_definition_response_message_at = 0;
  do
  :: instrument_definition_response_message_at < 4 -> assert(instrument_definition_response_message_read.instrument_count[instrument_definition_response_message_at] == instrument_definition_response_message_written.instrument_count[instrument_definition_response_message_at]); instrument_definition_response_message_at = instrument_definition_response_message_at + 1
  :: else -> break
  od;
  assert(instrument_definition_response_message_read.instrument_definition_response_status == instrument_definition_response_message_written.instrument_definition_response_status);
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

/* Oof Symbol Mapping Message: encoded, read back, and compared */
proctype check_oof_symbol_mapping_message() {
  OofSymbolMappingMessage oof_symbol_mapping_message_sent;
  OofSymbolMappingMessage oof_symbol_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 0)
  :: pattern == 1 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 32)
  :: pattern == 2 -> fill_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 255)
  :: else -> ramp_oof_symbol_mapping_message(oof_symbol_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_oof_symbol_mapping_message(oof_symbol_mapping_message_sent);
    assert(at == 58);
    at = 0;
    decode_oof_symbol_mapping_message(oof_symbol_mapping_message_got);
    assert(at == 58);
    equal_oof_symbol_mapping_message(oof_symbol_mapping_message_got, oof_symbol_mapping_message_sent)
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

/* Login Message: encoded, read back, and compared */
proctype check_login_message() {
  LoginMessage login_message_sent;
  LoginMessage login_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_message(login_message_sent, 0)
  :: pattern == 1 -> fill_login_message(login_message_sent, 32)
  :: pattern == 2 -> fill_login_message(login_message_sent, 255)
  :: else -> ramp_login_message(login_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_message(login_message_sent);
    assert(at == 20);
    at = 0;
    decode_login_message(login_message_got);
    assert(at == 20);
    equal_login_message(login_message_got, login_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 1);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 1);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Spin Image Available Message: encoded, read back, and compared */
proctype check_spin_image_available_message() {
  SpinImageAvailableMessage spin_image_available_message_sent;
  SpinImageAvailableMessage spin_image_available_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_image_available_message(spin_image_available_message_sent, 0)
  :: pattern == 1 -> fill_spin_image_available_message(spin_image_available_message_sent, 32)
  :: pattern == 2 -> fill_spin_image_available_message(spin_image_available_message_sent, 255)
  :: else -> ramp_spin_image_available_message(spin_image_available_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_image_available_message(spin_image_available_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_image_available_message(spin_image_available_message_got);
    assert(at == 4);
    equal_spin_image_available_message(spin_image_available_message_got, spin_image_available_message_sent)
  }
}

/* Spin Request Message: encoded, read back, and compared */
proctype check_spin_request_message() {
  SpinRequestMessage spin_request_message_sent;
  SpinRequestMessage spin_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_request_message(spin_request_message_sent, 0)
  :: pattern == 1 -> fill_spin_request_message(spin_request_message_sent, 32)
  :: pattern == 2 -> fill_spin_request_message(spin_request_message_sent, 255)
  :: else -> ramp_spin_request_message(spin_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_request_message(spin_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_request_message(spin_request_message_got);
    assert(at == 4);
    equal_spin_request_message(spin_request_message_got, spin_request_message_sent)
  }
}

/* Spin Response Message: encoded, read back, and compared */
proctype check_spin_response_message() {
  SpinResponseMessage spin_response_message_sent;
  SpinResponseMessage spin_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_response_message(spin_response_message_sent, 0)
  :: pattern == 1 -> fill_spin_response_message(spin_response_message_sent, 32)
  :: pattern == 2 -> fill_spin_response_message(spin_response_message_sent, 255)
  :: else -> ramp_spin_response_message(spin_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_response_message(spin_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_spin_response_message(spin_response_message_got);
    assert(at == 9);
    equal_spin_response_message(spin_response_message_got, spin_response_message_sent)
  }
}

/* Spin Finished Message: encoded, read back, and compared */
proctype check_spin_finished_message() {
  SpinFinishedMessage spin_finished_message_sent;
  SpinFinishedMessage spin_finished_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_finished_message(spin_finished_message_sent, 0)
  :: pattern == 1 -> fill_spin_finished_message(spin_finished_message_sent, 32)
  :: pattern == 2 -> fill_spin_finished_message(spin_finished_message_sent, 255)
  :: else -> ramp_spin_finished_message(spin_finished_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_finished_message(spin_finished_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_finished_message(spin_finished_message_got);
    assert(at == 4);
    equal_spin_finished_message(spin_finished_message_got, spin_finished_message_sent)
  }
}

/* Instrument Definition Request Message: encoded, read back, and compared */
proctype check_instrument_definition_request_message() {
  InstrumentDefinitionRequestMessage instrument_definition_request_message_sent;
  InstrumentDefinitionRequestMessage instrument_definition_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 0)
  :: pattern == 1 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 32)
  :: pattern == 2 -> fill_instrument_definition_request_message(instrument_definition_request_message_sent, 255)
  :: else -> ramp_instrument_definition_request_message(instrument_definition_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition_request_message(instrument_definition_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_instrument_definition_request_message(instrument_definition_request_message_got);
    assert(at == 4);
    equal_instrument_definition_request_message(instrument_definition_request_message_got, instrument_definition_request_message_sent)
  }
}

/* Instrument Definition Response Message: encoded, read back, and compared */
proctype check_instrument_definition_response_message() {
  InstrumentDefinitionResponseMessage instrument_definition_response_message_sent;
  InstrumentDefinitionResponseMessage instrument_definition_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 0)
  :: pattern == 1 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 32)
  :: pattern == 2 -> fill_instrument_definition_response_message(instrument_definition_response_message_sent, 255)
  :: else -> ramp_instrument_definition_response_message(instrument_definition_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_definition_response_message(instrument_definition_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_instrument_definition_response_message(instrument_definition_response_message_got);
    assert(at == 9);
    equal_instrument_definition_response_message(instrument_definition_response_message_got, instrument_definition_response_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_time_reference_message()
  :: run check_time_message()
  :: run check_oof_symbol_mapping_message()
  :: run check_trading_status_message()
  :: run check_single_side_update_short_message()
  :: run check_single_side_update_long_message()
  :: run check_two_side_update_short_message()
  :: run check_two_side_update_long_message()
  :: run check_settlement_message()
  :: run check_login_message()
  :: run check_login_response_message()
  :: run check_spin_image_available_message()
  :: run check_spin_request_message()
  :: run check_spin_response_message()
  :: run check_spin_finished_message()
  :: run check_instrument_definition_request_message()
  :: run check_instrument_definition_response_message()
  fi
}
