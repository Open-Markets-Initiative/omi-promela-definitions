/*
 * The Securities Industry Automation Corporation Snapshot
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
 *   - a run counted by a field
 *   - the dispatch that chooses a message by its type
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 96

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sip Block Timestamp: 8 bytes -------------------------------------------- */

/* Sip Block Timestamp */
typedef SipBlockTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int sip_block_timestamp_at;

/* every byte of Sip Block Timestamp set to one value */
inline fill_sip_block_timestamp(sip_block_timestamp_record, sip_block_timestamp_value) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = sip_block_timestamp_value; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = sip_block_timestamp_value; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sip Block Timestamp set to where it lies, so a field read out of place says so */
inline ramp_sip_block_timestamp(sip_block_timestamp_record, sip_block_timestamp_base) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = (sip_block_timestamp_base + 0 + sip_block_timestamp_at + 1) % 256; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = (sip_block_timestamp_base + 4 + sip_block_timestamp_at + 1) % 256; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Sip Block Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_sip_block_timestamp(sip_block_timestamp_record) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> wire[at] = sip_block_timestamp_record.seconds[sip_block_timestamp_at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> wire[at] = sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Sip Block Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_sip_block_timestamp(sip_block_timestamp_record) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.seconds[sip_block_timestamp_at] = wire[at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> sip_block_timestamp_record.nanoseconds[sip_block_timestamp_at] = wire[at]; at = at + 1; sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sip Block Timestamp is what was written, byte for byte */
inline equal_sip_block_timestamp(sip_block_timestamp_read, sip_block_timestamp_written) {
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> assert(sip_block_timestamp_read.seconds[sip_block_timestamp_at] == sip_block_timestamp_written.seconds[sip_block_timestamp_at]); sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  sip_block_timestamp_at = 0;
  do
  :: sip_block_timestamp_at < 4 -> assert(sip_block_timestamp_read.nanoseconds[sip_block_timestamp_at] == sip_block_timestamp_written.nanoseconds[sip_block_timestamp_at]); sip_block_timestamp_at = sip_block_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Block Header: 24 bytes -------------------------------------------------- */

/* Cqs Snapshot packet header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte block_sequence_number[4];
  byte messages_in_block;
  byte deliveryflag;
  byte lastseqnum[4];
  byte totpubseqrollover;
  SipBlockTimestamp sip_block_timestamp;
  byte block_checksum[2]
};

int block_header_at;

/* every byte of Block Header set to one value */
inline fill_block_header(block_header_record, block_header_value) {
  block_header_record.version = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
  block_header_record.deliveryflag = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.lastseqnum[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.totpubseqrollover = block_header_value;
  fill_sip_block_timestamp(block_header_record.sip_block_timestamp, block_header_value);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Block Header set to where it lies, so a field read out of place says so */
inline ramp_block_header(block_header_record, block_header_base) {
  block_header_record.version = (block_header_base + 0 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = (block_header_base + 1 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 3 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 7 + 1) % 256;
  block_header_record.deliveryflag = (block_header_base + 8 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.lastseqnum[block_header_at] = (block_header_base + 9 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.totpubseqrollover = (block_header_base + 13 + 1) % 256;
  ramp_sip_block_timestamp(block_header_record.sip_block_timestamp, block_header_base + 14);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 22 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 24 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  wire[at] = block_header_record.deliveryflag; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.lastseqnum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.totpubseqrollover; at = at + 1;
  encode_sip_block_timestamp(block_header_record.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 24 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
  block_header_record.deliveryflag = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.lastseqnum[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.totpubseqrollover = wire[at]; at = at + 1;
  decode_sip_block_timestamp(block_header_record.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Block Header is what was written, byte for byte */
inline equal_block_header(block_header_read, block_header_written) {
  assert(block_header_read.version == block_header_written.version);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_size[block_header_at] == block_header_written.block_size[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  assert(block_header_read.deliveryflag == block_header_written.deliveryflag);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.lastseqnum[block_header_at] == block_header_written.lastseqnum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.totpubseqrollover == block_header_written.totpubseqrollover);
  equal_sip_block_timestamp(block_header_read.sip_block_timestamp, block_header_written.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Line Integrity Message: 1 bytes ----------------------------------------- */

/* transmitted over the multicast lines at intervals of ten (10) seconds to verify continued integrity of multicast transmission */
typedef LineIntegrityMessage {
  byte participant_id
};

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  line_integrity_message_record.participant_id = line_integrity_message_value;
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  line_integrity_message_record.participant_id = (line_integrity_message_base + 0 + 1) % 256;
  skip
}

/* Line Integrity Message to the wire, 1 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  wire[at] = line_integrity_message_record.participant_id; at = at + 1;
  skip
}

/* Line Integrity Message off the wire, 1 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  line_integrity_message_record.participant_id = wire[at]; at = at + 1;
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  assert(line_integrity_message_read.participant_id == line_integrity_message_written.participant_id);
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Status Snapshot Message: 26 bytes ---- */

/* The Market-Wide Circuit Breaker Decline Level Status Snapshot Message is used to report the calculated Level 1, Level 2 and Level 3 threshold values for the current trading day necessary to trigger a circuit breaker */
typedef MarketWideCircuitBreakerDeclineLevelStatusSnapshotMessage {
  byte participant_id;
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8];
  byte reserved
};

int market_wide_circuit_breaker_decline_level_status_snapshot_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Status Snapshot Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_record, market_wide_circuit_breaker_decline_level_status_snapshot_message_value) {
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.participant_id = market_wide_circuit_breaker_decline_level_status_snapshot_message_value;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_value; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_value; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_value; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.reserved = market_wide_circuit_breaker_decline_level_status_snapshot_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Status Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_record, market_wide_circuit_breaker_decline_level_status_snapshot_message_base) {
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.participant_id = (market_wide_circuit_breaker_decline_level_status_snapshot_message_base + 0 + 1) % 256;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = (market_wide_circuit_breaker_decline_level_status_snapshot_message_base + 1 + market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = (market_wide_circuit_breaker_decline_level_status_snapshot_message_base + 9 + market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = (market_wide_circuit_breaker_decline_level_status_snapshot_message_base + 17 + market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.reserved = (market_wide_circuit_breaker_decline_level_status_snapshot_message_base + 25 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Snapshot Message to the wire, 26 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_record) {
  wire[at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_record.participant_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_decline_level_status_snapshot_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Snapshot Message off the wire, 26 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_record) {
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.participant_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_snapshot_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Status Snapshot Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_read, market_wide_circuit_breaker_decline_level_status_snapshot_message_written) {
  assert(market_wide_circuit_breaker_decline_level_status_snapshot_message_read.participant_id == market_wide_circuit_breaker_decline_level_status_snapshot_message_written.participant_id);
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_snapshot_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] == market_wide_circuit_breaker_decline_level_status_snapshot_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]); market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_snapshot_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] == market_wide_circuit_breaker_decline_level_status_snapshot_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]); market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_snapshot_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_snapshot_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_snapshot_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at] == market_wide_circuit_breaker_decline_level_status_snapshot_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_snapshot_message_at]); market_wide_circuit_breaker_decline_level_status_snapshot_message_at = market_wide_circuit_breaker_decline_level_status_snapshot_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_decline_level_status_snapshot_message_read.reserved == market_wide_circuit_breaker_decline_level_status_snapshot_message_written.reserved);
  skip
}

/* ---- Consolidated Snapshot Message: 96 bytes --------------------------------- */

/* a SIP Generated Message used to report information for each Security Symbol */
typedef ConsolidatedSnapshotMessage {
  byte participant_id;
  byte security_symbol[11];
  byte instrument_type;
  byte lower_limit_price_band[8];
  byte upper_limit_price_band[8];
  byte auction_collar_reference_price[8];
  byte auction_collar_upper_threshold_price[8];
  byte auction_collar_lower_threshold_price[8];
  byte number_of_extensions;
  byte national_best_bid_participant_id;
  byte national_best_bid_quote_condition;
  byte national_best_bid_price[8];
  byte national_best_bid_size[4];
  byte finra_best_bid_market_maker_id[4];
  byte national_best_offer_participant_id;
  byte national_best_offer_quote_condition;
  byte national_best_offer_price[8];
  byte national_best_offer_size[4];
  byte finra_best_offer_market_maker_id[4];
  byte national_bbo_luld_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte short_sale_restriction_indicator;
  byte halt_reason;
  byte future
};

int consolidated_snapshot_message_at;

/* every byte of Consolidated Snapshot Message set to one value */
inline fill_consolidated_snapshot_message(consolidated_snapshot_message_record, consolidated_snapshot_message_value) {
  consolidated_snapshot_message_record.participant_id = consolidated_snapshot_message_value;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 11 -> consolidated_snapshot_message_record.security_symbol[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.instrument_type = consolidated_snapshot_message_value;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.lower_limit_price_band[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.upper_limit_price_band[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_reference_price[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_upper_threshold_price[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_lower_threshold_price[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.number_of_extensions = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.national_best_bid_participant_id = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.national_best_bid_quote_condition = consolidated_snapshot_message_value;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_bid_price[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_bid_size[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_bid_market_maker_id[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_best_offer_participant_id = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.national_best_offer_quote_condition = consolidated_snapshot_message_value;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_offer_price[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_offer_size[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_offer_market_maker_id[consolidated_snapshot_message_at] = consolidated_snapshot_message_value; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_bbo_luld_indicator = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.primary_listing_market_participant_id = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.financial_status_indicator = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.short_sale_restriction_indicator = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.halt_reason = consolidated_snapshot_message_value;
  consolidated_snapshot_message_record.future = consolidated_snapshot_message_value;
  skip
}

/* each byte of Consolidated Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_consolidated_snapshot_message(consolidated_snapshot_message_record, consolidated_snapshot_message_base) {
  consolidated_snapshot_message_record.participant_id = (consolidated_snapshot_message_base + 0 + 1) % 256;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 11 -> consolidated_snapshot_message_record.security_symbol[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 1 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.instrument_type = (consolidated_snapshot_message_base + 12 + 1) % 256;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.lower_limit_price_band[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 13 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.upper_limit_price_band[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 21 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_reference_price[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 29 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_upper_threshold_price[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 37 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_lower_threshold_price[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 45 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.number_of_extensions = (consolidated_snapshot_message_base + 53 + 1) % 256;
  consolidated_snapshot_message_record.national_best_bid_participant_id = (consolidated_snapshot_message_base + 54 + 1) % 256;
  consolidated_snapshot_message_record.national_best_bid_quote_condition = (consolidated_snapshot_message_base + 55 + 1) % 256;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_bid_price[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 56 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_bid_size[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 64 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_bid_market_maker_id[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 68 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_best_offer_participant_id = (consolidated_snapshot_message_base + 72 + 1) % 256;
  consolidated_snapshot_message_record.national_best_offer_quote_condition = (consolidated_snapshot_message_base + 73 + 1) % 256;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_offer_price[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 74 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_offer_size[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 82 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_offer_market_maker_id[consolidated_snapshot_message_at] = (consolidated_snapshot_message_base + 86 + consolidated_snapshot_message_at + 1) % 256; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_bbo_luld_indicator = (consolidated_snapshot_message_base + 90 + 1) % 256;
  consolidated_snapshot_message_record.primary_listing_market_participant_id = (consolidated_snapshot_message_base + 91 + 1) % 256;
  consolidated_snapshot_message_record.financial_status_indicator = (consolidated_snapshot_message_base + 92 + 1) % 256;
  consolidated_snapshot_message_record.short_sale_restriction_indicator = (consolidated_snapshot_message_base + 93 + 1) % 256;
  consolidated_snapshot_message_record.halt_reason = (consolidated_snapshot_message_base + 94 + 1) % 256;
  consolidated_snapshot_message_record.future = (consolidated_snapshot_message_base + 95 + 1) % 256;
  skip
}

/* Consolidated Snapshot Message to the wire, 96 bytes from where the cursor stands */
inline encode_consolidated_snapshot_message(consolidated_snapshot_message_record) {
  wire[at] = consolidated_snapshot_message_record.participant_id; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 11 -> wire[at] = consolidated_snapshot_message_record.security_symbol[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_snapshot_message_record.instrument_type; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.lower_limit_price_band[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.upper_limit_price_band[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.auction_collar_reference_price[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.auction_collar_upper_threshold_price[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.auction_collar_lower_threshold_price[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_snapshot_message_record.number_of_extensions; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.national_best_bid_participant_id; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.national_best_bid_quote_condition; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.national_best_bid_price[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> wire[at] = consolidated_snapshot_message_record.national_best_bid_size[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> wire[at] = consolidated_snapshot_message_record.finra_best_bid_market_maker_id[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_snapshot_message_record.national_best_offer_participant_id; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.national_best_offer_quote_condition; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> wire[at] = consolidated_snapshot_message_record.national_best_offer_price[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> wire[at] = consolidated_snapshot_message_record.national_best_offer_size[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> wire[at] = consolidated_snapshot_message_record.finra_best_offer_market_maker_id[consolidated_snapshot_message_at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = consolidated_snapshot_message_record.national_bbo_luld_indicator; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.financial_status_indicator; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.halt_reason; at = at + 1;
  wire[at] = consolidated_snapshot_message_record.future; at = at + 1;
  skip
}

/* Consolidated Snapshot Message off the wire, 96 bytes from where the cursor stands */
inline decode_consolidated_snapshot_message(consolidated_snapshot_message_record) {
  consolidated_snapshot_message_record.participant_id = wire[at]; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 11 -> consolidated_snapshot_message_record.security_symbol[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.instrument_type = wire[at]; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.lower_limit_price_band[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.upper_limit_price_band[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_reference_price[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_upper_threshold_price[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.auction_collar_lower_threshold_price[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.number_of_extensions = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.national_best_bid_participant_id = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.national_best_bid_quote_condition = wire[at]; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_bid_price[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_bid_size[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_bid_market_maker_id[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_best_offer_participant_id = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.national_best_offer_quote_condition = wire[at]; at = at + 1;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> consolidated_snapshot_message_record.national_best_offer_price[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.national_best_offer_size[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> consolidated_snapshot_message_record.finra_best_offer_market_maker_id[consolidated_snapshot_message_at] = wire[at]; at = at + 1; consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_record.national_bbo_luld_indicator = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.financial_status_indicator = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.halt_reason = wire[at]; at = at + 1;
  consolidated_snapshot_message_record.future = wire[at]; at = at + 1;
  skip
}

/* what was read of Consolidated Snapshot Message is what was written, byte for byte */
inline equal_consolidated_snapshot_message(consolidated_snapshot_message_read, consolidated_snapshot_message_written) {
  assert(consolidated_snapshot_message_read.participant_id == consolidated_snapshot_message_written.participant_id);
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 11 -> assert(consolidated_snapshot_message_read.security_symbol[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.security_symbol[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  assert(consolidated_snapshot_message_read.instrument_type == consolidated_snapshot_message_written.instrument_type);
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.lower_limit_price_band[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.lower_limit_price_band[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.upper_limit_price_band[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.upper_limit_price_band[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.auction_collar_reference_price[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.auction_collar_reference_price[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.auction_collar_upper_threshold_price[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.auction_collar_upper_threshold_price[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.auction_collar_lower_threshold_price[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.auction_collar_lower_threshold_price[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  assert(consolidated_snapshot_message_read.number_of_extensions == consolidated_snapshot_message_written.number_of_extensions);
  assert(consolidated_snapshot_message_read.national_best_bid_participant_id == consolidated_snapshot_message_written.national_best_bid_participant_id);
  assert(consolidated_snapshot_message_read.national_best_bid_quote_condition == consolidated_snapshot_message_written.national_best_bid_quote_condition);
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.national_best_bid_price[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.national_best_bid_price[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> assert(consolidated_snapshot_message_read.national_best_bid_size[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.national_best_bid_size[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> assert(consolidated_snapshot_message_read.finra_best_bid_market_maker_id[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.finra_best_bid_market_maker_id[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  assert(consolidated_snapshot_message_read.national_best_offer_participant_id == consolidated_snapshot_message_written.national_best_offer_participant_id);
  assert(consolidated_snapshot_message_read.national_best_offer_quote_condition == consolidated_snapshot_message_written.national_best_offer_quote_condition);
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 8 -> assert(consolidated_snapshot_message_read.national_best_offer_price[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.national_best_offer_price[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> assert(consolidated_snapshot_message_read.national_best_offer_size[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.national_best_offer_size[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  consolidated_snapshot_message_at = 0;
  do
  :: consolidated_snapshot_message_at < 4 -> assert(consolidated_snapshot_message_read.finra_best_offer_market_maker_id[consolidated_snapshot_message_at] == consolidated_snapshot_message_written.finra_best_offer_market_maker_id[consolidated_snapshot_message_at]); consolidated_snapshot_message_at = consolidated_snapshot_message_at + 1
  :: else -> break
  od;
  assert(consolidated_snapshot_message_read.national_bbo_luld_indicator == consolidated_snapshot_message_written.national_bbo_luld_indicator);
  assert(consolidated_snapshot_message_read.primary_listing_market_participant_id == consolidated_snapshot_message_written.primary_listing_market_participant_id);
  assert(consolidated_snapshot_message_read.financial_status_indicator == consolidated_snapshot_message_written.financial_status_indicator);
  assert(consolidated_snapshot_message_read.short_sale_restriction_indicator == consolidated_snapshot_message_written.short_sale_restriction_indicator);
  assert(consolidated_snapshot_message_read.halt_reason == consolidated_snapshot_message_written.halt_reason);
  assert(consolidated_snapshot_message_read.future == consolidated_snapshot_message_written.future);
  skip
}

/* ---- Participant Snapshot Message: 58 bytes ---------------------------------- */

/* a SIP Generated Message used to report information for each Security Symbol */
typedef ParticipantSnapshotMessage {
  byte participant_id;
  byte security_symbol[11];
  byte quote_condition;
  byte bid_price[8];
  byte bid_size[4];
  byte offer_price[8];
  byte offer_size[4];
  byte retail_interest_indicator;
  byte settlement_condition;
  byte market_condition;
  byte luld_indicator;
  byte high_indication_price[8];
  byte low_indication_price[8];
  byte halt_reason
};

int participant_snapshot_message_at;

/* every byte of Participant Snapshot Message set to one value */
inline fill_participant_snapshot_message(participant_snapshot_message_record, participant_snapshot_message_value) {
  participant_snapshot_message_record.participant_id = participant_snapshot_message_value;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 11 -> participant_snapshot_message_record.security_symbol[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.quote_condition = participant_snapshot_message_value;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.bid_price[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.bid_size[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.offer_price[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.offer_size[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.retail_interest_indicator = participant_snapshot_message_value;
  participant_snapshot_message_record.settlement_condition = participant_snapshot_message_value;
  participant_snapshot_message_record.market_condition = participant_snapshot_message_value;
  participant_snapshot_message_record.luld_indicator = participant_snapshot_message_value;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.high_indication_price[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.low_indication_price[participant_snapshot_message_at] = participant_snapshot_message_value; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.halt_reason = participant_snapshot_message_value;
  skip
}

/* each byte of Participant Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_participant_snapshot_message(participant_snapshot_message_record, participant_snapshot_message_base) {
  participant_snapshot_message_record.participant_id = (participant_snapshot_message_base + 0 + 1) % 256;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 11 -> participant_snapshot_message_record.security_symbol[participant_snapshot_message_at] = (participant_snapshot_message_base + 1 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.quote_condition = (participant_snapshot_message_base + 12 + 1) % 256;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.bid_price[participant_snapshot_message_at] = (participant_snapshot_message_base + 13 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.bid_size[participant_snapshot_message_at] = (participant_snapshot_message_base + 21 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.offer_price[participant_snapshot_message_at] = (participant_snapshot_message_base + 25 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.offer_size[participant_snapshot_message_at] = (participant_snapshot_message_base + 33 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.retail_interest_indicator = (participant_snapshot_message_base + 37 + 1) % 256;
  participant_snapshot_message_record.settlement_condition = (participant_snapshot_message_base + 38 + 1) % 256;
  participant_snapshot_message_record.market_condition = (participant_snapshot_message_base + 39 + 1) % 256;
  participant_snapshot_message_record.luld_indicator = (participant_snapshot_message_base + 40 + 1) % 256;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.high_indication_price[participant_snapshot_message_at] = (participant_snapshot_message_base + 41 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.low_indication_price[participant_snapshot_message_at] = (participant_snapshot_message_base + 49 + participant_snapshot_message_at + 1) % 256; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.halt_reason = (participant_snapshot_message_base + 57 + 1) % 256;
  skip
}

/* Participant Snapshot Message to the wire, 58 bytes from where the cursor stands */
inline encode_participant_snapshot_message(participant_snapshot_message_record) {
  wire[at] = participant_snapshot_message_record.participant_id; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 11 -> wire[at] = participant_snapshot_message_record.security_symbol[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_snapshot_message_record.quote_condition; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> wire[at] = participant_snapshot_message_record.bid_price[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> wire[at] = participant_snapshot_message_record.bid_size[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> wire[at] = participant_snapshot_message_record.offer_price[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> wire[at] = participant_snapshot_message_record.offer_size[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_snapshot_message_record.retail_interest_indicator; at = at + 1;
  wire[at] = participant_snapshot_message_record.settlement_condition; at = at + 1;
  wire[at] = participant_snapshot_message_record.market_condition; at = at + 1;
  wire[at] = participant_snapshot_message_record.luld_indicator; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> wire[at] = participant_snapshot_message_record.high_indication_price[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> wire[at] = participant_snapshot_message_record.low_indication_price[participant_snapshot_message_at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = participant_snapshot_message_record.halt_reason; at = at + 1;
  skip
}

/* Participant Snapshot Message off the wire, 58 bytes from where the cursor stands */
inline decode_participant_snapshot_message(participant_snapshot_message_record) {
  participant_snapshot_message_record.participant_id = wire[at]; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 11 -> participant_snapshot_message_record.security_symbol[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.quote_condition = wire[at]; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.bid_price[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.bid_size[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.offer_price[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> participant_snapshot_message_record.offer_size[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.retail_interest_indicator = wire[at]; at = at + 1;
  participant_snapshot_message_record.settlement_condition = wire[at]; at = at + 1;
  participant_snapshot_message_record.market_condition = wire[at]; at = at + 1;
  participant_snapshot_message_record.luld_indicator = wire[at]; at = at + 1;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.high_indication_price[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> participant_snapshot_message_record.low_indication_price[participant_snapshot_message_at] = wire[at]; at = at + 1; participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_record.halt_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Participant Snapshot Message is what was written, byte for byte */
inline equal_participant_snapshot_message(participant_snapshot_message_read, participant_snapshot_message_written) {
  assert(participant_snapshot_message_read.participant_id == participant_snapshot_message_written.participant_id);
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 11 -> assert(participant_snapshot_message_read.security_symbol[participant_snapshot_message_at] == participant_snapshot_message_written.security_symbol[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  assert(participant_snapshot_message_read.quote_condition == participant_snapshot_message_written.quote_condition);
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> assert(participant_snapshot_message_read.bid_price[participant_snapshot_message_at] == participant_snapshot_message_written.bid_price[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> assert(participant_snapshot_message_read.bid_size[participant_snapshot_message_at] == participant_snapshot_message_written.bid_size[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> assert(participant_snapshot_message_read.offer_price[participant_snapshot_message_at] == participant_snapshot_message_written.offer_price[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 4 -> assert(participant_snapshot_message_read.offer_size[participant_snapshot_message_at] == participant_snapshot_message_written.offer_size[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  assert(participant_snapshot_message_read.retail_interest_indicator == participant_snapshot_message_written.retail_interest_indicator);
  assert(participant_snapshot_message_read.settlement_condition == participant_snapshot_message_written.settlement_condition);
  assert(participant_snapshot_message_read.market_condition == participant_snapshot_message_written.market_condition);
  assert(participant_snapshot_message_read.luld_indicator == participant_snapshot_message_written.luld_indicator);
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> assert(participant_snapshot_message_read.high_indication_price[participant_snapshot_message_at] == participant_snapshot_message_written.high_indication_price[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  participant_snapshot_message_at = 0;
  do
  :: participant_snapshot_message_at < 8 -> assert(participant_snapshot_message_read.low_indication_price[participant_snapshot_message_at] == participant_snapshot_message_written.low_indication_price[participant_snapshot_message_at]); participant_snapshot_message_at = participant_snapshot_message_at + 1
  :: else -> break
  od;
  assert(participant_snapshot_message_read.halt_reason == participant_snapshot_message_written.halt_reason);
  skip
}

/* ---- Finra Snapshot Message: 64 bytes ---------------------------------------- */

/* The FINRA Snapshot message is a SIP Generated Message used to report FINRA Best Bid and Offer */
typedef FinraSnapshotMessage {
  byte participant_id;
  byte security_symbol[11];
  byte finra_best_bid_quote_condition;
  byte finra_best_bid_price[8];
  byte finra_best_bid_size[4];
  byte finra_best_bid_market_maker_id[4];
  byte finra_best_offer_quote_condition;
  byte finra_best_offer_price[8];
  byte finra_best_offer_size[4];
  byte finra_best_offer_market_maker_id[4];
  byte finra_bbo_luld_indicator;
  byte high_indication_price[8];
  byte low_indication_price[8];
  byte halt_reason
};

int finra_snapshot_message_at;

/* every byte of Finra Snapshot Message set to one value */
inline fill_finra_snapshot_message(finra_snapshot_message_record, finra_snapshot_message_value) {
  finra_snapshot_message_record.participant_id = finra_snapshot_message_value;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 11 -> finra_snapshot_message_record.security_symbol[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_bid_quote_condition = finra_snapshot_message_value;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_bid_price[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_size[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_market_maker_id[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_offer_quote_condition = finra_snapshot_message_value;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_offer_price[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_size[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_market_maker_id[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_bbo_luld_indicator = finra_snapshot_message_value;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.high_indication_price[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.low_indication_price[finra_snapshot_message_at] = finra_snapshot_message_value; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.halt_reason = finra_snapshot_message_value;
  skip
}

/* each byte of Finra Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_finra_snapshot_message(finra_snapshot_message_record, finra_snapshot_message_base) {
  finra_snapshot_message_record.participant_id = (finra_snapshot_message_base + 0 + 1) % 256;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 11 -> finra_snapshot_message_record.security_symbol[finra_snapshot_message_at] = (finra_snapshot_message_base + 1 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_bid_quote_condition = (finra_snapshot_message_base + 12 + 1) % 256;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_bid_price[finra_snapshot_message_at] = (finra_snapshot_message_base + 13 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_size[finra_snapshot_message_at] = (finra_snapshot_message_base + 21 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_market_maker_id[finra_snapshot_message_at] = (finra_snapshot_message_base + 25 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_offer_quote_condition = (finra_snapshot_message_base + 29 + 1) % 256;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_offer_price[finra_snapshot_message_at] = (finra_snapshot_message_base + 30 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_size[finra_snapshot_message_at] = (finra_snapshot_message_base + 38 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_market_maker_id[finra_snapshot_message_at] = (finra_snapshot_message_base + 42 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_bbo_luld_indicator = (finra_snapshot_message_base + 46 + 1) % 256;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.high_indication_price[finra_snapshot_message_at] = (finra_snapshot_message_base + 47 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.low_indication_price[finra_snapshot_message_at] = (finra_snapshot_message_base + 55 + finra_snapshot_message_at + 1) % 256; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.halt_reason = (finra_snapshot_message_base + 63 + 1) % 256;
  skip
}

/* Finra Snapshot Message to the wire, 64 bytes from where the cursor stands */
inline encode_finra_snapshot_message(finra_snapshot_message_record) {
  wire[at] = finra_snapshot_message_record.participant_id; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 11 -> wire[at] = finra_snapshot_message_record.security_symbol[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_snapshot_message_record.finra_best_bid_quote_condition; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> wire[at] = finra_snapshot_message_record.finra_best_bid_price[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> wire[at] = finra_snapshot_message_record.finra_best_bid_size[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> wire[at] = finra_snapshot_message_record.finra_best_bid_market_maker_id[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_snapshot_message_record.finra_best_offer_quote_condition; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> wire[at] = finra_snapshot_message_record.finra_best_offer_price[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> wire[at] = finra_snapshot_message_record.finra_best_offer_size[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> wire[at] = finra_snapshot_message_record.finra_best_offer_market_maker_id[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_snapshot_message_record.finra_bbo_luld_indicator; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> wire[at] = finra_snapshot_message_record.high_indication_price[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> wire[at] = finra_snapshot_message_record.low_indication_price[finra_snapshot_message_at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  wire[at] = finra_snapshot_message_record.halt_reason; at = at + 1;
  skip
}

/* Finra Snapshot Message off the wire, 64 bytes from where the cursor stands */
inline decode_finra_snapshot_message(finra_snapshot_message_record) {
  finra_snapshot_message_record.participant_id = wire[at]; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 11 -> finra_snapshot_message_record.security_symbol[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_bid_quote_condition = wire[at]; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_bid_price[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_size[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_bid_market_maker_id[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_best_offer_quote_condition = wire[at]; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.finra_best_offer_price[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_size[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> finra_snapshot_message_record.finra_best_offer_market_maker_id[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.finra_bbo_luld_indicator = wire[at]; at = at + 1;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.high_indication_price[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> finra_snapshot_message_record.low_indication_price[finra_snapshot_message_at] = wire[at]; at = at + 1; finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_record.halt_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Finra Snapshot Message is what was written, byte for byte */
inline equal_finra_snapshot_message(finra_snapshot_message_read, finra_snapshot_message_written) {
  assert(finra_snapshot_message_read.participant_id == finra_snapshot_message_written.participant_id);
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 11 -> assert(finra_snapshot_message_read.security_symbol[finra_snapshot_message_at] == finra_snapshot_message_written.security_symbol[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  assert(finra_snapshot_message_read.finra_best_bid_quote_condition == finra_snapshot_message_written.finra_best_bid_quote_condition);
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> assert(finra_snapshot_message_read.finra_best_bid_price[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_bid_price[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> assert(finra_snapshot_message_read.finra_best_bid_size[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_bid_size[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> assert(finra_snapshot_message_read.finra_best_bid_market_maker_id[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_bid_market_maker_id[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  assert(finra_snapshot_message_read.finra_best_offer_quote_condition == finra_snapshot_message_written.finra_best_offer_quote_condition);
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> assert(finra_snapshot_message_read.finra_best_offer_price[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_offer_price[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> assert(finra_snapshot_message_read.finra_best_offer_size[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_offer_size[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 4 -> assert(finra_snapshot_message_read.finra_best_offer_market_maker_id[finra_snapshot_message_at] == finra_snapshot_message_written.finra_best_offer_market_maker_id[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  assert(finra_snapshot_message_read.finra_bbo_luld_indicator == finra_snapshot_message_written.finra_bbo_luld_indicator);
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> assert(finra_snapshot_message_read.high_indication_price[finra_snapshot_message_at] == finra_snapshot_message_written.high_indication_price[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  finra_snapshot_message_at = 0;
  do
  :: finra_snapshot_message_at < 8 -> assert(finra_snapshot_message_read.low_indication_price[finra_snapshot_message_at] == finra_snapshot_message_written.low_indication_price[finra_snapshot_message_at]); finra_snapshot_message_at = finra_snapshot_message_at + 1
  :: else -> break
  od;
  assert(finra_snapshot_message_read.halt_reason == finra_snapshot_message_written.halt_reason);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sip Block Timestamp: encoded, read back, and compared */
proctype check_sip_block_timestamp() {
  SipBlockTimestamp sip_block_timestamp_sent;
  SipBlockTimestamp sip_block_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 0)
  :: pattern == 1 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 32)
  :: pattern == 2 -> fill_sip_block_timestamp(sip_block_timestamp_sent, 255)
  :: else -> ramp_sip_block_timestamp(sip_block_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sip_block_timestamp(sip_block_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_sip_block_timestamp(sip_block_timestamp_got);
    assert(at == 8);
    equal_sip_block_timestamp(sip_block_timestamp_got, sip_block_timestamp_sent)
  }
}

/* Block Header: encoded, read back, and compared */
proctype check_block_header() {
  BlockHeader block_header_sent;
  BlockHeader block_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_block_header(block_header_sent, 0)
  :: pattern == 1 -> fill_block_header(block_header_sent, 32)
  :: pattern == 2 -> fill_block_header(block_header_sent, 255)
  :: else -> ramp_block_header(block_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_block_header(block_header_sent);
    assert(at == 24);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 24);
    equal_block_header(block_header_got, block_header_sent)
  }
}

/* Line Integrity Message: encoded, read back, and compared */
proctype check_line_integrity_message() {
  LineIntegrityMessage line_integrity_message_sent;
  LineIntegrityMessage line_integrity_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_line_integrity_message(line_integrity_message_sent, 0)
  :: pattern == 1 -> fill_line_integrity_message(line_integrity_message_sent, 32)
  :: pattern == 2 -> fill_line_integrity_message(line_integrity_message_sent, 255)
  :: else -> ramp_line_integrity_message(line_integrity_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_line_integrity_message(line_integrity_message_sent);
    assert(at == 1);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 1);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Status Snapshot Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_status_snapshot_message() {
  MarketWideCircuitBreakerDeclineLevelStatusSnapshotMessage market_wide_circuit_breaker_decline_level_status_snapshot_message_sent;
  MarketWideCircuitBreakerDeclineLevelStatusSnapshotMessage market_wide_circuit_breaker_decline_level_status_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_sent);
    assert(at == 26);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_got);
    assert(at == 26);
    equal_market_wide_circuit_breaker_decline_level_status_snapshot_message(market_wide_circuit_breaker_decline_level_status_snapshot_message_got, market_wide_circuit_breaker_decline_level_status_snapshot_message_sent)
  }
}

/* Consolidated Snapshot Message: encoded, read back, and compared */
proctype check_consolidated_snapshot_message() {
  ConsolidatedSnapshotMessage consolidated_snapshot_message_sent;
  ConsolidatedSnapshotMessage consolidated_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_snapshot_message(consolidated_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_consolidated_snapshot_message(consolidated_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_consolidated_snapshot_message(consolidated_snapshot_message_sent, 255)
  :: else -> ramp_consolidated_snapshot_message(consolidated_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_snapshot_message(consolidated_snapshot_message_sent);
    assert(at == 96);
    at = 0;
    decode_consolidated_snapshot_message(consolidated_snapshot_message_got);
    assert(at == 96);
    equal_consolidated_snapshot_message(consolidated_snapshot_message_got, consolidated_snapshot_message_sent)
  }
}

/* Participant Snapshot Message: encoded, read back, and compared */
proctype check_participant_snapshot_message() {
  ParticipantSnapshotMessage participant_snapshot_message_sent;
  ParticipantSnapshotMessage participant_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_snapshot_message(participant_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_participant_snapshot_message(participant_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_participant_snapshot_message(participant_snapshot_message_sent, 255)
  :: else -> ramp_participant_snapshot_message(participant_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_snapshot_message(participant_snapshot_message_sent);
    assert(at == 58);
    at = 0;
    decode_participant_snapshot_message(participant_snapshot_message_got);
    assert(at == 58);
    equal_participant_snapshot_message(participant_snapshot_message_got, participant_snapshot_message_sent)
  }
}

/* Finra Snapshot Message: encoded, read back, and compared */
proctype check_finra_snapshot_message() {
  FinraSnapshotMessage finra_snapshot_message_sent;
  FinraSnapshotMessage finra_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_snapshot_message(finra_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_finra_snapshot_message(finra_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_finra_snapshot_message(finra_snapshot_message_sent, 255)
  :: else -> ramp_finra_snapshot_message(finra_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_snapshot_message(finra_snapshot_message_sent);
    assert(at == 64);
    at = 0;
    decode_finra_snapshot_message(finra_snapshot_message_got);
    assert(at == 64);
    equal_finra_snapshot_message(finra_snapshot_message_got, finra_snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sip_block_timestamp()
  :: run check_block_header()
  :: run check_line_integrity_message()
  :: run check_market_wide_circuit_breaker_decline_level_status_snapshot_message()
  :: run check_consolidated_snapshot_message()
  :: run check_participant_snapshot_message()
  :: run check_finra_snapshot_message()
  fi
}
