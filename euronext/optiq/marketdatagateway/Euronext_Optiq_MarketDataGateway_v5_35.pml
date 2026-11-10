/*
 * Euronext Market Data Gateway
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
 *   - a field read in bits
 *   - a Conversion rule
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *   - a Empty element
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 405

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 8 bytes ------------------------------------------------- */

/* Optiq Sbe message header — message identifiers and length of message root */
typedef MessageHeader {
  byte block_length[2];
  byte template_id[2];
  byte schema_id[2];
  byte version[2]
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = (message_header_base + 6 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header to the wire, 8 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.block_length[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.template_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.schema_id[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.version[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* Message Header off the wire, 8 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.block_length[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.template_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.schema_id[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.version[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.block_length[message_header_at] == message_header_written.block_length[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.template_id[message_header_at] == message_header_written.template_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.schema_id[message_header_at] == message_header_written.schema_id[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.version[message_header_at] == message_header_written.version[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Start Of Day Message: 10 bytes ------------------------------------------ */

/* StartOfDayMessage */
typedef StartOfDayMessage {
  byte md_seq_num[8];
  byte session_trading_day[2]
};

int start_of_day_message_at;

/* every byte of Start Of Day Message set to one value */
inline fill_start_of_day_message(start_of_day_message_record, start_of_day_message_value) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.md_seq_num[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.session_trading_day[start_of_day_message_at] = start_of_day_message_value; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_day_message(start_of_day_message_record, start_of_day_message_base) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.md_seq_num[start_of_day_message_at] = (start_of_day_message_base + 0 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.session_trading_day[start_of_day_message_at] = (start_of_day_message_base + 8 + start_of_day_message_at + 1) % 256; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message to the wire, 10 bytes from where the cursor stands */
inline encode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> wire[at] = start_of_day_message_record.md_seq_num[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> wire[at] = start_of_day_message_record.session_trading_day[start_of_day_message_at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Day Message off the wire, 10 bytes from where the cursor stands */
inline decode_start_of_day_message(start_of_day_message_record) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> start_of_day_message_record.md_seq_num[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> start_of_day_message_record.session_trading_day[start_of_day_message_at] = wire[at]; at = at + 1; start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Day Message is what was written, byte for byte */
inline equal_start_of_day_message(start_of_day_message_read, start_of_day_message_written) {
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 8 -> assert(start_of_day_message_read.md_seq_num[start_of_day_message_at] == start_of_day_message_written.md_seq_num[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  start_of_day_message_at = 0;
  do
  :: start_of_day_message_at < 2 -> assert(start_of_day_message_read.session_trading_day[start_of_day_message_at] == start_of_day_message_written.session_trading_day[start_of_day_message_at]); start_of_day_message_at = start_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Day Message: 10 bytes -------------------------------------------- */

/* EndOfDayMessage */
typedef EndOfDayMessage {
  byte md_seq_num[8];
  byte session_trading_day[2]
};

int end_of_day_message_at;

/* every byte of End Of Day Message set to one value */
inline fill_end_of_day_message(end_of_day_message_record, end_of_day_message_value) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.md_seq_num[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.session_trading_day[end_of_day_message_at] = end_of_day_message_value; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Day Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_day_message(end_of_day_message_record, end_of_day_message_base) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.md_seq_num[end_of_day_message_at] = (end_of_day_message_base + 0 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.session_trading_day[end_of_day_message_at] = (end_of_day_message_base + 8 + end_of_day_message_at + 1) % 256; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message to the wire, 10 bytes from where the cursor stands */
inline encode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> wire[at] = end_of_day_message_record.md_seq_num[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> wire[at] = end_of_day_message_record.session_trading_day[end_of_day_message_at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Day Message off the wire, 10 bytes from where the cursor stands */
inline decode_end_of_day_message(end_of_day_message_record) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> end_of_day_message_record.md_seq_num[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> end_of_day_message_record.session_trading_day[end_of_day_message_at] = wire[at]; at = at + 1; end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Day Message is what was written, byte for byte */
inline equal_end_of_day_message(end_of_day_message_read, end_of_day_message_written) {
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 8 -> assert(end_of_day_message_read.md_seq_num[end_of_day_message_at] == end_of_day_message_written.md_seq_num[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  end_of_day_message_at = 0;
  do
  :: end_of_day_message_at < 2 -> assert(end_of_day_message_read.session_trading_day[end_of_day_message_at] == end_of_day_message_written.session_trading_day[end_of_day_message_at]); end_of_day_message_at = end_of_day_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Health Status Message: 16 bytes ----------------------------------------- */

/* HealthStatusMessage */
typedef HealthStatusMessage {
  byte md_seq_num[8];
  byte event_time[8]
};

int health_status_message_at;

/* every byte of Health Status Message set to one value */
inline fill_health_status_message(health_status_message_record, health_status_message_value) {
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.md_seq_num[health_status_message_at] = health_status_message_value; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.event_time[health_status_message_at] = health_status_message_value; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Health Status Message set to where it lies, so a field read out of place says so */
inline ramp_health_status_message(health_status_message_record, health_status_message_base) {
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.md_seq_num[health_status_message_at] = (health_status_message_base + 0 + health_status_message_at + 1) % 256; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.event_time[health_status_message_at] = (health_status_message_base + 8 + health_status_message_at + 1) % 256; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Health Status Message to the wire, 16 bytes from where the cursor stands */
inline encode_health_status_message(health_status_message_record) {
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> wire[at] = health_status_message_record.md_seq_num[health_status_message_at]; at = at + 1; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> wire[at] = health_status_message_record.event_time[health_status_message_at]; at = at + 1; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Health Status Message off the wire, 16 bytes from where the cursor stands */
inline decode_health_status_message(health_status_message_record) {
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.md_seq_num[health_status_message_at] = wire[at]; at = at + 1; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> health_status_message_record.event_time[health_status_message_at] = wire[at]; at = at + 1; health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Health Status Message is what was written, byte for byte */
inline equal_health_status_message(health_status_message_read, health_status_message_written) {
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> assert(health_status_message_read.md_seq_num[health_status_message_at] == health_status_message_written.md_seq_num[health_status_message_at]); health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  health_status_message_at = 0;
  do
  :: health_status_message_at < 8 -> assert(health_status_message_read.event_time[health_status_message_at] == health_status_message_written.event_time[health_status_message_at]); health_status_message_at = health_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Technical Notification Message: 30 bytes -------------------------------- */

/* TechnicalNotificationMessage */
typedef TechnicalNotificationMessage {
  byte md_seq_num_optional[8];
  byte technical_notification_type;
  byte rebroadcast_indicator;
  byte retransmission_start_time[8];
  byte retransmission_end_time[8];
  byte symbol_index_optional[4]
};

int technical_notification_message_at;

/* every byte of Technical Notification Message set to one value */
inline fill_technical_notification_message(technical_notification_message_record, technical_notification_message_value) {
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.md_seq_num_optional[technical_notification_message_at] = technical_notification_message_value; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_record.technical_notification_type = technical_notification_message_value;
  technical_notification_message_record.rebroadcast_indicator = technical_notification_message_value;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_start_time[technical_notification_message_at] = technical_notification_message_value; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_end_time[technical_notification_message_at] = technical_notification_message_value; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 4 -> technical_notification_message_record.symbol_index_optional[technical_notification_message_at] = technical_notification_message_value; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Technical Notification Message set to where it lies, so a field read out of place says so */
inline ramp_technical_notification_message(technical_notification_message_record, technical_notification_message_base) {
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.md_seq_num_optional[technical_notification_message_at] = (technical_notification_message_base + 0 + technical_notification_message_at + 1) % 256; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_record.technical_notification_type = (technical_notification_message_base + 8 + 1) % 256;
  technical_notification_message_record.rebroadcast_indicator = (technical_notification_message_base + 9 + 1) % 256;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_start_time[technical_notification_message_at] = (technical_notification_message_base + 10 + technical_notification_message_at + 1) % 256; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_end_time[technical_notification_message_at] = (technical_notification_message_base + 18 + technical_notification_message_at + 1) % 256; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 4 -> technical_notification_message_record.symbol_index_optional[technical_notification_message_at] = (technical_notification_message_base + 26 + technical_notification_message_at + 1) % 256; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Notification Message to the wire, 30 bytes from where the cursor stands */
inline encode_technical_notification_message(technical_notification_message_record) {
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> wire[at] = technical_notification_message_record.md_seq_num_optional[technical_notification_message_at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  wire[at] = technical_notification_message_record.technical_notification_type; at = at + 1;
  wire[at] = technical_notification_message_record.rebroadcast_indicator; at = at + 1;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> wire[at] = technical_notification_message_record.retransmission_start_time[technical_notification_message_at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> wire[at] = technical_notification_message_record.retransmission_end_time[technical_notification_message_at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 4 -> wire[at] = technical_notification_message_record.symbol_index_optional[technical_notification_message_at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* Technical Notification Message off the wire, 30 bytes from where the cursor stands */
inline decode_technical_notification_message(technical_notification_message_record) {
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.md_seq_num_optional[technical_notification_message_at] = wire[at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_record.technical_notification_type = wire[at]; at = at + 1;
  technical_notification_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_start_time[technical_notification_message_at] = wire[at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> technical_notification_message_record.retransmission_end_time[technical_notification_message_at] = wire[at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 4 -> technical_notification_message_record.symbol_index_optional[technical_notification_message_at] = wire[at]; at = at + 1; technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Technical Notification Message is what was written, byte for byte */
inline equal_technical_notification_message(technical_notification_message_read, technical_notification_message_written) {
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> assert(technical_notification_message_read.md_seq_num_optional[technical_notification_message_at] == technical_notification_message_written.md_seq_num_optional[technical_notification_message_at]); technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  assert(technical_notification_message_read.technical_notification_type == technical_notification_message_written.technical_notification_type);
  assert(technical_notification_message_read.rebroadcast_indicator == technical_notification_message_written.rebroadcast_indicator);
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> assert(technical_notification_message_read.retransmission_start_time[technical_notification_message_at] == technical_notification_message_written.retransmission_start_time[technical_notification_message_at]); technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 8 -> assert(technical_notification_message_read.retransmission_end_time[technical_notification_message_at] == technical_notification_message_written.retransmission_end_time[technical_notification_message_at]); technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  technical_notification_message_at = 0;
  do
  :: technical_notification_message_at < 4 -> assert(technical_notification_message_read.symbol_index_optional[technical_notification_message_at] == technical_notification_message_written.symbol_index_optional[technical_notification_message_at]); technical_notification_message_at = technical_notification_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size Encoding: 2 bytes -------------------------------------------- */

/* groupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length_short;
  byte num_in_group
};

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_record.block_length_short = group_size_encoding_value;
  group_size_encoding_record.num_in_group = group_size_encoding_value;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_record.block_length_short = (group_size_encoding_base + 0 + 1) % 256;
  group_size_encoding_record.num_in_group = (group_size_encoding_base + 1 + 1) % 256;
  skip
}

/* Group Size Encoding to the wire, 2 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  wire[at] = group_size_encoding_record.block_length_short; at = at + 1;
  wire[at] = group_size_encoding_record.num_in_group; at = at + 1;
  skip
}

/* Group Size Encoding off the wire, 2 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_record.block_length_short = wire[at]; at = at + 1;
  group_size_encoding_record.num_in_group = wire[at]; at = at + 1;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  assert(group_size_encoding_read.block_length_short == group_size_encoding_written.block_length_short);
  assert(group_size_encoding_read.num_in_group == group_size_encoding_written.num_in_group);
  skip
}

/* ---- Real Time Index Message: 50 bytes --------------------------------------- */

/* RealTimeIndexMessage */
typedef RealTimeIndexMessage {
  byte md_seq_num[8];
  byte rebroadcast_indicator;
  byte emm;
  byte event_time[8];
  byte symbol_index[4];
  byte index_level[8];
  byte pctg_of_capitalization[8];
  byte prct_varfrom_prev_close[8];
  byte num_traded_instruments[2];
  byte index_level_type;
  byte index_price_code
};

int real_time_index_message_at;

/* every byte of Real Time Index Message set to one value */
inline fill_real_time_index_message(real_time_index_message_record, real_time_index_message_value) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.md_seq_num[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.rebroadcast_indicator = real_time_index_message_value;
  real_time_index_message_record.emm = real_time_index_message_value;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.event_time[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.index_level[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.pctg_of_capitalization[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.prct_varfrom_prev_close[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_traded_instruments[real_time_index_message_at] = real_time_index_message_value; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_type = real_time_index_message_value;
  real_time_index_message_record.index_price_code = real_time_index_message_value;
  skip
}

/* each byte of Real Time Index Message set to where it lies, so a field read out of place says so */
inline ramp_real_time_index_message(real_time_index_message_record, real_time_index_message_base) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.md_seq_num[real_time_index_message_at] = (real_time_index_message_base + 0 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.rebroadcast_indicator = (real_time_index_message_base + 8 + 1) % 256;
  real_time_index_message_record.emm = (real_time_index_message_base + 9 + 1) % 256;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.event_time[real_time_index_message_at] = (real_time_index_message_base + 10 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = (real_time_index_message_base + 18 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.index_level[real_time_index_message_at] = (real_time_index_message_base + 22 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.pctg_of_capitalization[real_time_index_message_at] = (real_time_index_message_base + 30 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.prct_varfrom_prev_close[real_time_index_message_at] = (real_time_index_message_base + 38 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_traded_instruments[real_time_index_message_at] = (real_time_index_message_base + 46 + real_time_index_message_at + 1) % 256; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_type = (real_time_index_message_base + 48 + 1) % 256;
  real_time_index_message_record.index_price_code = (real_time_index_message_base + 49 + 1) % 256;
  skip
}

/* Real Time Index Message to the wire, 50 bytes from where the cursor stands */
inline encode_real_time_index_message(real_time_index_message_record) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.md_seq_num[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_index_message_record.rebroadcast_indicator; at = at + 1;
  wire[at] = real_time_index_message_record.emm; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.event_time[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> wire[at] = real_time_index_message_record.symbol_index[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.index_level[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.pctg_of_capitalization[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> wire[at] = real_time_index_message_record.prct_varfrom_prev_close[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> wire[at] = real_time_index_message_record.num_traded_instruments[real_time_index_message_at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  wire[at] = real_time_index_message_record.index_level_type; at = at + 1;
  wire[at] = real_time_index_message_record.index_price_code; at = at + 1;
  skip
}

/* Real Time Index Message off the wire, 50 bytes from where the cursor stands */
inline decode_real_time_index_message(real_time_index_message_record) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.md_seq_num[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  real_time_index_message_record.emm = wire[at]; at = at + 1;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.event_time[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> real_time_index_message_record.symbol_index[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.index_level[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.pctg_of_capitalization[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> real_time_index_message_record.prct_varfrom_prev_close[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> real_time_index_message_record.num_traded_instruments[real_time_index_message_at] = wire[at]; at = at + 1; real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_record.index_level_type = wire[at]; at = at + 1;
  real_time_index_message_record.index_price_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Real Time Index Message is what was written, byte for byte */
inline equal_real_time_index_message(real_time_index_message_read, real_time_index_message_written) {
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.md_seq_num[real_time_index_message_at] == real_time_index_message_written.md_seq_num[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  assert(real_time_index_message_read.rebroadcast_indicator == real_time_index_message_written.rebroadcast_indicator);
  assert(real_time_index_message_read.emm == real_time_index_message_written.emm);
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.event_time[real_time_index_message_at] == real_time_index_message_written.event_time[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 4 -> assert(real_time_index_message_read.symbol_index[real_time_index_message_at] == real_time_index_message_written.symbol_index[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.index_level[real_time_index_message_at] == real_time_index_message_written.index_level[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.pctg_of_capitalization[real_time_index_message_at] == real_time_index_message_written.pctg_of_capitalization[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 8 -> assert(real_time_index_message_read.prct_varfrom_prev_close[real_time_index_message_at] == real_time_index_message_written.prct_varfrom_prev_close[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  real_time_index_message_at = 0;
  do
  :: real_time_index_message_at < 2 -> assert(real_time_index_message_read.num_traded_instruments[real_time_index_message_at] == real_time_index_message_written.num_traded_instruments[real_time_index_message_at]); real_time_index_message_at = real_time_index_message_at + 1
  :: else -> break
  od;
  assert(real_time_index_message_read.index_level_type == real_time_index_message_written.index_level_type);
  assert(real_time_index_message_read.index_price_code == real_time_index_message_written.index_price_code);
  skip
}

/* ---- Index Summary Message: 126 bytes ---------------------------------------- */

/* IndexSummaryMessage */
typedef IndexSummaryMessage {
  byte md_seq_num[8];
  byte rebroadcast_indicator;
  byte emm;
  byte event_time[8];
  byte symbol_index[4];
  byte opening_level[8];
  byte opening_time[8];
  byte confirmed_reference_level[8];
  byte confirmed_reference_time[8];
  byte closing_reference_level[8];
  byte closing_reference_time[8];
  byte prct_varfrom_prev_close[8];
  byte high_level[8];
  byte high_time[8];
  byte low_level[8];
  byte low_time[8];
  byte liquidation_level[8];
  byte liquidation_time[8]
};

int index_summary_message_at;

/* every byte of Index Summary Message set to one value */
inline fill_index_summary_message(index_summary_message_record, index_summary_message_value) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.md_seq_num[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.rebroadcast_indicator = index_summary_message_value;
  index_summary_message_record.emm = index_summary_message_value;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.event_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.prct_varfrom_prev_close[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_level[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_time[index_summary_message_at] = index_summary_message_value; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Index Summary Message set to where it lies, so a field read out of place says so */
inline ramp_index_summary_message(index_summary_message_record, index_summary_message_base) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.md_seq_num[index_summary_message_at] = (index_summary_message_base + 0 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.rebroadcast_indicator = (index_summary_message_base + 8 + 1) % 256;
  index_summary_message_record.emm = (index_summary_message_base + 9 + 1) % 256;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.event_time[index_summary_message_at] = (index_summary_message_base + 10 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = (index_summary_message_base + 18 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_level[index_summary_message_at] = (index_summary_message_base + 22 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_time[index_summary_message_at] = (index_summary_message_base + 30 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_level[index_summary_message_at] = (index_summary_message_base + 38 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_time[index_summary_message_at] = (index_summary_message_base + 46 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = (index_summary_message_base + 54 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = (index_summary_message_base + 62 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.prct_varfrom_prev_close[index_summary_message_at] = (index_summary_message_base + 70 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_level[index_summary_message_at] = (index_summary_message_base + 78 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_time[index_summary_message_at] = (index_summary_message_base + 86 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_level[index_summary_message_at] = (index_summary_message_base + 94 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_time[index_summary_message_at] = (index_summary_message_base + 102 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_level[index_summary_message_at] = (index_summary_message_base + 110 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_time[index_summary_message_at] = (index_summary_message_base + 118 + index_summary_message_at + 1) % 256; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Summary Message to the wire, 126 bytes from where the cursor stands */
inline encode_index_summary_message(index_summary_message_record) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.md_seq_num[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = index_summary_message_record.rebroadcast_indicator; at = at + 1;
  wire[at] = index_summary_message_record.emm; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.event_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> wire[at] = index_summary_message_record.symbol_index[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.opening_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.opening_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.confirmed_reference_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.confirmed_reference_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.closing_reference_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.closing_reference_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.prct_varfrom_prev_close[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.high_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.high_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.low_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.low_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.liquidation_level[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> wire[at] = index_summary_message_record.liquidation_time[index_summary_message_at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Index Summary Message off the wire, 126 bytes from where the cursor stands */
inline decode_index_summary_message(index_summary_message_record) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.md_seq_num[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  index_summary_message_record.emm = wire[at]; at = at + 1;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.event_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> index_summary_message_record.symbol_index[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.opening_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.confirmed_reference_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.closing_reference_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.prct_varfrom_prev_close[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.high_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.low_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_level[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> index_summary_message_record.liquidation_time[index_summary_message_at] = wire[at]; at = at + 1; index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Index Summary Message is what was written, byte for byte */
inline equal_index_summary_message(index_summary_message_read, index_summary_message_written) {
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.md_seq_num[index_summary_message_at] == index_summary_message_written.md_seq_num[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  assert(index_summary_message_read.rebroadcast_indicator == index_summary_message_written.rebroadcast_indicator);
  assert(index_summary_message_read.emm == index_summary_message_written.emm);
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.event_time[index_summary_message_at] == index_summary_message_written.event_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 4 -> assert(index_summary_message_read.symbol_index[index_summary_message_at] == index_summary_message_written.symbol_index[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.opening_level[index_summary_message_at] == index_summary_message_written.opening_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.opening_time[index_summary_message_at] == index_summary_message_written.opening_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.confirmed_reference_level[index_summary_message_at] == index_summary_message_written.confirmed_reference_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.confirmed_reference_time[index_summary_message_at] == index_summary_message_written.confirmed_reference_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.closing_reference_level[index_summary_message_at] == index_summary_message_written.closing_reference_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.closing_reference_time[index_summary_message_at] == index_summary_message_written.closing_reference_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.prct_varfrom_prev_close[index_summary_message_at] == index_summary_message_written.prct_varfrom_prev_close[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.high_level[index_summary_message_at] == index_summary_message_written.high_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.high_time[index_summary_message_at] == index_summary_message_written.high_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.low_level[index_summary_message_at] == index_summary_message_written.low_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.low_time[index_summary_message_at] == index_summary_message_written.low_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.liquidation_level[index_summary_message_at] == index_summary_message_written.liquidation_level[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  index_summary_message_at = 0;
  do
  :: index_summary_message_at < 8 -> assert(index_summary_message_read.liquidation_time[index_summary_message_at] == index_summary_message_written.liquidation_time[index_summary_message_at]); index_summary_message_at = index_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Apa Quotes Message: 105 bytes ------------------------------------------- */

/* APAQuotesMessage */
typedef ApaQuotesMessage {
  byte md_seq_num_optional[8];
  byte rebroadcast_indicator;
  byte mifid_instrument_id_type[4];
  byte mifid_instrument_id[12];
  byte mic[4];
  byte currency[3];
  byte lei_code[20];
  byte event_time[8];
  byte quote_update_type;
  byte mifid_price[20];
  byte mifid_quantity[20];
  byte apa_origin[4]
};

int apa_quotes_message_at;

/* every byte of Apa Quotes Message set to one value */
inline fill_apa_quotes_message(apa_quotes_message_record, apa_quotes_message_value) {
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.md_seq_num_optional[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.rebroadcast_indicator = apa_quotes_message_value;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mifid_instrument_id_type[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 12 -> apa_quotes_message_record.mifid_instrument_id[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mic[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 3 -> apa_quotes_message_record.currency[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.lei_code[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.event_time[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.quote_update_type = apa_quotes_message_value;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_price[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_quantity[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.apa_origin[apa_quotes_message_at] = apa_quotes_message_value; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Apa Quotes Message set to where it lies, so a field read out of place says so */
inline ramp_apa_quotes_message(apa_quotes_message_record, apa_quotes_message_base) {
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.md_seq_num_optional[apa_quotes_message_at] = (apa_quotes_message_base + 0 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.rebroadcast_indicator = (apa_quotes_message_base + 8 + 1) % 256;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mifid_instrument_id_type[apa_quotes_message_at] = (apa_quotes_message_base + 9 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 12 -> apa_quotes_message_record.mifid_instrument_id[apa_quotes_message_at] = (apa_quotes_message_base + 13 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mic[apa_quotes_message_at] = (apa_quotes_message_base + 25 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 3 -> apa_quotes_message_record.currency[apa_quotes_message_at] = (apa_quotes_message_base + 29 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.lei_code[apa_quotes_message_at] = (apa_quotes_message_base + 32 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.event_time[apa_quotes_message_at] = (apa_quotes_message_base + 52 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.quote_update_type = (apa_quotes_message_base + 60 + 1) % 256;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_price[apa_quotes_message_at] = (apa_quotes_message_base + 61 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_quantity[apa_quotes_message_at] = (apa_quotes_message_base + 81 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.apa_origin[apa_quotes_message_at] = (apa_quotes_message_base + 101 + apa_quotes_message_at + 1) % 256; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Quotes Message to the wire, 105 bytes from where the cursor stands */
inline encode_apa_quotes_message(apa_quotes_message_record) {
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> wire[at] = apa_quotes_message_record.md_seq_num_optional[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_quotes_message_record.rebroadcast_indicator; at = at + 1;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> wire[at] = apa_quotes_message_record.mifid_instrument_id_type[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 12 -> wire[at] = apa_quotes_message_record.mifid_instrument_id[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> wire[at] = apa_quotes_message_record.mic[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 3 -> wire[at] = apa_quotes_message_record.currency[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> wire[at] = apa_quotes_message_record.lei_code[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> wire[at] = apa_quotes_message_record.event_time[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_quotes_message_record.quote_update_type; at = at + 1;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> wire[at] = apa_quotes_message_record.mifid_price[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> wire[at] = apa_quotes_message_record.mifid_quantity[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> wire[at] = apa_quotes_message_record.apa_origin[apa_quotes_message_at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Quotes Message off the wire, 105 bytes from where the cursor stands */
inline decode_apa_quotes_message(apa_quotes_message_record) {
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.md_seq_num_optional[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mifid_instrument_id_type[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 12 -> apa_quotes_message_record.mifid_instrument_id[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.mic[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 3 -> apa_quotes_message_record.currency[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.lei_code[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> apa_quotes_message_record.event_time[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_record.quote_update_type = wire[at]; at = at + 1;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_price[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> apa_quotes_message_record.mifid_quantity[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> apa_quotes_message_record.apa_origin[apa_quotes_message_at] = wire[at]; at = at + 1; apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Apa Quotes Message is what was written, byte for byte */
inline equal_apa_quotes_message(apa_quotes_message_read, apa_quotes_message_written) {
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> assert(apa_quotes_message_read.md_seq_num_optional[apa_quotes_message_at] == apa_quotes_message_written.md_seq_num_optional[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  assert(apa_quotes_message_read.rebroadcast_indicator == apa_quotes_message_written.rebroadcast_indicator);
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> assert(apa_quotes_message_read.mifid_instrument_id_type[apa_quotes_message_at] == apa_quotes_message_written.mifid_instrument_id_type[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 12 -> assert(apa_quotes_message_read.mifid_instrument_id[apa_quotes_message_at] == apa_quotes_message_written.mifid_instrument_id[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> assert(apa_quotes_message_read.mic[apa_quotes_message_at] == apa_quotes_message_written.mic[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 3 -> assert(apa_quotes_message_read.currency[apa_quotes_message_at] == apa_quotes_message_written.currency[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> assert(apa_quotes_message_read.lei_code[apa_quotes_message_at] == apa_quotes_message_written.lei_code[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 8 -> assert(apa_quotes_message_read.event_time[apa_quotes_message_at] == apa_quotes_message_written.event_time[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  assert(apa_quotes_message_read.quote_update_type == apa_quotes_message_written.quote_update_type);
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> assert(apa_quotes_message_read.mifid_price[apa_quotes_message_at] == apa_quotes_message_written.mifid_price[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 20 -> assert(apa_quotes_message_read.mifid_quantity[apa_quotes_message_at] == apa_quotes_message_written.mifid_quantity[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  apa_quotes_message_at = 0;
  do
  :: apa_quotes_message_at < 4 -> assert(apa_quotes_message_read.apa_origin[apa_quotes_message_at] == apa_quotes_message_written.apa_origin[apa_quotes_message_at]); apa_quotes_message_at = apa_quotes_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Apa Standing Data Message: 217 bytes ------------------------------------ */

/* APAStandingDataMessage */
typedef ApaStandingDataMessage {
  byte md_seq_num_optional[8];
  byte rebroadcast_indicator;
  byte mifid_instrument_id_type[4];
  byte mifid_instrument_id[12];
  byte full_instrument_name[102];
  byte cfi_optional[6];
  byte notional_currency[3];
  byte second_notional_currency[3];
  byte price_multiplier[4];
  byte price_multiplier_decimals;
  byte underlying_isin_code[12];
  byte underlying_index_name[25];
  byte underlying_index_term[8];
  byte option_type;
  byte strike_price[8];
  byte strike_price_decimals;
  byte exer_style;
  byte maturity_date_optional[8];
  byte expiry_date[8];
  byte settlement_method
};

int apa_standing_data_message_at;

/* every byte of Apa Standing Data Message set to one value */
inline fill_apa_standing_data_message(apa_standing_data_message_record, apa_standing_data_message_value) {
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.md_seq_num_optional[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.rebroadcast_indicator = apa_standing_data_message_value;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.mifid_instrument_id_type[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.mifid_instrument_id[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 102 -> apa_standing_data_message_record.full_instrument_name[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 6 -> apa_standing_data_message_record.cfi_optional[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.notional_currency[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.second_notional_currency[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.price_multiplier[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.price_multiplier_decimals = apa_standing_data_message_value;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.underlying_isin_code[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 25 -> apa_standing_data_message_record.underlying_index_name[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.underlying_index_term[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.option_type = apa_standing_data_message_value;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.strike_price[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.strike_price_decimals = apa_standing_data_message_value;
  apa_standing_data_message_record.exer_style = apa_standing_data_message_value;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.maturity_date_optional[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.expiry_date[apa_standing_data_message_at] = apa_standing_data_message_value; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.settlement_method = apa_standing_data_message_value;
  skip
}

/* each byte of Apa Standing Data Message set to where it lies, so a field read out of place says so */
inline ramp_apa_standing_data_message(apa_standing_data_message_record, apa_standing_data_message_base) {
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.md_seq_num_optional[apa_standing_data_message_at] = (apa_standing_data_message_base + 0 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.rebroadcast_indicator = (apa_standing_data_message_base + 8 + 1) % 256;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.mifid_instrument_id_type[apa_standing_data_message_at] = (apa_standing_data_message_base + 9 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.mifid_instrument_id[apa_standing_data_message_at] = (apa_standing_data_message_base + 13 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 102 -> apa_standing_data_message_record.full_instrument_name[apa_standing_data_message_at] = (apa_standing_data_message_base + 25 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 6 -> apa_standing_data_message_record.cfi_optional[apa_standing_data_message_at] = (apa_standing_data_message_base + 127 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.notional_currency[apa_standing_data_message_at] = (apa_standing_data_message_base + 133 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.second_notional_currency[apa_standing_data_message_at] = (apa_standing_data_message_base + 136 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.price_multiplier[apa_standing_data_message_at] = (apa_standing_data_message_base + 139 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.price_multiplier_decimals = (apa_standing_data_message_base + 143 + 1) % 256;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.underlying_isin_code[apa_standing_data_message_at] = (apa_standing_data_message_base + 144 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 25 -> apa_standing_data_message_record.underlying_index_name[apa_standing_data_message_at] = (apa_standing_data_message_base + 156 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.underlying_index_term[apa_standing_data_message_at] = (apa_standing_data_message_base + 181 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.option_type = (apa_standing_data_message_base + 189 + 1) % 256;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.strike_price[apa_standing_data_message_at] = (apa_standing_data_message_base + 190 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.strike_price_decimals = (apa_standing_data_message_base + 198 + 1) % 256;
  apa_standing_data_message_record.exer_style = (apa_standing_data_message_base + 199 + 1) % 256;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.maturity_date_optional[apa_standing_data_message_at] = (apa_standing_data_message_base + 200 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.expiry_date[apa_standing_data_message_at] = (apa_standing_data_message_base + 208 + apa_standing_data_message_at + 1) % 256; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.settlement_method = (apa_standing_data_message_base + 216 + 1) % 256;
  skip
}

/* Apa Standing Data Message to the wire, 217 bytes from where the cursor stands */
inline encode_apa_standing_data_message(apa_standing_data_message_record) {
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> wire[at] = apa_standing_data_message_record.md_seq_num_optional[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_standing_data_message_record.rebroadcast_indicator; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> wire[at] = apa_standing_data_message_record.mifid_instrument_id_type[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> wire[at] = apa_standing_data_message_record.mifid_instrument_id[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 102 -> wire[at] = apa_standing_data_message_record.full_instrument_name[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 6 -> wire[at] = apa_standing_data_message_record.cfi_optional[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> wire[at] = apa_standing_data_message_record.notional_currency[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> wire[at] = apa_standing_data_message_record.second_notional_currency[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> wire[at] = apa_standing_data_message_record.price_multiplier[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_standing_data_message_record.price_multiplier_decimals; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> wire[at] = apa_standing_data_message_record.underlying_isin_code[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 25 -> wire[at] = apa_standing_data_message_record.underlying_index_name[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> wire[at] = apa_standing_data_message_record.underlying_index_term[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_standing_data_message_record.option_type; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> wire[at] = apa_standing_data_message_record.strike_price[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_standing_data_message_record.strike_price_decimals; at = at + 1;
  wire[at] = apa_standing_data_message_record.exer_style; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> wire[at] = apa_standing_data_message_record.maturity_date_optional[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> wire[at] = apa_standing_data_message_record.expiry_date[apa_standing_data_message_at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_standing_data_message_record.settlement_method; at = at + 1;
  skip
}

/* Apa Standing Data Message off the wire, 217 bytes from where the cursor stands */
inline decode_apa_standing_data_message(apa_standing_data_message_record) {
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.md_seq_num_optional[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.mifid_instrument_id_type[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.mifid_instrument_id[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 102 -> apa_standing_data_message_record.full_instrument_name[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 6 -> apa_standing_data_message_record.cfi_optional[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.notional_currency[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> apa_standing_data_message_record.second_notional_currency[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> apa_standing_data_message_record.price_multiplier[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.price_multiplier_decimals = wire[at]; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> apa_standing_data_message_record.underlying_isin_code[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 25 -> apa_standing_data_message_record.underlying_index_name[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.underlying_index_term[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.option_type = wire[at]; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.strike_price[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.strike_price_decimals = wire[at]; at = at + 1;
  apa_standing_data_message_record.exer_style = wire[at]; at = at + 1;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.maturity_date_optional[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> apa_standing_data_message_record.expiry_date[apa_standing_data_message_at] = wire[at]; at = at + 1; apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_record.settlement_method = wire[at]; at = at + 1;
  skip
}

/* what was read of Apa Standing Data Message is what was written, byte for byte */
inline equal_apa_standing_data_message(apa_standing_data_message_read, apa_standing_data_message_written) {
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> assert(apa_standing_data_message_read.md_seq_num_optional[apa_standing_data_message_at] == apa_standing_data_message_written.md_seq_num_optional[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  assert(apa_standing_data_message_read.rebroadcast_indicator == apa_standing_data_message_written.rebroadcast_indicator);
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> assert(apa_standing_data_message_read.mifid_instrument_id_type[apa_standing_data_message_at] == apa_standing_data_message_written.mifid_instrument_id_type[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> assert(apa_standing_data_message_read.mifid_instrument_id[apa_standing_data_message_at] == apa_standing_data_message_written.mifid_instrument_id[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 102 -> assert(apa_standing_data_message_read.full_instrument_name[apa_standing_data_message_at] == apa_standing_data_message_written.full_instrument_name[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 6 -> assert(apa_standing_data_message_read.cfi_optional[apa_standing_data_message_at] == apa_standing_data_message_written.cfi_optional[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> assert(apa_standing_data_message_read.notional_currency[apa_standing_data_message_at] == apa_standing_data_message_written.notional_currency[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 3 -> assert(apa_standing_data_message_read.second_notional_currency[apa_standing_data_message_at] == apa_standing_data_message_written.second_notional_currency[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 4 -> assert(apa_standing_data_message_read.price_multiplier[apa_standing_data_message_at] == apa_standing_data_message_written.price_multiplier[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  assert(apa_standing_data_message_read.price_multiplier_decimals == apa_standing_data_message_written.price_multiplier_decimals);
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 12 -> assert(apa_standing_data_message_read.underlying_isin_code[apa_standing_data_message_at] == apa_standing_data_message_written.underlying_isin_code[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 25 -> assert(apa_standing_data_message_read.underlying_index_name[apa_standing_data_message_at] == apa_standing_data_message_written.underlying_index_name[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> assert(apa_standing_data_message_read.underlying_index_term[apa_standing_data_message_at] == apa_standing_data_message_written.underlying_index_term[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  assert(apa_standing_data_message_read.option_type == apa_standing_data_message_written.option_type);
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> assert(apa_standing_data_message_read.strike_price[apa_standing_data_message_at] == apa_standing_data_message_written.strike_price[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  assert(apa_standing_data_message_read.strike_price_decimals == apa_standing_data_message_written.strike_price_decimals);
  assert(apa_standing_data_message_read.exer_style == apa_standing_data_message_written.exer_style);
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> assert(apa_standing_data_message_read.maturity_date_optional[apa_standing_data_message_at] == apa_standing_data_message_written.maturity_date_optional[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  apa_standing_data_message_at = 0;
  do
  :: apa_standing_data_message_at < 8 -> assert(apa_standing_data_message_read.expiry_date[apa_standing_data_message_at] == apa_standing_data_message_written.expiry_date[apa_standing_data_message_at]); apa_standing_data_message_at = apa_standing_data_message_at + 1
  :: else -> break
  od;
  assert(apa_standing_data_message_read.settlement_method == apa_standing_data_message_written.settlement_method);
  skip
}

/* ---- Apa Full Trade Information Message: 405 bytes --------------------------- */

/* APAFullTradeInformationMessage */
typedef ApaFullTradeInformationMessage {
  byte md_seq_num[8];
  byte rebroadcast_indicator;
  byte emm;
  byte event_time[8];
  byte trading_date_time[27];
  byte publication_date_time[27];
  byte trade_type;
  byte mifid_instrument_id_type_optional[4];
  byte mifid_instrument_id_optional[12];
  byte mifid_transaction_id[52];
  byte mifid_price_optional[20];
  byte mifid_quantity[20];
  byte mifid_price_notation[4];
  byte mifid_currency[3];
  byte mifid_qty_in_msrmt_unit_notation[25];
  byte mifid_quantity_measurement_unit[20];
  byte mifid_notional_amount[20];
  byte notional_currency[3];
  byte mifid_clearing_flag[5];
  byte efficient_mmt_market_mechanism;
  byte efficient_mmt_trading_mode;
  byte efficient_mmt_transaction_category;
  byte efficient_mmt_negotiation_indicator;
  byte efficient_mmt_agency_cross_trade_indicator;
  byte efficient_mmt_modification_indicator;
  byte efficient_mmt_benchmark_indicator;
  byte efficient_mmt_special_dividend_indicator;
  byte efficient_mmt_off_book_automated_indicator;
  byte efficient_mmt_contributionto_price;
  byte efficient_mmt_algorithmic_indicator;
  byte efficient_mmt_publication_mode;
  byte efficient_mmt_post_trade_deferral;
  byte efficient_mmt_duplicative_indicator;
  byte trade_reference[30];
  byte original_report_timestamp[8];
  byte price_multiplier[4];
  byte price_multiplier_decimals;
  byte venue[11];
  byte mifid_emission_allowance_type[4];
  byte long_trade_reference[52];
  byte apa_origin[4];
  byte trade_unique_identifier[16]
};

int apa_full_trade_information_message_at;

/* every byte of Apa Full Trade Information Message set to one value */
inline fill_apa_full_trade_information_message(apa_full_trade_information_message_record, apa_full_trade_information_message_value) {
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.md_seq_num[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.rebroadcast_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.emm = apa_full_trade_information_message_value;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.event_time[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.trading_date_time[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.publication_date_time[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.trade_type = apa_full_trade_information_message_value;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_instrument_id_type_optional[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 12 -> apa_full_trade_information_message_record.mifid_instrument_id_optional[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.mifid_transaction_id[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_price_optional[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_price_notation[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.mifid_currency[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 25 -> apa_full_trade_information_message_record.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity_measurement_unit[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_notional_amount[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.notional_currency[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 5 -> apa_full_trade_information_message_record.mifid_clearing_flag[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.efficient_mmt_market_mechanism = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_trading_mode = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_transaction_category = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_negotiation_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_agency_cross_trade_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_modification_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_benchmark_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_special_dividend_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_off_book_automated_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_contributionto_price = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_algorithmic_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_publication_mode = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_post_trade_deferral = apa_full_trade_information_message_value;
  apa_full_trade_information_message_record.efficient_mmt_duplicative_indicator = apa_full_trade_information_message_value;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 30 -> apa_full_trade_information_message_record.trade_reference[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.original_report_timestamp[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.price_multiplier[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.price_multiplier_decimals = apa_full_trade_information_message_value;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 11 -> apa_full_trade_information_message_record.venue[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_emission_allowance_type[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.long_trade_reference[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.apa_origin[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 16 -> apa_full_trade_information_message_record.trade_unique_identifier[apa_full_trade_information_message_at] = apa_full_trade_information_message_value; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Apa Full Trade Information Message set to where it lies, so a field read out of place says so */
inline ramp_apa_full_trade_information_message(apa_full_trade_information_message_record, apa_full_trade_information_message_base) {
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.md_seq_num[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 0 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.rebroadcast_indicator = (apa_full_trade_information_message_base + 8 + 1) % 256;
  apa_full_trade_information_message_record.emm = (apa_full_trade_information_message_base + 9 + 1) % 256;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.event_time[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 10 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.trading_date_time[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 18 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.publication_date_time[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 45 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.trade_type = (apa_full_trade_information_message_base + 72 + 1) % 256;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_instrument_id_type_optional[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 73 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 12 -> apa_full_trade_information_message_record.mifid_instrument_id_optional[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 77 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.mifid_transaction_id[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 89 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_price_optional[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 141 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 161 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_price_notation[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 181 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.mifid_currency[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 185 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 25 -> apa_full_trade_information_message_record.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 188 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity_measurement_unit[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 213 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_notional_amount[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 233 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.notional_currency[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 253 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 5 -> apa_full_trade_information_message_record.mifid_clearing_flag[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 256 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.efficient_mmt_market_mechanism = (apa_full_trade_information_message_base + 261 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_trading_mode = (apa_full_trade_information_message_base + 262 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_transaction_category = (apa_full_trade_information_message_base + 263 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_negotiation_indicator = (apa_full_trade_information_message_base + 264 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_agency_cross_trade_indicator = (apa_full_trade_information_message_base + 265 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_modification_indicator = (apa_full_trade_information_message_base + 266 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_benchmark_indicator = (apa_full_trade_information_message_base + 267 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_special_dividend_indicator = (apa_full_trade_information_message_base + 268 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_off_book_automated_indicator = (apa_full_trade_information_message_base + 269 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_contributionto_price = (apa_full_trade_information_message_base + 270 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_algorithmic_indicator = (apa_full_trade_information_message_base + 271 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_publication_mode = (apa_full_trade_information_message_base + 272 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_post_trade_deferral = (apa_full_trade_information_message_base + 273 + 1) % 256;
  apa_full_trade_information_message_record.efficient_mmt_duplicative_indicator = (apa_full_trade_information_message_base + 274 + 1) % 256;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 30 -> apa_full_trade_information_message_record.trade_reference[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 275 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.original_report_timestamp[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 305 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.price_multiplier[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 313 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.price_multiplier_decimals = (apa_full_trade_information_message_base + 317 + 1) % 256;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 11 -> apa_full_trade_information_message_record.venue[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 318 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_emission_allowance_type[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 329 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.long_trade_reference[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 333 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.apa_origin[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 385 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 16 -> apa_full_trade_information_message_record.trade_unique_identifier[apa_full_trade_information_message_at] = (apa_full_trade_information_message_base + 389 + apa_full_trade_information_message_at + 1) % 256; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Full Trade Information Message to the wire, 405 bytes from where the cursor stands */
inline encode_apa_full_trade_information_message(apa_full_trade_information_message_record) {
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> wire[at] = apa_full_trade_information_message_record.md_seq_num[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_full_trade_information_message_record.rebroadcast_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.emm; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> wire[at] = apa_full_trade_information_message_record.event_time[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> wire[at] = apa_full_trade_information_message_record.trading_date_time[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> wire[at] = apa_full_trade_information_message_record.publication_date_time[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_full_trade_information_message_record.trade_type; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> wire[at] = apa_full_trade_information_message_record.mifid_instrument_id_type_optional[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 12 -> wire[at] = apa_full_trade_information_message_record.mifid_instrument_id_optional[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> wire[at] = apa_full_trade_information_message_record.mifid_transaction_id[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> wire[at] = apa_full_trade_information_message_record.mifid_price_optional[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> wire[at] = apa_full_trade_information_message_record.mifid_quantity[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> wire[at] = apa_full_trade_information_message_record.mifid_price_notation[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> wire[at] = apa_full_trade_information_message_record.mifid_currency[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 25 -> wire[at] = apa_full_trade_information_message_record.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> wire[at] = apa_full_trade_information_message_record.mifid_quantity_measurement_unit[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> wire[at] = apa_full_trade_information_message_record.mifid_notional_amount[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> wire[at] = apa_full_trade_information_message_record.notional_currency[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 5 -> wire[at] = apa_full_trade_information_message_record.mifid_clearing_flag[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_market_mechanism; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_trading_mode; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_transaction_category; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_negotiation_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_agency_cross_trade_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_modification_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_benchmark_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_special_dividend_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_off_book_automated_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_contributionto_price; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_algorithmic_indicator; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_publication_mode; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_post_trade_deferral; at = at + 1;
  wire[at] = apa_full_trade_information_message_record.efficient_mmt_duplicative_indicator; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 30 -> wire[at] = apa_full_trade_information_message_record.trade_reference[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> wire[at] = apa_full_trade_information_message_record.original_report_timestamp[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> wire[at] = apa_full_trade_information_message_record.price_multiplier[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  wire[at] = apa_full_trade_information_message_record.price_multiplier_decimals; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 11 -> wire[at] = apa_full_trade_information_message_record.venue[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> wire[at] = apa_full_trade_information_message_record.mifid_emission_allowance_type[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> wire[at] = apa_full_trade_information_message_record.long_trade_reference[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> wire[at] = apa_full_trade_information_message_record.apa_origin[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 16 -> wire[at] = apa_full_trade_information_message_record.trade_unique_identifier[apa_full_trade_information_message_at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* Apa Full Trade Information Message off the wire, 405 bytes from where the cursor stands */
inline decode_apa_full_trade_information_message(apa_full_trade_information_message_record) {
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.md_seq_num[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.emm = wire[at]; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.event_time[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.trading_date_time[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> apa_full_trade_information_message_record.publication_date_time[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.trade_type = wire[at]; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_instrument_id_type_optional[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 12 -> apa_full_trade_information_message_record.mifid_instrument_id_optional[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.mifid_transaction_id[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_price_optional[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_price_notation[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.mifid_currency[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 25 -> apa_full_trade_information_message_record.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_quantity_measurement_unit[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> apa_full_trade_information_message_record.mifid_notional_amount[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> apa_full_trade_information_message_record.notional_currency[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 5 -> apa_full_trade_information_message_record.mifid_clearing_flag[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.efficient_mmt_market_mechanism = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_trading_mode = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_transaction_category = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_negotiation_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_agency_cross_trade_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_modification_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_benchmark_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_special_dividend_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_off_book_automated_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_contributionto_price = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_algorithmic_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_publication_mode = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_post_trade_deferral = wire[at]; at = at + 1;
  apa_full_trade_information_message_record.efficient_mmt_duplicative_indicator = wire[at]; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 30 -> apa_full_trade_information_message_record.trade_reference[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> apa_full_trade_information_message_record.original_report_timestamp[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.price_multiplier[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_record.price_multiplier_decimals = wire[at]; at = at + 1;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 11 -> apa_full_trade_information_message_record.venue[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.mifid_emission_allowance_type[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> apa_full_trade_information_message_record.long_trade_reference[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> apa_full_trade_information_message_record.apa_origin[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 16 -> apa_full_trade_information_message_record.trade_unique_identifier[apa_full_trade_information_message_at] = wire[at]; at = at + 1; apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Apa Full Trade Information Message is what was written, byte for byte */
inline equal_apa_full_trade_information_message(apa_full_trade_information_message_read, apa_full_trade_information_message_written) {
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> assert(apa_full_trade_information_message_read.md_seq_num[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.md_seq_num[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  assert(apa_full_trade_information_message_read.rebroadcast_indicator == apa_full_trade_information_message_written.rebroadcast_indicator);
  assert(apa_full_trade_information_message_read.emm == apa_full_trade_information_message_written.emm);
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> assert(apa_full_trade_information_message_read.event_time[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.event_time[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> assert(apa_full_trade_information_message_read.trading_date_time[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.trading_date_time[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 27 -> assert(apa_full_trade_information_message_read.publication_date_time[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.publication_date_time[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  assert(apa_full_trade_information_message_read.trade_type == apa_full_trade_information_message_written.trade_type);
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> assert(apa_full_trade_information_message_read.mifid_instrument_id_type_optional[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_instrument_id_type_optional[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 12 -> assert(apa_full_trade_information_message_read.mifid_instrument_id_optional[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_instrument_id_optional[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> assert(apa_full_trade_information_message_read.mifid_transaction_id[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_transaction_id[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> assert(apa_full_trade_information_message_read.mifid_price_optional[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_price_optional[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> assert(apa_full_trade_information_message_read.mifid_quantity[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_quantity[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> assert(apa_full_trade_information_message_read.mifid_price_notation[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_price_notation[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> assert(apa_full_trade_information_message_read.mifid_currency[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_currency[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 25 -> assert(apa_full_trade_information_message_read.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_qty_in_msrmt_unit_notation[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> assert(apa_full_trade_information_message_read.mifid_quantity_measurement_unit[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_quantity_measurement_unit[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 20 -> assert(apa_full_trade_information_message_read.mifid_notional_amount[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_notional_amount[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 3 -> assert(apa_full_trade_information_message_read.notional_currency[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.notional_currency[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 5 -> assert(apa_full_trade_information_message_read.mifid_clearing_flag[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_clearing_flag[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  assert(apa_full_trade_information_message_read.efficient_mmt_market_mechanism == apa_full_trade_information_message_written.efficient_mmt_market_mechanism);
  assert(apa_full_trade_information_message_read.efficient_mmt_trading_mode == apa_full_trade_information_message_written.efficient_mmt_trading_mode);
  assert(apa_full_trade_information_message_read.efficient_mmt_transaction_category == apa_full_trade_information_message_written.efficient_mmt_transaction_category);
  assert(apa_full_trade_information_message_read.efficient_mmt_negotiation_indicator == apa_full_trade_information_message_written.efficient_mmt_negotiation_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_agency_cross_trade_indicator == apa_full_trade_information_message_written.efficient_mmt_agency_cross_trade_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_modification_indicator == apa_full_trade_information_message_written.efficient_mmt_modification_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_benchmark_indicator == apa_full_trade_information_message_written.efficient_mmt_benchmark_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_special_dividend_indicator == apa_full_trade_information_message_written.efficient_mmt_special_dividend_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_off_book_automated_indicator == apa_full_trade_information_message_written.efficient_mmt_off_book_automated_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_contributionto_price == apa_full_trade_information_message_written.efficient_mmt_contributionto_price);
  assert(apa_full_trade_information_message_read.efficient_mmt_algorithmic_indicator == apa_full_trade_information_message_written.efficient_mmt_algorithmic_indicator);
  assert(apa_full_trade_information_message_read.efficient_mmt_publication_mode == apa_full_trade_information_message_written.efficient_mmt_publication_mode);
  assert(apa_full_trade_information_message_read.efficient_mmt_post_trade_deferral == apa_full_trade_information_message_written.efficient_mmt_post_trade_deferral);
  assert(apa_full_trade_information_message_read.efficient_mmt_duplicative_indicator == apa_full_trade_information_message_written.efficient_mmt_duplicative_indicator);
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 30 -> assert(apa_full_trade_information_message_read.trade_reference[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.trade_reference[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 8 -> assert(apa_full_trade_information_message_read.original_report_timestamp[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.original_report_timestamp[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> assert(apa_full_trade_information_message_read.price_multiplier[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.price_multiplier[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  assert(apa_full_trade_information_message_read.price_multiplier_decimals == apa_full_trade_information_message_written.price_multiplier_decimals);
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 11 -> assert(apa_full_trade_information_message_read.venue[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.venue[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> assert(apa_full_trade_information_message_read.mifid_emission_allowance_type[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.mifid_emission_allowance_type[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 52 -> assert(apa_full_trade_information_message_read.long_trade_reference[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.long_trade_reference[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 4 -> assert(apa_full_trade_information_message_read.apa_origin[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.apa_origin[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  apa_full_trade_information_message_at = 0;
  do
  :: apa_full_trade_information_message_at < 16 -> assert(apa_full_trade_information_message_read.trade_unique_identifier[apa_full_trade_information_message_at] == apa_full_trade_information_message_written.trade_unique_identifier[apa_full_trade_information_message_at]); apa_full_trade_information_message_at = apa_full_trade_information_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bf Trade Message: 148 bytes --------------------------------------------- */

/* BFTradeMessage */
typedef BfTradeMessage {
  byte md_seq_num_optional[8];
  byte rebroadcast_indicator;
  byte symbol_index[4];
  byte mifid_transaction_id[52];
  byte event_time[8];
  byte bid_offer_date_time[8];
  byte mmt_modification_indicator[4];
  byte price[8];
  byte bid_price[8];
  byte offer_price[8];
  byte quantity[8];
  byte mmt_agency_cross_trade_indicator[4];
  byte mmt_benchmark_indicator[4];
  byte mmt_special_dividend_indicator[4];
  byte mmt_trading_mode;
  byte mifid_price_notation[4];
  byte quantity_notation[3];
  byte notional_amount_traded[8];
  byte trading_currency_optional[3]
};

int bf_trade_message_at;

/* every byte of Bf Trade Message set to one value */
inline fill_bf_trade_message(bf_trade_message_record, bf_trade_message_value) {
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.md_seq_num_optional[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.rebroadcast_indicator = bf_trade_message_value;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.symbol_index[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 52 -> bf_trade_message_record.mifid_transaction_id[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.event_time[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_offer_date_time[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_modification_indicator[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.price[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_price[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.offer_price[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.quantity[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_agency_cross_trade_indicator[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_benchmark_indicator[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_special_dividend_indicator[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.mmt_trading_mode = bf_trade_message_value;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mifid_price_notation[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.quantity_notation[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.notional_amount_traded[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.trading_currency_optional[bf_trade_message_at] = bf_trade_message_value; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bf Trade Message set to where it lies, so a field read out of place says so */
inline ramp_bf_trade_message(bf_trade_message_record, bf_trade_message_base) {
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.md_seq_num_optional[bf_trade_message_at] = (bf_trade_message_base + 0 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.rebroadcast_indicator = (bf_trade_message_base + 8 + 1) % 256;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.symbol_index[bf_trade_message_at] = (bf_trade_message_base + 9 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 52 -> bf_trade_message_record.mifid_transaction_id[bf_trade_message_at] = (bf_trade_message_base + 13 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.event_time[bf_trade_message_at] = (bf_trade_message_base + 65 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_offer_date_time[bf_trade_message_at] = (bf_trade_message_base + 73 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_modification_indicator[bf_trade_message_at] = (bf_trade_message_base + 81 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.price[bf_trade_message_at] = (bf_trade_message_base + 85 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_price[bf_trade_message_at] = (bf_trade_message_base + 93 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.offer_price[bf_trade_message_at] = (bf_trade_message_base + 101 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.quantity[bf_trade_message_at] = (bf_trade_message_base + 109 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_agency_cross_trade_indicator[bf_trade_message_at] = (bf_trade_message_base + 117 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_benchmark_indicator[bf_trade_message_at] = (bf_trade_message_base + 121 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_special_dividend_indicator[bf_trade_message_at] = (bf_trade_message_base + 125 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.mmt_trading_mode = (bf_trade_message_base + 129 + 1) % 256;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mifid_price_notation[bf_trade_message_at] = (bf_trade_message_base + 130 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.quantity_notation[bf_trade_message_at] = (bf_trade_message_base + 134 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.notional_amount_traded[bf_trade_message_at] = (bf_trade_message_base + 137 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.trading_currency_optional[bf_trade_message_at] = (bf_trade_message_base + 145 + bf_trade_message_at + 1) % 256; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bf Trade Message to the wire, 148 bytes from where the cursor stands */
inline encode_bf_trade_message(bf_trade_message_record) {
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.md_seq_num_optional[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = bf_trade_message_record.rebroadcast_indicator; at = at + 1;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.symbol_index[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 52 -> wire[at] = bf_trade_message_record.mifid_transaction_id[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.event_time[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.bid_offer_date_time[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.mmt_modification_indicator[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.price[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.bid_price[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.offer_price[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.quantity[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.mmt_agency_cross_trade_indicator[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.mmt_benchmark_indicator[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.mmt_special_dividend_indicator[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  wire[at] = bf_trade_message_record.mmt_trading_mode; at = at + 1;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> wire[at] = bf_trade_message_record.mifid_price_notation[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> wire[at] = bf_trade_message_record.quantity_notation[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> wire[at] = bf_trade_message_record.notional_amount_traded[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> wire[at] = bf_trade_message_record.trading_currency_optional[bf_trade_message_at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bf Trade Message off the wire, 148 bytes from where the cursor stands */
inline decode_bf_trade_message(bf_trade_message_record) {
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.md_seq_num_optional[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.symbol_index[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 52 -> bf_trade_message_record.mifid_transaction_id[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.event_time[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_offer_date_time[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_modification_indicator[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.price[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.bid_price[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.offer_price[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.quantity[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_agency_cross_trade_indicator[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_benchmark_indicator[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mmt_special_dividend_indicator[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_record.mmt_trading_mode = wire[at]; at = at + 1;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> bf_trade_message_record.mifid_price_notation[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.quantity_notation[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> bf_trade_message_record.notional_amount_traded[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> bf_trade_message_record.trading_currency_optional[bf_trade_message_at] = wire[at]; at = at + 1; bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bf Trade Message is what was written, byte for byte */
inline equal_bf_trade_message(bf_trade_message_read, bf_trade_message_written) {
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.md_seq_num_optional[bf_trade_message_at] == bf_trade_message_written.md_seq_num_optional[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  assert(bf_trade_message_read.rebroadcast_indicator == bf_trade_message_written.rebroadcast_indicator);
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.symbol_index[bf_trade_message_at] == bf_trade_message_written.symbol_index[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 52 -> assert(bf_trade_message_read.mifid_transaction_id[bf_trade_message_at] == bf_trade_message_written.mifid_transaction_id[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.event_time[bf_trade_message_at] == bf_trade_message_written.event_time[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.bid_offer_date_time[bf_trade_message_at] == bf_trade_message_written.bid_offer_date_time[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.mmt_modification_indicator[bf_trade_message_at] == bf_trade_message_written.mmt_modification_indicator[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.price[bf_trade_message_at] == bf_trade_message_written.price[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.bid_price[bf_trade_message_at] == bf_trade_message_written.bid_price[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.offer_price[bf_trade_message_at] == bf_trade_message_written.offer_price[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.quantity[bf_trade_message_at] == bf_trade_message_written.quantity[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.mmt_agency_cross_trade_indicator[bf_trade_message_at] == bf_trade_message_written.mmt_agency_cross_trade_indicator[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.mmt_benchmark_indicator[bf_trade_message_at] == bf_trade_message_written.mmt_benchmark_indicator[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.mmt_special_dividend_indicator[bf_trade_message_at] == bf_trade_message_written.mmt_special_dividend_indicator[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  assert(bf_trade_message_read.mmt_trading_mode == bf_trade_message_written.mmt_trading_mode);
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 4 -> assert(bf_trade_message_read.mifid_price_notation[bf_trade_message_at] == bf_trade_message_written.mifid_price_notation[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> assert(bf_trade_message_read.quantity_notation[bf_trade_message_at] == bf_trade_message_written.quantity_notation[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 8 -> assert(bf_trade_message_read.notional_amount_traded[bf_trade_message_at] == bf_trade_message_written.notional_amount_traded[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  bf_trade_message_at = 0;
  do
  :: bf_trade_message_at < 3 -> assert(bf_trade_message_read.trading_currency_optional[bf_trade_message_at] == bf_trade_message_written.trading_currency_optional[bf_trade_message_at]); bf_trade_message_at = bf_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bfnav Message: 109 bytes ------------------------------------------------ */

/* BFNAVMessage */
typedef BfnavMessage {
  byte md_seq_num_optional[8];
  byte rebroadcast_indicator;
  byte symbol_index[4];
  byte bid_offer_date_time[8];
  byte mifid_transaction_id[52];
  byte mmt_modification_indicator[4];
  byte nav_price[8];
  byte event_time_optional[8];
  byte nav_bid_price[8];
  byte nav_offer_price[8]
};

int bfnav_message_at;

/* every byte of Bfnav Message set to one value */
inline fill_bfnav_message(bfnav_message_record, bfnav_message_value) {
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.md_seq_num_optional[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_record.rebroadcast_indicator = bfnav_message_value;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.symbol_index[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.bid_offer_date_time[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 52 -> bfnav_message_record.mifid_transaction_id[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.mmt_modification_indicator[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_price[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.event_time_optional[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_bid_price[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_offer_price[bfnav_message_at] = bfnav_message_value; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bfnav Message set to where it lies, so a field read out of place says so */
inline ramp_bfnav_message(bfnav_message_record, bfnav_message_base) {
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.md_seq_num_optional[bfnav_message_at] = (bfnav_message_base + 0 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_record.rebroadcast_indicator = (bfnav_message_base + 8 + 1) % 256;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.symbol_index[bfnav_message_at] = (bfnav_message_base + 9 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.bid_offer_date_time[bfnav_message_at] = (bfnav_message_base + 13 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 52 -> bfnav_message_record.mifid_transaction_id[bfnav_message_at] = (bfnav_message_base + 21 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.mmt_modification_indicator[bfnav_message_at] = (bfnav_message_base + 73 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_price[bfnav_message_at] = (bfnav_message_base + 77 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.event_time_optional[bfnav_message_at] = (bfnav_message_base + 85 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_bid_price[bfnav_message_at] = (bfnav_message_base + 93 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_offer_price[bfnav_message_at] = (bfnav_message_base + 101 + bfnav_message_at + 1) % 256; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bfnav Message to the wire, 109 bytes from where the cursor stands */
inline encode_bfnav_message(bfnav_message_record) {
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.md_seq_num_optional[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  wire[at] = bfnav_message_record.rebroadcast_indicator; at = at + 1;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> wire[at] = bfnav_message_record.symbol_index[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.bid_offer_date_time[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 52 -> wire[at] = bfnav_message_record.mifid_transaction_id[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> wire[at] = bfnav_message_record.mmt_modification_indicator[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.nav_price[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.event_time_optional[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.nav_bid_price[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> wire[at] = bfnav_message_record.nav_offer_price[bfnav_message_at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bfnav Message off the wire, 109 bytes from where the cursor stands */
inline decode_bfnav_message(bfnav_message_record) {
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.md_seq_num_optional[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.symbol_index[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.bid_offer_date_time[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 52 -> bfnav_message_record.mifid_transaction_id[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> bfnav_message_record.mmt_modification_indicator[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_price[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.event_time_optional[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_bid_price[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> bfnav_message_record.nav_offer_price[bfnav_message_at] = wire[at]; at = at + 1; bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bfnav Message is what was written, byte for byte */
inline equal_bfnav_message(bfnav_message_read, bfnav_message_written) {
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.md_seq_num_optional[bfnav_message_at] == bfnav_message_written.md_seq_num_optional[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  assert(bfnav_message_read.rebroadcast_indicator == bfnav_message_written.rebroadcast_indicator);
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> assert(bfnav_message_read.symbol_index[bfnav_message_at] == bfnav_message_written.symbol_index[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.bid_offer_date_time[bfnav_message_at] == bfnav_message_written.bid_offer_date_time[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 52 -> assert(bfnav_message_read.mifid_transaction_id[bfnav_message_at] == bfnav_message_written.mifid_transaction_id[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 4 -> assert(bfnav_message_read.mmt_modification_indicator[bfnav_message_at] == bfnav_message_written.mmt_modification_indicator[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.nav_price[bfnav_message_at] == bfnav_message_written.nav_price[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.event_time_optional[bfnav_message_at] == bfnav_message_written.event_time_optional[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.nav_bid_price[bfnav_message_at] == bfnav_message_written.nav_bid_price[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  bfnav_message_at = 0;
  do
  :: bfnav_message_at < 8 -> assert(bfnav_message_read.nav_offer_price[bfnav_message_at] == bfnav_message_written.nav_offer_price[bfnav_message_at]); bfnav_message_at = bfnav_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bf Instrument Suspension Message: 22 bytes ------------------------------ */

/* BFInstrumentSuspensionMessage */
typedef BfInstrumentSuspensionMessage {
  byte md_seq_num_optional[8];
  byte rebroadcast_indicator;
  byte symbol_index[4];
  byte event_time[8];
  byte security_condition
};

int bf_instrument_suspension_message_at;

/* every byte of Bf Instrument Suspension Message set to one value */
inline fill_bf_instrument_suspension_message(bf_instrument_suspension_message_record, bf_instrument_suspension_message_value) {
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.md_seq_num_optional[bf_instrument_suspension_message_at] = bf_instrument_suspension_message_value; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.rebroadcast_indicator = bf_instrument_suspension_message_value;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 4 -> bf_instrument_suspension_message_record.symbol_index[bf_instrument_suspension_message_at] = bf_instrument_suspension_message_value; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.event_time[bf_instrument_suspension_message_at] = bf_instrument_suspension_message_value; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.security_condition = bf_instrument_suspension_message_value;
  skip
}

/* each byte of Bf Instrument Suspension Message set to where it lies, so a field read out of place says so */
inline ramp_bf_instrument_suspension_message(bf_instrument_suspension_message_record, bf_instrument_suspension_message_base) {
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.md_seq_num_optional[bf_instrument_suspension_message_at] = (bf_instrument_suspension_message_base + 0 + bf_instrument_suspension_message_at + 1) % 256; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.rebroadcast_indicator = (bf_instrument_suspension_message_base + 8 + 1) % 256;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 4 -> bf_instrument_suspension_message_record.symbol_index[bf_instrument_suspension_message_at] = (bf_instrument_suspension_message_base + 9 + bf_instrument_suspension_message_at + 1) % 256; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.event_time[bf_instrument_suspension_message_at] = (bf_instrument_suspension_message_base + 13 + bf_instrument_suspension_message_at + 1) % 256; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.security_condition = (bf_instrument_suspension_message_base + 21 + 1) % 256;
  skip
}

/* Bf Instrument Suspension Message to the wire, 22 bytes from where the cursor stands */
inline encode_bf_instrument_suspension_message(bf_instrument_suspension_message_record) {
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> wire[at] = bf_instrument_suspension_message_record.md_seq_num_optional[bf_instrument_suspension_message_at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  wire[at] = bf_instrument_suspension_message_record.rebroadcast_indicator; at = at + 1;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 4 -> wire[at] = bf_instrument_suspension_message_record.symbol_index[bf_instrument_suspension_message_at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> wire[at] = bf_instrument_suspension_message_record.event_time[bf_instrument_suspension_message_at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  wire[at] = bf_instrument_suspension_message_record.security_condition; at = at + 1;
  skip
}

/* Bf Instrument Suspension Message off the wire, 22 bytes from where the cursor stands */
inline decode_bf_instrument_suspension_message(bf_instrument_suspension_message_record) {
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.md_seq_num_optional[bf_instrument_suspension_message_at] = wire[at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.rebroadcast_indicator = wire[at]; at = at + 1;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 4 -> bf_instrument_suspension_message_record.symbol_index[bf_instrument_suspension_message_at] = wire[at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> bf_instrument_suspension_message_record.event_time[bf_instrument_suspension_message_at] = wire[at]; at = at + 1; bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_record.security_condition = wire[at]; at = at + 1;
  skip
}

/* what was read of Bf Instrument Suspension Message is what was written, byte for byte */
inline equal_bf_instrument_suspension_message(bf_instrument_suspension_message_read, bf_instrument_suspension_message_written) {
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> assert(bf_instrument_suspension_message_read.md_seq_num_optional[bf_instrument_suspension_message_at] == bf_instrument_suspension_message_written.md_seq_num_optional[bf_instrument_suspension_message_at]); bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  assert(bf_instrument_suspension_message_read.rebroadcast_indicator == bf_instrument_suspension_message_written.rebroadcast_indicator);
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 4 -> assert(bf_instrument_suspension_message_read.symbol_index[bf_instrument_suspension_message_at] == bf_instrument_suspension_message_written.symbol_index[bf_instrument_suspension_message_at]); bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  bf_instrument_suspension_message_at = 0;
  do
  :: bf_instrument_suspension_message_at < 8 -> assert(bf_instrument_suspension_message_read.event_time[bf_instrument_suspension_message_at] == bf_instrument_suspension_message_written.event_time[bf_instrument_suspension_message_at]); bf_instrument_suspension_message_at = bf_instrument_suspension_message_at + 1
  :: else -> break
  od;
  assert(bf_instrument_suspension_message_read.security_condition == bf_instrument_suspension_message_written.security_condition);
  skip
}

/* ---- Start Of Snapshot Message: 16 bytes ------------------------------------- */

/* StartOfSnapshotMessage */
typedef StartOfSnapshotMessage {
  byte last_md_seq_num[8];
  byte snapshot_time[8]
};

int start_of_snapshot_message_at;

/* every byte of Start Of Snapshot Message set to one value */
inline fill_start_of_snapshot_message(start_of_snapshot_message_record, start_of_snapshot_message_value) {
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.last_md_seq_num[start_of_snapshot_message_at] = start_of_snapshot_message_value; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.snapshot_time[start_of_snapshot_message_at] = start_of_snapshot_message_value; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_snapshot_message(start_of_snapshot_message_record, start_of_snapshot_message_base) {
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.last_md_seq_num[start_of_snapshot_message_at] = (start_of_snapshot_message_base + 0 + start_of_snapshot_message_at + 1) % 256; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.snapshot_time[start_of_snapshot_message_at] = (start_of_snapshot_message_base + 8 + start_of_snapshot_message_at + 1) % 256; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Snapshot Message to the wire, 16 bytes from where the cursor stands */
inline encode_start_of_snapshot_message(start_of_snapshot_message_record) {
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> wire[at] = start_of_snapshot_message_record.last_md_seq_num[start_of_snapshot_message_at]; at = at + 1; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> wire[at] = start_of_snapshot_message_record.snapshot_time[start_of_snapshot_message_at]; at = at + 1; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Snapshot Message off the wire, 16 bytes from where the cursor stands */
inline decode_start_of_snapshot_message(start_of_snapshot_message_record) {
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.last_md_seq_num[start_of_snapshot_message_at] = wire[at]; at = at + 1; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> start_of_snapshot_message_record.snapshot_time[start_of_snapshot_message_at] = wire[at]; at = at + 1; start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Snapshot Message is what was written, byte for byte */
inline equal_start_of_snapshot_message(start_of_snapshot_message_read, start_of_snapshot_message_written) {
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> assert(start_of_snapshot_message_read.last_md_seq_num[start_of_snapshot_message_at] == start_of_snapshot_message_written.last_md_seq_num[start_of_snapshot_message_at]); start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  start_of_snapshot_message_at = 0;
  do
  :: start_of_snapshot_message_at < 8 -> assert(start_of_snapshot_message_read.snapshot_time[start_of_snapshot_message_at] == start_of_snapshot_message_written.snapshot_time[start_of_snapshot_message_at]); start_of_snapshot_message_at = start_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Snapshot Message: 16 bytes --------------------------------------- */

/* EndOfSnapshotMessage */
typedef EndOfSnapshotMessage {
  byte last_md_seq_num[8];
  byte snapshot_time[8]
};

int end_of_snapshot_message_at;

/* every byte of End Of Snapshot Message set to one value */
inline fill_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_value) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.last_md_seq_num[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.snapshot_time[end_of_snapshot_message_at] = end_of_snapshot_message_value; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Snapshot Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_snapshot_message(end_of_snapshot_message_record, end_of_snapshot_message_base) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.last_md_seq_num[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 0 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.snapshot_time[end_of_snapshot_message_at] = (end_of_snapshot_message_base + 8 + end_of_snapshot_message_at + 1) % 256; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message to the wire, 16 bytes from where the cursor stands */
inline encode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> wire[at] = end_of_snapshot_message_record.last_md_seq_num[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> wire[at] = end_of_snapshot_message_record.snapshot_time[end_of_snapshot_message_at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Snapshot Message off the wire, 16 bytes from where the cursor stands */
inline decode_end_of_snapshot_message(end_of_snapshot_message_record) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.last_md_seq_num[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> end_of_snapshot_message_record.snapshot_time[end_of_snapshot_message_at] = wire[at]; at = at + 1; end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Snapshot Message is what was written, byte for byte */
inline equal_end_of_snapshot_message(end_of_snapshot_message_read, end_of_snapshot_message_written) {
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> assert(end_of_snapshot_message_read.last_md_seq_num[end_of_snapshot_message_at] == end_of_snapshot_message_written.last_md_seq_num[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
  :: else -> break
  od;
  end_of_snapshot_message_at = 0;
  do
  :: end_of_snapshot_message_at < 8 -> assert(end_of_snapshot_message_read.snapshot_time[end_of_snapshot_message_at] == end_of_snapshot_message_written.snapshot_time[end_of_snapshot_message_at]); end_of_snapshot_message_at = end_of_snapshot_message_at + 1
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
    assert(at == 8);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 8);
    equal_message_header(message_header_got, message_header_sent)
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
    assert(at == 10);
    at = 0;
    decode_start_of_day_message(start_of_day_message_got);
    assert(at == 10);
    equal_start_of_day_message(start_of_day_message_got, start_of_day_message_sent)
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
    assert(at == 10);
    at = 0;
    decode_end_of_day_message(end_of_day_message_got);
    assert(at == 10);
    equal_end_of_day_message(end_of_day_message_got, end_of_day_message_sent)
  }
}

/* Health Status Message: encoded, read back, and compared */
proctype check_health_status_message() {
  HealthStatusMessage health_status_message_sent;
  HealthStatusMessage health_status_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_health_status_message(health_status_message_sent, 0)
  :: pattern == 1 -> fill_health_status_message(health_status_message_sent, 32)
  :: pattern == 2 -> fill_health_status_message(health_status_message_sent, 255)
  :: else -> ramp_health_status_message(health_status_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_health_status_message(health_status_message_sent);
    assert(at == 16);
    at = 0;
    decode_health_status_message(health_status_message_got);
    assert(at == 16);
    equal_health_status_message(health_status_message_got, health_status_message_sent)
  }
}

/* Technical Notification Message: encoded, read back, and compared */
proctype check_technical_notification_message() {
  TechnicalNotificationMessage technical_notification_message_sent;
  TechnicalNotificationMessage technical_notification_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_technical_notification_message(technical_notification_message_sent, 0)
  :: pattern == 1 -> fill_technical_notification_message(technical_notification_message_sent, 32)
  :: pattern == 2 -> fill_technical_notification_message(technical_notification_message_sent, 255)
  :: else -> ramp_technical_notification_message(technical_notification_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_technical_notification_message(technical_notification_message_sent);
    assert(at == 30);
    at = 0;
    decode_technical_notification_message(technical_notification_message_got);
    assert(at == 30);
    equal_technical_notification_message(technical_notification_message_got, technical_notification_message_sent)
  }
}

/* Group Size Encoding: encoded, read back, and compared */
proctype check_group_size_encoding() {
  GroupSizeEncoding group_size_encoding_sent;
  GroupSizeEncoding group_size_encoding_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_group_size_encoding(group_size_encoding_sent, 0)
  :: pattern == 1 -> fill_group_size_encoding(group_size_encoding_sent, 32)
  :: pattern == 2 -> fill_group_size_encoding(group_size_encoding_sent, 255)
  :: else -> ramp_group_size_encoding(group_size_encoding_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_group_size_encoding(group_size_encoding_sent);
    assert(at == 2);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 2);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Real Time Index Message: encoded, read back, and compared */
proctype check_real_time_index_message() {
  RealTimeIndexMessage real_time_index_message_sent;
  RealTimeIndexMessage real_time_index_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_real_time_index_message(real_time_index_message_sent, 0)
  :: pattern == 1 -> fill_real_time_index_message(real_time_index_message_sent, 32)
  :: pattern == 2 -> fill_real_time_index_message(real_time_index_message_sent, 255)
  :: else -> ramp_real_time_index_message(real_time_index_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_real_time_index_message(real_time_index_message_sent);
    assert(at == 50);
    at = 0;
    decode_real_time_index_message(real_time_index_message_got);
    assert(at == 50);
    equal_real_time_index_message(real_time_index_message_got, real_time_index_message_sent)
  }
}

/* Index Summary Message: encoded, read back, and compared */
proctype check_index_summary_message() {
  IndexSummaryMessage index_summary_message_sent;
  IndexSummaryMessage index_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_index_summary_message(index_summary_message_sent, 0)
  :: pattern == 1 -> fill_index_summary_message(index_summary_message_sent, 32)
  :: pattern == 2 -> fill_index_summary_message(index_summary_message_sent, 255)
  :: else -> ramp_index_summary_message(index_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_index_summary_message(index_summary_message_sent);
    assert(at == 126);
    at = 0;
    decode_index_summary_message(index_summary_message_got);
    assert(at == 126);
    equal_index_summary_message(index_summary_message_got, index_summary_message_sent)
  }
}

/* Apa Quotes Message: encoded, read back, and compared */
proctype check_apa_quotes_message() {
  ApaQuotesMessage apa_quotes_message_sent;
  ApaQuotesMessage apa_quotes_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_apa_quotes_message(apa_quotes_message_sent, 0)
  :: pattern == 1 -> fill_apa_quotes_message(apa_quotes_message_sent, 32)
  :: pattern == 2 -> fill_apa_quotes_message(apa_quotes_message_sent, 255)
  :: else -> ramp_apa_quotes_message(apa_quotes_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_apa_quotes_message(apa_quotes_message_sent);
    assert(at == 105);
    at = 0;
    decode_apa_quotes_message(apa_quotes_message_got);
    assert(at == 105);
    equal_apa_quotes_message(apa_quotes_message_got, apa_quotes_message_sent)
  }
}

/* Apa Standing Data Message: encoded, read back, and compared */
proctype check_apa_standing_data_message() {
  ApaStandingDataMessage apa_standing_data_message_sent;
  ApaStandingDataMessage apa_standing_data_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_apa_standing_data_message(apa_standing_data_message_sent, 0)
  :: pattern == 1 -> fill_apa_standing_data_message(apa_standing_data_message_sent, 32)
  :: pattern == 2 -> fill_apa_standing_data_message(apa_standing_data_message_sent, 255)
  :: else -> ramp_apa_standing_data_message(apa_standing_data_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_apa_standing_data_message(apa_standing_data_message_sent);
    assert(at == 217);
    at = 0;
    decode_apa_standing_data_message(apa_standing_data_message_got);
    assert(at == 217);
    equal_apa_standing_data_message(apa_standing_data_message_got, apa_standing_data_message_sent)
  }
}

/* Apa Full Trade Information Message: encoded, read back, and compared */
proctype check_apa_full_trade_information_message() {
  ApaFullTradeInformationMessage apa_full_trade_information_message_sent;
  ApaFullTradeInformationMessage apa_full_trade_information_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_apa_full_trade_information_message(apa_full_trade_information_message_sent, 0)
  :: pattern == 1 -> fill_apa_full_trade_information_message(apa_full_trade_information_message_sent, 32)
  :: pattern == 2 -> fill_apa_full_trade_information_message(apa_full_trade_information_message_sent, 255)
  :: else -> ramp_apa_full_trade_information_message(apa_full_trade_information_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_apa_full_trade_information_message(apa_full_trade_information_message_sent);
    assert(at == 405);
    at = 0;
    decode_apa_full_trade_information_message(apa_full_trade_information_message_got);
    assert(at == 405);
    equal_apa_full_trade_information_message(apa_full_trade_information_message_got, apa_full_trade_information_message_sent)
  }
}

/* Bf Trade Message: encoded, read back, and compared */
proctype check_bf_trade_message() {
  BfTradeMessage bf_trade_message_sent;
  BfTradeMessage bf_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bf_trade_message(bf_trade_message_sent, 0)
  :: pattern == 1 -> fill_bf_trade_message(bf_trade_message_sent, 32)
  :: pattern == 2 -> fill_bf_trade_message(bf_trade_message_sent, 255)
  :: else -> ramp_bf_trade_message(bf_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bf_trade_message(bf_trade_message_sent);
    assert(at == 148);
    at = 0;
    decode_bf_trade_message(bf_trade_message_got);
    assert(at == 148);
    equal_bf_trade_message(bf_trade_message_got, bf_trade_message_sent)
  }
}

/* Bfnav Message: encoded, read back, and compared */
proctype check_bfnav_message() {
  BfnavMessage bfnav_message_sent;
  BfnavMessage bfnav_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bfnav_message(bfnav_message_sent, 0)
  :: pattern == 1 -> fill_bfnav_message(bfnav_message_sent, 32)
  :: pattern == 2 -> fill_bfnav_message(bfnav_message_sent, 255)
  :: else -> ramp_bfnav_message(bfnav_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bfnav_message(bfnav_message_sent);
    assert(at == 109);
    at = 0;
    decode_bfnav_message(bfnav_message_got);
    assert(at == 109);
    equal_bfnav_message(bfnav_message_got, bfnav_message_sent)
  }
}

/* Bf Instrument Suspension Message: encoded, read back, and compared */
proctype check_bf_instrument_suspension_message() {
  BfInstrumentSuspensionMessage bf_instrument_suspension_message_sent;
  BfInstrumentSuspensionMessage bf_instrument_suspension_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bf_instrument_suspension_message(bf_instrument_suspension_message_sent, 0)
  :: pattern == 1 -> fill_bf_instrument_suspension_message(bf_instrument_suspension_message_sent, 32)
  :: pattern == 2 -> fill_bf_instrument_suspension_message(bf_instrument_suspension_message_sent, 255)
  :: else -> ramp_bf_instrument_suspension_message(bf_instrument_suspension_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bf_instrument_suspension_message(bf_instrument_suspension_message_sent);
    assert(at == 22);
    at = 0;
    decode_bf_instrument_suspension_message(bf_instrument_suspension_message_got);
    assert(at == 22);
    equal_bf_instrument_suspension_message(bf_instrument_suspension_message_got, bf_instrument_suspension_message_sent)
  }
}

/* Start Of Snapshot Message: encoded, read back, and compared */
proctype check_start_of_snapshot_message() {
  StartOfSnapshotMessage start_of_snapshot_message_sent;
  StartOfSnapshotMessage start_of_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_snapshot_message(start_of_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_start_of_snapshot_message(start_of_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_start_of_snapshot_message(start_of_snapshot_message_sent, 255)
  :: else -> ramp_start_of_snapshot_message(start_of_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_snapshot_message(start_of_snapshot_message_sent);
    assert(at == 16);
    at = 0;
    decode_start_of_snapshot_message(start_of_snapshot_message_got);
    assert(at == 16);
    equal_start_of_snapshot_message(start_of_snapshot_message_got, start_of_snapshot_message_sent)
  }
}

/* End Of Snapshot Message: encoded, read back, and compared */
proctype check_end_of_snapshot_message() {
  EndOfSnapshotMessage end_of_snapshot_message_sent;
  EndOfSnapshotMessage end_of_snapshot_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  :: pattern == 1 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 32)
  :: pattern == 2 -> fill_end_of_snapshot_message(end_of_snapshot_message_sent, 255)
  :: else -> ramp_end_of_snapshot_message(end_of_snapshot_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_snapshot_message(end_of_snapshot_message_sent);
    assert(at == 16);
    at = 0;
    decode_end_of_snapshot_message(end_of_snapshot_message_got);
    assert(at == 16);
    equal_end_of_snapshot_message(end_of_snapshot_message_got, end_of_snapshot_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_start_of_day_message()
  :: run check_end_of_day_message()
  :: run check_health_status_message()
  :: run check_technical_notification_message()
  :: run check_group_size_encoding()
  :: run check_real_time_index_message()
  :: run check_index_summary_message()
  :: run check_apa_quotes_message()
  :: run check_apa_standing_data_message()
  :: run check_apa_full_trade_information_message()
  :: run check_bf_trade_message()
  :: run check_bfnav_message()
  :: run check_bf_instrument_suspension_message()
  :: run check_start_of_snapshot_message()
  :: run check_end_of_snapshot_message()
  fi
}
