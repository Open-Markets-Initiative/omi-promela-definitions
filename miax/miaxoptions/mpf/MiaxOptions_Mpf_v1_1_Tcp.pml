/*
 * Miami International Holdings MIAX Product Feed
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
 *   - a run filling what frames it
 *   - a length prefix framing what follows
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 37

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Sesm Packet Header: 3 bytes --------------------------------------------- */

/* SesM packet header */
typedef SesmPacketHeader {
  byte sesm_packet_length[2];
  byte sesm_packet_type
};

int sesm_packet_header_at;

/* every byte of Sesm Packet Header set to one value */
inline fill_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_value) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = sesm_packet_header_value; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = sesm_packet_header_value;
  skip
}

/* each byte of Sesm Packet Header set to where it lies, so a field read out of place says so */
inline ramp_sesm_packet_header(sesm_packet_header_record, sesm_packet_header_base) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = (sesm_packet_header_base + 0 + sesm_packet_header_at + 1) % 256; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = (sesm_packet_header_base + 2 + 1) % 256;
  skip
}

/* Sesm Packet Header to the wire, 3 bytes from where the cursor stands */
inline encode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> wire[at] = sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  wire[at] = sesm_packet_header_record.sesm_packet_type; at = at + 1;
  skip
}

/* Sesm Packet Header off the wire, 3 bytes from where the cursor stands */
inline decode_sesm_packet_header(sesm_packet_header_record) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> sesm_packet_header_record.sesm_packet_length[sesm_packet_header_at] = wire[at]; at = at + 1; sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  sesm_packet_header_record.sesm_packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sesm Packet Header is what was written, byte for byte */
inline equal_sesm_packet_header(sesm_packet_header_read, sesm_packet_header_written) {
  sesm_packet_header_at = 0;
  do
  :: sesm_packet_header_at < 2 -> assert(sesm_packet_header_read.sesm_packet_length[sesm_packet_header_at] == sesm_packet_header_written.sesm_packet_length[sesm_packet_header_at]); sesm_packet_header_at = sesm_packet_header_at + 1
  :: else -> break
  od;
  assert(sesm_packet_header_read.sesm_packet_type == sesm_packet_header_written.sesm_packet_type);
  skip
}

/* ---- Refresh Request Message: 1 bytes ---------------------------------------- */

/* Sent by the firm over the MPF Retransmission Interface (SesM Unsequenced Data Packet) to request a Last Value Refresh of a particular data set identified by Refresh Message Type. */
typedef RefreshRequestMessage {
  byte refresh_message_type
};

/* every byte of Refresh Request Message set to one value */
inline fill_refresh_request_message(refresh_request_message_record, refresh_request_message_value) {
  refresh_request_message_record.refresh_message_type = refresh_request_message_value;
  skip
}

/* each byte of Refresh Request Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_request_message(refresh_request_message_record, refresh_request_message_base) {
  refresh_request_message_record.refresh_message_type = (refresh_request_message_base + 0 + 1) % 256;
  skip
}

/* Refresh Request Message to the wire, 1 bytes from where the cursor stands */
inline encode_refresh_request_message(refresh_request_message_record) {
  wire[at] = refresh_request_message_record.refresh_message_type; at = at + 1;
  skip
}

