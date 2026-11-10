/*
 * Investors Exchange Depth Of Book
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
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 79

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Iextp Header: 40 bytes -------------------------------------------------- */

/* IexTp packet header */
typedef IextpHeader {
  byte version;
  byte reserved;
  byte message_protocol_id[2];
  byte channel_id[4];
  byte session_id[4];
  byte payload_length[2];
  byte message_count[2];
  byte stream_offset[8];
  byte first_message_sequence_number[8];
  byte send_time[8]
};

int iextp_header_at;

/* every byte of Iextp Header set to one value */
inline fill_iextp_header(iextp_header_record, iextp_header_value) {
  iextp_header_record.version = iextp_header_value;
  iextp_header_record.reserved = iextp_header_value;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = iextp_header_value; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Iextp Header set to where it lies, so a field read out of place says so */
inline ramp_iextp_header(iextp_header_record, iextp_header_base) {
  iextp_header_record.version = (iextp_header_base + 0 + 1) % 256;
  iextp_header_record.reserved = (iextp_header_base + 1 + 1) % 256;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = (iextp_header_base + 2 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = (iextp_header_base + 4 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = (iextp_header_base + 8 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = (iextp_header_base + 12 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = (iextp_header_base + 14 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = (iextp_header_base + 16 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = (iextp_header_base + 24 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = (iextp_header_base + 32 + iextp_header_at + 1) % 256; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* Iextp Header to the wire, 40 bytes from where the cursor stands */
inline encode_iextp_header(iextp_header_record) {
  wire[at] = iextp_header_record.version; at = at + 1;
  wire[at] = iextp_header_record.reserved; at = at + 1;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.message_protocol_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> wire[at] = iextp_header_record.channel_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> wire[at] = iextp_header_record.session_id[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.payload_length[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> wire[at] = iextp_header_record.message_count[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.stream_offset[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.first_message_sequence_number[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> wire[at] = iextp_header_record.send_time[iextp_header_at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* Iextp Header off the wire, 40 bytes from where the cursor stands */
inline decode_iextp_header(iextp_header_record) {
  iextp_header_record.version = wire[at]; at = at + 1;
  iextp_header_record.reserved = wire[at]; at = at + 1;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_protocol_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.channel_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> iextp_header_record.session_id[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.payload_length[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> iextp_header_record.message_count[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.stream_offset[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.first_message_sequence_number[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> iextp_header_record.send_time[iextp_header_at] = wire[at]; at = at + 1; iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Iextp Header is what was written, byte for byte */
inline equal_iextp_header(iextp_header_read, iextp_header_written) {
  assert(iextp_header_read.version == iextp_header_written.version);
  assert(iextp_header_read.reserved == iextp_header_written.reserved);
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.message_protocol_id[iextp_header_at] == iextp_header_written.message_protocol_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> assert(iextp_header_read.channel_id[iextp_header_at] == iextp_header_written.channel_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 4 -> assert(iextp_header_read.session_id[iextp_header_at] == iextp_header_written.session_id[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.payload_length[iextp_header_at] == iextp_header_written.payload_length[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 2 -> assert(iextp_header_read.message_count[iextp_header_at] == iextp_header_written.message_count[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.stream_offset[iextp_header_at] == iextp_header_written.stream_offset[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.first_message_sequence_number[iextp_header_at] == iextp_header_written.first_message_sequence_number[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  iextp_header_at = 0;
  do
  :: iextp_header_at < 8 -> assert(iextp_header_read.send_time[iextp_header_at] == iextp_header_written.send_time[iextp_header_at]); iextp_header_at = iextp_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* IexTp message header */
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

/* ---- System Event Message: 9 bytes ------------------------------------------- */

/* The System Event Message is used to indicate events that apply to the market or the data feed. */
typedef SystemEventMessage {
  byte system_event;
  byte timestamp[8]
};

int system_event_message_at;

/* every byte of System Event Message set to one value */
inline fill_system_event_message(system_event_message_record, system_event_message_value) {
  system_event_message_record.system_event = system_event_message_value;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = system_event_message_value; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_event_message(system_event_message_record, system_event_message_base) {
  system_event_message_record.system_event = (system_event_message_base + 0 + 1) % 256;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = (system_event_message_base + 1 + system_event_message_at + 1) % 256; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message to the wire, 9 bytes from where the cursor stands */
inline encode_system_event_message(system_event_message_record) {
  wire[at] = system_event_message_record.system_event; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> wire[at] = system_event_message_record.timestamp[system_event_message_at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Event Message off the wire, 9 bytes from where the cursor stands */
inline decode_system_event_message(system_event_message_record) {
  system_event_message_record.system_event = wire[at]; at = at + 1;
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> system_event_message_record.timestamp[system_event_message_at] = wire[at]; at = at + 1; system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Event Message is what was written, byte for byte */
inline equal_system_event_message(system_event_message_read, system_event_message_written) {
  assert(system_event_message_read.system_event == system_event_message_written.system_event);
  system_event_message_at = 0;
  do
  :: system_event_message_at < 8 -> assert(system_event_message_read.timestamp[system_event_message_at] == system_event_message_written.timestamp[system_event_message_at]); system_event_message_at = system_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 21 bytes ---------------------------------------- */

/* The Trading Status Message is used to indicate the current trading status of a security. */
typedef TradingStatusMessage {
  byte trading_status;
  byte timestamp[8];
  byte symbol[8];
  byte reason[4]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_record.trading_status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.reason[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_record.trading_status = (trading_status_message_base + 0 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = (trading_status_message_base + 1 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = (trading_status_message_base + 9 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.reason[trading_status_message_at] = (trading_status_message_base + 17 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 21 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  wire[at] = trading_status_message_record.trading_status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.timestamp[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> wire[at] = trading_status_message_record.reason[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 21 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_record.trading_status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.timestamp[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> trading_status_message_record.reason[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  assert(trading_status_message_read.trading_status == trading_status_message_written.trading_status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.timestamp[trading_status_message_at] == trading_status_message_written.timestamp[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol[trading_status_message_at] == trading_status_message_written.symbol[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 4 -> assert(trading_status_message_read.reason[trading_status_message_at] == trading_status_message_written.reason[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retail Liquidity Indicator Message: 17 bytes ---------------------------- */

/* broadcasts a real-time Retail Liquidity Indicator Message each time there is an update to IEX's eligible retail liquidity interest during the trading day */
typedef RetailLiquidityIndicatorMessage {
  byte retail_liquidity_indicator;
  byte timestamp[8];
  byte symbol[8]
};

int retail_liquidity_indicator_message_at;

/* every byte of Retail Liquidity Indicator Message set to one value */
inline fill_retail_liquidity_indicator_message(retail_liquidity_indicator_message_record, retail_liquidity_indicator_message_value) {
  retail_liquidity_indicator_message_record.retail_liquidity_indicator = retail_liquidity_indicator_message_value;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.timestamp[retail_liquidity_indicator_message_at] = retail_liquidity_indicator_message_value; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.symbol[retail_liquidity_indicator_message_at] = retail_liquidity_indicator_message_value; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Retail Liquidity Indicator Message set to where it lies, so a field read out of place says so */
inline ramp_retail_liquidity_indicator_message(retail_liquidity_indicator_message_record, retail_liquidity_indicator_message_base) {
  retail_liquidity_indicator_message_record.retail_liquidity_indicator = (retail_liquidity_indicator_message_base + 0 + 1) % 256;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.timestamp[retail_liquidity_indicator_message_at] = (retail_liquidity_indicator_message_base + 1 + retail_liquidity_indicator_message_at + 1) % 256; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.symbol[retail_liquidity_indicator_message_at] = (retail_liquidity_indicator_message_base + 9 + retail_liquidity_indicator_message_at + 1) % 256; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retail Liquidity Indicator Message to the wire, 17 bytes from where the cursor stands */
inline encode_retail_liquidity_indicator_message(retail_liquidity_indicator_message_record) {
  wire[at] = retail_liquidity_indicator_message_record.retail_liquidity_indicator; at = at + 1;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> wire[at] = retail_liquidity_indicator_message_record.timestamp[retail_liquidity_indicator_message_at]; at = at + 1; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> wire[at] = retail_liquidity_indicator_message_record.symbol[retail_liquidity_indicator_message_at]; at = at + 1; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* Retail Liquidity Indicator Message off the wire, 17 bytes from where the cursor stands */
inline decode_retail_liquidity_indicator_message(retail_liquidity_indicator_message_record) {
  retail_liquidity_indicator_message_record.retail_liquidity_indicator = wire[at]; at = at + 1;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.timestamp[retail_liquidity_indicator_message_at] = wire[at]; at = at + 1; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> retail_liquidity_indicator_message_record.symbol[retail_liquidity_indicator_message_at] = wire[at]; at = at + 1; retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Retail Liquidity Indicator Message is what was written, byte for byte */
inline equal_retail_liquidity_indicator_message(retail_liquidity_indicator_message_read, retail_liquidity_indicator_message_written) {
  assert(retail_liquidity_indicator_message_read.retail_liquidity_indicator == retail_liquidity_indicator_message_written.retail_liquidity_indicator);
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> assert(retail_liquidity_indicator_message_read.timestamp[retail_liquidity_indicator_message_at] == retail_liquidity_indicator_message_written.timestamp[retail_liquidity_indicator_message_at]); retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  retail_liquidity_indicator_message_at = 0;
  do
  :: retail_liquidity_indicator_message_at < 8 -> assert(retail_liquidity_indicator_message_read.symbol[retail_liquidity_indicator_message_at] == retail_liquidity_indicator_message_written.symbol[retail_liquidity_indicator_message_at]); retail_liquidity_indicator_message_at = retail_liquidity_indicator_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Operational Halt Status Message: 17 bytes ------------------------------- */

/* The Exchange may suspend trading of one or more securities on IEX for operational reasons and indicates such operational halt using the Operational Halt Status Message. */
typedef OperationalHaltStatusMessage {
  byte operational_halt_status;
  byte timestamp[8];
  byte symbol[8]
};

int operational_halt_status_message_at;

/* every byte of Operational Halt Status Message set to one value */
inline fill_operational_halt_status_message(operational_halt_status_message_record, operational_halt_status_message_value) {
  operational_halt_status_message_record.operational_halt_status = operational_halt_status_message_value;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.timestamp[operational_halt_status_message_at] = operational_halt_status_message_value; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.symbol[operational_halt_status_message_at] = operational_halt_status_message_value; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Operational Halt Status Message set to where it lies, so a field read out of place says so */
inline ramp_operational_halt_status_message(operational_halt_status_message_record, operational_halt_status_message_base) {
  operational_halt_status_message_record.operational_halt_status = (operational_halt_status_message_base + 0 + 1) % 256;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.timestamp[operational_halt_status_message_at] = (operational_halt_status_message_base + 1 + operational_halt_status_message_at + 1) % 256; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.symbol[operational_halt_status_message_at] = (operational_halt_status_message_base + 9 + operational_halt_status_message_at + 1) % 256; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Operational Halt Status Message to the wire, 17 bytes from where the cursor stands */
inline encode_operational_halt_status_message(operational_halt_status_message_record) {
  wire[at] = operational_halt_status_message_record.operational_halt_status; at = at + 1;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> wire[at] = operational_halt_status_message_record.timestamp[operational_halt_status_message_at]; at = at + 1; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> wire[at] = operational_halt_status_message_record.symbol[operational_halt_status_message_at]; at = at + 1; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Operational Halt Status Message off the wire, 17 bytes from where the cursor stands */
inline decode_operational_halt_status_message(operational_halt_status_message_record) {
  operational_halt_status_message_record.operational_halt_status = wire[at]; at = at + 1;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.timestamp[operational_halt_status_message_at] = wire[at]; at = at + 1; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> operational_halt_status_message_record.symbol[operational_halt_status_message_at] = wire[at]; at = at + 1; operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Operational Halt Status Message is what was written, byte for byte */
inline equal_operational_halt_status_message(operational_halt_status_message_read, operational_halt_status_message_written) {
  assert(operational_halt_status_message_read.operational_halt_status == operational_halt_status_message_written.operational_halt_status);
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> assert(operational_halt_status_message_read.timestamp[operational_halt_status_message_at] == operational_halt_status_message_written.timestamp[operational_halt_status_message_at]); operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  operational_halt_status_message_at = 0;
  do
  :: operational_halt_status_message_at < 8 -> assert(operational_halt_status_message_read.symbol[operational_halt_status_message_at] == operational_halt_status_message_written.symbol[operational_halt_status_message_at]); operational_halt_status_message_at = operational_halt_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Sale Price Test Status Message: 18 bytes -------------------------- */

/* The Short Sale Price Test Message is used to indicate when a short sale price test restriction is in effect for a security. */
typedef ShortSalePriceTestStatusMessage {
  byte short_sale_price_test_status;
  byte timestamp[8];
  byte symbol[8];
  byte detail
};

int short_sale_price_test_status_message_at;

/* every byte of Short Sale Price Test Status Message set to one value */
inline fill_short_sale_price_test_status_message(short_sale_price_test_status_message_record, short_sale_price_test_status_message_value) {
  short_sale_price_test_status_message_record.short_sale_price_test_status = short_sale_price_test_status_message_value;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.timestamp[short_sale_price_test_status_message_at] = short_sale_price_test_status_message_value; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.symbol[short_sale_price_test_status_message_at] = short_sale_price_test_status_message_value; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_record.detail = short_sale_price_test_status_message_value;
  skip
}

/* each byte of Short Sale Price Test Status Message set to where it lies, so a field read out of place says so */
inline ramp_short_sale_price_test_status_message(short_sale_price_test_status_message_record, short_sale_price_test_status_message_base) {
  short_sale_price_test_status_message_record.short_sale_price_test_status = (short_sale_price_test_status_message_base + 0 + 1) % 256;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.timestamp[short_sale_price_test_status_message_at] = (short_sale_price_test_status_message_base + 1 + short_sale_price_test_status_message_at + 1) % 256; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.symbol[short_sale_price_test_status_message_at] = (short_sale_price_test_status_message_base + 9 + short_sale_price_test_status_message_at + 1) % 256; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_record.detail = (short_sale_price_test_status_message_base + 17 + 1) % 256;
  skip
}

/* Short Sale Price Test Status Message to the wire, 18 bytes from where the cursor stands */
inline encode_short_sale_price_test_status_message(short_sale_price_test_status_message_record) {
  wire[at] = short_sale_price_test_status_message_record.short_sale_price_test_status; at = at + 1;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> wire[at] = short_sale_price_test_status_message_record.timestamp[short_sale_price_test_status_message_at]; at = at + 1; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> wire[at] = short_sale_price_test_status_message_record.symbol[short_sale_price_test_status_message_at]; at = at + 1; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  wire[at] = short_sale_price_test_status_message_record.detail; at = at + 1;
  skip
}

/* Short Sale Price Test Status Message off the wire, 18 bytes from where the cursor stands */
inline decode_short_sale_price_test_status_message(short_sale_price_test_status_message_record) {
  short_sale_price_test_status_message_record.short_sale_price_test_status = wire[at]; at = at + 1;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.timestamp[short_sale_price_test_status_message_at] = wire[at]; at = at + 1; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> short_sale_price_test_status_message_record.symbol[short_sale_price_test_status_message_at] = wire[at]; at = at + 1; short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_record.detail = wire[at]; at = at + 1;
  skip
}

/* what was read of Short Sale Price Test Status Message is what was written, byte for byte */
inline equal_short_sale_price_test_status_message(short_sale_price_test_status_message_read, short_sale_price_test_status_message_written) {
  assert(short_sale_price_test_status_message_read.short_sale_price_test_status == short_sale_price_test_status_message_written.short_sale_price_test_status);
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> assert(short_sale_price_test_status_message_read.timestamp[short_sale_price_test_status_message_at] == short_sale_price_test_status_message_written.timestamp[short_sale_price_test_status_message_at]); short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  short_sale_price_test_status_message_at = 0;
  do
  :: short_sale_price_test_status_message_at < 8 -> assert(short_sale_price_test_status_message_read.symbol[short_sale_price_test_status_message_at] == short_sale_price_test_status_message_written.symbol[short_sale_price_test_status_message_at]); short_sale_price_test_status_message_at = short_sale_price_test_status_message_at + 1
  :: else -> break
  od;
  assert(short_sale_price_test_status_message_read.detail == short_sale_price_test_status_message_written.detail);
  skip
}

/* ---- Security Event Message: 17 bytes ---------------------------------------- */

/* The Security Event Message is used to indicate events that apply to a security */
typedef SecurityEventMessage {
  byte security_event;
  byte timestamp[8];
  byte symbol[8]
};

int security_event_message_at;

/* every byte of Security Event Message set to one value */
inline fill_security_event_message(security_event_message_record, security_event_message_value) {
  security_event_message_record.security_event = security_event_message_value;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.timestamp[security_event_message_at] = security_event_message_value; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.symbol[security_event_message_at] = security_event_message_value; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Security Event Message set to where it lies, so a field read out of place says so */
inline ramp_security_event_message(security_event_message_record, security_event_message_base) {
  security_event_message_record.security_event = (security_event_message_base + 0 + 1) % 256;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.timestamp[security_event_message_at] = (security_event_message_base + 1 + security_event_message_at + 1) % 256; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.symbol[security_event_message_at] = (security_event_message_base + 9 + security_event_message_at + 1) % 256; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Event Message to the wire, 17 bytes from where the cursor stands */
inline encode_security_event_message(security_event_message_record) {
  wire[at] = security_event_message_record.security_event; at = at + 1;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> wire[at] = security_event_message_record.timestamp[security_event_message_at]; at = at + 1; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> wire[at] = security_event_message_record.symbol[security_event_message_at]; at = at + 1; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* Security Event Message off the wire, 17 bytes from where the cursor stands */
inline decode_security_event_message(security_event_message_record) {
  security_event_message_record.security_event = wire[at]; at = at + 1;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.timestamp[security_event_message_at] = wire[at]; at = at + 1; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> security_event_message_record.symbol[security_event_message_at] = wire[at]; at = at + 1; security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Security Event Message is what was written, byte for byte */
inline equal_security_event_message(security_event_message_read, security_event_message_written) {
  assert(security_event_message_read.security_event == security_event_message_written.security_event);
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> assert(security_event_message_read.timestamp[security_event_message_at] == security_event_message_written.timestamp[security_event_message_at]); security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  security_event_message_at = 0;
  do
  :: security_event_message_at < 8 -> assert(security_event_message_read.symbol[security_event_message_at] == security_event_message_written.symbol[security_event_message_at]); security_event_message_at = security_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Level Buy Update Message: 29 bytes -------------------------------- */

/* Deep broadcasts a real-time Price Level Update Message each time a displayed price level on IEX is updated during the trading day */
typedef PriceLevelBuyUpdateMessage {
  byte event_flags;
  byte timestamp[8];
  byte symbol[8];
  byte size[4];
  byte price[8]
};

int price_level_buy_update_message_at;

/* every byte of Price Level Buy Update Message set to one value */
inline fill_price_level_buy_update_message(price_level_buy_update_message_record, price_level_buy_update_message_value) {
  price_level_buy_update_message_record.event_flags = price_level_buy_update_message_value;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.timestamp[price_level_buy_update_message_at] = price_level_buy_update_message_value; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.symbol[price_level_buy_update_message_at] = price_level_buy_update_message_value; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 4 -> price_level_buy_update_message_record.size[price_level_buy_update_message_at] = price_level_buy_update_message_value; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.price[price_level_buy_update_message_at] = price_level_buy_update_message_value; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Level Buy Update Message set to where it lies, so a field read out of place says so */
inline ramp_price_level_buy_update_message(price_level_buy_update_message_record, price_level_buy_update_message_base) {
  price_level_buy_update_message_record.event_flags = (price_level_buy_update_message_base + 0 + 1) % 256;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.timestamp[price_level_buy_update_message_at] = (price_level_buy_update_message_base + 1 + price_level_buy_update_message_at + 1) % 256; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.symbol[price_level_buy_update_message_at] = (price_level_buy_update_message_base + 9 + price_level_buy_update_message_at + 1) % 256; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 4 -> price_level_buy_update_message_record.size[price_level_buy_update_message_at] = (price_level_buy_update_message_base + 17 + price_level_buy_update_message_at + 1) % 256; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.price[price_level_buy_update_message_at] = (price_level_buy_update_message_base + 21 + price_level_buy_update_message_at + 1) % 256; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level Buy Update Message to the wire, 29 bytes from where the cursor stands */
inline encode_price_level_buy_update_message(price_level_buy_update_message_record) {
  wire[at] = price_level_buy_update_message_record.event_flags; at = at + 1;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> wire[at] = price_level_buy_update_message_record.timestamp[price_level_buy_update_message_at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> wire[at] = price_level_buy_update_message_record.symbol[price_level_buy_update_message_at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 4 -> wire[at] = price_level_buy_update_message_record.size[price_level_buy_update_message_at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> wire[at] = price_level_buy_update_message_record.price[price_level_buy_update_message_at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level Buy Update Message off the wire, 29 bytes from where the cursor stands */
inline decode_price_level_buy_update_message(price_level_buy_update_message_record) {
  price_level_buy_update_message_record.event_flags = wire[at]; at = at + 1;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.timestamp[price_level_buy_update_message_at] = wire[at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.symbol[price_level_buy_update_message_at] = wire[at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 4 -> price_level_buy_update_message_record.size[price_level_buy_update_message_at] = wire[at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> price_level_buy_update_message_record.price[price_level_buy_update_message_at] = wire[at]; at = at + 1; price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Level Buy Update Message is what was written, byte for byte */
inline equal_price_level_buy_update_message(price_level_buy_update_message_read, price_level_buy_update_message_written) {
  assert(price_level_buy_update_message_read.event_flags == price_level_buy_update_message_written.event_flags);
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> assert(price_level_buy_update_message_read.timestamp[price_level_buy_update_message_at] == price_level_buy_update_message_written.timestamp[price_level_buy_update_message_at]); price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> assert(price_level_buy_update_message_read.symbol[price_level_buy_update_message_at] == price_level_buy_update_message_written.symbol[price_level_buy_update_message_at]); price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 4 -> assert(price_level_buy_update_message_read.size[price_level_buy_update_message_at] == price_level_buy_update_message_written.size[price_level_buy_update_message_at]); price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  price_level_buy_update_message_at = 0;
  do
  :: price_level_buy_update_message_at < 8 -> assert(price_level_buy_update_message_read.price[price_level_buy_update_message_at] == price_level_buy_update_message_written.price[price_level_buy_update_message_at]); price_level_buy_update_message_at = price_level_buy_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Price Level Sell Update Message: 29 bytes ------------------------------- */

/* Deep broadcasts a real-time Price Level Update Message each time a displayed price level on IEX is updated during the trading day */
typedef PriceLevelSellUpdateMessage {
  byte event_flags;
  byte timestamp[8];
  byte symbol[8];
  byte size[4];
  byte price[8]
};

int price_level_sell_update_message_at;

/* every byte of Price Level Sell Update Message set to one value */
inline fill_price_level_sell_update_message(price_level_sell_update_message_record, price_level_sell_update_message_value) {
  price_level_sell_update_message_record.event_flags = price_level_sell_update_message_value;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.timestamp[price_level_sell_update_message_at] = price_level_sell_update_message_value; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.symbol[price_level_sell_update_message_at] = price_level_sell_update_message_value; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 4 -> price_level_sell_update_message_record.size[price_level_sell_update_message_at] = price_level_sell_update_message_value; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.price[price_level_sell_update_message_at] = price_level_sell_update_message_value; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Price Level Sell Update Message set to where it lies, so a field read out of place says so */
inline ramp_price_level_sell_update_message(price_level_sell_update_message_record, price_level_sell_update_message_base) {
  price_level_sell_update_message_record.event_flags = (price_level_sell_update_message_base + 0 + 1) % 256;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.timestamp[price_level_sell_update_message_at] = (price_level_sell_update_message_base + 1 + price_level_sell_update_message_at + 1) % 256; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.symbol[price_level_sell_update_message_at] = (price_level_sell_update_message_base + 9 + price_level_sell_update_message_at + 1) % 256; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 4 -> price_level_sell_update_message_record.size[price_level_sell_update_message_at] = (price_level_sell_update_message_base + 17 + price_level_sell_update_message_at + 1) % 256; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.price[price_level_sell_update_message_at] = (price_level_sell_update_message_base + 21 + price_level_sell_update_message_at + 1) % 256; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level Sell Update Message to the wire, 29 bytes from where the cursor stands */
inline encode_price_level_sell_update_message(price_level_sell_update_message_record) {
  wire[at] = price_level_sell_update_message_record.event_flags; at = at + 1;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> wire[at] = price_level_sell_update_message_record.timestamp[price_level_sell_update_message_at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> wire[at] = price_level_sell_update_message_record.symbol[price_level_sell_update_message_at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 4 -> wire[at] = price_level_sell_update_message_record.size[price_level_sell_update_message_at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> wire[at] = price_level_sell_update_message_record.price[price_level_sell_update_message_at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Price Level Sell Update Message off the wire, 29 bytes from where the cursor stands */
inline decode_price_level_sell_update_message(price_level_sell_update_message_record) {
  price_level_sell_update_message_record.event_flags = wire[at]; at = at + 1;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.timestamp[price_level_sell_update_message_at] = wire[at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.symbol[price_level_sell_update_message_at] = wire[at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 4 -> price_level_sell_update_message_record.size[price_level_sell_update_message_at] = wire[at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> price_level_sell_update_message_record.price[price_level_sell_update_message_at] = wire[at]; at = at + 1; price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Price Level Sell Update Message is what was written, byte for byte */
inline equal_price_level_sell_update_message(price_level_sell_update_message_read, price_level_sell_update_message_written) {
  assert(price_level_sell_update_message_read.event_flags == price_level_sell_update_message_written.event_flags);
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> assert(price_level_sell_update_message_read.timestamp[price_level_sell_update_message_at] == price_level_sell_update_message_written.timestamp[price_level_sell_update_message_at]); price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> assert(price_level_sell_update_message_read.symbol[price_level_sell_update_message_at] == price_level_sell_update_message_written.symbol[price_level_sell_update_message_at]); price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 4 -> assert(price_level_sell_update_message_read.size[price_level_sell_update_message_at] == price_level_sell_update_message_written.size[price_level_sell_update_message_at]); price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  price_level_sell_update_message_at = 0;
  do
  :: price_level_sell_update_message_at < 8 -> assert(price_level_sell_update_message_read.price[price_level_sell_update_message_at] == price_level_sell_update_message_written.price[price_level_sell_update_message_at]); price_level_sell_update_message_at = price_level_sell_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Official Price Message: 25 bytes ---------------------------------------- */

/* Official Price Messages are sent for each IEX-listed security to indicate the IEX Official Opening Price and IEX Official Closing Price. */
typedef OfficialPriceMessage {
  byte price_type;
  byte timestamp[8];
  byte symbol[8];
  byte official_price[8]
};

int official_price_message_at;

/* every byte of Official Price Message set to one value */
inline fill_official_price_message(official_price_message_record, official_price_message_value) {
  official_price_message_record.price_type = official_price_message_value;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.timestamp[official_price_message_at] = official_price_message_value; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.symbol[official_price_message_at] = official_price_message_value; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.official_price[official_price_message_at] = official_price_message_value; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Official Price Message set to where it lies, so a field read out of place says so */
inline ramp_official_price_message(official_price_message_record, official_price_message_base) {
  official_price_message_record.price_type = (official_price_message_base + 0 + 1) % 256;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.timestamp[official_price_message_at] = (official_price_message_base + 1 + official_price_message_at + 1) % 256; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.symbol[official_price_message_at] = (official_price_message_base + 9 + official_price_message_at + 1) % 256; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.official_price[official_price_message_at] = (official_price_message_base + 17 + official_price_message_at + 1) % 256; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Official Price Message to the wire, 25 bytes from where the cursor stands */
inline encode_official_price_message(official_price_message_record) {
  wire[at] = official_price_message_record.price_type; at = at + 1;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> wire[at] = official_price_message_record.timestamp[official_price_message_at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> wire[at] = official_price_message_record.symbol[official_price_message_at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> wire[at] = official_price_message_record.official_price[official_price_message_at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Official Price Message off the wire, 25 bytes from where the cursor stands */
inline decode_official_price_message(official_price_message_record) {
  official_price_message_record.price_type = wire[at]; at = at + 1;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.timestamp[official_price_message_at] = wire[at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.symbol[official_price_message_at] = wire[at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> official_price_message_record.official_price[official_price_message_at] = wire[at]; at = at + 1; official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Official Price Message is what was written, byte for byte */
inline equal_official_price_message(official_price_message_read, official_price_message_written) {
  assert(official_price_message_read.price_type == official_price_message_written.price_type);
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> assert(official_price_message_read.timestamp[official_price_message_at] == official_price_message_written.timestamp[official_price_message_at]); official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> assert(official_price_message_read.symbol[official_price_message_at] == official_price_message_written.symbol[official_price_message_at]); official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  official_price_message_at = 0;
  do
  :: official_price_message_at < 8 -> assert(official_price_message_read.official_price[official_price_message_at] == official_price_message_written.official_price[official_price_message_at]); official_price_message_at = official_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Information Message: 79 bytes ----------------------------------- */

/* Broadcasts an Auction Information Message every one second between the Lock-in Time and the auction match for Opening and Closing Auctions, and during the Display Only Period for IPO, Halt, and Volatility Auctions. */
typedef AuctionInformationMessage {
  byte auction_type;
  byte timestamp[8];
  byte symbol[8];
  byte paired_shares[4];
  byte reference_price[8];
  byte indicative_clearing_price[8];
  byte imbalance_shares[4];
  byte imbalance_side;
  byte extension_number;
  byte scheduled_auction_time[4];
  byte auction_book_clearing_price[8];
  byte collar_reference_price[8];
  byte lower_auction_collar[8];
  byte upper_auction_collar[8]
};

int auction_information_message_at;

/* every byte of Auction Information Message set to one value */
inline fill_auction_information_message(auction_information_message_record, auction_information_message_value) {
  auction_information_message_record.auction_type = auction_information_message_value;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.timestamp[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.symbol[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.paired_shares[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.reference_price[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.indicative_clearing_price[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.imbalance_shares[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_record.imbalance_side = auction_information_message_value;
  auction_information_message_record.extension_number = auction_information_message_value;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.scheduled_auction_time[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.auction_book_clearing_price[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.collar_reference_price[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.lower_auction_collar[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.upper_auction_collar[auction_information_message_at] = auction_information_message_value; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Information Message set to where it lies, so a field read out of place says so */
inline ramp_auction_information_message(auction_information_message_record, auction_information_message_base) {
  auction_information_message_record.auction_type = (auction_information_message_base + 0 + 1) % 256;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.timestamp[auction_information_message_at] = (auction_information_message_base + 1 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.symbol[auction_information_message_at] = (auction_information_message_base + 9 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.paired_shares[auction_information_message_at] = (auction_information_message_base + 17 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.reference_price[auction_information_message_at] = (auction_information_message_base + 21 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.indicative_clearing_price[auction_information_message_at] = (auction_information_message_base + 29 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.imbalance_shares[auction_information_message_at] = (auction_information_message_base + 37 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_record.imbalance_side = (auction_information_message_base + 41 + 1) % 256;
  auction_information_message_record.extension_number = (auction_information_message_base + 42 + 1) % 256;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.scheduled_auction_time[auction_information_message_at] = (auction_information_message_base + 43 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.auction_book_clearing_price[auction_information_message_at] = (auction_information_message_base + 47 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.collar_reference_price[auction_information_message_at] = (auction_information_message_base + 55 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.lower_auction_collar[auction_information_message_at] = (auction_information_message_base + 63 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.upper_auction_collar[auction_information_message_at] = (auction_information_message_base + 71 + auction_information_message_at + 1) % 256; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Information Message to the wire, 79 bytes from where the cursor stands */
inline encode_auction_information_message(auction_information_message_record) {
  wire[at] = auction_information_message_record.auction_type; at = at + 1;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.timestamp[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.symbol[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> wire[at] = auction_information_message_record.paired_shares[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.reference_price[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.indicative_clearing_price[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> wire[at] = auction_information_message_record.imbalance_shares[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_information_message_record.imbalance_side; at = at + 1;
  wire[at] = auction_information_message_record.extension_number; at = at + 1;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> wire[at] = auction_information_message_record.scheduled_auction_time[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.auction_book_clearing_price[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.collar_reference_price[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.lower_auction_collar[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> wire[at] = auction_information_message_record.upper_auction_collar[auction_information_message_at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Information Message off the wire, 79 bytes from where the cursor stands */
inline decode_auction_information_message(auction_information_message_record) {
  auction_information_message_record.auction_type = wire[at]; at = at + 1;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.timestamp[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.symbol[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.paired_shares[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.reference_price[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.indicative_clearing_price[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.imbalance_shares[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_record.imbalance_side = wire[at]; at = at + 1;
  auction_information_message_record.extension_number = wire[at]; at = at + 1;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> auction_information_message_record.scheduled_auction_time[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.auction_book_clearing_price[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.collar_reference_price[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.lower_auction_collar[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> auction_information_message_record.upper_auction_collar[auction_information_message_at] = wire[at]; at = at + 1; auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Information Message is what was written, byte for byte */
inline equal_auction_information_message(auction_information_message_read, auction_information_message_written) {
  assert(auction_information_message_read.auction_type == auction_information_message_written.auction_type);
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.timestamp[auction_information_message_at] == auction_information_message_written.timestamp[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.symbol[auction_information_message_at] == auction_information_message_written.symbol[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> assert(auction_information_message_read.paired_shares[auction_information_message_at] == auction_information_message_written.paired_shares[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.reference_price[auction_information_message_at] == auction_information_message_written.reference_price[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.indicative_clearing_price[auction_information_message_at] == auction_information_message_written.indicative_clearing_price[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> assert(auction_information_message_read.imbalance_shares[auction_information_message_at] == auction_information_message_written.imbalance_shares[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  assert(auction_information_message_read.imbalance_side == auction_information_message_written.imbalance_side);
  assert(auction_information_message_read.extension_number == auction_information_message_written.extension_number);
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 4 -> assert(auction_information_message_read.scheduled_auction_time[auction_information_message_at] == auction_information_message_written.scheduled_auction_time[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.auction_book_clearing_price[auction_information_message_at] == auction_information_message_written.auction_book_clearing_price[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.collar_reference_price[auction_information_message_at] == auction_information_message_written.collar_reference_price[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.lower_auction_collar[auction_information_message_at] == auction_information_message_written.lower_auction_collar[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  auction_information_message_at = 0;
  do
  :: auction_information_message_at < 8 -> assert(auction_information_message_read.upper_auction_collar[auction_information_message_at] == auction_information_message_written.upper_auction_collar[auction_information_message_at]); auction_information_message_at = auction_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Iextp Header: encoded, read back, and compared */
proctype check_iextp_header() {
  IextpHeader iextp_header_sent;
  IextpHeader iextp_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_iextp_header(iextp_header_sent, 0)
  :: pattern == 1 -> fill_iextp_header(iextp_header_sent, 32)
  :: pattern == 2 -> fill_iextp_header(iextp_header_sent, 255)
  :: else -> ramp_iextp_header(iextp_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_iextp_header(iextp_header_sent);
    assert(at == 40);
    at = 0;
    decode_iextp_header(iextp_header_got);
    assert(at == 40);
    equal_iextp_header(iextp_header_got, iextp_header_sent)
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
    assert(at == 9);
    at = 0;
    decode_system_event_message(system_event_message_got);
    assert(at == 9);
    equal_system_event_message(system_event_message_got, system_event_message_sent)
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
    assert(at == 21);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 21);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* Retail Liquidity Indicator Message: encoded, read back, and compared */
proctype check_retail_liquidity_indicator_message() {
  RetailLiquidityIndicatorMessage retail_liquidity_indicator_message_sent;
  RetailLiquidityIndicatorMessage retail_liquidity_indicator_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_liquidity_indicator_message(retail_liquidity_indicator_message_sent, 0)
  :: pattern == 1 -> fill_retail_liquidity_indicator_message(retail_liquidity_indicator_message_sent, 32)
  :: pattern == 2 -> fill_retail_liquidity_indicator_message(retail_liquidity_indicator_message_sent, 255)
  :: else -> ramp_retail_liquidity_indicator_message(retail_liquidity_indicator_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_liquidity_indicator_message(retail_liquidity_indicator_message_sent);
    assert(at == 17);
    at = 0;
    decode_retail_liquidity_indicator_message(retail_liquidity_indicator_message_got);
    assert(at == 17);
    equal_retail_liquidity_indicator_message(retail_liquidity_indicator_message_got, retail_liquidity_indicator_message_sent)
  }
}

/* Operational Halt Status Message: encoded, read back, and compared */
proctype check_operational_halt_status_message() {
  OperationalHaltStatusMessage operational_halt_status_message_sent;
  OperationalHaltStatusMessage operational_halt_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_operational_halt_status_message(operational_halt_status_message_sent, 0)
  :: pattern == 1 -> fill_operational_halt_status_message(operational_halt_status_message_sent, 32)
  :: pattern == 2 -> fill_operational_halt_status_message(operational_halt_status_message_sent, 255)
  :: else -> ramp_operational_halt_status_message(operational_halt_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_operational_halt_status_message(operational_halt_status_message_sent);
    assert(at == 17);
    at = 0;
    decode_operational_halt_status_message(operational_halt_status_message_got);
    assert(at == 17);
    equal_operational_halt_status_message(operational_halt_status_message_got, operational_halt_status_message_sent)
  }
}

/* Short Sale Price Test Status Message: encoded, read back, and compared */
proctype check_short_sale_price_test_status_message() {
  ShortSalePriceTestStatusMessage short_sale_price_test_status_message_sent;
  ShortSalePriceTestStatusMessage short_sale_price_test_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_sale_price_test_status_message(short_sale_price_test_status_message_sent, 0)
  :: pattern == 1 -> fill_short_sale_price_test_status_message(short_sale_price_test_status_message_sent, 32)
  :: pattern == 2 -> fill_short_sale_price_test_status_message(short_sale_price_test_status_message_sent, 255)
  :: else -> ramp_short_sale_price_test_status_message(short_sale_price_test_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_sale_price_test_status_message(short_sale_price_test_status_message_sent);
    assert(at == 18);
    at = 0;
    decode_short_sale_price_test_status_message(short_sale_price_test_status_message_got);
    assert(at == 18);
    equal_short_sale_price_test_status_message(short_sale_price_test_status_message_got, short_sale_price_test_status_message_sent)
  }
}

/* Security Event Message: encoded, read back, and compared */
proctype check_security_event_message() {
  SecurityEventMessage security_event_message_sent;
  SecurityEventMessage security_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_security_event_message(security_event_message_sent, 0)
  :: pattern == 1 -> fill_security_event_message(security_event_message_sent, 32)
  :: pattern == 2 -> fill_security_event_message(security_event_message_sent, 255)
  :: else -> ramp_security_event_message(security_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_security_event_message(security_event_message_sent);
    assert(at == 17);
    at = 0;
    decode_security_event_message(security_event_message_got);
    assert(at == 17);
    equal_security_event_message(security_event_message_got, security_event_message_sent)
  }
}

/* Price Level Buy Update Message: encoded, read back, and compared */
proctype check_price_level_buy_update_message() {
  PriceLevelBuyUpdateMessage price_level_buy_update_message_sent;
  PriceLevelBuyUpdateMessage price_level_buy_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_level_buy_update_message(price_level_buy_update_message_sent, 0)
  :: pattern == 1 -> fill_price_level_buy_update_message(price_level_buy_update_message_sent, 32)
  :: pattern == 2 -> fill_price_level_buy_update_message(price_level_buy_update_message_sent, 255)
  :: else -> ramp_price_level_buy_update_message(price_level_buy_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_level_buy_update_message(price_level_buy_update_message_sent);
    assert(at == 29);
    at = 0;
    decode_price_level_buy_update_message(price_level_buy_update_message_got);
    assert(at == 29);
    equal_price_level_buy_update_message(price_level_buy_update_message_got, price_level_buy_update_message_sent)
  }
}

/* Price Level Sell Update Message: encoded, read back, and compared */
proctype check_price_level_sell_update_message() {
  PriceLevelSellUpdateMessage price_level_sell_update_message_sent;
  PriceLevelSellUpdateMessage price_level_sell_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_price_level_sell_update_message(price_level_sell_update_message_sent, 0)
  :: pattern == 1 -> fill_price_level_sell_update_message(price_level_sell_update_message_sent, 32)
  :: pattern == 2 -> fill_price_level_sell_update_message(price_level_sell_update_message_sent, 255)
  :: else -> ramp_price_level_sell_update_message(price_level_sell_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_price_level_sell_update_message(price_level_sell_update_message_sent);
    assert(at == 29);
    at = 0;
    decode_price_level_sell_update_message(price_level_sell_update_message_got);
    assert(at == 29);
    equal_price_level_sell_update_message(price_level_sell_update_message_got, price_level_sell_update_message_sent)
  }
}

/* Official Price Message: encoded, read back, and compared */
proctype check_official_price_message() {
  OfficialPriceMessage official_price_message_sent;
  OfficialPriceMessage official_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_official_price_message(official_price_message_sent, 0)
  :: pattern == 1 -> fill_official_price_message(official_price_message_sent, 32)
  :: pattern == 2 -> fill_official_price_message(official_price_message_sent, 255)
  :: else -> ramp_official_price_message(official_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_official_price_message(official_price_message_sent);
    assert(at == 25);
    at = 0;
    decode_official_price_message(official_price_message_got);
    assert(at == 25);
    equal_official_price_message(official_price_message_got, official_price_message_sent)
  }
}

/* Auction Information Message: encoded, read back, and compared */
proctype check_auction_information_message() {
  AuctionInformationMessage auction_information_message_sent;
  AuctionInformationMessage auction_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_information_message(auction_information_message_sent, 0)
  :: pattern == 1 -> fill_auction_information_message(auction_information_message_sent, 32)
  :: pattern == 2 -> fill_auction_information_message(auction_information_message_sent, 255)
  :: else -> ramp_auction_information_message(auction_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_information_message(auction_information_message_sent);
    assert(at == 79);
    at = 0;
    decode_auction_information_message(auction_information_message_got);
    assert(at == 79);
    equal_auction_information_message(auction_information_message_got, auction_information_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_iextp_header()
  :: run check_message_header()
  :: run check_system_event_message()
  :: run check_trading_status_message()
  :: run check_retail_liquidity_indicator_message()
  :: run check_operational_halt_status_message()
  :: run check_short_sale_price_test_status_message()
  :: run check_security_event_message()
  :: run check_price_level_buy_update_message()
  :: run check_price_level_sell_update_message()
  :: run check_official_price_message()
  :: run check_auction_information_message()
  fi
}
