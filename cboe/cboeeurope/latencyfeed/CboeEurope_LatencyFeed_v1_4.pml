/*
 * Chicago Board Options Exchange Multicast Latency Feed
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 110

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

/* ---- Latency Stat Message: 110 bytes ----------------------------------------- */

/* A Latency Stat Message demonstrates performance for a specific Matching Engine unit for a specific timeframe */
typedef LatencyStatMessage {
  byte measurement_type;
  byte matching_unit;
  byte begin_time[4];
  byte end_time[4];
  byte count[4];
  byte minimum[8];
  byte maximum[8];
  byte average[8];
  byte standard_deviation[8];
  byte mode[8];
  byte percentile_99_point_9[8];
  byte percentile_99[8];
  byte percentile_95[8];
  byte percentile_90[8];
  byte percentile_75[8];
  byte percentile_50[8];
  byte percentile_25[8]
};

int latency_stat_message_at;

/* every byte of Latency Stat Message set to one value */
inline fill_latency_stat_message(latency_stat_message_record, latency_stat_message_value) {
  latency_stat_message_record.measurement_type = latency_stat_message_value;
  latency_stat_message_record.matching_unit = latency_stat_message_value;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.begin_time[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.end_time[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.count[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.minimum[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.maximum[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.average[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.standard_deviation[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.mode[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99_point_9[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_95[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_90[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_75[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_50[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_25[latency_stat_message_at] = latency_stat_message_value; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Latency Stat Message set to where it lies, so a field read out of place says so */
inline ramp_latency_stat_message(latency_stat_message_record, latency_stat_message_base) {
  latency_stat_message_record.measurement_type = (latency_stat_message_base + 0 + 1) % 256;
  latency_stat_message_record.matching_unit = (latency_stat_message_base + 1 + 1) % 256;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.begin_time[latency_stat_message_at] = (latency_stat_message_base + 2 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.end_time[latency_stat_message_at] = (latency_stat_message_base + 6 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.count[latency_stat_message_at] = (latency_stat_message_base + 10 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.minimum[latency_stat_message_at] = (latency_stat_message_base + 14 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.maximum[latency_stat_message_at] = (latency_stat_message_base + 22 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.average[latency_stat_message_at] = (latency_stat_message_base + 30 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.standard_deviation[latency_stat_message_at] = (latency_stat_message_base + 38 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.mode[latency_stat_message_at] = (latency_stat_message_base + 46 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99_point_9[latency_stat_message_at] = (latency_stat_message_base + 54 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99[latency_stat_message_at] = (latency_stat_message_base + 62 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_95[latency_stat_message_at] = (latency_stat_message_base + 70 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_90[latency_stat_message_at] = (latency_stat_message_base + 78 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_75[latency_stat_message_at] = (latency_stat_message_base + 86 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_50[latency_stat_message_at] = (latency_stat_message_base + 94 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_25[latency_stat_message_at] = (latency_stat_message_base + 102 + latency_stat_message_at + 1) % 256; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Latency Stat Message to the wire, 110 bytes from where the cursor stands */
inline encode_latency_stat_message(latency_stat_message_record) {
  wire[at] = latency_stat_message_record.measurement_type; at = at + 1;
  wire[at] = latency_stat_message_record.matching_unit; at = at + 1;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> wire[at] = latency_stat_message_record.begin_time[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> wire[at] = latency_stat_message_record.end_time[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> wire[at] = latency_stat_message_record.count[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.minimum[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.maximum[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.average[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.standard_deviation[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.mode[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_99_point_9[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_99[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_95[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_90[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_75[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_50[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> wire[at] = latency_stat_message_record.percentile_25[latency_stat_message_at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Latency Stat Message off the wire, 110 bytes from where the cursor stands */
inline decode_latency_stat_message(latency_stat_message_record) {
  latency_stat_message_record.measurement_type = wire[at]; at = at + 1;
  latency_stat_message_record.matching_unit = wire[at]; at = at + 1;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.begin_time[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.end_time[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> latency_stat_message_record.count[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.minimum[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.maximum[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.average[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.standard_deviation[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.mode[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99_point_9[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_99[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_95[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_90[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_75[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_50[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> latency_stat_message_record.percentile_25[latency_stat_message_at] = wire[at]; at = at + 1; latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Latency Stat Message is what was written, byte for byte */
inline equal_latency_stat_message(latency_stat_message_read, latency_stat_message_written) {
  assert(latency_stat_message_read.measurement_type == latency_stat_message_written.measurement_type);
  assert(latency_stat_message_read.matching_unit == latency_stat_message_written.matching_unit);
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> assert(latency_stat_message_read.begin_time[latency_stat_message_at] == latency_stat_message_written.begin_time[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> assert(latency_stat_message_read.end_time[latency_stat_message_at] == latency_stat_message_written.end_time[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 4 -> assert(latency_stat_message_read.count[latency_stat_message_at] == latency_stat_message_written.count[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.minimum[latency_stat_message_at] == latency_stat_message_written.minimum[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.maximum[latency_stat_message_at] == latency_stat_message_written.maximum[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.average[latency_stat_message_at] == latency_stat_message_written.average[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.standard_deviation[latency_stat_message_at] == latency_stat_message_written.standard_deviation[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.mode[latency_stat_message_at] == latency_stat_message_written.mode[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_99_point_9[latency_stat_message_at] == latency_stat_message_written.percentile_99_point_9[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_99[latency_stat_message_at] == latency_stat_message_written.percentile_99[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_95[latency_stat_message_at] == latency_stat_message_written.percentile_95[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_90[latency_stat_message_at] == latency_stat_message_written.percentile_90[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_75[latency_stat_message_at] == latency_stat_message_written.percentile_75[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_50[latency_stat_message_at] == latency_stat_message_written.percentile_50[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
  :: else -> break
  od;
  latency_stat_message_at = 0;
  do
  :: latency_stat_message_at < 8 -> assert(latency_stat_message_read.percentile_25[latency_stat_message_at] == latency_stat_message_written.percentile_25[latency_stat_message_at]); latency_stat_message_at = latency_stat_message_at + 1
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

/* Latency Stat Message: encoded, read back, and compared */
proctype check_latency_stat_message() {
  LatencyStatMessage latency_stat_message_sent;
  LatencyStatMessage latency_stat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_latency_stat_message(latency_stat_message_sent, 0)
  :: pattern == 1 -> fill_latency_stat_message(latency_stat_message_sent, 32)
  :: pattern == 2 -> fill_latency_stat_message(latency_stat_message_sent, 255)
  :: else -> ramp_latency_stat_message(latency_stat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_latency_stat_message(latency_stat_message_sent);
    assert(at == 110);
    at = 0;
    decode_latency_stat_message(latency_stat_message_got);
    assert(at == 110);
    equal_latency_stat_message(latency_stat_message_got, latency_stat_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_latency_stat_message()
  fi
}