/* Refresh Request Message off the wire, 1 bytes from where the cursor stands */
inline decode_refresh_request_message(refresh_request_message_record) {
  refresh_request_message_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Refresh Request Message is what was written, byte for byte */
inline equal_refresh_request_message(refresh_request_message_read, refresh_request_message_written) {
  assert(refresh_request_message_read.refresh_message_type == refresh_request_message_written.refresh_message_type);
  skip
}

/* ---- System Time Message: 4 bytes -------------------------------------------- */

/* This is the message format that will be used to disseminate the “seconds” part of the timestamp that is applicable to all messages that are sent in the current second. */
typedef SystemTimeMessage {
  byte seconds[4]
};

int system_time_message_at;

/* every byte of System Time Message set to one value */
inline fill_system_time_message(system_time_message_record, system_time_message_value) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = system_time_message_value; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Time Message set to where it lies, so a field read out of place says so */
inline ramp_system_time_message(system_time_message_record, system_time_message_base) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = (system_time_message_base + 0 + system_time_message_at + 1) % 256; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Time Message to the wire, 4 bytes from where the cursor stands */
inline encode_system_time_message(system_time_message_record) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> wire[at] = system_time_message_record.seconds[system_time_message_at]; at = at + 1; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Time Message off the wire, 4 bytes from where the cursor stands */
inline decode_system_time_message(system_time_message_record) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> system_time_message_record.seconds[system_time_message_at] = wire[at]; at = at + 1; system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Time Message is what was written, byte for byte */
inline equal_system_time_message(system_time_message_read, system_time_message_written) {
  system_time_message_at = 0;
  do
  :: system_time_message_at < 4 -> assert(system_time_message_read.seconds[system_time_message_at] == system_time_message_written.seconds[system_time_message_at]); system_time_message_at = system_time_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Definition Message: 37 bytes ------------------------------------- */

/* This is the message format that will be used to disseminate all Synthetic Future symbol definitions for the current session. */
typedef SymbolDefinitionMessage {
  byte nanoseconds[4];
  byte synthetic_future_symbol[8];
  byte settlement_date[8];
  byte symbol_status;
  byte reserved_16[16]
};

int symbol_definition_message_at;

/* every byte of Symbol Definition Message set to one value */
inline fill_symbol_definition_message(symbol_definition_message_record, symbol_definition_message_value) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = symbol_definition_message_value;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = symbol_definition_message_value; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Definition Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_definition_message(symbol_definition_message_record, symbol_definition_message_base) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = (symbol_definition_message_base + 0 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = (symbol_definition_message_base + 4 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = (symbol_definition_message_base + 12 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = (symbol_definition_message_base + 20 + 1) % 256;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = (symbol_definition_message_base + 21 + symbol_definition_message_at + 1) % 256; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Definition Message to the wire, 37 bytes from where the cursor stands */
inline encode_symbol_definition_message(symbol_definition_message_record) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> wire[at] = symbol_definition_message_record.nanoseconds[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> wire[at] = symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> wire[at] = symbol_definition_message_record.settlement_date[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  wire[at] = symbol_definition_message_record.symbol_status; at = at + 1;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> wire[at] = symbol_definition_message_record.reserved_16[symbol_definition_message_at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Definition Message off the wire, 37 bytes from where the cursor stands */
inline decode_symbol_definition_message(symbol_definition_message_record) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> symbol_definition_message_record.nanoseconds[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.synthetic_future_symbol[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> symbol_definition_message_record.settlement_date[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_record.symbol_status = wire[at]; at = at + 1;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> symbol_definition_message_record.reserved_16[symbol_definition_message_at] = wire[at]; at = at + 1; symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Definition Message is what was written, byte for byte */
inline equal_symbol_definition_message(symbol_definition_message_read, symbol_definition_message_written) {
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 4 -> assert(symbol_definition_message_read.nanoseconds[symbol_definition_message_at] == symbol_definition_message_written.nanoseconds[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> assert(symbol_definition_message_read.synthetic_future_symbol[symbol_definition_message_at] == symbol_definition_message_written.synthetic_future_symbol[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 8 -> assert(symbol_definition_message_read.settlement_date[symbol_definition_message_at] == symbol_definition_message_written.settlement_date[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  assert(symbol_definition_message_read.symbol_status == symbol_definition_message_written.symbol_status);
  symbol_definition_message_at = 0;
  do
  :: symbol_definition_message_at < 16 -> assert(symbol_definition_message_read.reserved_16[symbol_definition_message_at] == symbol_definition_message_written.reserved_16[symbol_definition_message_at]); symbol_definition_message_at = symbol_definition_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Index Value Message: 13 bytes ------------------------------------------- */

/* This is the message format that will be used to disseminate current index value. The index value may be the index cash value or the index settlement value, as identified by the Index Symbol. */
typedef IndexValueMessage {
  byte nanoseconds[4];
  byte symbol[5];
  byte value[4]
};

int index_value_message_at;

/* every byte of Index Value Message set to one value */
inline fill_index_value_message(index_value_message_record, index_value_message_value) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = index_value_message_value; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Value Message set to where it lies, so a field read out of place says so */
inline ramp_index_value_message(index_value_message_record, index_value_message_base) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = (index_value_message_base + 0 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = (index_value_message_base + 4 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = (index_value_message_base + 9 + index_value_message_at + 1) % 256; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message to the wire, 13 bytes from where the cursor stands */
inline encode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.nanoseconds[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> wire[at] = index_value_message_record.symbol[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> wire[at] = index_value_message_record.value[index_value_message_at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Value Message off the wire, 13 bytes from where the cursor stands */
inline decode_index_value_message(index_value_message_record) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.nanoseconds[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> index_value_message_record.symbol[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> index_value_message_record.value[index_value_message_at] = wire[at]; at = at + 1; index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Value Message is what was written, byte for byte */
inline equal_index_value_message(index_value_message_read, index_value_message_written) {
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.nanoseconds[index_value_message_at] == index_value_message_written.nanoseconds[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 5 -> assert(index_value_message_read.symbol[index_value_message_at] == index_value_message_written.symbol[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  index_value_message_at = 0;
  do
  :: index_value_message_at < 4 -> assert(index_value_message_read.value[index_value_message_at] == index_value_message_written.value[index_value_message_at]); index_value_message_at = index_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Synthetic Future Value Message: 24 bytes -------------------------------- */

/* This is the message format that will be used to disseminate current Synthetic Future values. The specific Synthetic Future value is identified by the Synthetic Future Symbol. */
typedef SyntheticFutureValueMessage {
  byte nanoseconds[4];
  byte synthetic_future_symbol[8];
  byte value[4];
  byte reserved_8[8]
};

int synthetic_future_value_message_at;

/* every byte of Synthetic Future Value Message set to one value */
inline fill_synthetic_future_value_message(synthetic_future_value_message_record, synthetic_future_value_message_value) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = synthetic_future_value_message_value; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Synthetic Future Value Message set to where it lies, so a field read out of place says so */
inline ramp_synthetic_future_value_message(synthetic_future_value_message_record, synthetic_future_value_message_base) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 0 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 4 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 12 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = (synthetic_future_value_message_base + 16 + synthetic_future_value_message_at + 1) % 256; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synthetic Future Value Message to the wire, 24 bytes from where the cursor stands */
inline encode_synthetic_future_value_message(synthetic_future_value_message_record) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> wire[at] = synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> wire[at] = synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> wire[at] = synthetic_future_value_message_record.value[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> wire[at] = synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* Synthetic Future Value Message off the wire, 24 bytes from where the cursor stands */
inline decode_synthetic_future_value_message(synthetic_future_value_message_record) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.nanoseconds[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.synthetic_future_symbol[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> synthetic_future_value_message_record.value[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> synthetic_future_value_message_record.reserved_8[synthetic_future_value_message_at] = wire[at]; at = at + 1; synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Synthetic Future Value Message is what was written, byte for byte */
inline equal_synthetic_future_value_message(synthetic_future_value_message_read, synthetic_future_value_message_written) {
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> assert(synthetic_future_value_message_read.nanoseconds[synthetic_future_value_message_at] == synthetic_future_value_message_written.nanoseconds[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> assert(synthetic_future_value_message_read.synthetic_future_symbol[synthetic_future_value_message_at] == synthetic_future_value_message_written.synthetic_future_symbol[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 4 -> assert(synthetic_future_value_message_read.value[synthetic_future_value_message_at] == synthetic_future_value_message_written.value[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  synthetic_future_value_message_at = 0;
  do
  :: synthetic_future_value_message_at < 8 -> assert(synthetic_future_value_message_read.reserved_8[synthetic_future_value_message_at] == synthetic_future_value_message_written.reserved_8[synthetic_future_value_message_at]); synthetic_future_value_message_at = synthetic_future_value_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Refresh Notification Message: 1 bytes ---------------------------- */

/* Sent by MIAX Options over the MPF Retransmission Interface (SesM Unsequenced Data Packet) when the refresh response is complete. */
typedef EndOfRefreshNotificationMessage {
  byte refresh_message_type
};

/* every byte of End Of Refresh Notification Message set to one value */
inline fill_end_of_refresh_notification_message(end_of_refresh_notification_message_record, end_of_refresh_notification_message_value) {
  end_of_refresh_notification_message_record.refresh_message_type = end_of_refresh_notification_message_value;
  skip
}

/* each byte of End Of Refresh Notification Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_refresh_notification_message(end_of_refresh_notification_message_record, end_of_refresh_notification_message_base) {
  end_of_refresh_notification_message_record.refresh_message_type = (end_of_refresh_notification_message_base + 0 + 1) % 256;
  skip
}

/* End Of Refresh Notification Message to the wire, 1 bytes from where the cursor stands */
inline encode_end_of_refresh_notification_message(end_of_refresh_notification_message_record) {
  wire[at] = end_of_refresh_notification_message_record.refresh_message_type; at = at + 1;
  skip
}

/* End Of Refresh Notification Message off the wire, 1 bytes from where the cursor stands */
inline decode_end_of_refresh_notification_message(end_of_refresh_notification_message_record) {
  end_of_refresh_notification_message_record.refresh_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of End Of Refresh Notification Message is what was written, byte for byte */
inline equal_end_of_refresh_notification_message(end_of_refresh_notification_message_read, end_of_refresh_notification_message_written) {
  assert(end_of_refresh_notification_message_read.refresh_message_type == end_of_refresh_notification_message_written.refresh_message_type);
  skip
}

/* ---- Login Request: 35 bytes ------------------------------------------------- */

/* The SesM client must send a Login request packet immediately upon establishing a new TCP/IP socket connection to the server */
typedef LoginRequest {
  byte sesm_version[5];
  byte username[5];
  byte computer_id[8];
  byte application_protocol[8];
  byte requested_trading_session_id;
  byte requested_sequence_number[8]
};

int login_request_at;

/* every byte of Login Request set to one value */
inline fill_login_request(login_request_record, login_request_value) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = login_request_value;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = login_request_value; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request set to where it lies, so a field read out of place says so */
inline ramp_login_request(login_request_record, login_request_base) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = (login_request_base + 0 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = (login_request_base + 5 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = (login_request_base + 10 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = (login_request_base + 18 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = (login_request_base + 26 + 1) % 256;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = (login_request_base + 27 + login_request_at + 1) % 256; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request to the wire, 35 bytes from where the cursor stands */
inline encode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.sesm_version[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> wire[at] = login_request_record.username[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.computer_id[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.application_protocol[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  wire[at] = login_request_record.requested_trading_session_id; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> wire[at] = login_request_record.requested_sequence_number[login_request_at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request off the wire, 35 bytes from where the cursor stands */
inline decode_login_request(login_request_record) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.sesm_version[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> login_request_record.username[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.computer_id[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.application_protocol[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_record.requested_trading_session_id = wire[at]; at = at + 1;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> login_request_record.requested_sequence_number[login_request_at] = wire[at]; at = at + 1; login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request is what was written, byte for byte */
inline equal_login_request(login_request_read, login_request_written) {
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.sesm_version[login_request_at] == login_request_written.sesm_version[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 5 -> assert(login_request_read.username[login_request_at] == login_request_written.username[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.computer_id[login_request_at] == login_request_written.computer_id[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.application_protocol[login_request_at] == login_request_written.application_protocol[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  assert(login_request_read.requested_trading_session_id == login_request_written.requested_trading_session_id);
  login_request_at = 0;
  do
  :: login_request_at < 8 -> assert(login_request_read.requested_sequence_number[login_request_at] == login_request_written.requested_sequence_number[login_request_at]); login_request_at = login_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response: 11 bytes ------------------------------------------------ */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef LoginResponse {
  byte number_of_matching_engines;
  byte login_status;
  byte trading_session_id;
  byte highest_sequence_number[8]
};

int login_response_at;

/* every byte of Login Response set to one value */
inline fill_login_response(login_response_record, login_response_value) {
  login_response_record.number_of_matching_engines = login_response_value;
  login_response_record.login_status = login_response_value;
  login_response_record.trading_session_id = login_response_value;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = login_response_value; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Response set to where it lies, so a field read out of place says so */
inline ramp_login_response(login_response_record, login_response_base) {
  login_response_record.number_of_matching_engines = (login_response_base + 0 + 1) % 256;
  login_response_record.login_status = (login_response_base + 1 + 1) % 256;
  login_response_record.trading_session_id = (login_response_base + 2 + 1) % 256;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = (login_response_base + 3 + login_response_at + 1) % 256; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response to the wire, 11 bytes from where the cursor stands */
inline encode_login_response(login_response_record) {
  wire[at] = login_response_record.number_of_matching_engines; at = at + 1;
  wire[at] = login_response_record.login_status; at = at + 1;
  wire[at] = login_response_record.trading_session_id; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> wire[at] = login_response_record.highest_sequence_number[login_response_at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* Login Response off the wire, 11 bytes from where the cursor stands */
inline decode_login_response(login_response_record) {
  login_response_record.number_of_matching_engines = wire[at]; at = at + 1;
  login_response_record.login_status = wire[at]; at = at + 1;
  login_response_record.trading_session_id = wire[at]; at = at + 1;
  login_response_at = 0;
  do
  :: login_response_at < 8 -> login_response_record.highest_sequence_number[login_response_at] = wire[at]; at = at + 1; login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Response is what was written, byte for byte */
inline equal_login_response(login_response_read, login_response_written) {
  assert(login_response_read.number_of_matching_engines == login_response_written.number_of_matching_engines);
  assert(login_response_read.login_status == login_response_written.login_status);
  assert(login_response_read.trading_session_id == login_response_written.trading_session_id);
  login_response_at = 0;
  do
  :: login_response_at < 8 -> assert(login_response_read.highest_sequence_number[login_response_at] == login_response_written.highest_sequence_number[login_response_at]); login_response_at = login_response_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Synchronization Complete: 1 bytes --------------------------------------- */

/* The SesM server sends a Login response packet in response a Login request packet from the client */
typedef SynchronizationComplete {
  byte number_of_matching_engines
};

/* every byte of Synchronization Complete set to one value */
inline fill_synchronization_complete(synchronization_complete_record, synchronization_complete_value) {
  synchronization_complete_record.number_of_matching_engines = synchronization_complete_value;
  skip
}

/* each byte of Synchronization Complete set to where it lies, so a field read out of place says so */
inline ramp_synchronization_complete(synchronization_complete_record, synchronization_complete_base) {
  synchronization_complete_record.number_of_matching_engines = (synchronization_complete_base + 0 + 1) % 256;
  skip
}

/* Synchronization Complete to the wire, 1 bytes from where the cursor stands */
inline encode_synchronization_complete(synchronization_complete_record) {
  wire[at] = synchronization_complete_record.number_of_matching_engines; at = at + 1;
  skip
}

/* Synchronization Complete off the wire, 1 bytes from where the cursor stands */
inline decode_synchronization_complete(synchronization_complete_record) {
  synchronization_complete_record.number_of_matching_engines = wire[at]; at = at + 1;
  skip
}

/* what was read of Synchronization Complete is what was written, byte for byte */
inline equal_synchronization_complete(synchronization_complete_read, synchronization_complete_written) {
  assert(synchronization_complete_read.number_of_matching_engines == synchronization_complete_written.number_of_matching_engines);
  skip
}

/* ---- Retransmission Request: 16 bytes ---------------------------------------- */

/* The SesM client uses this packet to request a retransmission server to retransmit a range of packets */
typedef RetransmissionRequest {
  byte start_sequence_number[8];
  byte end_sequence_number[8]
};

int retransmission_request_at;

/* every byte of Retransmission Request set to one value */
inline fill_retransmission_request(retransmission_request_record, retransmission_request_value) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = retransmission_request_value; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retransmission Request set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request(retransmission_request_record, retransmission_request_base) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = (retransmission_request_base + 0 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = (retransmission_request_base + 8 + retransmission_request_at + 1) % 256; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request to the wire, 16 bytes from where the cursor stands */
inline encode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.start_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> wire[at] = retransmission_request_record.end_sequence_number[retransmission_request_at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* Retransmission Request off the wire, 16 bytes from where the cursor stands */
inline decode_retransmission_request(retransmission_request_record) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.start_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> retransmission_request_record.end_sequence_number[retransmission_request_at] = wire[at]; at = at + 1; retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retransmission Request is what was written, byte for byte */
inline equal_retransmission_request(retransmission_request_read, retransmission_request_written) {
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.start_sequence_number[retransmission_request_at] == retransmission_request_written.start_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  retransmission_request_at = 0;
  do
  :: retransmission_request_at < 8 -> assert(retransmission_request_read.end_sequence_number[retransmission_request_at] == retransmission_request_written.end_sequence_number[retransmission_request_at]); retransmission_request_at = retransmission_request_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Sesm Packet Header: encoded, read back, and compared */
proctype check_sesm_packet_header() {
  SesmPacketHeader sesm_packet_header_sent;
  SesmPacketHeader sesm_packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sesm_packet_header(sesm_packet_header_sent, 0)
  :: pattern == 1 -> fill_sesm_packet_header(sesm_packet_header_sent, 32)
  :: pattern == 2 -> fill_sesm_packet_header(sesm_packet_header_sent, 255)
  :: else -> ramp_sesm_packet_header(sesm_packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sesm_packet_header(sesm_packet_header_sent);
    assert(at == 3);
    at = 0;
    decode_sesm_packet_header(sesm_packet_header_got);
    assert(at == 3);
    equal_sesm_packet_header(sesm_packet_header_got, sesm_packet_header_sent)
  }
}

/* Refresh Request Message: encoded, read back, and compared */
proctype check_refresh_request_message() {
  RefreshRequestMessage refresh_request_message_sent;
  RefreshRequestMessage refresh_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_request_message(refresh_request_message_sent, 0)
  :: pattern == 1 -> fill_refresh_request_message(refresh_request_message_sent, 32)
  :: pattern == 2 -> fill_refresh_request_message(refresh_request_message_sent, 255)
  :: else -> ramp_refresh_request_message(refresh_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_request_message(refresh_request_message_sent);
    assert(at == 1);
    at = 0;
    decode_refresh_request_message(refresh_request_message_got);
    assert(at == 1);
    equal_refresh_request_message(refresh_request_message_got, refresh_request_message_sent)
  }
}

/* System Time Message: encoded, read back, and compared */
proctype check_system_time_message() {
  SystemTimeMessage system_time_message_sent;
  SystemTimeMessage system_time_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_time_message(system_time_message_sent, 0)
  :: pattern == 1 -> fill_system_time_message(system_time_message_sent, 32)
  :: pattern == 2 -> fill_system_time_message(system_time_message_sent, 255)
  :: else -> ramp_system_time_message(system_time_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_time_message(system_time_message_sent);
    assert(at == 4);
    at = 0;
    decode_system_time_message(system_time_message_got);
    assert(at == 4);
    equal_system_time_message(system_time_message_got, system_time_message_sent)
  }
}

/* Symbol Definition Message: encoded, read back, and compared */
proctype check_symbol_definition_message() {
  SymbolDefinitionMessage symbol_definition_message_sent;
  SymbolDefinitionMessage symbol_definition_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_definition_message(symbol_definition_message_sent, 0)
  :: pattern == 1 -> fill_symbol_definition_message(symbol_definition_message_sent, 32)
  :: pattern == 2 -> fill_symbol_definition_message(symbol_definition_message_sent, 255)
  :: else -> ramp_symbol_definition_message(symbol_definition_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_definition_message(symbol_definition_message_sent);
    assert(at == 37);
    at = 0;
    decode_symbol_definition_message(symbol_definition_message_got);
    assert(at == 37);
    equal_symbol_definition_message(symbol_definition_message_got, symbol_definition_message_sent)
  }
}

/* Index Value Message: encoded, read back, and compared */
proctype check_index_value_message() {
  IndexValueMessage index_value_message_sent;
  IndexValueMessage index_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_value_message(index_value_message_sent, 0)
  :: pattern == 1 -> fill_index_value_message(index_value_message_sent, 32)
  :: pattern == 2 -> fill_index_value_message(index_value_message_sent, 255)
  :: else -> ramp_index_value_message(index_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_value_message(index_value_message_sent);
    assert(at == 13);
    at = 0;
    decode_index_value_message(index_value_message_got);
    assert(at == 13);
    equal_index_value_message(index_value_message_got, index_value_message_sent)
  }
}

/* Synthetic Future Value Message: encoded, read back, and compared */
proctype check_synthetic_future_value_message() {
  SyntheticFutureValueMessage synthetic_future_value_message_sent;
  SyntheticFutureValueMessage synthetic_future_value_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 0)
  :: pattern == 1 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 32)
  :: pattern == 2 -> fill_synthetic_future_value_message(synthetic_future_value_message_sent, 255)
  :: else -> ramp_synthetic_future_value_message(synthetic_future_value_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synthetic_future_value_message(synthetic_future_value_message_sent);
    assert(at == 24);
    at = 0;
    decode_synthetic_future_value_message(synthetic_future_value_message_got);
    assert(at == 24);
    equal_synthetic_future_value_message(synthetic_future_value_message_got, synthetic_future_value_message_sent)
  }
}

/* End Of Refresh Notification Message: encoded, read back, and compared */
proctype check_end_of_refresh_notification_message() {
  EndOfRefreshNotificationMessage end_of_refresh_notification_message_sent;
  EndOfRefreshNotificationMessage end_of_refresh_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 0)
  :: pattern == 1 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 32)
  :: pattern == 2 -> fill_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 255)
  :: else -> ramp_end_of_refresh_notification_message(end_of_refresh_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_refresh_notification_message(end_of_refresh_notification_message_sent);
    assert(at == 1);
    at = 0;
    decode_end_of_refresh_notification_message(end_of_refresh_notification_message_got);
    assert(at == 1);
    equal_end_of_refresh_notification_message(end_of_refresh_notification_message_got, end_of_refresh_notification_message_sent)
  }
}

/* Login Request: encoded, read back, and compared */
proctype check_login_request() {
  LoginRequest login_request_sent;
  LoginRequest login_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request(login_request_sent, 0)
  :: pattern == 1 -> fill_login_request(login_request_sent, 32)
  :: pattern == 2 -> fill_login_request(login_request_sent, 255)
  :: else -> ramp_login_request(login_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request(login_request_sent);
    assert(at == 35);
    at = 0;
    decode_login_request(login_request_got);
    assert(at == 35);
    equal_login_request(login_request_got, login_request_sent)
  }
}

/* Login Response: encoded, read back, and compared */
proctype check_login_response() {
  LoginResponse login_response_sent;
  LoginResponse login_response_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response(login_response_sent, 0)
  :: pattern == 1 -> fill_login_response(login_response_sent, 32)
  :: pattern == 2 -> fill_login_response(login_response_sent, 255)
  :: else -> ramp_login_response(login_response_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response(login_response_sent);
    assert(at == 11);
    at = 0;
    decode_login_response(login_response_got);
    assert(at == 11);
    equal_login_response(login_response_got, login_response_sent)
  }
}

/* Synchronization Complete: encoded, read back, and compared */
proctype check_synchronization_complete() {
  SynchronizationComplete synchronization_complete_sent;
  SynchronizationComplete synchronization_complete_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_synchronization_complete(synchronization_complete_sent, 0)
  :: pattern == 1 -> fill_synchronization_complete(synchronization_complete_sent, 32)
  :: pattern == 2 -> fill_synchronization_complete(synchronization_complete_sent, 255)
  :: else -> ramp_synchronization_complete(synchronization_complete_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_synchronization_complete(synchronization_complete_sent);
    assert(at == 1);
    at = 0;
    decode_synchronization_complete(synchronization_complete_got);
    assert(at == 1);
    equal_synchronization_complete(synchronization_complete_got, synchronization_complete_sent)
  }
}

/* Retransmission Request: encoded, read back, and compared */
proctype check_retransmission_request() {
  RetransmissionRequest retransmission_request_sent;
  RetransmissionRequest retransmission_request_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request(retransmission_request_sent, 0)
  :: pattern == 1 -> fill_retransmission_request(retransmission_request_sent, 32)
  :: pattern == 2 -> fill_retransmission_request(retransmission_request_sent, 255)
  :: else -> ramp_retransmission_request(retransmission_request_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request(retransmission_request_sent);
    assert(at == 16);
    at = 0;
    decode_retransmission_request(retransmission_request_got);
    assert(at == 16);
    equal_retransmission_request(retransmission_request_got, retransmission_request_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_sesm_packet_header()
  :: run check_refresh_request_message()
  :: run check_system_time_message()
  :: run check_symbol_definition_message()
  :: run check_index_value_message()
  :: run check_synthetic_future_value_message()
  :: run check_end_of_refresh_notification_message()
  :: run check_login_request()
  :: run check_login_response()
  :: run check_synchronization_complete()
  :: run check_retransmission_request()
  fi
}
