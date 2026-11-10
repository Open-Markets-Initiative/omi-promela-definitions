/*
 * TMX Group Index Feed
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 122

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 22 bytes ------------------------------------------------ */

/* Twenty two byte ascii header carried on every Qrtmd message */
typedef MessageHeader {
  byte message_length[4];
  byte sequence_number[9];
  byte service_identifier[3];
  byte retransmission_identifier;
  byte continuation_identifier;
  byte message_type[2];
  byte exchange_identifier[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = message_header_value;
  message_header_record.continuation_identifier = message_header_value;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = (message_header_base + 13 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = (message_header_base + 16 + 1) % 256;
  message_header_record.continuation_identifier = (message_header_base + 17 + 1) % 256;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = (message_header_base + 18 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = (message_header_base + 20 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 22 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.message_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> wire[at] = message_header_record.sequence_number[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> wire[at] = message_header_record.service_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.retransmission_identifier; at = at + 1;
  wire[at] = message_header_record.continuation_identifier; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.exchange_identifier[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 22 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.message_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> message_header_record.sequence_number[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> message_header_record.service_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.retransmission_identifier = wire[at]; at = at + 1;
  message_header_record.continuation_identifier = wire[at]; at = at + 1;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.exchange_identifier[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.message_length[message_header_at] == message_header_written.message_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 9 -> assert(message_header_read.sequence_number[message_header_at] == message_header_written.sequence_number[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 3 -> assert(message_header_read.service_identifier[message_header_at] == message_header_written.service_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.retransmission_identifier == message_header_written.retransmission_identifier);
  assert(message_header_read.continuation_identifier == message_header_written.continuation_identifier);
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_type[message_header_at] == message_header_written.message_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.exchange_identifier[message_header_at] == message_header_written.exchange_identifier[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- S And P Tsx Official Index Level Message: 122 bytes --------------------- */

/* Level of an index as of the time of the calculation. */
typedef SAndPTsxOfficialIndexLevelMessage {
  byte time[6];
  byte index_id[4];
  byte last_level[8];
  byte net_change[7];
  byte volume[11];
  byte value[12];
  byte open_level[8];
  byte settlement_value[8];
  byte special_opening_quote[8];
  byte percent_trading[7];
  byte high_level[8];
  byte low_level[8];
  byte pe[7];
  byte yield[5];
  byte markers;
  byte bid_price[7];
  byte ask_price[7]
};

int s_and_p_tsx_official_index_level_message_at;

/* every byte of S And P Tsx Official Index Level Message set to one value */
inline fill_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_record, s_and_p_tsx_official_index_level_message_value) {
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 6 -> s_and_p_tsx_official_index_level_message_record.time[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 4 -> s_and_p_tsx_official_index_level_message_record.index_id[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.last_level[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.net_change[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 11 -> s_and_p_tsx_official_index_level_message_record.volume[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 12 -> s_and_p_tsx_official_index_level_message_record.value[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.open_level[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.settlement_value[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.special_opening_quote[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.percent_trading[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.high_level[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.low_level[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.pe[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 5 -> s_and_p_tsx_official_index_level_message_record.yield[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_record.markers = s_and_p_tsx_official_index_level_message_value;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.bid_price[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.ask_price[s_and_p_tsx_official_index_level_message_at] = s_and_p_tsx_official_index_level_message_value; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of S And P Tsx Official Index Level Message set to where it lies, so a field read out of place says so */
inline ramp_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_record, s_and_p_tsx_official_index_level_message_base) {
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 6 -> s_and_p_tsx_official_index_level_message_record.time[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 0 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 4 -> s_and_p_tsx_official_index_level_message_record.index_id[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 6 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.last_level[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 10 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.net_change[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 18 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 11 -> s_and_p_tsx_official_index_level_message_record.volume[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 25 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 12 -> s_and_p_tsx_official_index_level_message_record.value[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 36 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.open_level[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 48 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.settlement_value[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 56 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.special_opening_quote[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 64 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.percent_trading[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 72 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.high_level[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 79 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.low_level[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 87 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.pe[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 95 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 5 -> s_and_p_tsx_official_index_level_message_record.yield[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 102 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_record.markers = (s_and_p_tsx_official_index_level_message_base + 107 + 1) % 256;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.bid_price[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 108 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.ask_price[s_and_p_tsx_official_index_level_message_at] = (s_and_p_tsx_official_index_level_message_base + 115 + s_and_p_tsx_official_index_level_message_at + 1) % 256; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* S And P Tsx Official Index Level Message to the wire, 122 bytes from where the cursor stands */
inline encode_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_record) {
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 6 -> wire[at] = s_and_p_tsx_official_index_level_message_record.time[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 4 -> wire[at] = s_and_p_tsx_official_index_level_message_record.index_id[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.last_level[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> wire[at] = s_and_p_tsx_official_index_level_message_record.net_change[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 11 -> wire[at] = s_and_p_tsx_official_index_level_message_record.volume[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 12 -> wire[at] = s_and_p_tsx_official_index_level_message_record.value[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.open_level[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.settlement_value[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.special_opening_quote[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> wire[at] = s_and_p_tsx_official_index_level_message_record.percent_trading[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.high_level[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> wire[at] = s_and_p_tsx_official_index_level_message_record.low_level[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> wire[at] = s_and_p_tsx_official_index_level_message_record.pe[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 5 -> wire[at] = s_and_p_tsx_official_index_level_message_record.yield[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  wire[at] = s_and_p_tsx_official_index_level_message_record.markers; at = at + 1;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> wire[at] = s_and_p_tsx_official_index_level_message_record.bid_price[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> wire[at] = s_and_p_tsx_official_index_level_message_record.ask_price[s_and_p_tsx_official_index_level_message_at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* S And P Tsx Official Index Level Message off the wire, 122 bytes from where the cursor stands */
inline decode_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_record) {
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 6 -> s_and_p_tsx_official_index_level_message_record.time[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 4 -> s_and_p_tsx_official_index_level_message_record.index_id[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.last_level[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.net_change[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 11 -> s_and_p_tsx_official_index_level_message_record.volume[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 12 -> s_and_p_tsx_official_index_level_message_record.value[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.open_level[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.settlement_value[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.special_opening_quote[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.percent_trading[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.high_level[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> s_and_p_tsx_official_index_level_message_record.low_level[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.pe[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 5 -> s_and_p_tsx_official_index_level_message_record.yield[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_record.markers = wire[at]; at = at + 1;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.bid_price[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> s_and_p_tsx_official_index_level_message_record.ask_price[s_and_p_tsx_official_index_level_message_at] = wire[at]; at = at + 1; s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of S And P Tsx Official Index Level Message is what was written, byte for byte */
inline equal_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_read, s_and_p_tsx_official_index_level_message_written) {
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 6 -> assert(s_and_p_tsx_official_index_level_message_read.time[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.time[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 4 -> assert(s_and_p_tsx_official_index_level_message_read.index_id[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.index_id[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.last_level[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.last_level[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> assert(s_and_p_tsx_official_index_level_message_read.net_change[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.net_change[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 11 -> assert(s_and_p_tsx_official_index_level_message_read.volume[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.volume[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 12 -> assert(s_and_p_tsx_official_index_level_message_read.value[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.value[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.open_level[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.open_level[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.settlement_value[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.settlement_value[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.special_opening_quote[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.special_opening_quote[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> assert(s_and_p_tsx_official_index_level_message_read.percent_trading[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.percent_trading[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.high_level[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.high_level[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 8 -> assert(s_and_p_tsx_official_index_level_message_read.low_level[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.low_level[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> assert(s_and_p_tsx_official_index_level_message_read.pe[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.pe[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 5 -> assert(s_and_p_tsx_official_index_level_message_read.yield[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.yield[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  assert(s_and_p_tsx_official_index_level_message_read.markers == s_and_p_tsx_official_index_level_message_written.markers);
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> assert(s_and_p_tsx_official_index_level_message_read.bid_price[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.bid_price[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  s_and_p_tsx_official_index_level_message_at = 0;
  do
  :: s_and_p_tsx_official_index_level_message_at < 7 -> assert(s_and_p_tsx_official_index_level_message_read.ask_price[s_and_p_tsx_official_index_level_message_at] == s_and_p_tsx_official_index_level_message_written.ask_price[s_and_p_tsx_official_index_level_message_at]); s_and_p_tsx_official_index_level_message_at = s_and_p_tsx_official_index_level_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

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
    assert(at == 22);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 22);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* S And P Tsx Official Index Level Message: encoded, read back, and compared */
proctype check_s_and_p_tsx_official_index_level_message() {
  SAndPTsxOfficialIndexLevelMessage s_and_p_tsx_official_index_level_message_sent;
  SAndPTsxOfficialIndexLevelMessage s_and_p_tsx_official_index_level_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_sent, 0)
  :: pattern == 1 -> fill_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_sent, 32)
  :: pattern == 2 -> fill_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_sent, 255)
  :: else -> ramp_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_sent);
    assert(at == 122);
    at = 0;
    decode_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_got);
    assert(at == 122);
    equal_s_and_p_tsx_official_index_level_message(s_and_p_tsx_official_index_level_message_got, s_and_p_tsx_official_index_level_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_s_and_p_tsx_official_index_level_message()
  fi
}
