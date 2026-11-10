/*
 * Chicago Board Options Exchange Top
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
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 97

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Logon Message: 17 bytes ------------------------------------------------- */

/* Logon Message */
typedef LogonMessage {
  byte username[6];
  byte password[10];
  byte spin_flag
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.username[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.spin_flag = logon_message_value;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.username[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = (logon_message_base + 6 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.spin_flag = (logon_message_base + 16 + 1) % 256;
  skip
}

/* Logon Message to the wire, 17 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> wire[at] = logon_message_record.username[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> wire[at] = logon_message_record.password[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.spin_flag; at = at + 1;
  skip
}

/* Logon Message off the wire, 17 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> logon_message_record.username[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> logon_message_record.password[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.spin_flag = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 6 -> assert(logon_message_read.username[logon_message_at] == logon_message_written.username[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 10 -> assert(logon_message_read.password[logon_message_at] == logon_message_written.password[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.spin_flag == logon_message_written.spin_flag);
  skip
}

/* ---- Logon Rejected Message: 1 bytes ----------------------------------------- */

/* Logon Rejected Message */
typedef LogonRejectedMessage {
  byte reject_reason
};

/* every byte of Logon Rejected Message set to one value */
inline fill_logon_rejected_message(logon_rejected_message_record, logon_rejected_message_value) {
  logon_rejected_message_record.reject_reason = logon_rejected_message_value;
  skip
}

/* each byte of Logon Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_logon_rejected_message(logon_rejected_message_record, logon_rejected_message_base) {
  logon_rejected_message_record.reject_reason = (logon_rejected_message_base + 0 + 1) % 256;
  skip
}

/* Logon Rejected Message to the wire, 1 bytes from where the cursor stands */
inline encode_logon_rejected_message(logon_rejected_message_record) {
  wire[at] = logon_rejected_message_record.reject_reason; at = at + 1;
  skip
}

/* Logon Rejected Message off the wire, 1 bytes from where the cursor stands */
inline decode_logon_rejected_message(logon_rejected_message_record) {
  logon_rejected_message_record.reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Logon Rejected Message is what was written, byte for byte */
inline equal_logon_rejected_message(logon_rejected_message_read, logon_rejected_message_written) {
  assert(logon_rejected_message_read.reject_reason == logon_rejected_message_written.reject_reason);
  skip
}

/* ---- Seconds Message: 5 bytes ------------------------------------------------ */

/* Sent for every second for which at least one message is being generated. */
typedef SecondsMessage {
  byte seconds[5]
};

int seconds_message_at;

/* every byte of Seconds Message set to one value */
inline fill_seconds_message(seconds_message_record, seconds_message_value) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 5 -> seconds_message_record.seconds[seconds_message_at] = seconds_message_value; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Seconds Message set to where it lies, so a field read out of place says so */
inline ramp_seconds_message(seconds_message_record, seconds_message_base) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 5 -> seconds_message_record.seconds[seconds_message_at] = (seconds_message_base + 0 + seconds_message_at + 1) % 256; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message to the wire, 5 bytes from where the cursor stands */
inline encode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 5 -> wire[at] = seconds_message_record.seconds[seconds_message_at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Seconds Message off the wire, 5 bytes from where the cursor stands */
inline decode_seconds_message(seconds_message_record) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 5 -> seconds_message_record.seconds[seconds_message_at] = wire[at]; at = at + 1; seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Seconds Message is what was written, byte for byte */
inline equal_seconds_message(seconds_message_read, seconds_message_written) {
  seconds_message_at = 0;
  do
  :: seconds_message_at < 5 -> assert(seconds_message_read.seconds[seconds_message_at] == seconds_message_written.seconds[seconds_message_at]); seconds_message_at = seconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Milliseconds Message: 3 bytes ------------------------------------------- */

/* Sent for every millisecond for which at least one message is being generated. */
typedef MillisecondsMessage {
  byte milliseconds[3]
};

int milliseconds_message_at;

/* every byte of Milliseconds Message set to one value */
inline fill_milliseconds_message(milliseconds_message_record, milliseconds_message_value) {
  milliseconds_message_at = 0;
  do
  :: milliseconds_message_at < 3 -> milliseconds_message_record.milliseconds[milliseconds_message_at] = milliseconds_message_value; milliseconds_message_at = milliseconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Milliseconds Message set to where it lies, so a field read out of place says so */
inline ramp_milliseconds_message(milliseconds_message_record, milliseconds_message_base) {
  milliseconds_message_at = 0;
  do
  :: milliseconds_message_at < 3 -> milliseconds_message_record.milliseconds[milliseconds_message_at] = (milliseconds_message_base + 0 + milliseconds_message_at + 1) % 256; milliseconds_message_at = milliseconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Milliseconds Message to the wire, 3 bytes from where the cursor stands */
inline encode_milliseconds_message(milliseconds_message_record) {
  milliseconds_message_at = 0;
  do
  :: milliseconds_message_at < 3 -> wire[at] = milliseconds_message_record.milliseconds[milliseconds_message_at]; at = at + 1; milliseconds_message_at = milliseconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* Milliseconds Message off the wire, 3 bytes from where the cursor stands */
inline decode_milliseconds_message(milliseconds_message_record) {
  milliseconds_message_at = 0;
  do
  :: milliseconds_message_at < 3 -> milliseconds_message_record.milliseconds[milliseconds_message_at] = wire[at]; at = at + 1; milliseconds_message_at = milliseconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Milliseconds Message is what was written, byte for byte */
inline equal_milliseconds_message(milliseconds_message_read, milliseconds_message_written) {
  milliseconds_message_at = 0;
  do
  :: milliseconds_message_at < 3 -> assert(milliseconds_message_read.milliseconds[milliseconds_message_at] == milliseconds_message_written.milliseconds[milliseconds_message_at]); milliseconds_message_at = milliseconds_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Spin Message: 85 bytes ----------------------------------------- */

/* Expanded Spin Message */
typedef ExpandedSpinMessage {
  byte timestamp[8];
  byte symbol_extended[8];
  byte bid_price_long[10];
  byte bid_quantity_long[6];
  byte ask_price_long[10];
  byte ask_quantity_long[6];
  byte last_trade_time[8];
  byte last_trade_price_short[10];
  byte last_trade_size[6];
  byte cumulative_volume_long[9];
  byte halt_status;
  byte reg_s_h_o_action;
  byte last_trade_day_indicator;
  byte reserved_2
};

int expanded_spin_message_at;

/* every byte of Expanded Spin Message set to one value */
inline fill_expanded_spin_message(expanded_spin_message_record, expanded_spin_message_value) {
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.timestamp[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.symbol_extended[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.bid_price_long[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.bid_quantity_long[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.ask_price_long[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.ask_quantity_long[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.last_trade_time[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.last_trade_price_short[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.last_trade_size[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 9 -> expanded_spin_message_record.cumulative_volume_long[expanded_spin_message_at] = expanded_spin_message_value; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_record.halt_status = expanded_spin_message_value;
  expanded_spin_message_record.reg_s_h_o_action = expanded_spin_message_value;
  expanded_spin_message_record.last_trade_day_indicator = expanded_spin_message_value;
  expanded_spin_message_record.reserved_2 = expanded_spin_message_value;
  skip
}

/* each byte of Expanded Spin Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_spin_message(expanded_spin_message_record, expanded_spin_message_base) {
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.timestamp[expanded_spin_message_at] = (expanded_spin_message_base + 0 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.symbol_extended[expanded_spin_message_at] = (expanded_spin_message_base + 8 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.bid_price_long[expanded_spin_message_at] = (expanded_spin_message_base + 16 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.bid_quantity_long[expanded_spin_message_at] = (expanded_spin_message_base + 26 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.ask_price_long[expanded_spin_message_at] = (expanded_spin_message_base + 32 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.ask_quantity_long[expanded_spin_message_at] = (expanded_spin_message_base + 42 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.last_trade_time[expanded_spin_message_at] = (expanded_spin_message_base + 48 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.last_trade_price_short[expanded_spin_message_at] = (expanded_spin_message_base + 56 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.last_trade_size[expanded_spin_message_at] = (expanded_spin_message_base + 66 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 9 -> expanded_spin_message_record.cumulative_volume_long[expanded_spin_message_at] = (expanded_spin_message_base + 72 + expanded_spin_message_at + 1) % 256; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_record.halt_status = (expanded_spin_message_base + 81 + 1) % 256;
  expanded_spin_message_record.reg_s_h_o_action = (expanded_spin_message_base + 82 + 1) % 256;
  expanded_spin_message_record.last_trade_day_indicator = (expanded_spin_message_base + 83 + 1) % 256;
  expanded_spin_message_record.reserved_2 = (expanded_spin_message_base + 84 + 1) % 256;
  skip
}

/* Expanded Spin Message to the wire, 85 bytes from where the cursor stands */
inline encode_expanded_spin_message(expanded_spin_message_record) {
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> wire[at] = expanded_spin_message_record.timestamp[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> wire[at] = expanded_spin_message_record.symbol_extended[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> wire[at] = expanded_spin_message_record.bid_price_long[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> wire[at] = expanded_spin_message_record.bid_quantity_long[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> wire[at] = expanded_spin_message_record.ask_price_long[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> wire[at] = expanded_spin_message_record.ask_quantity_long[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> wire[at] = expanded_spin_message_record.last_trade_time[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> wire[at] = expanded_spin_message_record.last_trade_price_short[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> wire[at] = expanded_spin_message_record.last_trade_size[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 9 -> wire[at] = expanded_spin_message_record.cumulative_volume_long[expanded_spin_message_at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  wire[at] = expanded_spin_message_record.halt_status; at = at + 1;
  wire[at] = expanded_spin_message_record.reg_s_h_o_action; at = at + 1;
  wire[at] = expanded_spin_message_record.last_trade_day_indicator; at = at + 1;
  wire[at] = expanded_spin_message_record.reserved_2; at = at + 1;
  skip
}

/* Expanded Spin Message off the wire, 85 bytes from where the cursor stands */
inline decode_expanded_spin_message(expanded_spin_message_record) {
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.timestamp[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.symbol_extended[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.bid_price_long[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.bid_quantity_long[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.ask_price_long[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.ask_quantity_long[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> expanded_spin_message_record.last_trade_time[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> expanded_spin_message_record.last_trade_price_short[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> expanded_spin_message_record.last_trade_size[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 9 -> expanded_spin_message_record.cumulative_volume_long[expanded_spin_message_at] = wire[at]; at = at + 1; expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_record.halt_status = wire[at]; at = at + 1;
  expanded_spin_message_record.reg_s_h_o_action = wire[at]; at = at + 1;
  expanded_spin_message_record.last_trade_day_indicator = wire[at]; at = at + 1;
  expanded_spin_message_record.reserved_2 = wire[at]; at = at + 1;
  skip
}

/* what was read of Expanded Spin Message is what was written, byte for byte */
inline equal_expanded_spin_message(expanded_spin_message_read, expanded_spin_message_written) {
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> assert(expanded_spin_message_read.timestamp[expanded_spin_message_at] == expanded_spin_message_written.timestamp[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> assert(expanded_spin_message_read.symbol_extended[expanded_spin_message_at] == expanded_spin_message_written.symbol_extended[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> assert(expanded_spin_message_read.bid_price_long[expanded_spin_message_at] == expanded_spin_message_written.bid_price_long[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> assert(expanded_spin_message_read.bid_quantity_long[expanded_spin_message_at] == expanded_spin_message_written.bid_quantity_long[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> assert(expanded_spin_message_read.ask_price_long[expanded_spin_message_at] == expanded_spin_message_written.ask_price_long[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> assert(expanded_spin_message_read.ask_quantity_long[expanded_spin_message_at] == expanded_spin_message_written.ask_quantity_long[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 8 -> assert(expanded_spin_message_read.last_trade_time[expanded_spin_message_at] == expanded_spin_message_written.last_trade_time[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 10 -> assert(expanded_spin_message_read.last_trade_price_short[expanded_spin_message_at] == expanded_spin_message_written.last_trade_price_short[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 6 -> assert(expanded_spin_message_read.last_trade_size[expanded_spin_message_at] == expanded_spin_message_written.last_trade_size[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  expanded_spin_message_at = 0;
  do
  :: expanded_spin_message_at < 9 -> assert(expanded_spin_message_read.cumulative_volume_long[expanded_spin_message_at] == expanded_spin_message_written.cumulative_volume_long[expanded_spin_message_at]); expanded_spin_message_at = expanded_spin_message_at + 1
  :: else -> break
  od;
  assert(expanded_spin_message_read.halt_status == expanded_spin_message_written.halt_status);
  assert(expanded_spin_message_read.reg_s_h_o_action == expanded_spin_message_written.reg_s_h_o_action);
  assert(expanded_spin_message_read.last_trade_day_indicator == expanded_spin_message_written.last_trade_day_indicator);
  assert(expanded_spin_message_read.reserved_2 == expanded_spin_message_written.reserved_2);
  skip
}

/* ---- Extended Spin Message: 97 bytes ----------------------------------------- */

/* Extended Spin Message */
typedef ExtendedSpinMessage {
  byte timestamp[8];
  byte symbol_extended[8];
  byte bid_price_extended[14];
  byte bid_quantity_long[6];
  byte ask_price_extended[14];
  byte ask_quantity_long[6];
  byte last_trade_time[8];
  byte last_trade_price_long[14];
  byte last_trade_size[6];
  byte cumulative_volume_long[9];
  byte halt_status;
  byte reg_s_h_o_action;
  byte last_trade_day_indicator;
  byte reserved_2
};

int extended_spin_message_at;

/* every byte of Extended Spin Message set to one value */
inline fill_extended_spin_message(extended_spin_message_record, extended_spin_message_value) {
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.timestamp[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.symbol_extended[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.bid_price_extended[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.bid_quantity_long[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.ask_price_extended[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.ask_quantity_long[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.last_trade_time[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.last_trade_price_long[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.last_trade_size[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 9 -> extended_spin_message_record.cumulative_volume_long[extended_spin_message_at] = extended_spin_message_value; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_record.halt_status = extended_spin_message_value;
  extended_spin_message_record.reg_s_h_o_action = extended_spin_message_value;
  extended_spin_message_record.last_trade_day_indicator = extended_spin_message_value;
  extended_spin_message_record.reserved_2 = extended_spin_message_value;
  skip
}

/* each byte of Extended Spin Message set to where it lies, so a field read out of place says so */
inline ramp_extended_spin_message(extended_spin_message_record, extended_spin_message_base) {
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.timestamp[extended_spin_message_at] = (extended_spin_message_base + 0 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.symbol_extended[extended_spin_message_at] = (extended_spin_message_base + 8 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.bid_price_extended[extended_spin_message_at] = (extended_spin_message_base + 16 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.bid_quantity_long[extended_spin_message_at] = (extended_spin_message_base + 30 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.ask_price_extended[extended_spin_message_at] = (extended_spin_message_base + 36 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.ask_quantity_long[extended_spin_message_at] = (extended_spin_message_base + 50 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.last_trade_time[extended_spin_message_at] = (extended_spin_message_base + 56 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.last_trade_price_long[extended_spin_message_at] = (extended_spin_message_base + 64 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.last_trade_size[extended_spin_message_at] = (extended_spin_message_base + 78 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 9 -> extended_spin_message_record.cumulative_volume_long[extended_spin_message_at] = (extended_spin_message_base + 84 + extended_spin_message_at + 1) % 256; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_record.halt_status = (extended_spin_message_base + 93 + 1) % 256;
  extended_spin_message_record.reg_s_h_o_action = (extended_spin_message_base + 94 + 1) % 256;
  extended_spin_message_record.last_trade_day_indicator = (extended_spin_message_base + 95 + 1) % 256;
  extended_spin_message_record.reserved_2 = (extended_spin_message_base + 96 + 1) % 256;
  skip
}

/* Extended Spin Message to the wire, 97 bytes from where the cursor stands */
inline encode_extended_spin_message(extended_spin_message_record) {
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> wire[at] = extended_spin_message_record.timestamp[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> wire[at] = extended_spin_message_record.symbol_extended[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> wire[at] = extended_spin_message_record.bid_price_extended[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> wire[at] = extended_spin_message_record.bid_quantity_long[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> wire[at] = extended_spin_message_record.ask_price_extended[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> wire[at] = extended_spin_message_record.ask_quantity_long[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> wire[at] = extended_spin_message_record.last_trade_time[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> wire[at] = extended_spin_message_record.last_trade_price_long[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> wire[at] = extended_spin_message_record.last_trade_size[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 9 -> wire[at] = extended_spin_message_record.cumulative_volume_long[extended_spin_message_at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_spin_message_record.halt_status; at = at + 1;
  wire[at] = extended_spin_message_record.reg_s_h_o_action; at = at + 1;
  wire[at] = extended_spin_message_record.last_trade_day_indicator; at = at + 1;
  wire[at] = extended_spin_message_record.reserved_2; at = at + 1;
  skip
}

/* Extended Spin Message off the wire, 97 bytes from where the cursor stands */
inline decode_extended_spin_message(extended_spin_message_record) {
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.timestamp[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.symbol_extended[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.bid_price_extended[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.bid_quantity_long[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.ask_price_extended[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.ask_quantity_long[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> extended_spin_message_record.last_trade_time[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> extended_spin_message_record.last_trade_price_long[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> extended_spin_message_record.last_trade_size[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 9 -> extended_spin_message_record.cumulative_volume_long[extended_spin_message_at] = wire[at]; at = at + 1; extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_record.halt_status = wire[at]; at = at + 1;
  extended_spin_message_record.reg_s_h_o_action = wire[at]; at = at + 1;
  extended_spin_message_record.last_trade_day_indicator = wire[at]; at = at + 1;
  extended_spin_message_record.reserved_2 = wire[at]; at = at + 1;
  skip
}

/* what was read of Extended Spin Message is what was written, byte for byte */
inline equal_extended_spin_message(extended_spin_message_read, extended_spin_message_written) {
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> assert(extended_spin_message_read.timestamp[extended_spin_message_at] == extended_spin_message_written.timestamp[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> assert(extended_spin_message_read.symbol_extended[extended_spin_message_at] == extended_spin_message_written.symbol_extended[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> assert(extended_spin_message_read.bid_price_extended[extended_spin_message_at] == extended_spin_message_written.bid_price_extended[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> assert(extended_spin_message_read.bid_quantity_long[extended_spin_message_at] == extended_spin_message_written.bid_quantity_long[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> assert(extended_spin_message_read.ask_price_extended[extended_spin_message_at] == extended_spin_message_written.ask_price_extended[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> assert(extended_spin_message_read.ask_quantity_long[extended_spin_message_at] == extended_spin_message_written.ask_quantity_long[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 8 -> assert(extended_spin_message_read.last_trade_time[extended_spin_message_at] == extended_spin_message_written.last_trade_time[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 14 -> assert(extended_spin_message_read.last_trade_price_long[extended_spin_message_at] == extended_spin_message_written.last_trade_price_long[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 6 -> assert(extended_spin_message_read.last_trade_size[extended_spin_message_at] == extended_spin_message_written.last_trade_size[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  extended_spin_message_at = 0;
  do
  :: extended_spin_message_at < 9 -> assert(extended_spin_message_read.cumulative_volume_long[extended_spin_message_at] == extended_spin_message_written.cumulative_volume_long[extended_spin_message_at]); extended_spin_message_at = extended_spin_message_at + 1
  :: else -> break
  od;
  assert(extended_spin_message_read.halt_status == extended_spin_message_written.halt_status);
  assert(extended_spin_message_read.reg_s_h_o_action == extended_spin_message_written.reg_s_h_o_action);
  assert(extended_spin_message_read.last_trade_day_indicator == extended_spin_message_written.last_trade_day_indicator);
  assert(extended_spin_message_read.reserved_2 == extended_spin_message_written.reserved_2);
  skip
}

/* ---- Time Reference Message: 36 bytes ---------------------------------------- */

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Timestamp values will use the last Midnight Reference until another Time Reference message is received. The Timestamp field will contain the offset from the Trade Date of the Time Reference message. */
typedef TimeReferenceMessage {
  byte timestamp[8];
  byte midnight_reference[10];
  byte time[10];
  byte trade_date[8]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.timestamp[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.midnight_reference[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.time[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.trade_date[time_reference_message_at] = time_reference_message_value; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Time Reference Message set to where it lies, so a field read out of place says so */
inline ramp_time_reference_message(time_reference_message_record, time_reference_message_base) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.timestamp[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.midnight_reference[time_reference_message_at] = (time_reference_message_base + 8 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.time[time_reference_message_at] = (time_reference_message_base + 18 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.trade_date[time_reference_message_at] = (time_reference_message_base + 28 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 36 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> wire[at] = time_reference_message_record.timestamp[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> wire[at] = time_reference_message_record.midnight_reference[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> wire[at] = time_reference_message_record.time[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> wire[at] = time_reference_message_record.trade_date[time_reference_message_at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message off the wire, 36 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.timestamp[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.midnight_reference[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.time[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.trade_date[time_reference_message_at] = wire[at]; at = at + 1; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Time Reference Message is what was written, byte for byte */
inline equal_time_reference_message(time_reference_message_read, time_reference_message_written) {
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> assert(time_reference_message_read.timestamp[time_reference_message_at] == time_reference_message_written.timestamp[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> assert(time_reference_message_read.midnight_reference[time_reference_message_at] == time_reference_message_written.midnight_reference[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> assert(time_reference_message_read.time[time_reference_message_at] == time_reference_message_written.time[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> assert(time_reference_message_read.trade_date[time_reference_message_at] == time_reference_message_written.trade_date[time_reference_message_at]); time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Bid Update Message: 24 bytes ----------------------------------- */

/* Expanded Bid Update Message */
typedef ExpandedBidUpdateMessage {
  byte symbol_extended[8];
  byte bid_price_long[10];
  byte bid_quantity_long[6]
};

int expanded_bid_update_message_at;

/* every byte of Expanded Bid Update Message set to one value */
inline fill_expanded_bid_update_message(expanded_bid_update_message_record, expanded_bid_update_message_value) {
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 8 -> expanded_bid_update_message_record.symbol_extended[expanded_bid_update_message_at] = expanded_bid_update_message_value; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 10 -> expanded_bid_update_message_record.bid_price_long[expanded_bid_update_message_at] = expanded_bid_update_message_value; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 6 -> expanded_bid_update_message_record.bid_quantity_long[expanded_bid_update_message_at] = expanded_bid_update_message_value; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_bid_update_message(expanded_bid_update_message_record, expanded_bid_update_message_base) {
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 8 -> expanded_bid_update_message_record.symbol_extended[expanded_bid_update_message_at] = (expanded_bid_update_message_base + 0 + expanded_bid_update_message_at + 1) % 256; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 10 -> expanded_bid_update_message_record.bid_price_long[expanded_bid_update_message_at] = (expanded_bid_update_message_base + 8 + expanded_bid_update_message_at + 1) % 256; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 6 -> expanded_bid_update_message_record.bid_quantity_long[expanded_bid_update_message_at] = (expanded_bid_update_message_base + 18 + expanded_bid_update_message_at + 1) % 256; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Bid Update Message to the wire, 24 bytes from where the cursor stands */
inline encode_expanded_bid_update_message(expanded_bid_update_message_record) {
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 8 -> wire[at] = expanded_bid_update_message_record.symbol_extended[expanded_bid_update_message_at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 10 -> wire[at] = expanded_bid_update_message_record.bid_price_long[expanded_bid_update_message_at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 6 -> wire[at] = expanded_bid_update_message_record.bid_quantity_long[expanded_bid_update_message_at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Bid Update Message off the wire, 24 bytes from where the cursor stands */
inline decode_expanded_bid_update_message(expanded_bid_update_message_record) {
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 8 -> expanded_bid_update_message_record.symbol_extended[expanded_bid_update_message_at] = wire[at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 10 -> expanded_bid_update_message_record.bid_price_long[expanded_bid_update_message_at] = wire[at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 6 -> expanded_bid_update_message_record.bid_quantity_long[expanded_bid_update_message_at] = wire[at]; at = at + 1; expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Bid Update Message is what was written, byte for byte */
inline equal_expanded_bid_update_message(expanded_bid_update_message_read, expanded_bid_update_message_written) {
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 8 -> assert(expanded_bid_update_message_read.symbol_extended[expanded_bid_update_message_at] == expanded_bid_update_message_written.symbol_extended[expanded_bid_update_message_at]); expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 10 -> assert(expanded_bid_update_message_read.bid_price_long[expanded_bid_update_message_at] == expanded_bid_update_message_written.bid_price_long[expanded_bid_update_message_at]); expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  expanded_bid_update_message_at = 0;
  do
  :: expanded_bid_update_message_at < 6 -> assert(expanded_bid_update_message_read.bid_quantity_long[expanded_bid_update_message_at] == expanded_bid_update_message_written.bid_quantity_long[expanded_bid_update_message_at]); expanded_bid_update_message_at = expanded_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Bid Update Message: 22 bytes --------------------------------------- */

/* Long Bid Update Message */
typedef LongBidUpdateMessage {
  byte symbol_long[6];
  byte bid_price_long[10];
  byte bid_quantity_long[6]
};

int long_bid_update_message_at;

/* every byte of Long Bid Update Message set to one value */
inline fill_long_bid_update_message(long_bid_update_message_record, long_bid_update_message_value) {
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.symbol_long[long_bid_update_message_at] = long_bid_update_message_value; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 10 -> long_bid_update_message_record.bid_price_long[long_bid_update_message_at] = long_bid_update_message_value; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.bid_quantity_long[long_bid_update_message_at] = long_bid_update_message_value; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_bid_update_message(long_bid_update_message_record, long_bid_update_message_base) {
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.symbol_long[long_bid_update_message_at] = (long_bid_update_message_base + 0 + long_bid_update_message_at + 1) % 256; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 10 -> long_bid_update_message_record.bid_price_long[long_bid_update_message_at] = (long_bid_update_message_base + 6 + long_bid_update_message_at + 1) % 256; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.bid_quantity_long[long_bid_update_message_at] = (long_bid_update_message_base + 16 + long_bid_update_message_at + 1) % 256; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Bid Update Message to the wire, 22 bytes from where the cursor stands */
inline encode_long_bid_update_message(long_bid_update_message_record) {
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> wire[at] = long_bid_update_message_record.symbol_long[long_bid_update_message_at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 10 -> wire[at] = long_bid_update_message_record.bid_price_long[long_bid_update_message_at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> wire[at] = long_bid_update_message_record.bid_quantity_long[long_bid_update_message_at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Bid Update Message off the wire, 22 bytes from where the cursor stands */
inline decode_long_bid_update_message(long_bid_update_message_record) {
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.symbol_long[long_bid_update_message_at] = wire[at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 10 -> long_bid_update_message_record.bid_price_long[long_bid_update_message_at] = wire[at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> long_bid_update_message_record.bid_quantity_long[long_bid_update_message_at] = wire[at]; at = at + 1; long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Bid Update Message is what was written, byte for byte */
inline equal_long_bid_update_message(long_bid_update_message_read, long_bid_update_message_written) {
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> assert(long_bid_update_message_read.symbol_long[long_bid_update_message_at] == long_bid_update_message_written.symbol_long[long_bid_update_message_at]); long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 10 -> assert(long_bid_update_message_read.bid_price_long[long_bid_update_message_at] == long_bid_update_message_written.bid_price_long[long_bid_update_message_at]); long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  long_bid_update_message_at = 0;
  do
  :: long_bid_update_message_at < 6 -> assert(long_bid_update_message_read.bid_quantity_long[long_bid_update_message_at] == long_bid_update_message_written.bid_quantity_long[long_bid_update_message_at]); long_bid_update_message_at = long_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Bid Update Message: 14 bytes -------------------------------------- */

/* Short Bid Update Message */
typedef ShortBidUpdateMessage {
  byte symbol_short[4];
  byte bid_price_short[5];
  byte bid_quantity_short[5]
};

int short_bid_update_message_at;

/* every byte of Short Bid Update Message set to one value */
inline fill_short_bid_update_message(short_bid_update_message_record, short_bid_update_message_value) {
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 4 -> short_bid_update_message_record.symbol_short[short_bid_update_message_at] = short_bid_update_message_value; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_price_short[short_bid_update_message_at] = short_bid_update_message_value; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_quantity_short[short_bid_update_message_at] = short_bid_update_message_value; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_bid_update_message(short_bid_update_message_record, short_bid_update_message_base) {
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 4 -> short_bid_update_message_record.symbol_short[short_bid_update_message_at] = (short_bid_update_message_base + 0 + short_bid_update_message_at + 1) % 256; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_price_short[short_bid_update_message_at] = (short_bid_update_message_base + 4 + short_bid_update_message_at + 1) % 256; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_quantity_short[short_bid_update_message_at] = (short_bid_update_message_base + 9 + short_bid_update_message_at + 1) % 256; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Bid Update Message to the wire, 14 bytes from where the cursor stands */
inline encode_short_bid_update_message(short_bid_update_message_record) {
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 4 -> wire[at] = short_bid_update_message_record.symbol_short[short_bid_update_message_at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> wire[at] = short_bid_update_message_record.bid_price_short[short_bid_update_message_at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> wire[at] = short_bid_update_message_record.bid_quantity_short[short_bid_update_message_at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Bid Update Message off the wire, 14 bytes from where the cursor stands */
inline decode_short_bid_update_message(short_bid_update_message_record) {
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 4 -> short_bid_update_message_record.symbol_short[short_bid_update_message_at] = wire[at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_price_short[short_bid_update_message_at] = wire[at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> short_bid_update_message_record.bid_quantity_short[short_bid_update_message_at] = wire[at]; at = at + 1; short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Bid Update Message is what was written, byte for byte */
inline equal_short_bid_update_message(short_bid_update_message_read, short_bid_update_message_written) {
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 4 -> assert(short_bid_update_message_read.symbol_short[short_bid_update_message_at] == short_bid_update_message_written.symbol_short[short_bid_update_message_at]); short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> assert(short_bid_update_message_read.bid_price_short[short_bid_update_message_at] == short_bid_update_message_written.bid_price_short[short_bid_update_message_at]); short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  short_bid_update_message_at = 0;
  do
  :: short_bid_update_message_at < 5 -> assert(short_bid_update_message_read.bid_quantity_short[short_bid_update_message_at] == short_bid_update_message_written.bid_quantity_short[short_bid_update_message_at]); short_bid_update_message_at = short_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Bid Update Message: 28 bytes ----------------------------------- */

/* Extended Bid Update Message */
typedef ExtendedBidUpdateMessage {
  byte symbol_extended[8];
  byte bid_price_extended[14];
  byte bid_quantity_long[6]
};

int extended_bid_update_message_at;

/* every byte of Extended Bid Update Message set to one value */
inline fill_extended_bid_update_message(extended_bid_update_message_record, extended_bid_update_message_value) {
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 8 -> extended_bid_update_message_record.symbol_extended[extended_bid_update_message_at] = extended_bid_update_message_value; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 14 -> extended_bid_update_message_record.bid_price_extended[extended_bid_update_message_at] = extended_bid_update_message_value; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 6 -> extended_bid_update_message_record.bid_quantity_long[extended_bid_update_message_at] = extended_bid_update_message_value; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Bid Update Message set to where it lies, so a field read out of place says so */
inline ramp_extended_bid_update_message(extended_bid_update_message_record, extended_bid_update_message_base) {
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 8 -> extended_bid_update_message_record.symbol_extended[extended_bid_update_message_at] = (extended_bid_update_message_base + 0 + extended_bid_update_message_at + 1) % 256; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 14 -> extended_bid_update_message_record.bid_price_extended[extended_bid_update_message_at] = (extended_bid_update_message_base + 8 + extended_bid_update_message_at + 1) % 256; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 6 -> extended_bid_update_message_record.bid_quantity_long[extended_bid_update_message_at] = (extended_bid_update_message_base + 22 + extended_bid_update_message_at + 1) % 256; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Bid Update Message to the wire, 28 bytes from where the cursor stands */
inline encode_extended_bid_update_message(extended_bid_update_message_record) {
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 8 -> wire[at] = extended_bid_update_message_record.symbol_extended[extended_bid_update_message_at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 14 -> wire[at] = extended_bid_update_message_record.bid_price_extended[extended_bid_update_message_at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 6 -> wire[at] = extended_bid_update_message_record.bid_quantity_long[extended_bid_update_message_at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Bid Update Message off the wire, 28 bytes from where the cursor stands */
inline decode_extended_bid_update_message(extended_bid_update_message_record) {
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 8 -> extended_bid_update_message_record.symbol_extended[extended_bid_update_message_at] = wire[at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 14 -> extended_bid_update_message_record.bid_price_extended[extended_bid_update_message_at] = wire[at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 6 -> extended_bid_update_message_record.bid_quantity_long[extended_bid_update_message_at] = wire[at]; at = at + 1; extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Bid Update Message is what was written, byte for byte */
inline equal_extended_bid_update_message(extended_bid_update_message_read, extended_bid_update_message_written) {
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 8 -> assert(extended_bid_update_message_read.symbol_extended[extended_bid_update_message_at] == extended_bid_update_message_written.symbol_extended[extended_bid_update_message_at]); extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 14 -> assert(extended_bid_update_message_read.bid_price_extended[extended_bid_update_message_at] == extended_bid_update_message_written.bid_price_extended[extended_bid_update_message_at]); extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  extended_bid_update_message_at = 0;
  do
  :: extended_bid_update_message_at < 6 -> assert(extended_bid_update_message_read.bid_quantity_long[extended_bid_update_message_at] == extended_bid_update_message_written.bid_quantity_long[extended_bid_update_message_at]); extended_bid_update_message_at = extended_bid_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Ask Update Message: 24 bytes ----------------------------------- */

/* Expanded Ask Update Message */
typedef ExpandedAskUpdateMessage {
  byte symbol_extended[8];
  byte ask_price_long[10];
  byte ask_quantity_long[6]
};

int expanded_ask_update_message_at;

/* every byte of Expanded Ask Update Message set to one value */
inline fill_expanded_ask_update_message(expanded_ask_update_message_record, expanded_ask_update_message_value) {
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 8 -> expanded_ask_update_message_record.symbol_extended[expanded_ask_update_message_at] = expanded_ask_update_message_value; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 10 -> expanded_ask_update_message_record.ask_price_long[expanded_ask_update_message_at] = expanded_ask_update_message_value; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 6 -> expanded_ask_update_message_record.ask_quantity_long[expanded_ask_update_message_at] = expanded_ask_update_message_value; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_ask_update_message(expanded_ask_update_message_record, expanded_ask_update_message_base) {
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 8 -> expanded_ask_update_message_record.symbol_extended[expanded_ask_update_message_at] = (expanded_ask_update_message_base + 0 + expanded_ask_update_message_at + 1) % 256; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 10 -> expanded_ask_update_message_record.ask_price_long[expanded_ask_update_message_at] = (expanded_ask_update_message_base + 8 + expanded_ask_update_message_at + 1) % 256; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 6 -> expanded_ask_update_message_record.ask_quantity_long[expanded_ask_update_message_at] = (expanded_ask_update_message_base + 18 + expanded_ask_update_message_at + 1) % 256; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Ask Update Message to the wire, 24 bytes from where the cursor stands */
inline encode_expanded_ask_update_message(expanded_ask_update_message_record) {
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 8 -> wire[at] = expanded_ask_update_message_record.symbol_extended[expanded_ask_update_message_at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 10 -> wire[at] = expanded_ask_update_message_record.ask_price_long[expanded_ask_update_message_at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 6 -> wire[at] = expanded_ask_update_message_record.ask_quantity_long[expanded_ask_update_message_at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Ask Update Message off the wire, 24 bytes from where the cursor stands */
inline decode_expanded_ask_update_message(expanded_ask_update_message_record) {
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 8 -> expanded_ask_update_message_record.symbol_extended[expanded_ask_update_message_at] = wire[at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 10 -> expanded_ask_update_message_record.ask_price_long[expanded_ask_update_message_at] = wire[at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 6 -> expanded_ask_update_message_record.ask_quantity_long[expanded_ask_update_message_at] = wire[at]; at = at + 1; expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Ask Update Message is what was written, byte for byte */
inline equal_expanded_ask_update_message(expanded_ask_update_message_read, expanded_ask_update_message_written) {
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 8 -> assert(expanded_ask_update_message_read.symbol_extended[expanded_ask_update_message_at] == expanded_ask_update_message_written.symbol_extended[expanded_ask_update_message_at]); expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 10 -> assert(expanded_ask_update_message_read.ask_price_long[expanded_ask_update_message_at] == expanded_ask_update_message_written.ask_price_long[expanded_ask_update_message_at]); expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  expanded_ask_update_message_at = 0;
  do
  :: expanded_ask_update_message_at < 6 -> assert(expanded_ask_update_message_read.ask_quantity_long[expanded_ask_update_message_at] == expanded_ask_update_message_written.ask_quantity_long[expanded_ask_update_message_at]); expanded_ask_update_message_at = expanded_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Ask Update Message: 22 bytes --------------------------------------- */

/* Long Ask Update Message */
typedef LongAskUpdateMessage {
  byte symbol_long[6];
  byte ask_price_long[10];
  byte ask_quantity_long[6]
};

int long_ask_update_message_at;

/* every byte of Long Ask Update Message set to one value */
inline fill_long_ask_update_message(long_ask_update_message_record, long_ask_update_message_value) {
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.symbol_long[long_ask_update_message_at] = long_ask_update_message_value; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 10 -> long_ask_update_message_record.ask_price_long[long_ask_update_message_at] = long_ask_update_message_value; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.ask_quantity_long[long_ask_update_message_at] = long_ask_update_message_value; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_ask_update_message(long_ask_update_message_record, long_ask_update_message_base) {
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.symbol_long[long_ask_update_message_at] = (long_ask_update_message_base + 0 + long_ask_update_message_at + 1) % 256; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 10 -> long_ask_update_message_record.ask_price_long[long_ask_update_message_at] = (long_ask_update_message_base + 6 + long_ask_update_message_at + 1) % 256; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.ask_quantity_long[long_ask_update_message_at] = (long_ask_update_message_base + 16 + long_ask_update_message_at + 1) % 256; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Ask Update Message to the wire, 22 bytes from where the cursor stands */
inline encode_long_ask_update_message(long_ask_update_message_record) {
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> wire[at] = long_ask_update_message_record.symbol_long[long_ask_update_message_at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 10 -> wire[at] = long_ask_update_message_record.ask_price_long[long_ask_update_message_at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> wire[at] = long_ask_update_message_record.ask_quantity_long[long_ask_update_message_at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Ask Update Message off the wire, 22 bytes from where the cursor stands */
inline decode_long_ask_update_message(long_ask_update_message_record) {
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.symbol_long[long_ask_update_message_at] = wire[at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 10 -> long_ask_update_message_record.ask_price_long[long_ask_update_message_at] = wire[at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> long_ask_update_message_record.ask_quantity_long[long_ask_update_message_at] = wire[at]; at = at + 1; long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Ask Update Message is what was written, byte for byte */
inline equal_long_ask_update_message(long_ask_update_message_read, long_ask_update_message_written) {
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> assert(long_ask_update_message_read.symbol_long[long_ask_update_message_at] == long_ask_update_message_written.symbol_long[long_ask_update_message_at]); long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 10 -> assert(long_ask_update_message_read.ask_price_long[long_ask_update_message_at] == long_ask_update_message_written.ask_price_long[long_ask_update_message_at]); long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  long_ask_update_message_at = 0;
  do
  :: long_ask_update_message_at < 6 -> assert(long_ask_update_message_read.ask_quantity_long[long_ask_update_message_at] == long_ask_update_message_written.ask_quantity_long[long_ask_update_message_at]); long_ask_update_message_at = long_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Ask Update Message: 14 bytes -------------------------------------- */

/* Short Ask Update Message */
typedef ShortAskUpdateMessage {
  byte symbol_short[4];
  byte ask_price_short[5];
  byte ask_quantity_short[5]
};

int short_ask_update_message_at;

/* every byte of Short Ask Update Message set to one value */
inline fill_short_ask_update_message(short_ask_update_message_record, short_ask_update_message_value) {
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 4 -> short_ask_update_message_record.symbol_short[short_ask_update_message_at] = short_ask_update_message_value; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_price_short[short_ask_update_message_at] = short_ask_update_message_value; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_quantity_short[short_ask_update_message_at] = short_ask_update_message_value; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_ask_update_message(short_ask_update_message_record, short_ask_update_message_base) {
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 4 -> short_ask_update_message_record.symbol_short[short_ask_update_message_at] = (short_ask_update_message_base + 0 + short_ask_update_message_at + 1) % 256; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_price_short[short_ask_update_message_at] = (short_ask_update_message_base + 4 + short_ask_update_message_at + 1) % 256; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_quantity_short[short_ask_update_message_at] = (short_ask_update_message_base + 9 + short_ask_update_message_at + 1) % 256; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Ask Update Message to the wire, 14 bytes from where the cursor stands */
inline encode_short_ask_update_message(short_ask_update_message_record) {
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 4 -> wire[at] = short_ask_update_message_record.symbol_short[short_ask_update_message_at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> wire[at] = short_ask_update_message_record.ask_price_short[short_ask_update_message_at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> wire[at] = short_ask_update_message_record.ask_quantity_short[short_ask_update_message_at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Ask Update Message off the wire, 14 bytes from where the cursor stands */
inline decode_short_ask_update_message(short_ask_update_message_record) {
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 4 -> short_ask_update_message_record.symbol_short[short_ask_update_message_at] = wire[at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_price_short[short_ask_update_message_at] = wire[at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> short_ask_update_message_record.ask_quantity_short[short_ask_update_message_at] = wire[at]; at = at + 1; short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Ask Update Message is what was written, byte for byte */
inline equal_short_ask_update_message(short_ask_update_message_read, short_ask_update_message_written) {
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 4 -> assert(short_ask_update_message_read.symbol_short[short_ask_update_message_at] == short_ask_update_message_written.symbol_short[short_ask_update_message_at]); short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> assert(short_ask_update_message_read.ask_price_short[short_ask_update_message_at] == short_ask_update_message_written.ask_price_short[short_ask_update_message_at]); short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  short_ask_update_message_at = 0;
  do
  :: short_ask_update_message_at < 5 -> assert(short_ask_update_message_read.ask_quantity_short[short_ask_update_message_at] == short_ask_update_message_written.ask_quantity_short[short_ask_update_message_at]); short_ask_update_message_at = short_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Ask Update Message: 28 bytes ----------------------------------- */

/* Extended Ask Update Message */
typedef ExtendedAskUpdateMessage {
  byte symbol_extended[8];
  byte ask_price_extended[14];
  byte ask_quantity_long[6]
};

int extended_ask_update_message_at;

/* every byte of Extended Ask Update Message set to one value */
inline fill_extended_ask_update_message(extended_ask_update_message_record, extended_ask_update_message_value) {
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 8 -> extended_ask_update_message_record.symbol_extended[extended_ask_update_message_at] = extended_ask_update_message_value; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 14 -> extended_ask_update_message_record.ask_price_extended[extended_ask_update_message_at] = extended_ask_update_message_value; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 6 -> extended_ask_update_message_record.ask_quantity_long[extended_ask_update_message_at] = extended_ask_update_message_value; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Ask Update Message set to where it lies, so a field read out of place says so */
inline ramp_extended_ask_update_message(extended_ask_update_message_record, extended_ask_update_message_base) {
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 8 -> extended_ask_update_message_record.symbol_extended[extended_ask_update_message_at] = (extended_ask_update_message_base + 0 + extended_ask_update_message_at + 1) % 256; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 14 -> extended_ask_update_message_record.ask_price_extended[extended_ask_update_message_at] = (extended_ask_update_message_base + 8 + extended_ask_update_message_at + 1) % 256; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 6 -> extended_ask_update_message_record.ask_quantity_long[extended_ask_update_message_at] = (extended_ask_update_message_base + 22 + extended_ask_update_message_at + 1) % 256; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Ask Update Message to the wire, 28 bytes from where the cursor stands */
inline encode_extended_ask_update_message(extended_ask_update_message_record) {
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 8 -> wire[at] = extended_ask_update_message_record.symbol_extended[extended_ask_update_message_at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 14 -> wire[at] = extended_ask_update_message_record.ask_price_extended[extended_ask_update_message_at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 6 -> wire[at] = extended_ask_update_message_record.ask_quantity_long[extended_ask_update_message_at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Ask Update Message off the wire, 28 bytes from where the cursor stands */
inline decode_extended_ask_update_message(extended_ask_update_message_record) {
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 8 -> extended_ask_update_message_record.symbol_extended[extended_ask_update_message_at] = wire[at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 14 -> extended_ask_update_message_record.ask_price_extended[extended_ask_update_message_at] = wire[at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 6 -> extended_ask_update_message_record.ask_quantity_long[extended_ask_update_message_at] = wire[at]; at = at + 1; extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Ask Update Message is what was written, byte for byte */
inline equal_extended_ask_update_message(extended_ask_update_message_read, extended_ask_update_message_written) {
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 8 -> assert(extended_ask_update_message_read.symbol_extended[extended_ask_update_message_at] == extended_ask_update_message_written.symbol_extended[extended_ask_update_message_at]); extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 14 -> assert(extended_ask_update_message_read.ask_price_extended[extended_ask_update_message_at] == extended_ask_update_message_written.ask_price_extended[extended_ask_update_message_at]); extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  extended_ask_update_message_at = 0;
  do
  :: extended_ask_update_message_at < 6 -> assert(extended_ask_update_message_read.ask_quantity_long[extended_ask_update_message_at] == extended_ask_update_message_written.ask_quantity_long[extended_ask_update_message_at]); extended_ask_update_message_at = extended_ask_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Two Sided Update Message: 40 bytes ----------------------------- */

/* Expanded Two-Sided Update Message */
typedef ExpandedTwoSidedUpdateMessage {
  byte symbol_extended[8];
  byte bid_price_long[10];
  byte bid_quantity_long[6];
  byte ask_price_long[10];
  byte ask_quantity_long[6]
};

int expanded_two_sided_update_message_at;

/* every byte of Expanded Two Sided Update Message set to one value */
inline fill_expanded_two_sided_update_message(expanded_two_sided_update_message_record, expanded_two_sided_update_message_value) {
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 8 -> expanded_two_sided_update_message_record.symbol_extended[expanded_two_sided_update_message_at] = expanded_two_sided_update_message_value; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.bid_price_long[expanded_two_sided_update_message_at] = expanded_two_sided_update_message_value; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.bid_quantity_long[expanded_two_sided_update_message_at] = expanded_two_sided_update_message_value; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.ask_price_long[expanded_two_sided_update_message_at] = expanded_two_sided_update_message_value; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.ask_quantity_long[expanded_two_sided_update_message_at] = expanded_two_sided_update_message_value; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Two Sided Update Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_two_sided_update_message(expanded_two_sided_update_message_record, expanded_two_sided_update_message_base) {
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 8 -> expanded_two_sided_update_message_record.symbol_extended[expanded_two_sided_update_message_at] = (expanded_two_sided_update_message_base + 0 + expanded_two_sided_update_message_at + 1) % 256; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.bid_price_long[expanded_two_sided_update_message_at] = (expanded_two_sided_update_message_base + 8 + expanded_two_sided_update_message_at + 1) % 256; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.bid_quantity_long[expanded_two_sided_update_message_at] = (expanded_two_sided_update_message_base + 18 + expanded_two_sided_update_message_at + 1) % 256; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.ask_price_long[expanded_two_sided_update_message_at] = (expanded_two_sided_update_message_base + 24 + expanded_two_sided_update_message_at + 1) % 256; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.ask_quantity_long[expanded_two_sided_update_message_at] = (expanded_two_sided_update_message_base + 34 + expanded_two_sided_update_message_at + 1) % 256; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Two Sided Update Message to the wire, 40 bytes from where the cursor stands */
inline encode_expanded_two_sided_update_message(expanded_two_sided_update_message_record) {
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 8 -> wire[at] = expanded_two_sided_update_message_record.symbol_extended[expanded_two_sided_update_message_at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> wire[at] = expanded_two_sided_update_message_record.bid_price_long[expanded_two_sided_update_message_at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> wire[at] = expanded_two_sided_update_message_record.bid_quantity_long[expanded_two_sided_update_message_at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> wire[at] = expanded_two_sided_update_message_record.ask_price_long[expanded_two_sided_update_message_at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> wire[at] = expanded_two_sided_update_message_record.ask_quantity_long[expanded_two_sided_update_message_at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Two Sided Update Message off the wire, 40 bytes from where the cursor stands */
inline decode_expanded_two_sided_update_message(expanded_two_sided_update_message_record) {
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 8 -> expanded_two_sided_update_message_record.symbol_extended[expanded_two_sided_update_message_at] = wire[at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.bid_price_long[expanded_two_sided_update_message_at] = wire[at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.bid_quantity_long[expanded_two_sided_update_message_at] = wire[at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> expanded_two_sided_update_message_record.ask_price_long[expanded_two_sided_update_message_at] = wire[at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> expanded_two_sided_update_message_record.ask_quantity_long[expanded_two_sided_update_message_at] = wire[at]; at = at + 1; expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Two Sided Update Message is what was written, byte for byte */
inline equal_expanded_two_sided_update_message(expanded_two_sided_update_message_read, expanded_two_sided_update_message_written) {
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 8 -> assert(expanded_two_sided_update_message_read.symbol_extended[expanded_two_sided_update_message_at] == expanded_two_sided_update_message_written.symbol_extended[expanded_two_sided_update_message_at]); expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> assert(expanded_two_sided_update_message_read.bid_price_long[expanded_two_sided_update_message_at] == expanded_two_sided_update_message_written.bid_price_long[expanded_two_sided_update_message_at]); expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> assert(expanded_two_sided_update_message_read.bid_quantity_long[expanded_two_sided_update_message_at] == expanded_two_sided_update_message_written.bid_quantity_long[expanded_two_sided_update_message_at]); expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 10 -> assert(expanded_two_sided_update_message_read.ask_price_long[expanded_two_sided_update_message_at] == expanded_two_sided_update_message_written.ask_price_long[expanded_two_sided_update_message_at]); expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  expanded_two_sided_update_message_at = 0;
  do
  :: expanded_two_sided_update_message_at < 6 -> assert(expanded_two_sided_update_message_read.ask_quantity_long[expanded_two_sided_update_message_at] == expanded_two_sided_update_message_written.ask_quantity_long[expanded_two_sided_update_message_at]); expanded_two_sided_update_message_at = expanded_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Two Sided Update Message: 38 bytes --------------------------------- */

/* Long Two-Sided Update Message */
typedef LongTwoSidedUpdateMessage {
  byte symbol_long[6];
  byte bid_price_long[10];
  byte bid_quantity_long[6];
  byte ask_price_long[10];
  byte ask_quantity_long[6]
};

int long_two_sided_update_message_at;

/* every byte of Long Two Sided Update Message set to one value */
inline fill_long_two_sided_update_message(long_two_sided_update_message_record, long_two_sided_update_message_value) {
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.symbol_long[long_two_sided_update_message_at] = long_two_sided_update_message_value; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.bid_price_long[long_two_sided_update_message_at] = long_two_sided_update_message_value; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.bid_quantity_long[long_two_sided_update_message_at] = long_two_sided_update_message_value; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.ask_price_long[long_two_sided_update_message_at] = long_two_sided_update_message_value; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.ask_quantity_long[long_two_sided_update_message_at] = long_two_sided_update_message_value; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Two Sided Update Message set to where it lies, so a field read out of place says so */
inline ramp_long_two_sided_update_message(long_two_sided_update_message_record, long_two_sided_update_message_base) {
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.symbol_long[long_two_sided_update_message_at] = (long_two_sided_update_message_base + 0 + long_two_sided_update_message_at + 1) % 256; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.bid_price_long[long_two_sided_update_message_at] = (long_two_sided_update_message_base + 6 + long_two_sided_update_message_at + 1) % 256; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.bid_quantity_long[long_two_sided_update_message_at] = (long_two_sided_update_message_base + 16 + long_two_sided_update_message_at + 1) % 256; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.ask_price_long[long_two_sided_update_message_at] = (long_two_sided_update_message_base + 22 + long_two_sided_update_message_at + 1) % 256; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.ask_quantity_long[long_two_sided_update_message_at] = (long_two_sided_update_message_base + 32 + long_two_sided_update_message_at + 1) % 256; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Two Sided Update Message to the wire, 38 bytes from where the cursor stands */
inline encode_long_two_sided_update_message(long_two_sided_update_message_record) {
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> wire[at] = long_two_sided_update_message_record.symbol_long[long_two_sided_update_message_at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> wire[at] = long_two_sided_update_message_record.bid_price_long[long_two_sided_update_message_at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> wire[at] = long_two_sided_update_message_record.bid_quantity_long[long_two_sided_update_message_at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> wire[at] = long_two_sided_update_message_record.ask_price_long[long_two_sided_update_message_at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> wire[at] = long_two_sided_update_message_record.ask_quantity_long[long_two_sided_update_message_at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Two Sided Update Message off the wire, 38 bytes from where the cursor stands */
inline decode_long_two_sided_update_message(long_two_sided_update_message_record) {
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.symbol_long[long_two_sided_update_message_at] = wire[at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.bid_price_long[long_two_sided_update_message_at] = wire[at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.bid_quantity_long[long_two_sided_update_message_at] = wire[at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> long_two_sided_update_message_record.ask_price_long[long_two_sided_update_message_at] = wire[at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> long_two_sided_update_message_record.ask_quantity_long[long_two_sided_update_message_at] = wire[at]; at = at + 1; long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Two Sided Update Message is what was written, byte for byte */
inline equal_long_two_sided_update_message(long_two_sided_update_message_read, long_two_sided_update_message_written) {
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> assert(long_two_sided_update_message_read.symbol_long[long_two_sided_update_message_at] == long_two_sided_update_message_written.symbol_long[long_two_sided_update_message_at]); long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> assert(long_two_sided_update_message_read.bid_price_long[long_two_sided_update_message_at] == long_two_sided_update_message_written.bid_price_long[long_two_sided_update_message_at]); long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> assert(long_two_sided_update_message_read.bid_quantity_long[long_two_sided_update_message_at] == long_two_sided_update_message_written.bid_quantity_long[long_two_sided_update_message_at]); long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 10 -> assert(long_two_sided_update_message_read.ask_price_long[long_two_sided_update_message_at] == long_two_sided_update_message_written.ask_price_long[long_two_sided_update_message_at]); long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  long_two_sided_update_message_at = 0;
  do
  :: long_two_sided_update_message_at < 6 -> assert(long_two_sided_update_message_read.ask_quantity_long[long_two_sided_update_message_at] == long_two_sided_update_message_written.ask_quantity_long[long_two_sided_update_message_at]); long_two_sided_update_message_at = long_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Two Sided Update Message: 24 bytes -------------------------------- */

/* Short Two-Sided Update Message */
typedef ShortTwoSidedUpdateMessage {
  byte symbol_short[4];
  byte bid_price_short[5];
  byte bid_quantity_short[5];
  byte ask_price_short[5];
  byte ask_quantity_short[5]
};

int short_two_sided_update_message_at;

/* every byte of Short Two Sided Update Message set to one value */
inline fill_short_two_sided_update_message(short_two_sided_update_message_record, short_two_sided_update_message_value) {
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 4 -> short_two_sided_update_message_record.symbol_short[short_two_sided_update_message_at] = short_two_sided_update_message_value; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_price_short[short_two_sided_update_message_at] = short_two_sided_update_message_value; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_quantity_short[short_two_sided_update_message_at] = short_two_sided_update_message_value; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_price_short[short_two_sided_update_message_at] = short_two_sided_update_message_value; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_quantity_short[short_two_sided_update_message_at] = short_two_sided_update_message_value; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Two Sided Update Message set to where it lies, so a field read out of place says so */
inline ramp_short_two_sided_update_message(short_two_sided_update_message_record, short_two_sided_update_message_base) {
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 4 -> short_two_sided_update_message_record.symbol_short[short_two_sided_update_message_at] = (short_two_sided_update_message_base + 0 + short_two_sided_update_message_at + 1) % 256; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_price_short[short_two_sided_update_message_at] = (short_two_sided_update_message_base + 4 + short_two_sided_update_message_at + 1) % 256; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_quantity_short[short_two_sided_update_message_at] = (short_two_sided_update_message_base + 9 + short_two_sided_update_message_at + 1) % 256; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_price_short[short_two_sided_update_message_at] = (short_two_sided_update_message_base + 14 + short_two_sided_update_message_at + 1) % 256; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_quantity_short[short_two_sided_update_message_at] = (short_two_sided_update_message_base + 19 + short_two_sided_update_message_at + 1) % 256; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Two Sided Update Message to the wire, 24 bytes from where the cursor stands */
inline encode_short_two_sided_update_message(short_two_sided_update_message_record) {
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 4 -> wire[at] = short_two_sided_update_message_record.symbol_short[short_two_sided_update_message_at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> wire[at] = short_two_sided_update_message_record.bid_price_short[short_two_sided_update_message_at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> wire[at] = short_two_sided_update_message_record.bid_quantity_short[short_two_sided_update_message_at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> wire[at] = short_two_sided_update_message_record.ask_price_short[short_two_sided_update_message_at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> wire[at] = short_two_sided_update_message_record.ask_quantity_short[short_two_sided_update_message_at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Two Sided Update Message off the wire, 24 bytes from where the cursor stands */
inline decode_short_two_sided_update_message(short_two_sided_update_message_record) {
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 4 -> short_two_sided_update_message_record.symbol_short[short_two_sided_update_message_at] = wire[at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_price_short[short_two_sided_update_message_at] = wire[at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.bid_quantity_short[short_two_sided_update_message_at] = wire[at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_price_short[short_two_sided_update_message_at] = wire[at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> short_two_sided_update_message_record.ask_quantity_short[short_two_sided_update_message_at] = wire[at]; at = at + 1; short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Two Sided Update Message is what was written, byte for byte */
inline equal_short_two_sided_update_message(short_two_sided_update_message_read, short_two_sided_update_message_written) {
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 4 -> assert(short_two_sided_update_message_read.symbol_short[short_two_sided_update_message_at] == short_two_sided_update_message_written.symbol_short[short_two_sided_update_message_at]); short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> assert(short_two_sided_update_message_read.bid_price_short[short_two_sided_update_message_at] == short_two_sided_update_message_written.bid_price_short[short_two_sided_update_message_at]); short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> assert(short_two_sided_update_message_read.bid_quantity_short[short_two_sided_update_message_at] == short_two_sided_update_message_written.bid_quantity_short[short_two_sided_update_message_at]); short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> assert(short_two_sided_update_message_read.ask_price_short[short_two_sided_update_message_at] == short_two_sided_update_message_written.ask_price_short[short_two_sided_update_message_at]); short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  short_two_sided_update_message_at = 0;
  do
  :: short_two_sided_update_message_at < 5 -> assert(short_two_sided_update_message_read.ask_quantity_short[short_two_sided_update_message_at] == short_two_sided_update_message_written.ask_quantity_short[short_two_sided_update_message_at]); short_two_sided_update_message_at = short_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Two Sided Update Message: 48 bytes ----------------------------- */

/* Extended Two-Sided Update Message */
typedef ExtendedTwoSidedUpdateMessage {
  byte symbol_extended[8];
  byte bid_price_extended[14];
  byte bid_quantity_long[6];
  byte ask_price_extended[14];
  byte ask_quantity_long[6]
};

int extended_two_sided_update_message_at;

/* every byte of Extended Two Sided Update Message set to one value */
inline fill_extended_two_sided_update_message(extended_two_sided_update_message_record, extended_two_sided_update_message_value) {
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 8 -> extended_two_sided_update_message_record.symbol_extended[extended_two_sided_update_message_at] = extended_two_sided_update_message_value; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.bid_price_extended[extended_two_sided_update_message_at] = extended_two_sided_update_message_value; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.bid_quantity_long[extended_two_sided_update_message_at] = extended_two_sided_update_message_value; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.ask_price_extended[extended_two_sided_update_message_at] = extended_two_sided_update_message_value; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.ask_quantity_long[extended_two_sided_update_message_at] = extended_two_sided_update_message_value; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Two Sided Update Message set to where it lies, so a field read out of place says so */
inline ramp_extended_two_sided_update_message(extended_two_sided_update_message_record, extended_two_sided_update_message_base) {
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 8 -> extended_two_sided_update_message_record.symbol_extended[extended_two_sided_update_message_at] = (extended_two_sided_update_message_base + 0 + extended_two_sided_update_message_at + 1) % 256; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.bid_price_extended[extended_two_sided_update_message_at] = (extended_two_sided_update_message_base + 8 + extended_two_sided_update_message_at + 1) % 256; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.bid_quantity_long[extended_two_sided_update_message_at] = (extended_two_sided_update_message_base + 22 + extended_two_sided_update_message_at + 1) % 256; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.ask_price_extended[extended_two_sided_update_message_at] = (extended_two_sided_update_message_base + 28 + extended_two_sided_update_message_at + 1) % 256; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.ask_quantity_long[extended_two_sided_update_message_at] = (extended_two_sided_update_message_base + 42 + extended_two_sided_update_message_at + 1) % 256; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Two Sided Update Message to the wire, 48 bytes from where the cursor stands */
inline encode_extended_two_sided_update_message(extended_two_sided_update_message_record) {
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 8 -> wire[at] = extended_two_sided_update_message_record.symbol_extended[extended_two_sided_update_message_at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> wire[at] = extended_two_sided_update_message_record.bid_price_extended[extended_two_sided_update_message_at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> wire[at] = extended_two_sided_update_message_record.bid_quantity_long[extended_two_sided_update_message_at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> wire[at] = extended_two_sided_update_message_record.ask_price_extended[extended_two_sided_update_message_at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> wire[at] = extended_two_sided_update_message_record.ask_quantity_long[extended_two_sided_update_message_at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Two Sided Update Message off the wire, 48 bytes from where the cursor stands */
inline decode_extended_two_sided_update_message(extended_two_sided_update_message_record) {
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 8 -> extended_two_sided_update_message_record.symbol_extended[extended_two_sided_update_message_at] = wire[at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.bid_price_extended[extended_two_sided_update_message_at] = wire[at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.bid_quantity_long[extended_two_sided_update_message_at] = wire[at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> extended_two_sided_update_message_record.ask_price_extended[extended_two_sided_update_message_at] = wire[at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> extended_two_sided_update_message_record.ask_quantity_long[extended_two_sided_update_message_at] = wire[at]; at = at + 1; extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Two Sided Update Message is what was written, byte for byte */
inline equal_extended_two_sided_update_message(extended_two_sided_update_message_read, extended_two_sided_update_message_written) {
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 8 -> assert(extended_two_sided_update_message_read.symbol_extended[extended_two_sided_update_message_at] == extended_two_sided_update_message_written.symbol_extended[extended_two_sided_update_message_at]); extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> assert(extended_two_sided_update_message_read.bid_price_extended[extended_two_sided_update_message_at] == extended_two_sided_update_message_written.bid_price_extended[extended_two_sided_update_message_at]); extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> assert(extended_two_sided_update_message_read.bid_quantity_long[extended_two_sided_update_message_at] == extended_two_sided_update_message_written.bid_quantity_long[extended_two_sided_update_message_at]); extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 14 -> assert(extended_two_sided_update_message_read.ask_price_extended[extended_two_sided_update_message_at] == extended_two_sided_update_message_written.ask_price_extended[extended_two_sided_update_message_at]); extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  extended_two_sided_update_message_at = 0;
  do
  :: extended_two_sided_update_message_at < 6 -> assert(extended_two_sided_update_message_read.ask_quantity_long[extended_two_sided_update_message_at] == extended_two_sided_update_message_written.ask_quantity_long[extended_two_sided_update_message_at]); extended_two_sided_update_message_at = extended_two_sided_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Expanded Trade Message: 33 bytes ---------------------------------------- */

/* Expanded Trade Message */
typedef ExpandedTradeMessage {
  byte symbol_extended[8];
  byte last_price_long[10];
  byte last_quantity_long[6];
  byte cumulative_volume_long[9]
};

int expanded_trade_message_at;

/* every byte of Expanded Trade Message set to one value */
inline fill_expanded_trade_message(expanded_trade_message_record, expanded_trade_message_value) {
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 8 -> expanded_trade_message_record.symbol_extended[expanded_trade_message_at] = expanded_trade_message_value; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 10 -> expanded_trade_message_record.last_price_long[expanded_trade_message_at] = expanded_trade_message_value; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 6 -> expanded_trade_message_record.last_quantity_long[expanded_trade_message_at] = expanded_trade_message_value; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 9 -> expanded_trade_message_record.cumulative_volume_long[expanded_trade_message_at] = expanded_trade_message_value; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Expanded Trade Message set to where it lies, so a field read out of place says so */
inline ramp_expanded_trade_message(expanded_trade_message_record, expanded_trade_message_base) {
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 8 -> expanded_trade_message_record.symbol_extended[expanded_trade_message_at] = (expanded_trade_message_base + 0 + expanded_trade_message_at + 1) % 256; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 10 -> expanded_trade_message_record.last_price_long[expanded_trade_message_at] = (expanded_trade_message_base + 8 + expanded_trade_message_at + 1) % 256; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 6 -> expanded_trade_message_record.last_quantity_long[expanded_trade_message_at] = (expanded_trade_message_base + 18 + expanded_trade_message_at + 1) % 256; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 9 -> expanded_trade_message_record.cumulative_volume_long[expanded_trade_message_at] = (expanded_trade_message_base + 24 + expanded_trade_message_at + 1) % 256; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Trade Message to the wire, 33 bytes from where the cursor stands */
inline encode_expanded_trade_message(expanded_trade_message_record) {
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 8 -> wire[at] = expanded_trade_message_record.symbol_extended[expanded_trade_message_at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 10 -> wire[at] = expanded_trade_message_record.last_price_long[expanded_trade_message_at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 6 -> wire[at] = expanded_trade_message_record.last_quantity_long[expanded_trade_message_at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 9 -> wire[at] = expanded_trade_message_record.cumulative_volume_long[expanded_trade_message_at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Expanded Trade Message off the wire, 33 bytes from where the cursor stands */
inline decode_expanded_trade_message(expanded_trade_message_record) {
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 8 -> expanded_trade_message_record.symbol_extended[expanded_trade_message_at] = wire[at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 10 -> expanded_trade_message_record.last_price_long[expanded_trade_message_at] = wire[at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 6 -> expanded_trade_message_record.last_quantity_long[expanded_trade_message_at] = wire[at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 9 -> expanded_trade_message_record.cumulative_volume_long[expanded_trade_message_at] = wire[at]; at = at + 1; expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Expanded Trade Message is what was written, byte for byte */
inline equal_expanded_trade_message(expanded_trade_message_read, expanded_trade_message_written) {
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 8 -> assert(expanded_trade_message_read.symbol_extended[expanded_trade_message_at] == expanded_trade_message_written.symbol_extended[expanded_trade_message_at]); expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 10 -> assert(expanded_trade_message_read.last_price_long[expanded_trade_message_at] == expanded_trade_message_written.last_price_long[expanded_trade_message_at]); expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 6 -> assert(expanded_trade_message_read.last_quantity_long[expanded_trade_message_at] == expanded_trade_message_written.last_quantity_long[expanded_trade_message_at]); expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  expanded_trade_message_at = 0;
  do
  :: expanded_trade_message_at < 9 -> assert(expanded_trade_message_read.cumulative_volume_long[expanded_trade_message_at] == expanded_trade_message_written.cumulative_volume_long[expanded_trade_message_at]); expanded_trade_message_at = expanded_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Long Trade Message: 31 bytes -------------------------------------------- */

/* Long Trade Message */
typedef LongTradeMessage {
  byte symbol_long[6];
  byte last_price_long[10];
  byte last_quantity_long[6];
  byte cumulative_volume_long[9]
};

int long_trade_message_at;

/* every byte of Long Trade Message set to one value */
inline fill_long_trade_message(long_trade_message_record, long_trade_message_value) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.symbol_long[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 10 -> long_trade_message_record.last_price_long[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.last_quantity_long[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 9 -> long_trade_message_record.cumulative_volume_long[long_trade_message_at] = long_trade_message_value; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Long Trade Message set to where it lies, so a field read out of place says so */
inline ramp_long_trade_message(long_trade_message_record, long_trade_message_base) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.symbol_long[long_trade_message_at] = (long_trade_message_base + 0 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 10 -> long_trade_message_record.last_price_long[long_trade_message_at] = (long_trade_message_base + 6 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.last_quantity_long[long_trade_message_at] = (long_trade_message_base + 16 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 9 -> long_trade_message_record.cumulative_volume_long[long_trade_message_at] = (long_trade_message_base + 22 + long_trade_message_at + 1) % 256; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Trade Message to the wire, 31 bytes from where the cursor stands */
inline encode_long_trade_message(long_trade_message_record) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> wire[at] = long_trade_message_record.symbol_long[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 10 -> wire[at] = long_trade_message_record.last_price_long[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> wire[at] = long_trade_message_record.last_quantity_long[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 9 -> wire[at] = long_trade_message_record.cumulative_volume_long[long_trade_message_at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Long Trade Message off the wire, 31 bytes from where the cursor stands */
inline decode_long_trade_message(long_trade_message_record) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.symbol_long[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 10 -> long_trade_message_record.last_price_long[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> long_trade_message_record.last_quantity_long[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 9 -> long_trade_message_record.cumulative_volume_long[long_trade_message_at] = wire[at]; at = at + 1; long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Long Trade Message is what was written, byte for byte */
inline equal_long_trade_message(long_trade_message_read, long_trade_message_written) {
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> assert(long_trade_message_read.symbol_long[long_trade_message_at] == long_trade_message_written.symbol_long[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 10 -> assert(long_trade_message_read.last_price_long[long_trade_message_at] == long_trade_message_written.last_price_long[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 6 -> assert(long_trade_message_read.last_quantity_long[long_trade_message_at] == long_trade_message_written.last_quantity_long[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  long_trade_message_at = 0;
  do
  :: long_trade_message_at < 9 -> assert(long_trade_message_read.cumulative_volume_long[long_trade_message_at] == long_trade_message_written.cumulative_volume_long[long_trade_message_at]); long_trade_message_at = long_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Short Trade Message: 21 bytes ------------------------------------------- */

/* Short Trade Message */
typedef ShortTradeMessage {
  byte symbol_short[4];
  byte last_price_short[5];
  byte last_quantity_short[5];
  byte cumulative_volume_short[7]
};

int short_trade_message_at;

/* every byte of Short Trade Message set to one value */
inline fill_short_trade_message(short_trade_message_record, short_trade_message_value) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.symbol_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_price_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_quantity_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 7 -> short_trade_message_record.cumulative_volume_short[short_trade_message_at] = short_trade_message_value; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Short Trade Message set to where it lies, so a field read out of place says so */
inline ramp_short_trade_message(short_trade_message_record, short_trade_message_base) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.symbol_short[short_trade_message_at] = (short_trade_message_base + 0 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_price_short[short_trade_message_at] = (short_trade_message_base + 4 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_quantity_short[short_trade_message_at] = (short_trade_message_base + 9 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 7 -> short_trade_message_record.cumulative_volume_short[short_trade_message_at] = (short_trade_message_base + 14 + short_trade_message_at + 1) % 256; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Trade Message to the wire, 21 bytes from where the cursor stands */
inline encode_short_trade_message(short_trade_message_record) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> wire[at] = short_trade_message_record.symbol_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> wire[at] = short_trade_message_record.last_price_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> wire[at] = short_trade_message_record.last_quantity_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 7 -> wire[at] = short_trade_message_record.cumulative_volume_short[short_trade_message_at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Short Trade Message off the wire, 21 bytes from where the cursor stands */
inline decode_short_trade_message(short_trade_message_record) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> short_trade_message_record.symbol_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_price_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> short_trade_message_record.last_quantity_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 7 -> short_trade_message_record.cumulative_volume_short[short_trade_message_at] = wire[at]; at = at + 1; short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Short Trade Message is what was written, byte for byte */
inline equal_short_trade_message(short_trade_message_read, short_trade_message_written) {
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 4 -> assert(short_trade_message_read.symbol_short[short_trade_message_at] == short_trade_message_written.symbol_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> assert(short_trade_message_read.last_price_short[short_trade_message_at] == short_trade_message_written.last_price_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 5 -> assert(short_trade_message_read.last_quantity_short[short_trade_message_at] == short_trade_message_written.last_quantity_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  short_trade_message_at = 0;
  do
  :: short_trade_message_at < 7 -> assert(short_trade_message_read.cumulative_volume_short[short_trade_message_at] == short_trade_message_written.cumulative_volume_short[short_trade_message_at]); short_trade_message_at = short_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Trade Message: 37 bytes ---------------------------------------- */

/* Extended Trade Message */
typedef ExtendedTradeMessage {
  byte symbol_extended[8];
  byte last_price_extended[14];
  byte last_quantity_long[6];
  byte cumulative_volume_long[9]
};

int extended_trade_message_at;

/* every byte of Extended Trade Message set to one value */
inline fill_extended_trade_message(extended_trade_message_record, extended_trade_message_value) {
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 8 -> extended_trade_message_record.symbol_extended[extended_trade_message_at] = extended_trade_message_value; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 14 -> extended_trade_message_record.last_price_extended[extended_trade_message_at] = extended_trade_message_value; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 6 -> extended_trade_message_record.last_quantity_long[extended_trade_message_at] = extended_trade_message_value; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 9 -> extended_trade_message_record.cumulative_volume_long[extended_trade_message_at] = extended_trade_message_value; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Trade Message set to where it lies, so a field read out of place says so */
inline ramp_extended_trade_message(extended_trade_message_record, extended_trade_message_base) {
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 8 -> extended_trade_message_record.symbol_extended[extended_trade_message_at] = (extended_trade_message_base + 0 + extended_trade_message_at + 1) % 256; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 14 -> extended_trade_message_record.last_price_extended[extended_trade_message_at] = (extended_trade_message_base + 8 + extended_trade_message_at + 1) % 256; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 6 -> extended_trade_message_record.last_quantity_long[extended_trade_message_at] = (extended_trade_message_base + 22 + extended_trade_message_at + 1) % 256; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 9 -> extended_trade_message_record.cumulative_volume_long[extended_trade_message_at] = (extended_trade_message_base + 28 + extended_trade_message_at + 1) % 256; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Trade Message to the wire, 37 bytes from where the cursor stands */
inline encode_extended_trade_message(extended_trade_message_record) {
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 8 -> wire[at] = extended_trade_message_record.symbol_extended[extended_trade_message_at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 14 -> wire[at] = extended_trade_message_record.last_price_extended[extended_trade_message_at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 6 -> wire[at] = extended_trade_message_record.last_quantity_long[extended_trade_message_at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 9 -> wire[at] = extended_trade_message_record.cumulative_volume_long[extended_trade_message_at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Trade Message off the wire, 37 bytes from where the cursor stands */
inline decode_extended_trade_message(extended_trade_message_record) {
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 8 -> extended_trade_message_record.symbol_extended[extended_trade_message_at] = wire[at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 14 -> extended_trade_message_record.last_price_extended[extended_trade_message_at] = wire[at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 6 -> extended_trade_message_record.last_quantity_long[extended_trade_message_at] = wire[at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 9 -> extended_trade_message_record.cumulative_volume_long[extended_trade_message_at] = wire[at]; at = at + 1; extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Trade Message is what was written, byte for byte */
inline equal_extended_trade_message(extended_trade_message_read, extended_trade_message_written) {
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 8 -> assert(extended_trade_message_read.symbol_extended[extended_trade_message_at] == extended_trade_message_written.symbol_extended[extended_trade_message_at]); extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 14 -> assert(extended_trade_message_read.last_price_extended[extended_trade_message_at] == extended_trade_message_written.last_price_extended[extended_trade_message_at]); extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 6 -> assert(extended_trade_message_read.last_quantity_long[extended_trade_message_at] == extended_trade_message_written.last_quantity_long[extended_trade_message_at]); extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  extended_trade_message_at = 0;
  do
  :: extended_trade_message_at < 9 -> assert(extended_trade_message_read.cumulative_volume_long[extended_trade_message_at] == extended_trade_message_written.cumulative_volume_long[extended_trade_message_at]); extended_trade_message_at = extended_trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 12 bytes ---------------------------------------- */

/* The Trading Status Message is used to indicate the current trading status of a security. */
typedef TradingStatusMessage {
  byte symbol_extended[8];
  byte halt_status;
  byte reg_s_h_o_action;
  byte reserved_1;
  byte reserved_2
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_extended[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = trading_status_message_value;
  trading_status_message_record.reg_s_h_o_action = trading_status_message_value;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  trading_status_message_record.reserved_2 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_extended[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = (trading_status_message_base + 8 + 1) % 256;
  trading_status_message_record.reg_s_h_o_action = (trading_status_message_base + 9 + 1) % 256;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 10 + 1) % 256;
  trading_status_message_record.reserved_2 = (trading_status_message_base + 11 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 12 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol_extended[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.halt_status; at = at + 1;
  wire[at] = trading_status_message_record.reg_s_h_o_action; at = at + 1;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = trading_status_message_record.reserved_2; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 12 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_extended[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = wire[at]; at = at + 1;
  trading_status_message_record.reg_s_h_o_action = wire[at]; at = at + 1;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  trading_status_message_record.reserved_2 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol_extended[trading_status_message_at] == trading_status_message_written.symbol_extended[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.halt_status == trading_status_message_written.halt_status);
  assert(trading_status_message_read.reg_s_h_o_action == trading_status_message_written.reg_s_h_o_action);
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  assert(trading_status_message_read.reserved_2 == trading_status_message_written.reserved_2);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Logon Message: encoded, read back, and compared */
proctype check_logon_message() {
  LogonMessage logon_message_sent;
  LogonMessage logon_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_message(logon_message_sent, 0)
  :: pattern == 1 -> fill_logon_message(logon_message_sent, 32)
  :: pattern == 2 -> fill_logon_message(logon_message_sent, 255)
  :: else -> ramp_logon_message(logon_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_message(logon_message_sent);
    assert(at == 17);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 17);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Rejected Message: encoded, read back, and compared */
proctype check_logon_rejected_message() {
  LogonRejectedMessage logon_rejected_message_sent;
  LogonRejectedMessage logon_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_rejected_message(logon_rejected_message_sent, 0)
  :: pattern == 1 -> fill_logon_rejected_message(logon_rejected_message_sent, 32)
  :: pattern == 2 -> fill_logon_rejected_message(logon_rejected_message_sent, 255)
  :: else -> ramp_logon_rejected_message(logon_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_rejected_message(logon_rejected_message_sent);
    assert(at == 1);
    at = 0;
    decode_logon_rejected_message(logon_rejected_message_got);
    assert(at == 1);
    equal_logon_rejected_message(logon_rejected_message_got, logon_rejected_message_sent)
  }
}

/* Seconds Message: encoded, read back, and compared */
proctype check_seconds_message() {
  SecondsMessage seconds_message_sent;
  SecondsMessage seconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_seconds_message(seconds_message_sent, 0)
  :: pattern == 1 -> fill_seconds_message(seconds_message_sent, 32)
  :: pattern == 2 -> fill_seconds_message(seconds_message_sent, 255)
  :: else -> ramp_seconds_message(seconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_seconds_message(seconds_message_sent);
    assert(at == 5);
    at = 0;
    decode_seconds_message(seconds_message_got);
    assert(at == 5);
    equal_seconds_message(seconds_message_got, seconds_message_sent)
  }
}

/* Milliseconds Message: encoded, read back, and compared */
proctype check_milliseconds_message() {
  MillisecondsMessage milliseconds_message_sent;
  MillisecondsMessage milliseconds_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_milliseconds_message(milliseconds_message_sent, 0)
  :: pattern == 1 -> fill_milliseconds_message(milliseconds_message_sent, 32)
  :: pattern == 2 -> fill_milliseconds_message(milliseconds_message_sent, 255)
  :: else -> ramp_milliseconds_message(milliseconds_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_milliseconds_message(milliseconds_message_sent);
    assert(at == 3);
    at = 0;
    decode_milliseconds_message(milliseconds_message_got);
    assert(at == 3);
    equal_milliseconds_message(milliseconds_message_got, milliseconds_message_sent)
  }
}

/* Expanded Spin Message: encoded, read back, and compared */
proctype check_expanded_spin_message() {
  ExpandedSpinMessage expanded_spin_message_sent;
  ExpandedSpinMessage expanded_spin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_spin_message(expanded_spin_message_sent, 0)
  :: pattern == 1 -> fill_expanded_spin_message(expanded_spin_message_sent, 32)
  :: pattern == 2 -> fill_expanded_spin_message(expanded_spin_message_sent, 255)
  :: else -> ramp_expanded_spin_message(expanded_spin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_spin_message(expanded_spin_message_sent);
    assert(at == 85);
    at = 0;
    decode_expanded_spin_message(expanded_spin_message_got);
    assert(at == 85);
    equal_expanded_spin_message(expanded_spin_message_got, expanded_spin_message_sent)
  }
}

/* Extended Spin Message: encoded, read back, and compared */
proctype check_extended_spin_message() {
  ExtendedSpinMessage extended_spin_message_sent;
  ExtendedSpinMessage extended_spin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_spin_message(extended_spin_message_sent, 0)
  :: pattern == 1 -> fill_extended_spin_message(extended_spin_message_sent, 32)
  :: pattern == 2 -> fill_extended_spin_message(extended_spin_message_sent, 255)
  :: else -> ramp_extended_spin_message(extended_spin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_spin_message(extended_spin_message_sent);
    assert(at == 97);
    at = 0;
    decode_extended_spin_message(extended_spin_message_got);
    assert(at == 97);
    equal_extended_spin_message(extended_spin_message_got, extended_spin_message_sent)
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
    assert(at == 36);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 36);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
  }
}

/* Expanded Bid Update Message: encoded, read back, and compared */
proctype check_expanded_bid_update_message() {
  ExpandedBidUpdateMessage expanded_bid_update_message_sent;
  ExpandedBidUpdateMessage expanded_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_bid_update_message(expanded_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_expanded_bid_update_message(expanded_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_expanded_bid_update_message(expanded_bid_update_message_sent, 255)
  :: else -> ramp_expanded_bid_update_message(expanded_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_bid_update_message(expanded_bid_update_message_sent);
    assert(at == 24);
    at = 0;
    decode_expanded_bid_update_message(expanded_bid_update_message_got);
    assert(at == 24);
    equal_expanded_bid_update_message(expanded_bid_update_message_got, expanded_bid_update_message_sent)
  }
}

/* Long Bid Update Message: encoded, read back, and compared */
proctype check_long_bid_update_message() {
  LongBidUpdateMessage long_bid_update_message_sent;
  LongBidUpdateMessage long_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_bid_update_message(long_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_long_bid_update_message(long_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_long_bid_update_message(long_bid_update_message_sent, 255)
  :: else -> ramp_long_bid_update_message(long_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_bid_update_message(long_bid_update_message_sent);
    assert(at == 22);
    at = 0;
    decode_long_bid_update_message(long_bid_update_message_got);
    assert(at == 22);
    equal_long_bid_update_message(long_bid_update_message_got, long_bid_update_message_sent)
  }
}

/* Short Bid Update Message: encoded, read back, and compared */
proctype check_short_bid_update_message() {
  ShortBidUpdateMessage short_bid_update_message_sent;
  ShortBidUpdateMessage short_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_bid_update_message(short_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_short_bid_update_message(short_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_short_bid_update_message(short_bid_update_message_sent, 255)
  :: else -> ramp_short_bid_update_message(short_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_bid_update_message(short_bid_update_message_sent);
    assert(at == 14);
    at = 0;
    decode_short_bid_update_message(short_bid_update_message_got);
    assert(at == 14);
    equal_short_bid_update_message(short_bid_update_message_got, short_bid_update_message_sent)
  }
}

/* Extended Bid Update Message: encoded, read back, and compared */
proctype check_extended_bid_update_message() {
  ExtendedBidUpdateMessage extended_bid_update_message_sent;
  ExtendedBidUpdateMessage extended_bid_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_bid_update_message(extended_bid_update_message_sent, 0)
  :: pattern == 1 -> fill_extended_bid_update_message(extended_bid_update_message_sent, 32)
  :: pattern == 2 -> fill_extended_bid_update_message(extended_bid_update_message_sent, 255)
  :: else -> ramp_extended_bid_update_message(extended_bid_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_bid_update_message(extended_bid_update_message_sent);
    assert(at == 28);
    at = 0;
    decode_extended_bid_update_message(extended_bid_update_message_got);
    assert(at == 28);
    equal_extended_bid_update_message(extended_bid_update_message_got, extended_bid_update_message_sent)
  }
}

/* Expanded Ask Update Message: encoded, read back, and compared */
proctype check_expanded_ask_update_message() {
  ExpandedAskUpdateMessage expanded_ask_update_message_sent;
  ExpandedAskUpdateMessage expanded_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_ask_update_message(expanded_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_expanded_ask_update_message(expanded_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_expanded_ask_update_message(expanded_ask_update_message_sent, 255)
  :: else -> ramp_expanded_ask_update_message(expanded_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_ask_update_message(expanded_ask_update_message_sent);
    assert(at == 24);
    at = 0;
    decode_expanded_ask_update_message(expanded_ask_update_message_got);
    assert(at == 24);
    equal_expanded_ask_update_message(expanded_ask_update_message_got, expanded_ask_update_message_sent)
  }
}

/* Long Ask Update Message: encoded, read back, and compared */
proctype check_long_ask_update_message() {
  LongAskUpdateMessage long_ask_update_message_sent;
  LongAskUpdateMessage long_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_ask_update_message(long_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_long_ask_update_message(long_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_long_ask_update_message(long_ask_update_message_sent, 255)
  :: else -> ramp_long_ask_update_message(long_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_ask_update_message(long_ask_update_message_sent);
    assert(at == 22);
    at = 0;
    decode_long_ask_update_message(long_ask_update_message_got);
    assert(at == 22);
    equal_long_ask_update_message(long_ask_update_message_got, long_ask_update_message_sent)
  }
}

/* Short Ask Update Message: encoded, read back, and compared */
proctype check_short_ask_update_message() {
  ShortAskUpdateMessage short_ask_update_message_sent;
  ShortAskUpdateMessage short_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_ask_update_message(short_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_short_ask_update_message(short_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_short_ask_update_message(short_ask_update_message_sent, 255)
  :: else -> ramp_short_ask_update_message(short_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_ask_update_message(short_ask_update_message_sent);
    assert(at == 14);
    at = 0;
    decode_short_ask_update_message(short_ask_update_message_got);
    assert(at == 14);
    equal_short_ask_update_message(short_ask_update_message_got, short_ask_update_message_sent)
  }
}

/* Extended Ask Update Message: encoded, read back, and compared */
proctype check_extended_ask_update_message() {
  ExtendedAskUpdateMessage extended_ask_update_message_sent;
  ExtendedAskUpdateMessage extended_ask_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_ask_update_message(extended_ask_update_message_sent, 0)
  :: pattern == 1 -> fill_extended_ask_update_message(extended_ask_update_message_sent, 32)
  :: pattern == 2 -> fill_extended_ask_update_message(extended_ask_update_message_sent, 255)
  :: else -> ramp_extended_ask_update_message(extended_ask_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_ask_update_message(extended_ask_update_message_sent);
    assert(at == 28);
    at = 0;
    decode_extended_ask_update_message(extended_ask_update_message_got);
    assert(at == 28);
    equal_extended_ask_update_message(extended_ask_update_message_got, extended_ask_update_message_sent)
  }
}

/* Expanded Two Sided Update Message: encoded, read back, and compared */
proctype check_expanded_two_sided_update_message() {
  ExpandedTwoSidedUpdateMessage expanded_two_sided_update_message_sent;
  ExpandedTwoSidedUpdateMessage expanded_two_sided_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_two_sided_update_message(expanded_two_sided_update_message_sent, 0)
  :: pattern == 1 -> fill_expanded_two_sided_update_message(expanded_two_sided_update_message_sent, 32)
  :: pattern == 2 -> fill_expanded_two_sided_update_message(expanded_two_sided_update_message_sent, 255)
  :: else -> ramp_expanded_two_sided_update_message(expanded_two_sided_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_two_sided_update_message(expanded_two_sided_update_message_sent);
    assert(at == 40);
    at = 0;
    decode_expanded_two_sided_update_message(expanded_two_sided_update_message_got);
    assert(at == 40);
    equal_expanded_two_sided_update_message(expanded_two_sided_update_message_got, expanded_two_sided_update_message_sent)
  }
}

/* Long Two Sided Update Message: encoded, read back, and compared */
proctype check_long_two_sided_update_message() {
  LongTwoSidedUpdateMessage long_two_sided_update_message_sent;
  LongTwoSidedUpdateMessage long_two_sided_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_two_sided_update_message(long_two_sided_update_message_sent, 0)
  :: pattern == 1 -> fill_long_two_sided_update_message(long_two_sided_update_message_sent, 32)
  :: pattern == 2 -> fill_long_two_sided_update_message(long_two_sided_update_message_sent, 255)
  :: else -> ramp_long_two_sided_update_message(long_two_sided_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_two_sided_update_message(long_two_sided_update_message_sent);
    assert(at == 38);
    at = 0;
    decode_long_two_sided_update_message(long_two_sided_update_message_got);
    assert(at == 38);
    equal_long_two_sided_update_message(long_two_sided_update_message_got, long_two_sided_update_message_sent)
  }
}

/* Short Two Sided Update Message: encoded, read back, and compared */
proctype check_short_two_sided_update_message() {
  ShortTwoSidedUpdateMessage short_two_sided_update_message_sent;
  ShortTwoSidedUpdateMessage short_two_sided_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_two_sided_update_message(short_two_sided_update_message_sent, 0)
  :: pattern == 1 -> fill_short_two_sided_update_message(short_two_sided_update_message_sent, 32)
  :: pattern == 2 -> fill_short_two_sided_update_message(short_two_sided_update_message_sent, 255)
  :: else -> ramp_short_two_sided_update_message(short_two_sided_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_two_sided_update_message(short_two_sided_update_message_sent);
    assert(at == 24);
    at = 0;
    decode_short_two_sided_update_message(short_two_sided_update_message_got);
    assert(at == 24);
    equal_short_two_sided_update_message(short_two_sided_update_message_got, short_two_sided_update_message_sent)
  }
}

/* Extended Two Sided Update Message: encoded, read back, and compared */
proctype check_extended_two_sided_update_message() {
  ExtendedTwoSidedUpdateMessage extended_two_sided_update_message_sent;
  ExtendedTwoSidedUpdateMessage extended_two_sided_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_two_sided_update_message(extended_two_sided_update_message_sent, 0)
  :: pattern == 1 -> fill_extended_two_sided_update_message(extended_two_sided_update_message_sent, 32)
  :: pattern == 2 -> fill_extended_two_sided_update_message(extended_two_sided_update_message_sent, 255)
  :: else -> ramp_extended_two_sided_update_message(extended_two_sided_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_two_sided_update_message(extended_two_sided_update_message_sent);
    assert(at == 48);
    at = 0;
    decode_extended_two_sided_update_message(extended_two_sided_update_message_got);
    assert(at == 48);
    equal_extended_two_sided_update_message(extended_two_sided_update_message_got, extended_two_sided_update_message_sent)
  }
}

/* Expanded Trade Message: encoded, read back, and compared */
proctype check_expanded_trade_message() {
  ExpandedTradeMessage expanded_trade_message_sent;
  ExpandedTradeMessage expanded_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_expanded_trade_message(expanded_trade_message_sent, 0)
  :: pattern == 1 -> fill_expanded_trade_message(expanded_trade_message_sent, 32)
  :: pattern == 2 -> fill_expanded_trade_message(expanded_trade_message_sent, 255)
  :: else -> ramp_expanded_trade_message(expanded_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_expanded_trade_message(expanded_trade_message_sent);
    assert(at == 33);
    at = 0;
    decode_expanded_trade_message(expanded_trade_message_got);
    assert(at == 33);
    equal_expanded_trade_message(expanded_trade_message_got, expanded_trade_message_sent)
  }
}

/* Long Trade Message: encoded, read back, and compared */
proctype check_long_trade_message() {
  LongTradeMessage long_trade_message_sent;
  LongTradeMessage long_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_long_trade_message(long_trade_message_sent, 0)
  :: pattern == 1 -> fill_long_trade_message(long_trade_message_sent, 32)
  :: pattern == 2 -> fill_long_trade_message(long_trade_message_sent, 255)
  :: else -> ramp_long_trade_message(long_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_long_trade_message(long_trade_message_sent);
    assert(at == 31);
    at = 0;
    decode_long_trade_message(long_trade_message_got);
    assert(at == 31);
    equal_long_trade_message(long_trade_message_got, long_trade_message_sent)
  }
}

/* Short Trade Message: encoded, read back, and compared */
proctype check_short_trade_message() {
  ShortTradeMessage short_trade_message_sent;
  ShortTradeMessage short_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_short_trade_message(short_trade_message_sent, 0)
  :: pattern == 1 -> fill_short_trade_message(short_trade_message_sent, 32)
  :: pattern == 2 -> fill_short_trade_message(short_trade_message_sent, 255)
  :: else -> ramp_short_trade_message(short_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_short_trade_message(short_trade_message_sent);
    assert(at == 21);
    at = 0;
    decode_short_trade_message(short_trade_message_got);
    assert(at == 21);
    equal_short_trade_message(short_trade_message_got, short_trade_message_sent)
  }
}

/* Extended Trade Message: encoded, read back, and compared */
proctype check_extended_trade_message() {
  ExtendedTradeMessage extended_trade_message_sent;
  ExtendedTradeMessage extended_trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_trade_message(extended_trade_message_sent, 0)
  :: pattern == 1 -> fill_extended_trade_message(extended_trade_message_sent, 32)
  :: pattern == 2 -> fill_extended_trade_message(extended_trade_message_sent, 255)
  :: else -> ramp_extended_trade_message(extended_trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_trade_message(extended_trade_message_sent);
    assert(at == 37);
    at = 0;
    decode_extended_trade_message(extended_trade_message_got);
    assert(at == 37);
    equal_extended_trade_message(extended_trade_message_got, extended_trade_message_sent)
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
    assert(at == 12);
    at = 0;
    decode_trading_status_message(trading_status_message_got);
    assert(at == 12);
    equal_trading_status_message(trading_status_message_got, trading_status_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_logon_message()
  :: run check_logon_rejected_message()
  :: run check_seconds_message()
  :: run check_milliseconds_message()
  :: run check_expanded_spin_message()
  :: run check_extended_spin_message()
  :: run check_time_reference_message()
  :: run check_expanded_bid_update_message()
  :: run check_long_bid_update_message()
  :: run check_short_bid_update_message()
  :: run check_extended_bid_update_message()
  :: run check_expanded_ask_update_message()
  :: run check_long_ask_update_message()
  :: run check_short_ask_update_message()
  :: run check_extended_ask_update_message()
  :: run check_expanded_two_sided_update_message()
  :: run check_long_two_sided_update_message()
  :: run check_short_two_sided_update_message()
  :: run check_extended_two_sided_update_message()
  :: run check_expanded_trade_message()
  :: run check_long_trade_message()
  :: run check_short_trade_message()
  :: run check_extended_trade_message()
  :: run check_trading_status_message()
  fi
}
