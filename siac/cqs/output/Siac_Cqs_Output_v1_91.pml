/*
 * The Securities Industry Automation Corporation Output
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
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 63

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

/* ---- Block Header: 20 bytes -------------------------------------------------- */

/* Cta Output packet header */
typedef BlockHeader {
  byte version;
  byte block_size[2];
  byte data_feed_indicator;
  byte retransmission_indicator;
  byte block_sequence_number[4];
  byte messages_in_block;
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
  block_header_record.data_feed_indicator = block_header_value;
  block_header_record.retransmission_indicator = block_header_value;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = block_header_value; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = block_header_value;
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
  block_header_record.data_feed_indicator = (block_header_base + 3 + 1) % 256;
  block_header_record.retransmission_indicator = (block_header_base + 4 + 1) % 256;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = (block_header_base + 5 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = (block_header_base + 9 + 1) % 256;
  ramp_sip_block_timestamp(block_header_record.sip_block_timestamp, block_header_base + 10);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_checksum[block_header_at] = (block_header_base + 18 + block_header_at + 1) % 256; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header to the wire, 20 bytes from where the cursor stands */
inline encode_block_header(block_header_record) {
  wire[at] = block_header_record.version; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_size[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.data_feed_indicator; at = at + 1;
  wire[at] = block_header_record.retransmission_indicator; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> wire[at] = block_header_record.block_sequence_number[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  wire[at] = block_header_record.messages_in_block; at = at + 1;
  encode_sip_block_timestamp(block_header_record.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> wire[at] = block_header_record.block_checksum[block_header_at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* Block Header off the wire, 20 bytes from where the cursor stands */
inline decode_block_header(block_header_record) {
  block_header_record.version = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 2 -> block_header_record.block_size[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.data_feed_indicator = wire[at]; at = at + 1;
  block_header_record.retransmission_indicator = wire[at]; at = at + 1;
  block_header_at = 0;
  do
  :: block_header_at < 4 -> block_header_record.block_sequence_number[block_header_at] = wire[at]; at = at + 1; block_header_at = block_header_at + 1
  :: else -> break
  od;
  block_header_record.messages_in_block = wire[at]; at = at + 1;
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
  assert(block_header_read.data_feed_indicator == block_header_written.data_feed_indicator);
  assert(block_header_read.retransmission_indicator == block_header_written.retransmission_indicator);
  block_header_at = 0;
  do
  :: block_header_at < 4 -> assert(block_header_read.block_sequence_number[block_header_at] == block_header_written.block_sequence_number[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  assert(block_header_read.messages_in_block == block_header_written.messages_in_block);
  equal_sip_block_timestamp(block_header_read.sip_block_timestamp, block_header_written.sip_block_timestamp);
  block_header_at = 0;
  do
  :: block_header_at < 2 -> assert(block_header_read.block_checksum[block_header_at] == block_header_written.block_checksum[block_header_at]); block_header_at = block_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Participant Timestamp: 8 bytes ------------------------------------------ */

/* Participant Timestamp */
typedef ParticipantTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int participant_timestamp_at;

/* every byte of Participant Timestamp set to one value */
inline fill_participant_timestamp(participant_timestamp_record, participant_timestamp_value) {
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.seconds[participant_timestamp_at] = participant_timestamp_value; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.nanoseconds[participant_timestamp_at] = participant_timestamp_value; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Participant Timestamp set to where it lies, so a field read out of place says so */
inline ramp_participant_timestamp(participant_timestamp_record, participant_timestamp_base) {
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.seconds[participant_timestamp_at] = (participant_timestamp_base + 0 + participant_timestamp_at + 1) % 256; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.nanoseconds[participant_timestamp_at] = (participant_timestamp_base + 4 + participant_timestamp_at + 1) % 256; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_participant_timestamp(participant_timestamp_record) {
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> wire[at] = participant_timestamp_record.seconds[participant_timestamp_at]; at = at + 1; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> wire[at] = participant_timestamp_record.nanoseconds[participant_timestamp_at]; at = at + 1; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Participant Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_participant_timestamp(participant_timestamp_record) {
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.seconds[participant_timestamp_at] = wire[at]; at = at + 1; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> participant_timestamp_record.nanoseconds[participant_timestamp_at] = wire[at]; at = at + 1; participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Participant Timestamp is what was written, byte for byte */
inline equal_participant_timestamp(participant_timestamp_read, participant_timestamp_written) {
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> assert(participant_timestamp_read.seconds[participant_timestamp_at] == participant_timestamp_written.seconds[participant_timestamp_at]); participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  participant_timestamp_at = 0;
  do
  :: participant_timestamp_at < 4 -> assert(participant_timestamp_read.nanoseconds[participant_timestamp_at] == participant_timestamp_written.nanoseconds[participant_timestamp_at]); participant_timestamp_at = participant_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Administrative Unformatted Message: 26 bytes ---------------------------- */

/* The Administrative Unformatted (free form text) Category A message is designed to facilitate non-computerized miscellaneous information messages to CQS */
typedef AdministrativeUnformattedMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte text[4]
};

int administrative_unformatted_message_at;

/* every byte of Administrative Unformatted Message set to one value */
inline fill_administrative_unformatted_message(administrative_unformatted_message_record, administrative_unformatted_message_value) {
  administrative_unformatted_message_record.participant_id = administrative_unformatted_message_value;
  fill_participant_timestamp(administrative_unformatted_message_record.participant_timestamp, administrative_unformatted_message_value);
  administrative_unformatted_message_record.message_id = administrative_unformatted_message_value;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.transaction_id[administrative_unformatted_message_at] = administrative_unformatted_message_value; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 8 -> administrative_unformatted_message_record.participant_reference_number[administrative_unformatted_message_at] = administrative_unformatted_message_value; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.text[administrative_unformatted_message_at] = administrative_unformatted_message_value; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Administrative Unformatted Message set to where it lies, so a field read out of place says so */
inline ramp_administrative_unformatted_message(administrative_unformatted_message_record, administrative_unformatted_message_base) {
  administrative_unformatted_message_record.participant_id = (administrative_unformatted_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(administrative_unformatted_message_record.participant_timestamp, administrative_unformatted_message_base + 1);
  administrative_unformatted_message_record.message_id = (administrative_unformatted_message_base + 9 + 1) % 256;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.transaction_id[administrative_unformatted_message_at] = (administrative_unformatted_message_base + 10 + administrative_unformatted_message_at + 1) % 256; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 8 -> administrative_unformatted_message_record.participant_reference_number[administrative_unformatted_message_at] = (administrative_unformatted_message_base + 14 + administrative_unformatted_message_at + 1) % 256; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.text[administrative_unformatted_message_at] = (administrative_unformatted_message_base + 22 + administrative_unformatted_message_at + 1) % 256; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Administrative Unformatted Message to the wire, 26 bytes from where the cursor stands */
inline encode_administrative_unformatted_message(administrative_unformatted_message_record) {
  wire[at] = administrative_unformatted_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(administrative_unformatted_message_record.participant_timestamp);
  wire[at] = administrative_unformatted_message_record.message_id; at = at + 1;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> wire[at] = administrative_unformatted_message_record.transaction_id[administrative_unformatted_message_at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 8 -> wire[at] = administrative_unformatted_message_record.participant_reference_number[administrative_unformatted_message_at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> wire[at] = administrative_unformatted_message_record.text[administrative_unformatted_message_at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  skip
}

/* Administrative Unformatted Message off the wire, 26 bytes from where the cursor stands */
inline decode_administrative_unformatted_message(administrative_unformatted_message_record) {
  administrative_unformatted_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(administrative_unformatted_message_record.participant_timestamp);
  administrative_unformatted_message_record.message_id = wire[at]; at = at + 1;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.transaction_id[administrative_unformatted_message_at] = wire[at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 8 -> administrative_unformatted_message_record.participant_reference_number[administrative_unformatted_message_at] = wire[at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> administrative_unformatted_message_record.text[administrative_unformatted_message_at] = wire[at]; at = at + 1; administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Administrative Unformatted Message is what was written, byte for byte */
inline equal_administrative_unformatted_message(administrative_unformatted_message_read, administrative_unformatted_message_written) {
  assert(administrative_unformatted_message_read.participant_id == administrative_unformatted_message_written.participant_id);
  equal_participant_timestamp(administrative_unformatted_message_read.participant_timestamp, administrative_unformatted_message_written.participant_timestamp);
  assert(administrative_unformatted_message_read.message_id == administrative_unformatted_message_written.message_id);
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> assert(administrative_unformatted_message_read.transaction_id[administrative_unformatted_message_at] == administrative_unformatted_message_written.transaction_id[administrative_unformatted_message_at]); administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 8 -> assert(administrative_unformatted_message_read.participant_reference_number[administrative_unformatted_message_at] == administrative_unformatted_message_written.participant_reference_number[administrative_unformatted_message_at]); administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  administrative_unformatted_message_at = 0;
  do
  :: administrative_unformatted_message_at < 4 -> assert(administrative_unformatted_message_read.text[administrative_unformatted_message_at] == administrative_unformatted_message_written.text[administrative_unformatted_message_at]); administrative_unformatted_message_at = administrative_unformatted_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 22 bytes ------------------------------------------ */

/* The Start of Day message signals the start of normal data dissemination over the multicast lines */
typedef StartOfDayMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_record.participant_id = start_of_day_message_value;
  fill_participant_timestamp(start_of_day_message_record.participant_timestamp, start_of_day_message_value);
  start_of_day_message_record.message_id = start_of_day_message_value;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_record.participant_id = (start_of_day_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(start_of_day_message_record.participant_timestamp, start_of_day_message_base + 1);
  start_of_day_message_record.message_id = (start_of_day_message_base + 9 + 1) % 256;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = (start_of_day_message_base + 10 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = (start_of_day_message_base + 14 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  wire[at] = start_of_day_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(start_of_day_message_record.participant_timestamp);
  wire[at] = start_of_day_message_record.message_id; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> wire[at] = start_of_day_message_record.transaction_id[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.participant_reference_number[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(start_of_day_message_record.participant_timestamp);
  start_of_day_message_record.message_id = wire[at]; at = at + 1;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> start_of_day_message_record.transaction_id[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.participant_reference_number[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  assert(start_of_day_message_read.participant_id == start_of_day_message_written.participant_id);
  equal_participant_timestamp(start_of_day_message_read.participant_timestamp, start_of_day_message_written.participant_timestamp);
  assert(start_of_day_message_read.message_id == start_of_day_message_written.message_id);
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 4 -> assert(start_of_day_message_read.transaction_id[start_of_day_message_at] == start_of_day_message_written.transaction_id[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.participant_reference_number[start_of_day_message_at] == start_of_day_message_written.participant_reference_number[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Finra Close Message: 22 bytes ------------------------------------------- */

/* The FINRA Close message is transmitted by FINRA to CQS to indicate the Close state of FINRA Market Maker(s). */
typedef FinraCloseMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int finra_close_message_at;

/* every byte of Finra Close Message set to one value */
inline fill_finra_close_message(finra_close_message_record, finra_close_message_value) {
  finra_close_message_record.participant_id = finra_close_message_value;
  fill_participant_timestamp(finra_close_message_record.participant_timestamp, finra_close_message_value);
  finra_close_message_record.message_id = finra_close_message_value;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = finra_close_message_value; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = finra_close_message_value; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Finra Close Message set to where it lies, so a field read out of place says so */
inline ramp_finra_close_message(finra_close_message_record, finra_close_message_base) {
  finra_close_message_record.participant_id = (finra_close_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(finra_close_message_record.participant_timestamp, finra_close_message_base + 1);
  finra_close_message_record.message_id = (finra_close_message_base + 9 + 1) % 256;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = (finra_close_message_base + 10 + finra_close_message_at + 1) % 256; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = (finra_close_message_base + 14 + finra_close_message_at + 1) % 256; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Close Message to the wire, 22 bytes from where the cursor stands */
inline encode_finra_close_message(finra_close_message_record) {
  wire[at] = finra_close_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(finra_close_message_record.participant_timestamp);
  wire[at] = finra_close_message_record.message_id; at = at + 1;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> wire[at] = finra_close_message_record.transaction_id[finra_close_message_at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> wire[at] = finra_close_message_record.participant_reference_number[finra_close_message_at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Close Message off the wire, 22 bytes from where the cursor stands */
inline decode_finra_close_message(finra_close_message_record) {
  finra_close_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(finra_close_message_record.participant_timestamp);
  finra_close_message_record.message_id = wire[at]; at = at + 1;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> finra_close_message_record.transaction_id[finra_close_message_at] = wire[at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> finra_close_message_record.participant_reference_number[finra_close_message_at] = wire[at]; at = at + 1; finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Finra Close Message is what was written, byte for byte */
inline equal_finra_close_message(finra_close_message_read, finra_close_message_written) {
  assert(finra_close_message_read.participant_id == finra_close_message_written.participant_id);
  equal_participant_timestamp(finra_close_message_read.participant_timestamp, finra_close_message_written.participant_timestamp);
  assert(finra_close_message_read.message_id == finra_close_message_written.message_id);
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 4 -> assert(finra_close_message_read.transaction_id[finra_close_message_at] == finra_close_message_written.transaction_id[finra_close_message_at]); finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  finra_close_message_at = 0;
  do
  :: finra_close_message_at < 8 -> assert(finra_close_message_read.participant_reference_number[finra_close_message_at] == finra_close_message_written.participant_reference_number[finra_close_message_at]); finra_close_message_at = finra_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Reset Block Sequence Number Message: 22 bytes --------------------------- */

/* The Reset Block Sequence Number message is transmitted when the block sequence number on an output multicast line requires resetting. */
typedef ResetBlockSequenceNumberMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int reset_block_sequence_number_message_at;

/* every byte of Reset Block Sequence Number Message set to one value */
inline fill_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_value) {
  reset_block_sequence_number_message_record.participant_id = reset_block_sequence_number_message_value;
  fill_participant_timestamp(reset_block_sequence_number_message_record.participant_timestamp, reset_block_sequence_number_message_value);
  reset_block_sequence_number_message_record.message_id = reset_block_sequence_number_message_value;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = reset_block_sequence_number_message_value; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Reset Block Sequence Number Message set to where it lies, so a field read out of place says so */
inline ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_record, reset_block_sequence_number_message_base) {
  reset_block_sequence_number_message_record.participant_id = (reset_block_sequence_number_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(reset_block_sequence_number_message_record.participant_timestamp, reset_block_sequence_number_message_base + 1);
  reset_block_sequence_number_message_record.message_id = (reset_block_sequence_number_message_base + 9 + 1) % 256;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 10 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = (reset_block_sequence_number_message_base + 14 + reset_block_sequence_number_message_at + 1) % 256; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message to the wire, 22 bytes from where the cursor stands */
inline encode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  wire[at] = reset_block_sequence_number_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(reset_block_sequence_number_message_record.participant_timestamp);
  wire[at] = reset_block_sequence_number_message_record.message_id; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> wire[at] = reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> wire[at] = reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* Reset Block Sequence Number Message off the wire, 22 bytes from where the cursor stands */
inline decode_reset_block_sequence_number_message(reset_block_sequence_number_message_record) {
  reset_block_sequence_number_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(reset_block_sequence_number_message_record.participant_timestamp);
  reset_block_sequence_number_message_record.message_id = wire[at]; at = at + 1;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> reset_block_sequence_number_message_record.transaction_id[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> reset_block_sequence_number_message_record.participant_reference_number[reset_block_sequence_number_message_at] = wire[at]; at = at + 1; reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Reset Block Sequence Number Message is what was written, byte for byte */
inline equal_reset_block_sequence_number_message(reset_block_sequence_number_message_read, reset_block_sequence_number_message_written) {
  assert(reset_block_sequence_number_message_read.participant_id == reset_block_sequence_number_message_written.participant_id);
  equal_participant_timestamp(reset_block_sequence_number_message_read.participant_timestamp, reset_block_sequence_number_message_written.participant_timestamp);
  assert(reset_block_sequence_number_message_read.message_id == reset_block_sequence_number_message_written.message_id);
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 4 -> assert(reset_block_sequence_number_message_read.transaction_id[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.transaction_id[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  reset_block_sequence_number_message_at = 0;
  do
  :: reset_block_sequence_number_message_at < 8 -> assert(reset_block_sequence_number_message_read.participant_reference_number[reset_block_sequence_number_message_at] == reset_block_sequence_number_message_written.participant_reference_number[reset_block_sequence_number_message_at]); reset_block_sequence_number_message_at = reset_block_sequence_number_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Test Cycle Message: 22 bytes ----------------------------------- */

/* The Start of Test Cycle message is transmitted to signal the beginning of the transmission of test message cycles */
typedef StartOfTestCycleMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int start_of_test_cycle_message_at;

/* every byte of Start Of Test Cycle Message set to one value */
inline fill_start_of_test_cycle_message(start_of_test_cycle_message_record, start_of_test_cycle_message_value) {
  start_of_test_cycle_message_record.participant_id = start_of_test_cycle_message_value;
  fill_participant_timestamp(start_of_test_cycle_message_record.participant_timestamp, start_of_test_cycle_message_value);
  start_of_test_cycle_message_record.message_id = start_of_test_cycle_message_value;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 4 -> start_of_test_cycle_message_record.transaction_id[start_of_test_cycle_message_at] = start_of_test_cycle_message_value; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 8 -> start_of_test_cycle_message_record.participant_reference_number[start_of_test_cycle_message_at] = start_of_test_cycle_message_value; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Test Cycle Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_test_cycle_message(start_of_test_cycle_message_record, start_of_test_cycle_message_base) {
  start_of_test_cycle_message_record.participant_id = (start_of_test_cycle_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(start_of_test_cycle_message_record.participant_timestamp, start_of_test_cycle_message_base + 1);
  start_of_test_cycle_message_record.message_id = (start_of_test_cycle_message_base + 9 + 1) % 256;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 4 -> start_of_test_cycle_message_record.transaction_id[start_of_test_cycle_message_at] = (start_of_test_cycle_message_base + 10 + start_of_test_cycle_message_at + 1) % 256; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 8 -> start_of_test_cycle_message_record.participant_reference_number[start_of_test_cycle_message_at] = (start_of_test_cycle_message_base + 14 + start_of_test_cycle_message_at + 1) % 256; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Test Cycle Message to the wire, 22 bytes from where the cursor stands */
inline encode_start_of_test_cycle_message(start_of_test_cycle_message_record) {
  wire[at] = start_of_test_cycle_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(start_of_test_cycle_message_record.participant_timestamp);
  wire[at] = start_of_test_cycle_message_record.message_id; at = at + 1;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 4 -> wire[at] = start_of_test_cycle_message_record.transaction_id[start_of_test_cycle_message_at]; at = at + 1; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 8 -> wire[at] = start_of_test_cycle_message_record.participant_reference_number[start_of_test_cycle_message_at]; at = at + 1; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Test Cycle Message off the wire, 22 bytes from where the cursor stands */
inline decode_start_of_test_cycle_message(start_of_test_cycle_message_record) {
  start_of_test_cycle_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(start_of_test_cycle_message_record.participant_timestamp);
  start_of_test_cycle_message_record.message_id = wire[at]; at = at + 1;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 4 -> start_of_test_cycle_message_record.transaction_id[start_of_test_cycle_message_at] = wire[at]; at = at + 1; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 8 -> start_of_test_cycle_message_record.participant_reference_number[start_of_test_cycle_message_at] = wire[at]; at = at + 1; start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Test Cycle Message is what was written, byte for byte */
inline equal_start_of_test_cycle_message(start_of_test_cycle_message_read, start_of_test_cycle_message_written) {
  assert(start_of_test_cycle_message_read.participant_id == start_of_test_cycle_message_written.participant_id);
  equal_participant_timestamp(start_of_test_cycle_message_read.participant_timestamp, start_of_test_cycle_message_written.participant_timestamp);
  assert(start_of_test_cycle_message_read.message_id == start_of_test_cycle_message_written.message_id);
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 4 -> assert(start_of_test_cycle_message_read.transaction_id[start_of_test_cycle_message_at] == start_of_test_cycle_message_written.transaction_id[start_of_test_cycle_message_at]); start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  start_of_test_cycle_message_at = 0;
  do
  :: start_of_test_cycle_message_at < 8 -> assert(start_of_test_cycle_message_read.participant_reference_number[start_of_test_cycle_message_at] == start_of_test_cycle_message_written.participant_reference_number[start_of_test_cycle_message_at]); start_of_test_cycle_message_at = start_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Test Cycle Message: 22 bytes ------------------------------------- */

/* The End of Test Cycle message is transmitted to signal the end of the transmission of the repeated free form text test message cycles */
typedef EndOfTestCycleMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_test_cycle_message_at;

/* every byte of End Of Test Cycle Message set to one value */
inline fill_end_of_test_cycle_message(end_of_test_cycle_message_record, end_of_test_cycle_message_value) {
  end_of_test_cycle_message_record.participant_id = end_of_test_cycle_message_value;
  fill_participant_timestamp(end_of_test_cycle_message_record.participant_timestamp, end_of_test_cycle_message_value);
  end_of_test_cycle_message_record.message_id = end_of_test_cycle_message_value;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 4 -> end_of_test_cycle_message_record.transaction_id[end_of_test_cycle_message_at] = end_of_test_cycle_message_value; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 8 -> end_of_test_cycle_message_record.participant_reference_number[end_of_test_cycle_message_at] = end_of_test_cycle_message_value; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Test Cycle Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_test_cycle_message(end_of_test_cycle_message_record, end_of_test_cycle_message_base) {
  end_of_test_cycle_message_record.participant_id = (end_of_test_cycle_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(end_of_test_cycle_message_record.participant_timestamp, end_of_test_cycle_message_base + 1);
  end_of_test_cycle_message_record.message_id = (end_of_test_cycle_message_base + 9 + 1) % 256;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 4 -> end_of_test_cycle_message_record.transaction_id[end_of_test_cycle_message_at] = (end_of_test_cycle_message_base + 10 + end_of_test_cycle_message_at + 1) % 256; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 8 -> end_of_test_cycle_message_record.participant_reference_number[end_of_test_cycle_message_at] = (end_of_test_cycle_message_base + 14 + end_of_test_cycle_message_at + 1) % 256; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Test Cycle Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_test_cycle_message(end_of_test_cycle_message_record) {
  wire[at] = end_of_test_cycle_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(end_of_test_cycle_message_record.participant_timestamp);
  wire[at] = end_of_test_cycle_message_record.message_id; at = at + 1;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 4 -> wire[at] = end_of_test_cycle_message_record.transaction_id[end_of_test_cycle_message_at]; at = at + 1; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 8 -> wire[at] = end_of_test_cycle_message_record.participant_reference_number[end_of_test_cycle_message_at]; at = at + 1; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Test Cycle Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_test_cycle_message(end_of_test_cycle_message_record) {
  end_of_test_cycle_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(end_of_test_cycle_message_record.participant_timestamp);
  end_of_test_cycle_message_record.message_id = wire[at]; at = at + 1;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 4 -> end_of_test_cycle_message_record.transaction_id[end_of_test_cycle_message_at] = wire[at]; at = at + 1; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 8 -> end_of_test_cycle_message_record.participant_reference_number[end_of_test_cycle_message_at] = wire[at]; at = at + 1; end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Test Cycle Message is what was written, byte for byte */
inline equal_end_of_test_cycle_message(end_of_test_cycle_message_read, end_of_test_cycle_message_written) {
  assert(end_of_test_cycle_message_read.participant_id == end_of_test_cycle_message_written.participant_id);
  equal_participant_timestamp(end_of_test_cycle_message_read.participant_timestamp, end_of_test_cycle_message_written.participant_timestamp);
  assert(end_of_test_cycle_message_read.message_id == end_of_test_cycle_message_written.message_id);
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 4 -> assert(end_of_test_cycle_message_read.transaction_id[end_of_test_cycle_message_at] == end_of_test_cycle_message_written.transaction_id[end_of_test_cycle_message_at]); end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  end_of_test_cycle_message_at = 0;
  do
  :: end_of_test_cycle_message_at < 8 -> assert(end_of_test_cycle_message_read.participant_reference_number[end_of_test_cycle_message_at] == end_of_test_cycle_message_written.participant_reference_number[end_of_test_cycle_message_at]); end_of_test_cycle_message_at = end_of_test_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Finra Open Message: 22 bytes -------------------------------------------- */

/* The FINRA Open message is transmitted by FINRA to CQS */
typedef FinraOpenMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int finra_open_message_at;

/* every byte of Finra Open Message set to one value */
inline fill_finra_open_message(finra_open_message_record, finra_open_message_value) {
  finra_open_message_record.participant_id = finra_open_message_value;
  fill_participant_timestamp(finra_open_message_record.participant_timestamp, finra_open_message_value);
  finra_open_message_record.message_id = finra_open_message_value;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = finra_open_message_value; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = finra_open_message_value; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Finra Open Message set to where it lies, so a field read out of place says so */
inline ramp_finra_open_message(finra_open_message_record, finra_open_message_base) {
  finra_open_message_record.participant_id = (finra_open_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(finra_open_message_record.participant_timestamp, finra_open_message_base + 1);
  finra_open_message_record.message_id = (finra_open_message_base + 9 + 1) % 256;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = (finra_open_message_base + 10 + finra_open_message_at + 1) % 256; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = (finra_open_message_base + 14 + finra_open_message_at + 1) % 256; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Open Message to the wire, 22 bytes from where the cursor stands */
inline encode_finra_open_message(finra_open_message_record) {
  wire[at] = finra_open_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(finra_open_message_record.participant_timestamp);
  wire[at] = finra_open_message_record.message_id; at = at + 1;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> wire[at] = finra_open_message_record.transaction_id[finra_open_message_at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> wire[at] = finra_open_message_record.participant_reference_number[finra_open_message_at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Finra Open Message off the wire, 22 bytes from where the cursor stands */
inline decode_finra_open_message(finra_open_message_record) {
  finra_open_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(finra_open_message_record.participant_timestamp);
  finra_open_message_record.message_id = wire[at]; at = at + 1;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> finra_open_message_record.transaction_id[finra_open_message_at] = wire[at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> finra_open_message_record.participant_reference_number[finra_open_message_at] = wire[at]; at = at + 1; finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Finra Open Message is what was written, byte for byte */
inline equal_finra_open_message(finra_open_message_read, finra_open_message_written) {
  assert(finra_open_message_read.participant_id == finra_open_message_written.participant_id);
  equal_participant_timestamp(finra_open_message_read.participant_timestamp, finra_open_message_written.participant_timestamp);
  assert(finra_open_message_read.message_id == finra_open_message_written.message_id);
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 4 -> assert(finra_open_message_read.transaction_id[finra_open_message_at] == finra_open_message_written.transaction_id[finra_open_message_at]); finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  finra_open_message_at = 0;
  do
  :: finra_open_message_at < 8 -> assert(finra_open_message_read.participant_reference_number[finra_open_message_at] == finra_open_message_written.participant_reference_number[finra_open_message_at]); finra_open_message_at = finra_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Disaster Recovery Data Center Activation Message: 22 bytes -------------- */

/* The Disaster Recovery Data Center Activation message is transmitted to signify that the Consolidated Quotation System (CQS) has switched processing from the Primary Data Center to the Disaster Recovery Data Center */
typedef DisasterRecoveryDataCenterActivationMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int disaster_recovery_data_center_activation_message_at;

/* every byte of Disaster Recovery Data Center Activation Message set to one value */
inline fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_value) {
  disaster_recovery_data_center_activation_message_record.participant_id = disaster_recovery_data_center_activation_message_value;
  fill_participant_timestamp(disaster_recovery_data_center_activation_message_record.participant_timestamp, disaster_recovery_data_center_activation_message_value);
  disaster_recovery_data_center_activation_message_record.message_id = disaster_recovery_data_center_activation_message_value;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = disaster_recovery_data_center_activation_message_value; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Disaster Recovery Data Center Activation Message set to where it lies, so a field read out of place says so */
inline ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record, disaster_recovery_data_center_activation_message_base) {
  disaster_recovery_data_center_activation_message_record.participant_id = (disaster_recovery_data_center_activation_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(disaster_recovery_data_center_activation_message_record.participant_timestamp, disaster_recovery_data_center_activation_message_base + 1);
  disaster_recovery_data_center_activation_message_record.message_id = (disaster_recovery_data_center_activation_message_base + 9 + 1) % 256;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 10 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = (disaster_recovery_data_center_activation_message_base + 14 + disaster_recovery_data_center_activation_message_at + 1) % 256; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message to the wire, 22 bytes from where the cursor stands */
inline encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  wire[at] = disaster_recovery_data_center_activation_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(disaster_recovery_data_center_activation_message_record.participant_timestamp);
  wire[at] = disaster_recovery_data_center_activation_message_record.message_id; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> wire[at] = disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> wire[at] = disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* Disaster Recovery Data Center Activation Message off the wire, 22 bytes from where the cursor stands */
inline decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_record) {
  disaster_recovery_data_center_activation_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(disaster_recovery_data_center_activation_message_record.participant_timestamp);
  disaster_recovery_data_center_activation_message_record.message_id = wire[at]; at = at + 1;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> disaster_recovery_data_center_activation_message_record.transaction_id[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> disaster_recovery_data_center_activation_message_record.participant_reference_number[disaster_recovery_data_center_activation_message_at] = wire[at]; at = at + 1; disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Disaster Recovery Data Center Activation Message is what was written, byte for byte */
inline equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_read, disaster_recovery_data_center_activation_message_written) {
  assert(disaster_recovery_data_center_activation_message_read.participant_id == disaster_recovery_data_center_activation_message_written.participant_id);
  equal_participant_timestamp(disaster_recovery_data_center_activation_message_read.participant_timestamp, disaster_recovery_data_center_activation_message_written.participant_timestamp);
  assert(disaster_recovery_data_center_activation_message_read.message_id == disaster_recovery_data_center_activation_message_written.message_id);
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 4 -> assert(disaster_recovery_data_center_activation_message_read.transaction_id[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.transaction_id[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  disaster_recovery_data_center_activation_message_at = 0;
  do
  :: disaster_recovery_data_center_activation_message_at < 8 -> assert(disaster_recovery_data_center_activation_message_read.participant_reference_number[disaster_recovery_data_center_activation_message_at] == disaster_recovery_data_center_activation_message_written.participant_reference_number[disaster_recovery_data_center_activation_message_at]); disaster_recovery_data_center_activation_message_at = disaster_recovery_data_center_activation_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Line Integrity Message: 22 bytes ---------------------------------------- */

/* The Line Integrity message is transmitted over the multicast lines at intervals of sixty (60) seconds to verify continued integrity of multicast transmission */
typedef LineIntegrityMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int line_integrity_message_at;

/* every byte of Line Integrity Message set to one value */
inline fill_line_integrity_message(line_integrity_message_record, line_integrity_message_value) {
  line_integrity_message_record.participant_id = line_integrity_message_value;
  fill_participant_timestamp(line_integrity_message_record.participant_timestamp, line_integrity_message_value);
  line_integrity_message_record.message_id = line_integrity_message_value;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = line_integrity_message_value; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Line Integrity Message set to where it lies, so a field read out of place says so */
inline ramp_line_integrity_message(line_integrity_message_record, line_integrity_message_base) {
  line_integrity_message_record.participant_id = (line_integrity_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(line_integrity_message_record.participant_timestamp, line_integrity_message_base + 1);
  line_integrity_message_record.message_id = (line_integrity_message_base + 9 + 1) % 256;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = (line_integrity_message_base + 10 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = (line_integrity_message_base + 14 + line_integrity_message_at + 1) % 256; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message to the wire, 22 bytes from where the cursor stands */
inline encode_line_integrity_message(line_integrity_message_record) {
  wire[at] = line_integrity_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(line_integrity_message_record.participant_timestamp);
  wire[at] = line_integrity_message_record.message_id; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> wire[at] = line_integrity_message_record.transaction_id[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> wire[at] = line_integrity_message_record.participant_reference_number[line_integrity_message_at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* Line Integrity Message off the wire, 22 bytes from where the cursor stands */
inline decode_line_integrity_message(line_integrity_message_record) {
  line_integrity_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(line_integrity_message_record.participant_timestamp);
  line_integrity_message_record.message_id = wire[at]; at = at + 1;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> line_integrity_message_record.transaction_id[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> line_integrity_message_record.participant_reference_number[line_integrity_message_at] = wire[at]; at = at + 1; line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Line Integrity Message is what was written, byte for byte */
inline equal_line_integrity_message(line_integrity_message_read, line_integrity_message_written) {
  assert(line_integrity_message_read.participant_id == line_integrity_message_written.participant_id);
  equal_participant_timestamp(line_integrity_message_read.participant_timestamp, line_integrity_message_written.participant_timestamp);
  assert(line_integrity_message_read.message_id == line_integrity_message_written.message_id);
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 4 -> assert(line_integrity_message_read.transaction_id[line_integrity_message_at] == line_integrity_message_written.transaction_id[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  line_integrity_message_at = 0;
  do
  :: line_integrity_message_at < 8 -> assert(line_integrity_message_read.participant_reference_number[line_integrity_message_at] == line_integrity_message_written.participant_reference_number[line_integrity_message_at]); line_integrity_message_at = line_integrity_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 22 bytes -------------------------------------------- */

/* The End of Day message is transmitted over the multicast lines to advise all Data Recipients that there are no further messages of any type transmitted for the day */
typedef EndOfDayMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_record.participant_id = end_of_day_message_value;
  fill_participant_timestamp(end_of_day_message_record.participant_timestamp, end_of_day_message_value);
  end_of_day_message_record.message_id = end_of_day_message_value;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_record.participant_id = (end_of_day_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(end_of_day_message_record.participant_timestamp, end_of_day_message_base + 1);
  end_of_day_message_record.message_id = (end_of_day_message_base + 9 + 1) % 256;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = (end_of_day_message_base + 10 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = (end_of_day_message_base + 14 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 22 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  wire[at] = end_of_day_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(end_of_day_message_record.participant_timestamp);
  wire[at] = end_of_day_message_record.message_id; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> wire[at] = end_of_day_message_record.transaction_id[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.participant_reference_number[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 22 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(end_of_day_message_record.participant_timestamp);
  end_of_day_message_record.message_id = wire[at]; at = at + 1;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> end_of_day_message_record.transaction_id[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.participant_reference_number[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  assert(end_of_day_message_read.participant_id == end_of_day_message_written.participant_id);
  equal_participant_timestamp(end_of_day_message_read.participant_timestamp, end_of_day_message_written.participant_timestamp);
  assert(end_of_day_message_read.message_id == end_of_day_message_written.message_id);
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 4 -> assert(end_of_day_message_read.transaction_id[end_of_day_message_at] == end_of_day_message_written.transaction_id[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.participant_reference_number[end_of_day_message_at] == end_of_day_message_written.participant_reference_number[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Wide Circuit Breaker Decline Level Status Message: 47 bytes ------ */

/* The Market-Wide Circuit Breaker Decline Level Status message is used to report the calculated Level 1, Level 2 and Level 3 threshold values for the current trading day necessary to trigger a circuit breaker */
typedef MarketWideCircuitBreakerDeclineLevelStatusMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte mwcb_level_1[8];
  byte mwcb_level_2[8];
  byte mwcb_level_3[8];
  byte reserved
};

int market_wide_circuit_breaker_decline_level_status_message_at;

/* every byte of Market Wide Circuit Breaker Decline Level Status Message set to one value */
inline fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_value) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = market_wide_circuit_breaker_decline_level_status_message_value;
  fill_participant_timestamp(market_wide_circuit_breaker_decline_level_status_message_record.participant_timestamp, market_wide_circuit_breaker_decline_level_status_message_value);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = market_wide_circuit_breaker_decline_level_status_message_value;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = market_wide_circuit_breaker_decline_level_status_message_value; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = market_wide_circuit_breaker_decline_level_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Decline Level Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record, market_wide_circuit_breaker_decline_level_status_message_base) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = (market_wide_circuit_breaker_decline_level_status_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(market_wide_circuit_breaker_decline_level_status_message_record.participant_timestamp, market_wide_circuit_breaker_decline_level_status_message_base + 1);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = (market_wide_circuit_breaker_decline_level_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 10 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 14 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 22 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 30 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = (market_wide_circuit_breaker_decline_level_status_message_base + 38 + market_wide_circuit_breaker_decline_level_status_message_at + 1) % 256; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = (market_wide_circuit_breaker_decline_level_status_message_base + 46 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message to the wire, 47 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(market_wide_circuit_breaker_decline_level_status_message_record.participant_timestamp);
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_decline_level_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Decline Level Status Message off the wire, 47 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_record) {
  market_wide_circuit_breaker_decline_level_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(market_wide_circuit_breaker_decline_level_status_message_record.participant_timestamp);
  market_wide_circuit_breaker_decline_level_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> market_wide_circuit_breaker_decline_level_status_message_record.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> market_wide_circuit_breaker_decline_level_status_message_record.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Decline Level Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_read, market_wide_circuit_breaker_decline_level_status_message_written) {
  assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_id == market_wide_circuit_breaker_decline_level_status_message_written.participant_id);
  equal_participant_timestamp(market_wide_circuit_breaker_decline_level_status_message_read.participant_timestamp, market_wide_circuit_breaker_decline_level_status_message_written.participant_timestamp);
  assert(market_wide_circuit_breaker_decline_level_status_message_read.message_id == market_wide_circuit_breaker_decline_level_status_message_written.message_id);
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 4 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.transaction_id[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.participant_reference_number[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_1[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_2[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_decline_level_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_decline_level_status_message_at < 8 -> assert(market_wide_circuit_breaker_decline_level_status_message_read.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at] == market_wide_circuit_breaker_decline_level_status_message_written.mwcb_level_3[market_wide_circuit_breaker_decline_level_status_message_at]); market_wide_circuit_breaker_decline_level_status_message_at = market_wide_circuit_breaker_decline_level_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_decline_level_status_message_read.reserved == market_wide_circuit_breaker_decline_level_status_message_written.reserved);
  skip
}

/* ---- Market Wide Circuit Breaker Status Message: 24 bytes -------------------- */

/* The Market-Wide Circuit Breaker Status message is used to report the Market-Wide Circuit Breaker threshold Level that has been breached. */
typedef MarketWideCircuitBreakerStatusMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte market_wide_circuit_breaker_level_indicator;
  byte reserved
};

int market_wide_circuit_breaker_status_message_at;

/* every byte of Market Wide Circuit Breaker Status Message set to one value */
inline fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_value) {
  market_wide_circuit_breaker_status_message_record.participant_id = market_wide_circuit_breaker_status_message_value;
  fill_participant_timestamp(market_wide_circuit_breaker_status_message_record.participant_timestamp, market_wide_circuit_breaker_status_message_value);
  market_wide_circuit_breaker_status_message_record.message_id = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = market_wide_circuit_breaker_status_message_value; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = market_wide_circuit_breaker_status_message_value;
  market_wide_circuit_breaker_status_message_record.reserved = market_wide_circuit_breaker_status_message_value;
  skip
}

/* each byte of Market Wide Circuit Breaker Status Message set to where it lies, so a field read out of place says so */
inline ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record, market_wide_circuit_breaker_status_message_base) {
  market_wide_circuit_breaker_status_message_record.participant_id = (market_wide_circuit_breaker_status_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(market_wide_circuit_breaker_status_message_record.participant_timestamp, market_wide_circuit_breaker_status_message_base + 1);
  market_wide_circuit_breaker_status_message_record.message_id = (market_wide_circuit_breaker_status_message_base + 9 + 1) % 256;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 10 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = (market_wide_circuit_breaker_status_message_base + 14 + market_wide_circuit_breaker_status_message_at + 1) % 256; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = (market_wide_circuit_breaker_status_message_base + 22 + 1) % 256;
  market_wide_circuit_breaker_status_message_record.reserved = (market_wide_circuit_breaker_status_message_base + 23 + 1) % 256;
  skip
}

/* Market Wide Circuit Breaker Status Message to the wire, 24 bytes from where the cursor stands */
inline encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  wire[at] = market_wide_circuit_breaker_status_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(market_wide_circuit_breaker_status_message_record.participant_timestamp);
  wire[at] = market_wide_circuit_breaker_status_message_record.message_id; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> wire[at] = market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> wire[at] = market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  wire[at] = market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator; at = at + 1;
  wire[at] = market_wide_circuit_breaker_status_message_record.reserved; at = at + 1;
  skip
}

/* Market Wide Circuit Breaker Status Message off the wire, 24 bytes from where the cursor stands */
inline decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_record) {
  market_wide_circuit_breaker_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(market_wide_circuit_breaker_status_message_record.participant_timestamp);
  market_wide_circuit_breaker_status_message_record.message_id = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> market_wide_circuit_breaker_status_message_record.transaction_id[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> market_wide_circuit_breaker_status_message_record.participant_reference_number[market_wide_circuit_breaker_status_message_at] = wire[at]; at = at + 1; market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_record.market_wide_circuit_breaker_level_indicator = wire[at]; at = at + 1;
  market_wide_circuit_breaker_status_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Market Wide Circuit Breaker Status Message is what was written, byte for byte */
inline equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_read, market_wide_circuit_breaker_status_message_written) {
  assert(market_wide_circuit_breaker_status_message_read.participant_id == market_wide_circuit_breaker_status_message_written.participant_id);
  equal_participant_timestamp(market_wide_circuit_breaker_status_message_read.participant_timestamp, market_wide_circuit_breaker_status_message_written.participant_timestamp);
  assert(market_wide_circuit_breaker_status_message_read.message_id == market_wide_circuit_breaker_status_message_written.message_id);
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 4 -> assert(market_wide_circuit_breaker_status_message_read.transaction_id[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.transaction_id[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  market_wide_circuit_breaker_status_message_at = 0;
  do
  :: market_wide_circuit_breaker_status_message_at < 8 -> assert(market_wide_circuit_breaker_status_message_read.participant_reference_number[market_wide_circuit_breaker_status_message_at] == market_wide_circuit_breaker_status_message_written.participant_reference_number[market_wide_circuit_breaker_status_message_at]); market_wide_circuit_breaker_status_message_at = market_wide_circuit_breaker_status_message_at + 1
  :: else -> break
  od;
  assert(market_wide_circuit_breaker_status_message_read.market_wide_circuit_breaker_level_indicator == market_wide_circuit_breaker_status_message_written.market_wide_circuit_breaker_level_indicator);
  assert(market_wide_circuit_breaker_status_message_read.reserved == market_wide_circuit_breaker_status_message_written.reserved);
  skip
}

/* ---- Auction Status Message: 63 bytes ---------------------------------------- */

/* The Auction Status message is used when a Participant in a Cta eligible security */
typedef AuctionStatusMessage {
  byte participant_id;
  ParticipantTimestamp participant_timestamp;
  byte message_id;
  byte transaction_id[4];
  byte participant_reference_number[8];
  byte security_symbol_long[11];
  byte instrument_type;
  byte auction_collar_reference_price[8];
  byte auction_collar_upper_threshold_price[8];
  byte auction_collar_lower_threshold_price[8];
  byte number_of_extensions;
  byte short_sale_restriction_indicator;
  byte primary_listing_market_participant_id;
  byte financial_status_indicator;
  byte future
};

int auction_status_message_at;

/* every byte of Auction Status Message set to one value */
inline fill_auction_status_message(auction_status_message_record, auction_status_message_value) {
  auction_status_message_record.participant_id = auction_status_message_value;
  fill_participant_timestamp(auction_status_message_record.participant_timestamp, auction_status_message_value);
  auction_status_message_record.message_id = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol_long[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = auction_status_message_value;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = auction_status_message_value; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = auction_status_message_value;
  auction_status_message_record.short_sale_restriction_indicator = auction_status_message_value;
  auction_status_message_record.primary_listing_market_participant_id = auction_status_message_value;
  auction_status_message_record.financial_status_indicator = auction_status_message_value;
  auction_status_message_record.future = auction_status_message_value;
  skip
}

/* each byte of Auction Status Message set to where it lies, so a field read out of place says so */
inline ramp_auction_status_message(auction_status_message_record, auction_status_message_base) {
  auction_status_message_record.participant_id = (auction_status_message_base + 0 + 1) % 256;
  ramp_participant_timestamp(auction_status_message_record.participant_timestamp, auction_status_message_base + 1);
  auction_status_message_record.message_id = (auction_status_message_base + 9 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = (auction_status_message_base + 10 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = (auction_status_message_base + 14 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol_long[auction_status_message_at] = (auction_status_message_base + 22 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = (auction_status_message_base + 33 + 1) % 256;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = (auction_status_message_base + 34 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = (auction_status_message_base + 42 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = (auction_status_message_base + 50 + auction_status_message_at + 1) % 256; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = (auction_status_message_base + 58 + 1) % 256;
  auction_status_message_record.short_sale_restriction_indicator = (auction_status_message_base + 59 + 1) % 256;
  auction_status_message_record.primary_listing_market_participant_id = (auction_status_message_base + 60 + 1) % 256;
  auction_status_message_record.financial_status_indicator = (auction_status_message_base + 61 + 1) % 256;
  auction_status_message_record.future = (auction_status_message_base + 62 + 1) % 256;
  skip
}

/* Auction Status Message to the wire, 63 bytes from where the cursor stands */
inline encode_auction_status_message(auction_status_message_record) {
  wire[at] = auction_status_message_record.participant_id; at = at + 1;
  encode_participant_timestamp(auction_status_message_record.participant_timestamp);
  wire[at] = auction_status_message_record.message_id; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> wire[at] = auction_status_message_record.transaction_id[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.participant_reference_number[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> wire[at] = auction_status_message_record.security_symbol_long[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.instrument_type; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_reference_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> wire[at] = auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_status_message_record.number_of_extensions; at = at + 1;
  wire[at] = auction_status_message_record.short_sale_restriction_indicator; at = at + 1;
  wire[at] = auction_status_message_record.primary_listing_market_participant_id; at = at + 1;
  wire[at] = auction_status_message_record.financial_status_indicator; at = at + 1;
  wire[at] = auction_status_message_record.future; at = at + 1;
  skip
}

/* Auction Status Message off the wire, 63 bytes from where the cursor stands */
inline decode_auction_status_message(auction_status_message_record) {
  auction_status_message_record.participant_id = wire[at]; at = at + 1;
  decode_participant_timestamp(auction_status_message_record.participant_timestamp);
  auction_status_message_record.message_id = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> auction_status_message_record.transaction_id[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.participant_reference_number[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> auction_status_message_record.security_symbol_long[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.instrument_type = wire[at]; at = at + 1;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_reference_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_upper_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> auction_status_message_record.auction_collar_lower_threshold_price[auction_status_message_at] = wire[at]; at = at + 1; auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_record.number_of_extensions = wire[at]; at = at + 1;
  auction_status_message_record.short_sale_restriction_indicator = wire[at]; at = at + 1;
  auction_status_message_record.primary_listing_market_participant_id = wire[at]; at = at + 1;
  auction_status_message_record.financial_status_indicator = wire[at]; at = at + 1;
  auction_status_message_record.future = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Status Message is what was written, byte for byte */
inline equal_auction_status_message(auction_status_message_read, auction_status_message_written) {
  assert(auction_status_message_read.participant_id == auction_status_message_written.participant_id);
  equal_participant_timestamp(auction_status_message_read.participant_timestamp, auction_status_message_written.participant_timestamp);
  assert(auction_status_message_read.message_id == auction_status_message_written.message_id);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 4 -> assert(auction_status_message_read.transaction_id[auction_status_message_at] == auction_status_message_written.transaction_id[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.participant_reference_number[auction_status_message_at] == auction_status_message_written.participant_reference_number[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 11 -> assert(auction_status_message_read.security_symbol_long[auction_status_message_at] == auction_status_message_written.security_symbol_long[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.instrument_type == auction_status_message_written.instrument_type);
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_reference_price[auction_status_message_at] == auction_status_message_written.auction_collar_reference_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_upper_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_upper_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  auction_status_message_at = 0;
  do
  :: auction_status_message_at < 8 -> assert(auction_status_message_read.auction_collar_lower_threshold_price[auction_status_message_at] == auction_status_message_written.auction_collar_lower_threshold_price[auction_status_message_at]); auction_status_message_at = auction_status_message_at + 1
  :: else -> break
  od;
  assert(auction_status_message_read.number_of_extensions == auction_status_message_written.number_of_extensions);
  assert(auction_status_message_read.short_sale_restriction_indicator == auction_status_message_written.short_sale_restriction_indicator);
  assert(auction_status_message_read.primary_listing_market_participant_id == auction_status_message_written.primary_listing_market_participant_id);
  assert(auction_status_message_read.financial_status_indicator == auction_status_message_written.financial_status_indicator);
  assert(auction_status_message_read.future == auction_status_message_written.future);
  skip
}

/* ---- Adf Timestamp: 8 bytes -------------------------------------------------- */

/* Adf Timestamp */
typedef AdfTimestamp {
  byte seconds[4];
  byte nanoseconds[4]
};

int adf_timestamp_at;

/* every byte of Adf Timestamp set to one value */
inline fill_adf_timestamp(adf_timestamp_record, adf_timestamp_value) {
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.seconds[adf_timestamp_at] = adf_timestamp_value; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.nanoseconds[adf_timestamp_at] = adf_timestamp_value; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Adf Timestamp set to where it lies, so a field read out of place says so */
inline ramp_adf_timestamp(adf_timestamp_record, adf_timestamp_base) {
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.seconds[adf_timestamp_at] = (adf_timestamp_base + 0 + adf_timestamp_at + 1) % 256; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.nanoseconds[adf_timestamp_at] = (adf_timestamp_base + 4 + adf_timestamp_at + 1) % 256; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Adf Timestamp to the wire, 8 bytes from where the cursor stands */
inline encode_adf_timestamp(adf_timestamp_record) {
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> wire[at] = adf_timestamp_record.seconds[adf_timestamp_at]; at = at + 1; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> wire[at] = adf_timestamp_record.nanoseconds[adf_timestamp_at]; at = at + 1; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* Adf Timestamp off the wire, 8 bytes from where the cursor stands */
inline decode_adf_timestamp(adf_timestamp_record) {
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.seconds[adf_timestamp_at] = wire[at]; at = at + 1; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> adf_timestamp_record.nanoseconds[adf_timestamp_at] = wire[at]; at = at + 1; adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Adf Timestamp is what was written, byte for byte */
inline equal_adf_timestamp(adf_timestamp_read, adf_timestamp_written) {
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> assert(adf_timestamp_read.seconds[adf_timestamp_at] == adf_timestamp_written.seconds[adf_timestamp_at]); adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
  adf_timestamp_at = 0;
  do
  :: adf_timestamp_at < 4 -> assert(adf_timestamp_read.nanoseconds[adf_timestamp_at] == adf_timestamp_written.nanoseconds[adf_timestamp_at]); adf_timestamp_at = adf_timestamp_at + 1
  :: else -> break
  od;
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
    assert(at == 20);
    at = 0;
    decode_block_header(block_header_got);
    assert(at == 20);
    equal_block_header(block_header_got, block_header_sent)
  }
}

/* Participant Timestamp: encoded, read back, and compared */
proctype check_participant_timestamp() {
  ParticipantTimestamp participant_timestamp_sent;
  ParticipantTimestamp participant_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_participant_timestamp(participant_timestamp_sent, 0)
  :: pattern == 1 -> fill_participant_timestamp(participant_timestamp_sent, 32)
  :: pattern == 2 -> fill_participant_timestamp(participant_timestamp_sent, 255)
  :: else -> ramp_participant_timestamp(participant_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_participant_timestamp(participant_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_participant_timestamp(participant_timestamp_got);
    assert(at == 8);
    equal_participant_timestamp(participant_timestamp_got, participant_timestamp_sent)
  }
}

/* Administrative Unformatted Message: encoded, read back, and compared */
proctype check_administrative_unformatted_message() {
  AdministrativeUnformattedMessage administrative_unformatted_message_sent;
  AdministrativeUnformattedMessage administrative_unformatted_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_administrative_unformatted_message(administrative_unformatted_message_sent, 0)
  :: pattern == 1 -> fill_administrative_unformatted_message(administrative_unformatted_message_sent, 32)
  :: pattern == 2 -> fill_administrative_unformatted_message(administrative_unformatted_message_sent, 255)
  :: else -> ramp_administrative_unformatted_message(administrative_unformatted_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_administrative_unformatted_message(administrative_unformatted_message_sent);
    assert(at == 26);
    at = 0;
    decode_administrative_unformatted_message(administrative_unformatted_message_got);
    assert(at == 26);
    equal_administrative_unformatted_message(administrative_unformatted_message_got, administrative_unformatted_message_sent)
  }
}

/* Start Of Day Message: encoded, read back, and compared */
proctype check_start_of_day_message() {
  StartOfDayMessage start_of_day_message_sent;
  StartOfDayMessage start_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_day_message(start_of_day_message_sent, 0)
  :: pattern == 1 -> fill_start_of_day_message(start_of_day_message_sent, 32)
  :: pattern == 2 -> fill_start_of_day_message(start_of_day_message_sent, 255)
  :: else -> ramp_start_of_day_message(start_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_day_message(start_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 22);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
  }
}

/* Finra Close Message: encoded, read back, and compared */
proctype check_finra_close_message() {
  FinraCloseMessage finra_close_message_sent;
  FinraCloseMessage finra_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_close_message(finra_close_message_sent, 0)
  :: pattern == 1 -> fill_finra_close_message(finra_close_message_sent, 32)
  :: pattern == 2 -> fill_finra_close_message(finra_close_message_sent, 255)
  :: else -> ramp_finra_close_message(finra_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_close_message(finra_close_message_sent);
    assert(at == 22);
    at = 0;
    decode_finra_close_message(finra_close_message_got);
    assert(at == 22);
    equal_finra_close_message(finra_close_message_got, finra_close_message_sent)
  }
}

/* Reset Block Sequence Number Message: encoded, read back, and compared */
proctype check_reset_block_sequence_number_message() {
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_sent;
  ResetBlockSequenceNumberMessage reset_block_sequence_number_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  :: pattern == 1 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 32)
  :: pattern == 2 -> fill_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 255)
  :: else -> ramp_reset_block_sequence_number_message(reset_block_sequence_number_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_reset_block_sequence_number_message(reset_block_sequence_number_message_sent);
    assert(at == 22);
    at = 0;
    decode_reset_block_sequence_number_message(reset_block_sequence_number_message_got);
    assert(at == 22);
    equal_reset_block_sequence_number_message(reset_block_sequence_number_message_got, reset_block_sequence_number_message_sent)
  }
}

/* Start Of Test Cycle Message: encoded, read back, and compared */
proctype check_start_of_test_cycle_message() {
  StartOfTestCycleMessage start_of_test_cycle_message_sent;
  StartOfTestCycleMessage start_of_test_cycle_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_test_cycle_message(start_of_test_cycle_message_sent, 0)
  :: pattern == 1 -> fill_start_of_test_cycle_message(start_of_test_cycle_message_sent, 32)
  :: pattern == 2 -> fill_start_of_test_cycle_message(start_of_test_cycle_message_sent, 255)
  :: else -> ramp_start_of_test_cycle_message(start_of_test_cycle_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_test_cycle_message(start_of_test_cycle_message_sent);
    assert(at == 22);
    at = 0;
    decode_start_of_test_cycle_message(start_of_test_cycle_message_got);
    assert(at == 22);
    equal_start_of_test_cycle_message(start_of_test_cycle_message_got, start_of_test_cycle_message_sent)
  }
}

/* End Of Test Cycle Message: encoded, read back, and compared */
proctype check_end_of_test_cycle_message() {
  EndOfTestCycleMessage end_of_test_cycle_message_sent;
  EndOfTestCycleMessage end_of_test_cycle_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_test_cycle_message(end_of_test_cycle_message_sent, 0)
  :: pattern == 1 -> fill_end_of_test_cycle_message(end_of_test_cycle_message_sent, 32)
  :: pattern == 2 -> fill_end_of_test_cycle_message(end_of_test_cycle_message_sent, 255)
  :: else -> ramp_end_of_test_cycle_message(end_of_test_cycle_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_test_cycle_message(end_of_test_cycle_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_test_cycle_message(end_of_test_cycle_message_got);
    assert(at == 22);
    equal_end_of_test_cycle_message(end_of_test_cycle_message_got, end_of_test_cycle_message_sent)
  }
}

/* Finra Open Message: encoded, read back, and compared */
proctype check_finra_open_message() {
  FinraOpenMessage finra_open_message_sent;
  FinraOpenMessage finra_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_finra_open_message(finra_open_message_sent, 0)
  :: pattern == 1 -> fill_finra_open_message(finra_open_message_sent, 32)
  :: pattern == 2 -> fill_finra_open_message(finra_open_message_sent, 255)
  :: else -> ramp_finra_open_message(finra_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_finra_open_message(finra_open_message_sent);
    assert(at == 22);
    at = 0;
    decode_finra_open_message(finra_open_message_got);
    assert(at == 22);
    equal_finra_open_message(finra_open_message_got, finra_open_message_sent)
  }
}

/* Disaster Recovery Data Center Activation Message: encoded, read back, and compared */
proctype check_disaster_recovery_data_center_activation_message() {
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_sent;
  DisasterRecoveryDataCenterActivationMessage disaster_recovery_data_center_activation_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  :: pattern == 1 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 32)
  :: pattern == 2 -> fill_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 255)
  :: else -> ramp_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_sent);
    assert(at == 22);
    at = 0;
    decode_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got);
    assert(at == 22);
    equal_disaster_recovery_data_center_activation_message(disaster_recovery_data_center_activation_message_got, disaster_recovery_data_center_activation_message_sent)
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
    assert(at == 22);
    at = 0;
    decode_line_integrity_message(line_integrity_message_got);
    assert(at == 22);
    equal_line_integrity_message(line_integrity_message_got, line_integrity_message_sent)
  }
}

/* End Of Day Message: encoded, read back, and compared */
proctype check_end_of_day_message() {
  EndOfDayMessage end_of_day_message_sent;
  EndOfDayMessage end_of_day_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_day_message(end_of_day_message_sent, 0)
  :: pattern == 1 -> fill_end_of_day_message(end_of_day_message_sent, 32)
  :: pattern == 2 -> fill_end_of_day_message(end_of_day_message_sent, 255)
  :: else -> ramp_end_of_day_message(end_of_day_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_day_message(end_of_day_message_sent);
    assert(at == 22);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 22);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Market Wide Circuit Breaker Decline Level Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_decline_level_status_message() {
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_sent;
  MarketWideCircuitBreakerDeclineLevelStatusMessage market_wide_circuit_breaker_decline_level_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_sent);
    assert(at == 47);
    at = 0;
    decode_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got);
    assert(at == 47);
    equal_market_wide_circuit_breaker_decline_level_status_message(market_wide_circuit_breaker_decline_level_status_message_got, market_wide_circuit_breaker_decline_level_status_message_sent)
  }
}

/* Market Wide Circuit Breaker Status Message: encoded, read back, and compared */
proctype check_market_wide_circuit_breaker_status_message() {
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_sent;
  MarketWideCircuitBreakerStatusMessage market_wide_circuit_breaker_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  :: pattern == 1 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 32)
  :: pattern == 2 -> fill_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 255)
  :: else -> ramp_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_sent);
    assert(at == 24);
    at = 0;
    decode_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got);
    assert(at == 24);
    equal_market_wide_circuit_breaker_status_message(market_wide_circuit_breaker_status_message_got, market_wide_circuit_breaker_status_message_sent)
  }
}

/* Auction Status Message: encoded, read back, and compared */
proctype check_auction_status_message() {
  AuctionStatusMessage auction_status_message_sent;
  AuctionStatusMessage auction_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_status_message(auction_status_message_sent, 0)
  :: pattern == 1 -> fill_auction_status_message(auction_status_message_sent, 32)
  :: pattern == 2 -> fill_auction_status_message(auction_status_message_sent, 255)
  :: else -> ramp_auction_status_message(auction_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_status_message(auction_status_message_sent);
    assert(at == 63);
    at = 0;
    decode_auction_status_message(auction_status_message_got);
    assert(at == 63);
    equal_auction_status_message(auction_status_message_got, auction_status_message_sent)
  }
}

/* Adf Timestamp: encoded, read back, and compared */
proctype check_adf_timestamp() {
  AdfTimestamp adf_timestamp_sent;
  AdfTimestamp adf_timestamp_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_adf_timestamp(adf_timestamp_sent, 0)
  :: pattern == 1 -> fill_adf_timestamp(adf_timestamp_sent, 32)
  :: pattern == 2 -> fill_adf_timestamp(adf_timestamp_sent, 255)
  :: else -> ramp_adf_timestamp(adf_timestamp_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_adf_timestamp(adf_timestamp_sent);
    assert(at == 8);
    at = 0;
    decode_adf_timestamp(adf_timestamp_got);
    assert(at == 8);
    equal_adf_timestamp(adf_timestamp_got, adf_timestamp_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sip_block_timestamp()
  :: run check_block_header()
  :: run check_participant_timestamp()
  :: run check_administrative_unformatted_message()
  :: run check_start_of_day_message()
  :: run check_finra_close_message()
  :: run check_reset_block_sequence_number_message()
  :: run check_start_of_test_cycle_message()
  :: run check_end_of_test_cycle_message()
  :: run check_finra_open_message()
  :: run check_disaster_recovery_data_center_activation_message()
  :: run check_line_integrity_message()
  :: run check_end_of_day_message()
  :: run check_market_wide_circuit_breaker_decline_level_status_message()
  :: run check_market_wide_circuit_breaker_status_message()
  :: run check_auction_status_message()
  :: run check_adf_timestamp()
  fi
}
