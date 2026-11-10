/*
 * Texas Stock Exchange Session Enabled Entry Daemon
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
 *   - a field read in bits
 *   - a field present only on a condition
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 30

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Rake Message Header: 3 bytes -------------------------------------------- */

/* Rake Tcp per-message header carrying the frame length and packet-level dispatch byte */
typedef RakeMessageHeader {
  byte message_length[2];
  byte packet_type
};

int rake_message_header_at;

/* every byte of Rake Message Header set to one value */
inline fill_rake_message_header(rake_message_header_record, rake_message_header_value) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = rake_message_header_value; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = rake_message_header_value;
  skip
}

/* each byte of Rake Message Header set to where it lies, so a field read out of place says so */
inline ramp_rake_message_header(rake_message_header_record, rake_message_header_base) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = (rake_message_header_base + 0 + rake_message_header_at + 1) % 256; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = (rake_message_header_base + 2 + 1) % 256;
  skip
}

/* Rake Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_rake_message_header(rake_message_header_record) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> wire[at] = rake_message_header_record.message_length[rake_message_header_at]; at = at + 1; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  wire[at] = rake_message_header_record.packet_type; at = at + 1;
  skip
}

/* Rake Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_rake_message_header(rake_message_header_record) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> rake_message_header_record.message_length[rake_message_header_at] = wire[at]; at = at + 1; rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  rake_message_header_record.packet_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Rake Message Header is what was written, byte for byte */
inline equal_rake_message_header(rake_message_header_read, rake_message_header_written) {
  rake_message_header_at = 0;
  do
  :: rake_message_header_at < 2 -> assert(rake_message_header_read.message_length[rake_message_header_at] == rake_message_header_written.message_length[rake_message_header_at]); rake_message_header_at = rake_message_header_at + 1
  :: else -> break
  od;
  assert(rake_message_header_read.packet_type == rake_message_header_written.packet_type);
  skip
}

/* ---- Logon Response Message: 30 bytes ---------------------------------------- */

/* Response to a logon request */
typedef LogonResponseMessage {
  byte session[8];
  byte next_sequence_number[8];
  byte highest_known_sequence_number[8];
  byte logon_response_code;
  byte number_stream_ids;
  byte instance[4]
};

int logon_response_message_at;

/* every byte of Logon Response Message set to one value */
inline fill_logon_response_message(logon_response_message_record, logon_response_message_value) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.session[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.next_sequence_number[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.highest_known_sequence_number[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.logon_response_code = logon_response_message_value;
  logon_response_message_record.number_stream_ids = logon_response_message_value;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.instance[logon_response_message_at] = logon_response_message_value; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Response Message set to where it lies, so a field read out of place says so */
inline ramp_logon_response_message(logon_response_message_record, logon_response_message_base) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.session[logon_response_message_at] = (logon_response_message_base + 0 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.next_sequence_number[logon_response_message_at] = (logon_response_message_base + 8 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.highest_known_sequence_number[logon_response_message_at] = (logon_response_message_base + 16 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.logon_response_code = (logon_response_message_base + 24 + 1) % 256;
  logon_response_message_record.number_stream_ids = (logon_response_message_base + 25 + 1) % 256;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.instance[logon_response_message_at] = (logon_response_message_base + 26 + logon_response_message_at + 1) % 256; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message to the wire, 30 bytes from where the cursor stands */
inline encode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> wire[at] = logon_response_message_record.session[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> wire[at] = logon_response_message_record.next_sequence_number[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> wire[at] = logon_response_message_record.highest_known_sequence_number[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_response_message_record.logon_response_code; at = at + 1;
  wire[at] = logon_response_message_record.number_stream_ids; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> wire[at] = logon_response_message_record.instance[logon_response_message_at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Response Message off the wire, 30 bytes from where the cursor stands */
inline decode_logon_response_message(logon_response_message_record) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.session[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.next_sequence_number[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> logon_response_message_record.highest_known_sequence_number[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_record.logon_response_code = wire[at]; at = at + 1;
  logon_response_message_record.number_stream_ids = wire[at]; at = at + 1;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> logon_response_message_record.instance[logon_response_message_at] = wire[at]; at = at + 1; logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Response Message is what was written, byte for byte */
inline equal_logon_response_message(logon_response_message_read, logon_response_message_written) {
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> assert(logon_response_message_read.session[logon_response_message_at] == logon_response_message_written.session[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> assert(logon_response_message_read.next_sequence_number[logon_response_message_at] == logon_response_message_written.next_sequence_number[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 8 -> assert(logon_response_message_read.highest_known_sequence_number[logon_response_message_at] == logon_response_message_written.highest_known_sequence_number[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  assert(logon_response_message_read.logon_response_code == logon_response_message_written.logon_response_code);
  assert(logon_response_message_read.number_stream_ids == logon_response_message_written.number_stream_ids);
  logon_response_message_at = 0;
  do
  :: logon_response_message_at < 4 -> assert(logon_response_message_read.instance[logon_response_message_at] == logon_response_message_written.instance[logon_response_message_at]); logon_response_message_at = logon_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Canceled Message: 25 bytes ---------------------------------------- */

/* This order has been canceled. No shares are left on the Exchange. The Member will receive this message in response to a CancelOrder message, as well as unsolicited messages from the Exchange for various reasons. */
typedef OrderCanceledMessage {
  byte transact_time[8];
  byte order_id[8];
  byte orig_cl_ord_id[8];
  byte cancel_reason
};

int order_canceled_message_at;

/* every byte of Order Canceled Message set to one value */
inline fill_order_canceled_message(order_canceled_message_record, order_canceled_message_value) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.transact_time[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.orig_cl_ord_id[order_canceled_message_at] = order_canceled_message_value; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = order_canceled_message_value;
  skip
}

/* each byte of Order Canceled Message set to where it lies, so a field read out of place says so */
inline ramp_order_canceled_message(order_canceled_message_record, order_canceled_message_base) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.transact_time[order_canceled_message_at] = (order_canceled_message_base + 0 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = (order_canceled_message_base + 8 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.orig_cl_ord_id[order_canceled_message_at] = (order_canceled_message_base + 16 + order_canceled_message_at + 1) % 256; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = (order_canceled_message_base + 24 + 1) % 256;
  skip
}

/* Order Canceled Message to the wire, 25 bytes from where the cursor stands */
inline encode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.transact_time[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.order_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> wire[at] = order_canceled_message_record.orig_cl_ord_id[order_canceled_message_at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  wire[at] = order_canceled_message_record.cancel_reason; at = at + 1;
  skip
}

/* Order Canceled Message off the wire, 25 bytes from where the cursor stands */
inline decode_order_canceled_message(order_canceled_message_record) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.transact_time[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.order_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> order_canceled_message_record.orig_cl_ord_id[order_canceled_message_at] = wire[at]; at = at + 1; order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_record.cancel_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Order Canceled Message is what was written, byte for byte */
inline equal_order_canceled_message(order_canceled_message_read, order_canceled_message_written) {
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.transact_time[order_canceled_message_at] == order_canceled_message_written.transact_time[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.order_id[order_canceled_message_at] == order_canceled_message_written.order_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  order_canceled_message_at = 0;
  do
  :: order_canceled_message_at < 8 -> assert(order_canceled_message_read.orig_cl_ord_id[order_canceled_message_at] == order_canceled_message_written.orig_cl_ord_id[order_canceled_message_at]); order_canceled_message_at = order_canceled_message_at + 1
  :: else -> break
  od;
  assert(order_canceled_message_read.cancel_reason == order_canceled_message_written.cancel_reason);
  skip
}

/* ---- Cancel Rejected Message: 17 bytes --------------------------------------- */

/* The requested CancelOrder has been rejected. */
typedef CancelRejectedMessage {
  byte transact_time[8];
  byte orig_cl_ord_id[8];
  byte cancel_rejected_reason
};

int cancel_rejected_message_at;

/* every byte of Cancel Rejected Message set to one value */
inline fill_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_value) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transact_time[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.orig_cl_ord_id[cancel_rejected_message_at] = cancel_rejected_message_value; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_rejected_reason = cancel_rejected_message_value;
  skip
}

/* each byte of Cancel Rejected Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_rejected_message(cancel_rejected_message_record, cancel_rejected_message_base) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transact_time[cancel_rejected_message_at] = (cancel_rejected_message_base + 0 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.orig_cl_ord_id[cancel_rejected_message_at] = (cancel_rejected_message_base + 8 + cancel_rejected_message_at + 1) % 256; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_rejected_reason = (cancel_rejected_message_base + 16 + 1) % 256;
  skip
}

/* Cancel Rejected Message to the wire, 17 bytes from where the cursor stands */
inline encode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> wire[at] = cancel_rejected_message_record.transact_time[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> wire[at] = cancel_rejected_message_record.orig_cl_ord_id[cancel_rejected_message_at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  wire[at] = cancel_rejected_message_record.cancel_rejected_reason; at = at + 1;
  skip
}

/* Cancel Rejected Message off the wire, 17 bytes from where the cursor stands */
inline decode_cancel_rejected_message(cancel_rejected_message_record) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.transact_time[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> cancel_rejected_message_record.orig_cl_ord_id[cancel_rejected_message_at] = wire[at]; at = at + 1; cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_record.cancel_rejected_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Cancel Rejected Message is what was written, byte for byte */
inline equal_cancel_rejected_message(cancel_rejected_message_read, cancel_rejected_message_written) {
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> assert(cancel_rejected_message_read.transact_time[cancel_rejected_message_at] == cancel_rejected_message_written.transact_time[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  cancel_rejected_message_at = 0;
  do
  :: cancel_rejected_message_at < 8 -> assert(cancel_rejected_message_read.orig_cl_ord_id[cancel_rejected_message_at] == cancel_rejected_message_written.orig_cl_ord_id[cancel_rejected_message_at]); cancel_rejected_message_at = cancel_rejected_message_at + 1
  :: else -> break
  od;
  assert(cancel_rejected_message_read.cancel_rejected_reason == cancel_rejected_message_written.cancel_rejected_reason);
  skip
}

/* ---- Mass Cancel Result Message: 28 bytes ------------------------------------ */

/* Confirms sweep completion. Sent after all affected orders have been canceled. */
typedef MassCancelResultMessage {
  byte transact_time[8];
  byte mass_cancel_request_id[8];
  byte mass_cancel_id[8];
  byte canceled_count[4]
};

int mass_cancel_result_message_at;

/* every byte of Mass Cancel Result Message set to one value */
inline fill_mass_cancel_result_message(mass_cancel_result_message_record, mass_cancel_result_message_value) {
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.transact_time[mass_cancel_result_message_at] = mass_cancel_result_message_value; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_request_id[mass_cancel_result_message_at] = mass_cancel_result_message_value; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_id[mass_cancel_result_message_at] = mass_cancel_result_message_value; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 4 -> mass_cancel_result_message_record.canceled_count[mass_cancel_result_message_at] = mass_cancel_result_message_value; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Result Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_result_message(mass_cancel_result_message_record, mass_cancel_result_message_base) {
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.transact_time[mass_cancel_result_message_at] = (mass_cancel_result_message_base + 0 + mass_cancel_result_message_at + 1) % 256; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_request_id[mass_cancel_result_message_at] = (mass_cancel_result_message_base + 8 + mass_cancel_result_message_at + 1) % 256; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_id[mass_cancel_result_message_at] = (mass_cancel_result_message_base + 16 + mass_cancel_result_message_at + 1) % 256; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 4 -> mass_cancel_result_message_record.canceled_count[mass_cancel_result_message_at] = (mass_cancel_result_message_base + 24 + mass_cancel_result_message_at + 1) % 256; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Result Message to the wire, 28 bytes from where the cursor stands */
inline encode_mass_cancel_result_message(mass_cancel_result_message_record) {
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> wire[at] = mass_cancel_result_message_record.transact_time[mass_cancel_result_message_at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> wire[at] = mass_cancel_result_message_record.mass_cancel_request_id[mass_cancel_result_message_at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> wire[at] = mass_cancel_result_message_record.mass_cancel_id[mass_cancel_result_message_at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 4 -> wire[at] = mass_cancel_result_message_record.canceled_count[mass_cancel_result_message_at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Result Message off the wire, 28 bytes from where the cursor stands */
inline decode_mass_cancel_result_message(mass_cancel_result_message_record) {
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.transact_time[mass_cancel_result_message_at] = wire[at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_request_id[mass_cancel_result_message_at] = wire[at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> mass_cancel_result_message_record.mass_cancel_id[mass_cancel_result_message_at] = wire[at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 4 -> mass_cancel_result_message_record.canceled_count[mass_cancel_result_message_at] = wire[at]; at = at + 1; mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Result Message is what was written, byte for byte */
inline equal_mass_cancel_result_message(mass_cancel_result_message_read, mass_cancel_result_message_written) {
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> assert(mass_cancel_result_message_read.transact_time[mass_cancel_result_message_at] == mass_cancel_result_message_written.transact_time[mass_cancel_result_message_at]); mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> assert(mass_cancel_result_message_read.mass_cancel_request_id[mass_cancel_result_message_at] == mass_cancel_result_message_written.mass_cancel_request_id[mass_cancel_result_message_at]); mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 8 -> assert(mass_cancel_result_message_read.mass_cancel_id[mass_cancel_result_message_at] == mass_cancel_result_message_written.mass_cancel_id[mass_cancel_result_message_at]); mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  mass_cancel_result_message_at = 0;
  do
  :: mass_cancel_result_message_at < 4 -> assert(mass_cancel_result_message_read.canceled_count[mass_cancel_result_message_at] == mass_cancel_result_message_written.canceled_count[mass_cancel_result_message_at]); mass_cancel_result_message_at = mass_cancel_result_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Rake Message Header: encoded, read back, and compared */
proctype check_rake_message_header() {
  RakeMessageHeader rake_message_header_sent;
  RakeMessageHeader rake_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_rake_message_header(rake_message_header_sent, 0)
  :: pattern == 1 -> fill_rake_message_header(rake_message_header_sent, 32)
  :: pattern == 2 -> fill_rake_message_header(rake_message_header_sent, 255)
  :: else -> ramp_rake_message_header(rake_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_rake_message_header(rake_message_header_sent);
    assert(at == 3);
    at = 0;
    decode_rake_message_header(rake_message_header_got);
    assert(at == 3);
    equal_rake_message_header(rake_message_header_got, rake_message_header_sent)
  }
}

/* Logon Response Message: encoded, read back, and compared */
proctype check_logon_response_message() {
  LogonResponseMessage logon_response_message_sent;
  LogonResponseMessage logon_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_response_message(logon_response_message_sent, 0)
  :: pattern == 1 -> fill_logon_response_message(logon_response_message_sent, 32)
  :: pattern == 2 -> fill_logon_response_message(logon_response_message_sent, 255)
  :: else -> ramp_logon_response_message(logon_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_response_message(logon_response_message_sent);
    assert(at == 30);
    at = 0;
    decode_logon_response_message(logon_response_message_got);
    assert(at == 30);
    equal_logon_response_message(logon_response_message_got, logon_response_message_sent)
  }
}

/* Order Canceled Message: encoded, read back, and compared */
proctype check_order_canceled_message() {
  OrderCanceledMessage order_canceled_message_sent;
  OrderCanceledMessage order_canceled_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_canceled_message(order_canceled_message_sent, 0)
  :: pattern == 1 -> fill_order_canceled_message(order_canceled_message_sent, 32)
  :: pattern == 2 -> fill_order_canceled_message(order_canceled_message_sent, 255)
  :: else -> ramp_order_canceled_message(order_canceled_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_canceled_message(order_canceled_message_sent);
    assert(at == 25);
    at = 0;
    decode_order_canceled_message(order_canceled_message_got);
    assert(at == 25);
    equal_order_canceled_message(order_canceled_message_got, order_canceled_message_sent)
  }
}

/* Cancel Rejected Message: encoded, read back, and compared */
proctype check_cancel_rejected_message() {
  CancelRejectedMessage cancel_rejected_message_sent;
  CancelRejectedMessage cancel_rejected_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 0)
  :: pattern == 1 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 32)
  :: pattern == 2 -> fill_cancel_rejected_message(cancel_rejected_message_sent, 255)
  :: else -> ramp_cancel_rejected_message(cancel_rejected_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_rejected_message(cancel_rejected_message_sent);
    assert(at == 17);
    at = 0;
    decode_cancel_rejected_message(cancel_rejected_message_got);
    assert(at == 17);
    equal_cancel_rejected_message(cancel_rejected_message_got, cancel_rejected_message_sent)
  }
}

/* Mass Cancel Result Message: encoded, read back, and compared */
proctype check_mass_cancel_result_message() {
  MassCancelResultMessage mass_cancel_result_message_sent;
  MassCancelResultMessage mass_cancel_result_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_result_message(mass_cancel_result_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_result_message(mass_cancel_result_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_result_message(mass_cancel_result_message_sent, 255)
  :: else -> ramp_mass_cancel_result_message(mass_cancel_result_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_result_message(mass_cancel_result_message_sent);
    assert(at == 28);
    at = 0;
    decode_mass_cancel_result_message(mass_cancel_result_message_got);
    assert(at == 28);
    equal_mass_cancel_result_message(mass_cancel_result_message_got, mass_cancel_result_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_rake_message_header()
  :: run check_logon_response_message()
  :: run check_order_canceled_message()
  :: run check_cancel_rejected_message()
  :: run check_mass_cancel_result_message()
  fi
}
