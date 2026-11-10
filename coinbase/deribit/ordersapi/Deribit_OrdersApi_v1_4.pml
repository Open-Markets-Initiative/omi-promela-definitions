/*
 * Coinbase Orders Api
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
 *   - a field read in bits
 *   - a field present only on a condition
 *   - a block whose stated length holds more than its fields
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 67

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Logon Message: 67 bytes ------------------------------------------------- */

/* LogonMessage */
typedef LogonMessage {
  byte client_id[16];
  byte secret[48];
  byte reset_seq_num;
  byte schema_version[2]
};

int logon_message_at;

/* every byte of Logon Message set to one value */
inline fill_logon_message(logon_message_record, logon_message_value) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.client_id[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 48 -> logon_message_record.secret[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = logon_message_value;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.schema_version[logon_message_at] = logon_message_value; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Message set to where it lies, so a field read out of place says so */
inline ramp_logon_message(logon_message_record, logon_message_base) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.client_id[logon_message_at] = (logon_message_base + 0 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 48 -> logon_message_record.secret[logon_message_at] = (logon_message_base + 16 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = (logon_message_base + 64 + 1) % 256;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.schema_version[logon_message_at] = (logon_message_base + 65 + logon_message_at + 1) % 256; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message to the wire, 67 bytes from where the cursor stands */
inline encode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> wire[at] = logon_message_record.client_id[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 48 -> wire[at] = logon_message_record.secret[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  wire[at] = logon_message_record.reset_seq_num; at = at + 1;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> wire[at] = logon_message_record.schema_version[logon_message_at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Message off the wire, 67 bytes from where the cursor stands */
inline decode_logon_message(logon_message_record) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> logon_message_record.client_id[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 48 -> logon_message_record.secret[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_record.reset_seq_num = wire[at]; at = at + 1;
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> logon_message_record.schema_version[logon_message_at] = wire[at]; at = at + 1; logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Message is what was written, byte for byte */
inline equal_logon_message(logon_message_read, logon_message_written) {
  logon_message_at = 0;
  do
  :: logon_message_at < 16 -> assert(logon_message_read.client_id[logon_message_at] == logon_message_written.client_id[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  logon_message_at = 0;
  do
  :: logon_message_at < 48 -> assert(logon_message_read.secret[logon_message_at] == logon_message_written.secret[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  assert(logon_message_read.reset_seq_num == logon_message_written.reset_seq_num);
  logon_message_at = 0;
  do
  :: logon_message_at < 2 -> assert(logon_message_read.schema_version[logon_message_at] == logon_message_written.schema_version[logon_message_at]); logon_message_at = logon_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Logon Conf Message: 6 bytes --------------------------------------------- */

/* LogonConfMessage */
typedef LogonConfMessage {
  byte heartbeat_interval_seconds[4];
  byte schema_version[2]
};

int logon_conf_message_at;

/* every byte of Logon Conf Message set to one value */
inline fill_logon_conf_message(logon_conf_message_record, logon_conf_message_value) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = logon_conf_message_value; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 2 -> logon_conf_message_record.schema_version[logon_conf_message_at] = logon_conf_message_value; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logon Conf Message set to where it lies, so a field read out of place says so */
inline ramp_logon_conf_message(logon_conf_message_record, logon_conf_message_base) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = (logon_conf_message_base + 0 + logon_conf_message_at + 1) % 256; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 2 -> logon_conf_message_record.schema_version[logon_conf_message_at] = (logon_conf_message_base + 4 + logon_conf_message_at + 1) % 256; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Conf Message to the wire, 6 bytes from where the cursor stands */
inline encode_logon_conf_message(logon_conf_message_record) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> wire[at] = logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 2 -> wire[at] = logon_conf_message_record.schema_version[logon_conf_message_at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* Logon Conf Message off the wire, 6 bytes from where the cursor stands */
inline decode_logon_conf_message(logon_conf_message_record) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> logon_conf_message_record.heartbeat_interval_seconds[logon_conf_message_at] = wire[at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 2 -> logon_conf_message_record.schema_version[logon_conf_message_at] = wire[at]; at = at + 1; logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logon Conf Message is what was written, byte for byte */
inline equal_logon_conf_message(logon_conf_message_read, logon_conf_message_written) {
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 4 -> assert(logon_conf_message_read.heartbeat_interval_seconds[logon_conf_message_at] == logon_conf_message_written.heartbeat_interval_seconds[logon_conf_message_at]); logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  logon_conf_message_at = 0;
  do
  :: logon_conf_message_at < 2 -> assert(logon_conf_message_read.schema_version[logon_conf_message_at] == logon_conf_message_written.schema_version[logon_conf_message_at]); logon_conf_message_at = logon_conf_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 8 bytes ---------------------------------------------- */

/* HeartbeatMessage */
typedef HeartbeatMessage {
  byte correlation_id[8]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 8 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> wire[at] = heartbeat_message_record.correlation_id[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 8 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> heartbeat_message_record.correlation_id[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 8 -> assert(heartbeat_message_read.correlation_id[heartbeat_message_at] == heartbeat_message_written.correlation_id[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Test Request Message: 8 bytes ------------------------------------------- */

/* TestRequestMessage */
typedef TestRequestMessage {
  byte correlation_id[8]
};

int test_request_message_at;

/* every byte of Test Request Message set to one value */
inline fill_test_request_message(test_request_message_record, test_request_message_value) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = test_request_message_value; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Test Request Message set to where it lies, so a field read out of place says so */
inline ramp_test_request_message(test_request_message_record, test_request_message_base) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = (test_request_message_base + 0 + test_request_message_at + 1) % 256; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Request Message to the wire, 8 bytes from where the cursor stands */
inline encode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> wire[at] = test_request_message_record.correlation_id[test_request_message_at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Test Request Message off the wire, 8 bytes from where the cursor stands */
inline decode_test_request_message(test_request_message_record) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> test_request_message_record.correlation_id[test_request_message_at] = wire[at]; at = at + 1; test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Test Request Message is what was written, byte for byte */
inline equal_test_request_message(test_request_message_read, test_request_message_written) {
  test_request_message_at = 0;
  do
  :: test_request_message_at < 8 -> assert(test_request_message_read.correlation_id[test_request_message_at] == test_request_message_written.correlation_id[test_request_message_at]); test_request_message_at = test_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Resend Request Message: 16 bytes ---------------------------------------- */

/* ResendRequestMessage */
typedef ResendRequestMessage {
  byte from_sequence_number[8];
  byte to_sequence_number[8]
};

int resend_request_message_at;

/* every byte of Resend Request Message set to one value */
inline fill_resend_request_message(resend_request_message_record, resend_request_message_value) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = resend_request_message_value; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Resend Request Message set to where it lies, so a field read out of place says so */
inline ramp_resend_request_message(resend_request_message_record, resend_request_message_base) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = (resend_request_message_base + 0 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = (resend_request_message_base + 8 + resend_request_message_at + 1) % 256; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> wire[at] = resend_request_message_record.from_sequence_number[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> wire[at] = resend_request_message_record.to_sequence_number[resend_request_message_at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Resend Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_resend_request_message(resend_request_message_record) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.from_sequence_number[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> resend_request_message_record.to_sequence_number[resend_request_message_at] = wire[at]; at = at + 1; resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Resend Request Message is what was written, byte for byte */
inline equal_resend_request_message(resend_request_message_read, resend_request_message_written) {
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> assert(resend_request_message_read.from_sequence_number[resend_request_message_at] == resend_request_message_written.from_sequence_number[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  resend_request_message_at = 0;
  do
  :: resend_request_message_at < 8 -> assert(resend_request_message_read.to_sequence_number[resend_request_message_at] == resend_request_message_written.to_sequence_number[resend_request_message_at]); resend_request_message_at = resend_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Gap Fill Message: 8 bytes ----------------------------------------------- */

/* GapFillMessage */
typedef GapFillMessage {
  byte new_sequence_number[8]
};

int gap_fill_message_at;

/* every byte of Gap Fill Message set to one value */
inline fill_gap_fill_message(gap_fill_message_record, gap_fill_message_value) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 8 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = gap_fill_message_value; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Gap Fill Message set to where it lies, so a field read out of place says so */
inline ramp_gap_fill_message(gap_fill_message_record, gap_fill_message_base) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 8 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = (gap_fill_message_base + 0 + gap_fill_message_at + 1) % 256; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Fill Message to the wire, 8 bytes from where the cursor stands */
inline encode_gap_fill_message(gap_fill_message_record) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 8 -> wire[at] = gap_fill_message_record.new_sequence_number[gap_fill_message_at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* Gap Fill Message off the wire, 8 bytes from where the cursor stands */
inline decode_gap_fill_message(gap_fill_message_record) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 8 -> gap_fill_message_record.new_sequence_number[gap_fill_message_at] = wire[at]; at = at + 1; gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Gap Fill Message is what was written, byte for byte */
inline equal_gap_fill_message(gap_fill_message_read, gap_fill_message_written) {
  gap_fill_message_at = 0;
  do
  :: gap_fill_message_at < 8 -> assert(gap_fill_message_read.new_sequence_number[gap_fill_message_at] == gap_fill_message_written.new_sequence_number[gap_fill_message_at]); gap_fill_message_at = gap_fill_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quantity: 9 bytes ------------------------------------------------------- */

/* NewOrderRequestMessage */
typedef Quantity {
  byte mantissa[8];
  byte exponent
};

int quantity_at;

/* every byte of Quantity set to one value */
inline fill_quantity(quantity_record, quantity_value) {
  quantity_at = 0;
  do
  :: quantity_at < 8 -> quantity_record.mantissa[quantity_at] = quantity_value; quantity_at = quantity_at + 1
  :: else -> break
  od;
  quantity_record.exponent = quantity_value;
  skip
}

/* each byte of Quantity set to where it lies, so a field read out of place says so */
inline ramp_quantity(quantity_record, quantity_base) {
  quantity_at = 0;
  do
  :: quantity_at < 8 -> quantity_record.mantissa[quantity_at] = (quantity_base + 0 + quantity_at + 1) % 256; quantity_at = quantity_at + 1
  :: else -> break
  od;
  quantity_record.exponent = (quantity_base + 8 + 1) % 256;
  skip
}

/* Quantity to the wire, 9 bytes from where the cursor stands */
inline encode_quantity(quantity_record) {
  quantity_at = 0;
  do
  :: quantity_at < 8 -> wire[at] = quantity_record.mantissa[quantity_at]; at = at + 1; quantity_at = quantity_at + 1
  :: else -> break
  od;
  wire[at] = quantity_record.exponent; at = at + 1;
  skip
}

/* Quantity off the wire, 9 bytes from where the cursor stands */
inline decode_quantity(quantity_record) {
  quantity_at = 0;
  do
  :: quantity_at < 8 -> quantity_record.mantissa[quantity_at] = wire[at]; at = at + 1; quantity_at = quantity_at + 1
  :: else -> break
  od;
  quantity_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Quantity is what was written, byte for byte */
inline equal_quantity(quantity_read, quantity_written) {
  quantity_at = 0;
  do
  :: quantity_at < 8 -> assert(quantity_read.mantissa[quantity_at] == quantity_written.mantissa[quantity_at]); quantity_at = quantity_at + 1
  :: else -> break
  od;
  assert(quantity_read.exponent == quantity_written.exponent);
  skip
}

/* ---- Show Qty: 9 bytes ------------------------------------------------------- */

/* NewOrderRequestMessage */
typedef ShowQty {
  byte mantissa[8];
  byte exponent
};

int show_qty_at;

/* every byte of Show Qty set to one value */
inline fill_show_qty(show_qty_record, show_qty_value) {
  show_qty_at = 0;
  do
  :: show_qty_at < 8 -> show_qty_record.mantissa[show_qty_at] = show_qty_value; show_qty_at = show_qty_at + 1
  :: else -> break
  od;
  show_qty_record.exponent = show_qty_value;
  skip
}

/* each byte of Show Qty set to where it lies, so a field read out of place says so */
inline ramp_show_qty(show_qty_record, show_qty_base) {
  show_qty_at = 0;
  do
  :: show_qty_at < 8 -> show_qty_record.mantissa[show_qty_at] = (show_qty_base + 0 + show_qty_at + 1) % 256; show_qty_at = show_qty_at + 1
  :: else -> break
  od;
  show_qty_record.exponent = (show_qty_base + 8 + 1) % 256;
  skip
}

/* Show Qty to the wire, 9 bytes from where the cursor stands */
inline encode_show_qty(show_qty_record) {
  show_qty_at = 0;
  do
  :: show_qty_at < 8 -> wire[at] = show_qty_record.mantissa[show_qty_at]; at = at + 1; show_qty_at = show_qty_at + 1
  :: else -> break
  od;
  wire[at] = show_qty_record.exponent; at = at + 1;
  skip
}

/* Show Qty off the wire, 9 bytes from where the cursor stands */
inline decode_show_qty(show_qty_record) {
  show_qty_at = 0;
  do
  :: show_qty_at < 8 -> show_qty_record.mantissa[show_qty_at] = wire[at]; at = at + 1; show_qty_at = show_qty_at + 1
  :: else -> break
  od;
  show_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Show Qty is what was written, byte for byte */
inline equal_show_qty(show_qty_read, show_qty_written) {
  show_qty_at = 0;
  do
  :: show_qty_at < 8 -> assert(show_qty_read.mantissa[show_qty_at] == show_qty_written.mantissa[show_qty_at]); show_qty_at = show_qty_at + 1
  :: else -> break
  od;
  assert(show_qty_read.exponent == show_qty_written.exponent);
  skip
}

/* ---- Cancel Order Request Message: 24 bytes ---------------------------------- */

/* CancelOrderRequestMessage */
typedef CancelOrderRequestMessage {
  byte client_order_id[8];
  byte correlation_id[8];
  byte instrument_id[8]
};

int cancel_order_request_message_at;

/* every byte of Cancel Order Request Message set to one value */
inline fill_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_value) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.correlation_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.instrument_id[cancel_order_request_message_at] = cancel_order_request_message_value; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_request_message(cancel_order_request_message_record, cancel_order_request_message_base) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 0 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.correlation_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 8 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.instrument_id[cancel_order_request_message_at] = (cancel_order_request_message_base + 16 + cancel_order_request_message_at + 1) % 256; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message to the wire, 24 bytes from where the cursor stands */
inline encode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.client_order_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.correlation_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> wire[at] = cancel_order_request_message_record.instrument_id[cancel_order_request_message_at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Request Message off the wire, 24 bytes from where the cursor stands */
inline decode_cancel_order_request_message(cancel_order_request_message_record) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.client_order_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.correlation_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> cancel_order_request_message_record.instrument_id[cancel_order_request_message_at] = wire[at]; at = at + 1; cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Request Message is what was written, byte for byte */
inline equal_cancel_order_request_message(cancel_order_request_message_read, cancel_order_request_message_written) {
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.client_order_id[cancel_order_request_message_at] == cancel_order_request_message_written.client_order_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.correlation_id[cancel_order_request_message_at] == cancel_order_request_message_written.correlation_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  cancel_order_request_message_at = 0;
  do
  :: cancel_order_request_message_at < 8 -> assert(cancel_order_request_message_read.instrument_id[cancel_order_request_message_at] == cancel_order_request_message_written.instrument_id[cancel_order_request_message_at]); cancel_order_request_message_at = cancel_order_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Cancel Order By Id Request Message: 24 bytes ---------------------------- */

/* CancelOrderByIdRequestMessage */
typedef CancelOrderByIdRequestMessage {
  byte order_id[8];
  byte correlation_id[8];
  byte instrument_id[8]
};

int cancel_order_by_id_request_message_at;

/* every byte of Cancel Order By Id Request Message set to one value */
inline fill_cancel_order_by_id_request_message(cancel_order_by_id_request_message_record, cancel_order_by_id_request_message_value) {
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.order_id[cancel_order_by_id_request_message_at] = cancel_order_by_id_request_message_value; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.correlation_id[cancel_order_by_id_request_message_at] = cancel_order_by_id_request_message_value; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.instrument_id[cancel_order_by_id_request_message_at] = cancel_order_by_id_request_message_value; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order By Id Request Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_by_id_request_message(cancel_order_by_id_request_message_record, cancel_order_by_id_request_message_base) {
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.order_id[cancel_order_by_id_request_message_at] = (cancel_order_by_id_request_message_base + 0 + cancel_order_by_id_request_message_at + 1) % 256; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.correlation_id[cancel_order_by_id_request_message_at] = (cancel_order_by_id_request_message_base + 8 + cancel_order_by_id_request_message_at + 1) % 256; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.instrument_id[cancel_order_by_id_request_message_at] = (cancel_order_by_id_request_message_base + 16 + cancel_order_by_id_request_message_at + 1) % 256; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Id Request Message to the wire, 24 bytes from where the cursor stands */
inline encode_cancel_order_by_id_request_message(cancel_order_by_id_request_message_record) {
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> wire[at] = cancel_order_by_id_request_message_record.order_id[cancel_order_by_id_request_message_at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> wire[at] = cancel_order_by_id_request_message_record.correlation_id[cancel_order_by_id_request_message_at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> wire[at] = cancel_order_by_id_request_message_record.instrument_id[cancel_order_by_id_request_message_at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order By Id Request Message off the wire, 24 bytes from where the cursor stands */
inline decode_cancel_order_by_id_request_message(cancel_order_by_id_request_message_record) {
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.order_id[cancel_order_by_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.correlation_id[cancel_order_by_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> cancel_order_by_id_request_message_record.instrument_id[cancel_order_by_id_request_message_at] = wire[at]; at = at + 1; cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order By Id Request Message is what was written, byte for byte */
inline equal_cancel_order_by_id_request_message(cancel_order_by_id_request_message_read, cancel_order_by_id_request_message_written) {
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> assert(cancel_order_by_id_request_message_read.order_id[cancel_order_by_id_request_message_at] == cancel_order_by_id_request_message_written.order_id[cancel_order_by_id_request_message_at]); cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> assert(cancel_order_by_id_request_message_read.correlation_id[cancel_order_by_id_request_message_at] == cancel_order_by_id_request_message_written.correlation_id[cancel_order_by_id_request_message_at]); cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  cancel_order_by_id_request_message_at = 0;
  do
  :: cancel_order_by_id_request_message_at < 8 -> assert(cancel_order_by_id_request_message_read.instrument_id[cancel_order_by_id_request_message_at] == cancel_order_by_id_request_message_written.instrument_id[cancel_order_by_id_request_message_at]); cancel_order_by_id_request_message_at = cancel_order_by_id_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Group Size Encoding: 4 bytes -------------------------------------------- */

/* groupSizeEncoding */
typedef GroupSizeEncoding {
  byte block_length[2];
  byte num_in_group[2]
};

int group_size_encoding_at;

/* every byte of Group Size Encoding set to one value */
inline fill_group_size_encoding(group_size_encoding_record, group_size_encoding_value) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = group_size_encoding_value; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Group Size Encoding set to where it lies, so a field read out of place says so */
inline ramp_group_size_encoding(group_size_encoding_record, group_size_encoding_base) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = (group_size_encoding_base + 0 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = (group_size_encoding_base + 2 + group_size_encoding_at + 1) % 256; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding to the wire, 4 bytes from where the cursor stands */
inline encode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.block_length[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> wire[at] = group_size_encoding_record.num_in_group[group_size_encoding_at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* Group Size Encoding off the wire, 4 bytes from where the cursor stands */
inline decode_group_size_encoding(group_size_encoding_record) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.block_length[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> group_size_encoding_record.num_in_group[group_size_encoding_at] = wire[at]; at = at + 1; group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Group Size Encoding is what was written, byte for byte */
inline equal_group_size_encoding(group_size_encoding_read, group_size_encoding_written) {
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.block_length[group_size_encoding_at] == group_size_encoding_written.block_length[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  group_size_encoding_at = 0;
  do
  :: group_size_encoding_at < 2 -> assert(group_size_encoding_read.num_in_group[group_size_encoding_at] == group_size_encoding_written.num_in_group[group_size_encoding_at]); group_size_encoding_at = group_size_encoding_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Qty: 9 bytes -------------------------------------------------------- */

/* quotes */
typedef BidQty {
  byte mantissa[8];
  byte exponent
};

int bid_qty_at;

/* every byte of Bid Qty set to one value */
inline fill_bid_qty(bid_qty_record, bid_qty_value) {
  bid_qty_at = 0;
  do
  :: bid_qty_at < 8 -> bid_qty_record.mantissa[bid_qty_at] = bid_qty_value; bid_qty_at = bid_qty_at + 1
  :: else -> break
  od;
  bid_qty_record.exponent = bid_qty_value;
  skip
}

/* each byte of Bid Qty set to where it lies, so a field read out of place says so */
inline ramp_bid_qty(bid_qty_record, bid_qty_base) {
  bid_qty_at = 0;
  do
  :: bid_qty_at < 8 -> bid_qty_record.mantissa[bid_qty_at] = (bid_qty_base + 0 + bid_qty_at + 1) % 256; bid_qty_at = bid_qty_at + 1
  :: else -> break
  od;
  bid_qty_record.exponent = (bid_qty_base + 8 + 1) % 256;
  skip
}

/* Bid Qty to the wire, 9 bytes from where the cursor stands */
inline encode_bid_qty(bid_qty_record) {
  bid_qty_at = 0;
  do
  :: bid_qty_at < 8 -> wire[at] = bid_qty_record.mantissa[bid_qty_at]; at = at + 1; bid_qty_at = bid_qty_at + 1
  :: else -> break
  od;
  wire[at] = bid_qty_record.exponent; at = at + 1;
  skip
}

/* Bid Qty off the wire, 9 bytes from where the cursor stands */
inline decode_bid_qty(bid_qty_record) {
  bid_qty_at = 0;
  do
  :: bid_qty_at < 8 -> bid_qty_record.mantissa[bid_qty_at] = wire[at]; at = at + 1; bid_qty_at = bid_qty_at + 1
  :: else -> break
  od;
  bid_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Bid Qty is what was written, byte for byte */
inline equal_bid_qty(bid_qty_read, bid_qty_written) {
  bid_qty_at = 0;
  do
  :: bid_qty_at < 8 -> assert(bid_qty_read.mantissa[bid_qty_at] == bid_qty_written.mantissa[bid_qty_at]); bid_qty_at = bid_qty_at + 1
  :: else -> break
  od;
  assert(bid_qty_read.exponent == bid_qty_written.exponent);
  skip
}

/* ---- Ask Qty: 9 bytes -------------------------------------------------------- */

/* quotes */
typedef AskQty {
  byte mantissa[8];
  byte exponent
};

int ask_qty_at;

/* every byte of Ask Qty set to one value */
inline fill_ask_qty(ask_qty_record, ask_qty_value) {
  ask_qty_at = 0;
  do
  :: ask_qty_at < 8 -> ask_qty_record.mantissa[ask_qty_at] = ask_qty_value; ask_qty_at = ask_qty_at + 1
  :: else -> break
  od;
  ask_qty_record.exponent = ask_qty_value;
  skip
}

/* each byte of Ask Qty set to where it lies, so a field read out of place says so */
inline ramp_ask_qty(ask_qty_record, ask_qty_base) {
  ask_qty_at = 0;
  do
  :: ask_qty_at < 8 -> ask_qty_record.mantissa[ask_qty_at] = (ask_qty_base + 0 + ask_qty_at + 1) % 256; ask_qty_at = ask_qty_at + 1
  :: else -> break
  od;
  ask_qty_record.exponent = (ask_qty_base + 8 + 1) % 256;
  skip
}

/* Ask Qty to the wire, 9 bytes from where the cursor stands */
inline encode_ask_qty(ask_qty_record) {
  ask_qty_at = 0;
  do
  :: ask_qty_at < 8 -> wire[at] = ask_qty_record.mantissa[ask_qty_at]; at = at + 1; ask_qty_at = ask_qty_at + 1
  :: else -> break
  od;
  wire[at] = ask_qty_record.exponent; at = at + 1;
  skip
}

/* Ask Qty off the wire, 9 bytes from where the cursor stands */
inline decode_ask_qty(ask_qty_record) {
  ask_qty_at = 0;
  do
  :: ask_qty_at < 8 -> ask_qty_record.mantissa[ask_qty_at] = wire[at]; at = at + 1; ask_qty_at = ask_qty_at + 1
  :: else -> break
  od;
  ask_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Ask Qty is what was written, byte for byte */
inline equal_ask_qty(ask_qty_read, ask_qty_written) {
  ask_qty_at = 0;
  do
  :: ask_qty_at < 8 -> assert(ask_qty_read.mantissa[ask_qty_at] == ask_qty_written.mantissa[ask_qty_at]); ask_qty_at = ask_qty_at + 1
  :: else -> break
  od;
  assert(ask_qty_read.exponent == ask_qty_written.exponent);
  skip
}

/* ---- Mass Cancel Request Message: 26 bytes ----------------------------------- */

/* MassCancelRequestMessage */
typedef MassCancelRequestMessage {
  byte correlation_id[8];
  byte currency_pair_id[8];
  byte instrument_id_optional[8];
  byte product_type;
  byte side
};

int mass_cancel_request_message_at;

/* every byte of Mass Cancel Request Message set to one value */
inline fill_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_value) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.correlation_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.currency_pair_id[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.instrument_id_optional[mass_cancel_request_message_at] = mass_cancel_request_message_value; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.product_type = mass_cancel_request_message_value;
  mass_cancel_request_message_record.side = mass_cancel_request_message_value;
  skip
}

/* each byte of Mass Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_request_message(mass_cancel_request_message_record, mass_cancel_request_message_base) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.correlation_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 0 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.currency_pair_id[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 8 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.instrument_id_optional[mass_cancel_request_message_at] = (mass_cancel_request_message_base + 16 + mass_cancel_request_message_at + 1) % 256; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.product_type = (mass_cancel_request_message_base + 24 + 1) % 256;
  mass_cancel_request_message_record.side = (mass_cancel_request_message_base + 25 + 1) % 256;
  skip
}

/* Mass Cancel Request Message to the wire, 26 bytes from where the cursor stands */
inline encode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.correlation_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.currency_pair_id[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> wire[at] = mass_cancel_request_message_record.instrument_id_optional[mass_cancel_request_message_at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_cancel_request_message_record.product_type; at = at + 1;
  wire[at] = mass_cancel_request_message_record.side; at = at + 1;
  skip
}

/* Mass Cancel Request Message off the wire, 26 bytes from where the cursor stands */
inline decode_mass_cancel_request_message(mass_cancel_request_message_record) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.correlation_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.currency_pair_id[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> mass_cancel_request_message_record.instrument_id_optional[mass_cancel_request_message_at] = wire[at]; at = at + 1; mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_record.product_type = wire[at]; at = at + 1;
  mass_cancel_request_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Cancel Request Message is what was written, byte for byte */
inline equal_mass_cancel_request_message(mass_cancel_request_message_read, mass_cancel_request_message_written) {
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.correlation_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.correlation_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.currency_pair_id[mass_cancel_request_message_at] == mass_cancel_request_message_written.currency_pair_id[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_cancel_request_message_at = 0;
  do
  :: mass_cancel_request_message_at < 8 -> assert(mass_cancel_request_message_read.instrument_id_optional[mass_cancel_request_message_at] == mass_cancel_request_message_written.instrument_id_optional[mass_cancel_request_message_at]); mass_cancel_request_message_at = mass_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(mass_cancel_request_message_read.product_type == mass_cancel_request_message_written.product_type);
  assert(mass_cancel_request_message_read.side == mass_cancel_request_message_written.side);
  skip
}

/* ---- Mass Quote Cancel Request Message: 17 bytes ----------------------------- */

/* MassQuoteCancelRequestMessage */
typedef MassQuoteCancelRequestMessage {
  byte correlation_id[8];
  byte mmp_group_id[8];
  byte side
};

int mass_quote_cancel_request_message_at;

/* every byte of Mass Quote Cancel Request Message set to one value */
inline fill_mass_quote_cancel_request_message(mass_quote_cancel_request_message_record, mass_quote_cancel_request_message_value) {
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.correlation_id[mass_quote_cancel_request_message_at] = mass_quote_cancel_request_message_value; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.mmp_group_id[mass_quote_cancel_request_message_at] = mass_quote_cancel_request_message_value; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_record.side = mass_quote_cancel_request_message_value;
  skip
}

/* each byte of Mass Quote Cancel Request Message set to where it lies, so a field read out of place says so */
inline ramp_mass_quote_cancel_request_message(mass_quote_cancel_request_message_record, mass_quote_cancel_request_message_base) {
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.correlation_id[mass_quote_cancel_request_message_at] = (mass_quote_cancel_request_message_base + 0 + mass_quote_cancel_request_message_at + 1) % 256; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.mmp_group_id[mass_quote_cancel_request_message_at] = (mass_quote_cancel_request_message_base + 8 + mass_quote_cancel_request_message_at + 1) % 256; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_record.side = (mass_quote_cancel_request_message_base + 16 + 1) % 256;
  skip
}

/* Mass Quote Cancel Request Message to the wire, 17 bytes from where the cursor stands */
inline encode_mass_quote_cancel_request_message(mass_quote_cancel_request_message_record) {
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> wire[at] = mass_quote_cancel_request_message_record.correlation_id[mass_quote_cancel_request_message_at]; at = at + 1; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> wire[at] = mass_quote_cancel_request_message_record.mmp_group_id[mass_quote_cancel_request_message_at]; at = at + 1; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_quote_cancel_request_message_record.side; at = at + 1;
  skip
}

/* Mass Quote Cancel Request Message off the wire, 17 bytes from where the cursor stands */
inline decode_mass_quote_cancel_request_message(mass_quote_cancel_request_message_record) {
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.correlation_id[mass_quote_cancel_request_message_at] = wire[at]; at = at + 1; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> mass_quote_cancel_request_message_record.mmp_group_id[mass_quote_cancel_request_message_at] = wire[at]; at = at + 1; mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_record.side = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Quote Cancel Request Message is what was written, byte for byte */
inline equal_mass_quote_cancel_request_message(mass_quote_cancel_request_message_read, mass_quote_cancel_request_message_written) {
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> assert(mass_quote_cancel_request_message_read.correlation_id[mass_quote_cancel_request_message_at] == mass_quote_cancel_request_message_written.correlation_id[mass_quote_cancel_request_message_at]); mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  mass_quote_cancel_request_message_at = 0;
  do
  :: mass_quote_cancel_request_message_at < 8 -> assert(mass_quote_cancel_request_message_read.mmp_group_id[mass_quote_cancel_request_message_at] == mass_quote_cancel_request_message_written.mmp_group_id[mass_quote_cancel_request_message_at]); mass_quote_cancel_request_message_at = mass_quote_cancel_request_message_at + 1
  :: else -> break
  od;
  assert(mass_quote_cancel_request_message_read.side == mass_quote_cancel_request_message_written.side);
  skip
}

/* ---- Get Mass Quote Mmp Status Request Message: 16 bytes --------------------- */

/* GetMassQuoteMmpStatusRequestMessage */
typedef GetMassQuoteMmpStatusRequestMessage {
  byte correlation_id[8];
  byte mmp_group_id[8]
};

int get_mass_quote_mmp_status_request_message_at;

/* every byte of Get Mass Quote Mmp Status Request Message set to one value */
inline fill_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_record, get_mass_quote_mmp_status_request_message_value) {
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.correlation_id[get_mass_quote_mmp_status_request_message_at] = get_mass_quote_mmp_status_request_message_value; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.mmp_group_id[get_mass_quote_mmp_status_request_message_at] = get_mass_quote_mmp_status_request_message_value; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Get Mass Quote Mmp Status Request Message set to where it lies, so a field read out of place says so */
inline ramp_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_record, get_mass_quote_mmp_status_request_message_base) {
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.correlation_id[get_mass_quote_mmp_status_request_message_at] = (get_mass_quote_mmp_status_request_message_base + 0 + get_mass_quote_mmp_status_request_message_at + 1) % 256; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.mmp_group_id[get_mass_quote_mmp_status_request_message_at] = (get_mass_quote_mmp_status_request_message_base + 8 + get_mass_quote_mmp_status_request_message_at + 1) % 256; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Mass Quote Mmp Status Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_record) {
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_request_message_record.correlation_id[get_mass_quote_mmp_status_request_message_at]; at = at + 1; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_request_message_record.mmp_group_id[get_mass_quote_mmp_status_request_message_at]; at = at + 1; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Mass Quote Mmp Status Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_record) {
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.correlation_id[get_mass_quote_mmp_status_request_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> get_mass_quote_mmp_status_request_message_record.mmp_group_id[get_mass_quote_mmp_status_request_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Get Mass Quote Mmp Status Request Message is what was written, byte for byte */
inline equal_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_read, get_mass_quote_mmp_status_request_message_written) {
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> assert(get_mass_quote_mmp_status_request_message_read.correlation_id[get_mass_quote_mmp_status_request_message_at] == get_mass_quote_mmp_status_request_message_written.correlation_id[get_mass_quote_mmp_status_request_message_at]); get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_request_message_at = 0;
  do
  :: get_mass_quote_mmp_status_request_message_at < 8 -> assert(get_mass_quote_mmp_status_request_message_read.mmp_group_id[get_mass_quote_mmp_status_request_message_at] == get_mass_quote_mmp_status_request_message_written.mmp_group_id[get_mass_quote_mmp_status_request_message_at]); get_mass_quote_mmp_status_request_message_at = get_mass_quote_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Get Orders Mmp Status Request Message: 16 bytes ------------------------- */

/* GetOrdersMmpStatusRequestMessage */
typedef GetOrdersMmpStatusRequestMessage {
  byte correlation_id[8];
  byte currency_pair_id[8]
};

int get_orders_mmp_status_request_message_at;

/* every byte of Get Orders Mmp Status Request Message set to one value */
inline fill_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_record, get_orders_mmp_status_request_message_value) {
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.correlation_id[get_orders_mmp_status_request_message_at] = get_orders_mmp_status_request_message_value; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.currency_pair_id[get_orders_mmp_status_request_message_at] = get_orders_mmp_status_request_message_value; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Get Orders Mmp Status Request Message set to where it lies, so a field read out of place says so */
inline ramp_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_record, get_orders_mmp_status_request_message_base) {
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.correlation_id[get_orders_mmp_status_request_message_at] = (get_orders_mmp_status_request_message_base + 0 + get_orders_mmp_status_request_message_at + 1) % 256; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.currency_pair_id[get_orders_mmp_status_request_message_at] = (get_orders_mmp_status_request_message_base + 8 + get_orders_mmp_status_request_message_at + 1) % 256; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Orders Mmp Status Request Message to the wire, 16 bytes from where the cursor stands */
inline encode_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_record) {
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> wire[at] = get_orders_mmp_status_request_message_record.correlation_id[get_orders_mmp_status_request_message_at]; at = at + 1; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> wire[at] = get_orders_mmp_status_request_message_record.currency_pair_id[get_orders_mmp_status_request_message_at]; at = at + 1; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Orders Mmp Status Request Message off the wire, 16 bytes from where the cursor stands */
inline decode_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_record) {
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.correlation_id[get_orders_mmp_status_request_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> get_orders_mmp_status_request_message_record.currency_pair_id[get_orders_mmp_status_request_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Get Orders Mmp Status Request Message is what was written, byte for byte */
inline equal_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_read, get_orders_mmp_status_request_message_written) {
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> assert(get_orders_mmp_status_request_message_read.correlation_id[get_orders_mmp_status_request_message_at] == get_orders_mmp_status_request_message_written.correlation_id[get_orders_mmp_status_request_message_at]); get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_request_message_at = 0;
  do
  :: get_orders_mmp_status_request_message_at < 8 -> assert(get_orders_mmp_status_request_message_read.currency_pair_id[get_orders_mmp_status_request_message_at] == get_orders_mmp_status_request_message_written.currency_pair_id[get_orders_mmp_status_request_message_at]); get_orders_mmp_status_request_message_at = get_orders_mmp_status_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Total Filled: 9 bytes --------------------------------------------------- */

/* NewOrderResponseMessage */
typedef TotalFilled {
  byte mantissa[8];
  byte exponent
};

int total_filled_at;

/* every byte of Total Filled set to one value */
inline fill_total_filled(total_filled_record, total_filled_value) {
  total_filled_at = 0;
  do
  :: total_filled_at < 8 -> total_filled_record.mantissa[total_filled_at] = total_filled_value; total_filled_at = total_filled_at + 1
  :: else -> break
  od;
  total_filled_record.exponent = total_filled_value;
  skip
}

/* each byte of Total Filled set to where it lies, so a field read out of place says so */
inline ramp_total_filled(total_filled_record, total_filled_base) {
  total_filled_at = 0;
  do
  :: total_filled_at < 8 -> total_filled_record.mantissa[total_filled_at] = (total_filled_base + 0 + total_filled_at + 1) % 256; total_filled_at = total_filled_at + 1
  :: else -> break
  od;
  total_filled_record.exponent = (total_filled_base + 8 + 1) % 256;
  skip
}

/* Total Filled to the wire, 9 bytes from where the cursor stands */
inline encode_total_filled(total_filled_record) {
  total_filled_at = 0;
  do
  :: total_filled_at < 8 -> wire[at] = total_filled_record.mantissa[total_filled_at]; at = at + 1; total_filled_at = total_filled_at + 1
  :: else -> break
  od;
  wire[at] = total_filled_record.exponent; at = at + 1;
  skip
}

/* Total Filled off the wire, 9 bytes from where the cursor stands */
inline decode_total_filled(total_filled_record) {
  total_filled_at = 0;
  do
  :: total_filled_at < 8 -> total_filled_record.mantissa[total_filled_at] = wire[at]; at = at + 1; total_filled_at = total_filled_at + 1
  :: else -> break
  od;
  total_filled_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Total Filled is what was written, byte for byte */
inline equal_total_filled(total_filled_read, total_filled_written) {
  total_filled_at = 0;
  do
  :: total_filled_at < 8 -> assert(total_filled_read.mantissa[total_filled_at] == total_filled_written.mantissa[total_filled_at]); total_filled_at = total_filled_at + 1
  :: else -> break
  od;
  assert(total_filled_read.exponent == total_filled_written.exponent);
  skip
}

/* ---- Visible Qty: 9 bytes ---------------------------------------------------- */

/* NewOrderResponseMessage */
typedef VisibleQty {
  byte mantissa[8];
  byte exponent
};

int visible_qty_at;

/* every byte of Visible Qty set to one value */
inline fill_visible_qty(visible_qty_record, visible_qty_value) {
  visible_qty_at = 0;
  do
  :: visible_qty_at < 8 -> visible_qty_record.mantissa[visible_qty_at] = visible_qty_value; visible_qty_at = visible_qty_at + 1
  :: else -> break
  od;
  visible_qty_record.exponent = visible_qty_value;
  skip
}

/* each byte of Visible Qty set to where it lies, so a field read out of place says so */
inline ramp_visible_qty(visible_qty_record, visible_qty_base) {
  visible_qty_at = 0;
  do
  :: visible_qty_at < 8 -> visible_qty_record.mantissa[visible_qty_at] = (visible_qty_base + 0 + visible_qty_at + 1) % 256; visible_qty_at = visible_qty_at + 1
  :: else -> break
  od;
  visible_qty_record.exponent = (visible_qty_base + 8 + 1) % 256;
  skip
}

/* Visible Qty to the wire, 9 bytes from where the cursor stands */
inline encode_visible_qty(visible_qty_record) {
  visible_qty_at = 0;
  do
  :: visible_qty_at < 8 -> wire[at] = visible_qty_record.mantissa[visible_qty_at]; at = at + 1; visible_qty_at = visible_qty_at + 1
  :: else -> break
  od;
  wire[at] = visible_qty_record.exponent; at = at + 1;
  skip
}

/* Visible Qty off the wire, 9 bytes from where the cursor stands */
inline decode_visible_qty(visible_qty_record) {
  visible_qty_at = 0;
  do
  :: visible_qty_at < 8 -> visible_qty_record.mantissa[visible_qty_at] = wire[at]; at = at + 1; visible_qty_at = visible_qty_at + 1
  :: else -> break
  od;
  visible_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Visible Qty is what was written, byte for byte */
inline equal_visible_qty(visible_qty_read, visible_qty_written) {
  visible_qty_at = 0;
  do
  :: visible_qty_at < 8 -> assert(visible_qty_read.mantissa[visible_qty_at] == visible_qty_written.mantissa[visible_qty_at]); visible_qty_at = visible_qty_at + 1
  :: else -> break
  od;
  assert(visible_qty_read.exponent == visible_qty_written.exponent);
  skip
}

/* ---- Fill Qty: 9 bytes ------------------------------------------------------- */

/* fills */
typedef FillQty {
  byte mantissa[8];
  byte exponent
};

int fill_qty_at;

/* every byte of Fill Qty set to one value */
inline fill_fill_qty(fill_qty_record, fill_qty_value) {
  fill_qty_at = 0;
  do
  :: fill_qty_at < 8 -> fill_qty_record.mantissa[fill_qty_at] = fill_qty_value; fill_qty_at = fill_qty_at + 1
  :: else -> break
  od;
  fill_qty_record.exponent = fill_qty_value;
  skip
}

/* each byte of Fill Qty set to where it lies, so a field read out of place says so */
inline ramp_fill_qty(fill_qty_record, fill_qty_base) {
  fill_qty_at = 0;
  do
  :: fill_qty_at < 8 -> fill_qty_record.mantissa[fill_qty_at] = (fill_qty_base + 0 + fill_qty_at + 1) % 256; fill_qty_at = fill_qty_at + 1
  :: else -> break
  od;
  fill_qty_record.exponent = (fill_qty_base + 8 + 1) % 256;
  skip
}

/* Fill Qty to the wire, 9 bytes from where the cursor stands */
inline encode_fill_qty(fill_qty_record) {
  fill_qty_at = 0;
  do
  :: fill_qty_at < 8 -> wire[at] = fill_qty_record.mantissa[fill_qty_at]; at = at + 1; fill_qty_at = fill_qty_at + 1
  :: else -> break
  od;
  wire[at] = fill_qty_record.exponent; at = at + 1;
  skip
}

/* Fill Qty off the wire, 9 bytes from where the cursor stands */
inline decode_fill_qty(fill_qty_record) {
  fill_qty_at = 0;
  do
  :: fill_qty_at < 8 -> fill_qty_record.mantissa[fill_qty_at] = wire[at]; at = at + 1; fill_qty_at = fill_qty_at + 1
  :: else -> break
  od;
  fill_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Fill Qty is what was written, byte for byte */
inline equal_fill_qty(fill_qty_read, fill_qty_written) {
  fill_qty_at = 0;
  do
  :: fill_qty_at < 8 -> assert(fill_qty_read.mantissa[fill_qty_at] == fill_qty_written.mantissa[fill_qty_at]); fill_qty_at = fill_qty_at + 1
  :: else -> break
  od;
  assert(fill_qty_read.exponent == fill_qty_written.exponent);
  skip
}

/* ---- Cancel Order Response Message: 56 bytes --------------------------------- */

/* CancelOrderResponseMessage */
typedef CancelOrderResponseMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte client_order_id[8];
  byte correlation_id[8];
  byte order_id[8];
  byte instrument_id[8];
  byte receive_time[8]
};

int cancel_order_response_message_at;

/* every byte of Cancel Order Response Message set to one value */
inline fill_cancel_order_response_message(cancel_order_response_message_record, cancel_order_response_message_value) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.timestamp[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.exec_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.correlation_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.instrument_id[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.receive_time[cancel_order_response_message_at] = cancel_order_response_message_value; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Cancel Order Response Message set to where it lies, so a field read out of place says so */
inline ramp_cancel_order_response_message(cancel_order_response_message_record, cancel_order_response_message_base) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.timestamp[cancel_order_response_message_at] = (cancel_order_response_message_base + 0 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.exec_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 8 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 16 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.correlation_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 24 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 32 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.instrument_id[cancel_order_response_message_at] = (cancel_order_response_message_base + 40 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.receive_time[cancel_order_response_message_at] = (cancel_order_response_message_base + 48 + cancel_order_response_message_at + 1) % 256; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Response Message to the wire, 56 bytes from where the cursor stands */
inline encode_cancel_order_response_message(cancel_order_response_message_record) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.timestamp[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.exec_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.client_order_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.correlation_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.order_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.instrument_id[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> wire[at] = cancel_order_response_message_record.receive_time[cancel_order_response_message_at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Cancel Order Response Message off the wire, 56 bytes from where the cursor stands */
inline decode_cancel_order_response_message(cancel_order_response_message_record) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.timestamp[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.exec_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.client_order_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.correlation_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.order_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.instrument_id[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> cancel_order_response_message_record.receive_time[cancel_order_response_message_at] = wire[at]; at = at + 1; cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Cancel Order Response Message is what was written, byte for byte */
inline equal_cancel_order_response_message(cancel_order_response_message_read, cancel_order_response_message_written) {
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.timestamp[cancel_order_response_message_at] == cancel_order_response_message_written.timestamp[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.exec_id[cancel_order_response_message_at] == cancel_order_response_message_written.exec_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.client_order_id[cancel_order_response_message_at] == cancel_order_response_message_written.client_order_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.correlation_id[cancel_order_response_message_at] == cancel_order_response_message_written.correlation_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.order_id[cancel_order_response_message_at] == cancel_order_response_message_written.order_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.instrument_id[cancel_order_response_message_at] == cancel_order_response_message_written.instrument_id[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  cancel_order_response_message_at = 0;
  do
  :: cancel_order_response_message_at < 8 -> assert(cancel_order_response_message_read.receive_time[cancel_order_response_message_at] == cancel_order_response_message_written.receive_time[cancel_order_response_message_at]); cancel_order_response_message_at = cancel_order_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Filled Qty: 9 bytes ------------------------------------------------- */

/* quotes */
typedef BidFilledQty {
  byte mantissa[8];
  byte exponent
};

int bid_filled_qty_at;

/* every byte of Bid Filled Qty set to one value */
inline fill_bid_filled_qty(bid_filled_qty_record, bid_filled_qty_value) {
  bid_filled_qty_at = 0;
  do
  :: bid_filled_qty_at < 8 -> bid_filled_qty_record.mantissa[bid_filled_qty_at] = bid_filled_qty_value; bid_filled_qty_at = bid_filled_qty_at + 1
  :: else -> break
  od;
  bid_filled_qty_record.exponent = bid_filled_qty_value;
  skip
}

/* each byte of Bid Filled Qty set to where it lies, so a field read out of place says so */
inline ramp_bid_filled_qty(bid_filled_qty_record, bid_filled_qty_base) {
  bid_filled_qty_at = 0;
  do
  :: bid_filled_qty_at < 8 -> bid_filled_qty_record.mantissa[bid_filled_qty_at] = (bid_filled_qty_base + 0 + bid_filled_qty_at + 1) % 256; bid_filled_qty_at = bid_filled_qty_at + 1
  :: else -> break
  od;
  bid_filled_qty_record.exponent = (bid_filled_qty_base + 8 + 1) % 256;
  skip
}

/* Bid Filled Qty to the wire, 9 bytes from where the cursor stands */
inline encode_bid_filled_qty(bid_filled_qty_record) {
  bid_filled_qty_at = 0;
  do
  :: bid_filled_qty_at < 8 -> wire[at] = bid_filled_qty_record.mantissa[bid_filled_qty_at]; at = at + 1; bid_filled_qty_at = bid_filled_qty_at + 1
  :: else -> break
  od;
  wire[at] = bid_filled_qty_record.exponent; at = at + 1;
  skip
}

/* Bid Filled Qty off the wire, 9 bytes from where the cursor stands */
inline decode_bid_filled_qty(bid_filled_qty_record) {
  bid_filled_qty_at = 0;
  do
  :: bid_filled_qty_at < 8 -> bid_filled_qty_record.mantissa[bid_filled_qty_at] = wire[at]; at = at + 1; bid_filled_qty_at = bid_filled_qty_at + 1
  :: else -> break
  od;
  bid_filled_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Bid Filled Qty is what was written, byte for byte */
inline equal_bid_filled_qty(bid_filled_qty_read, bid_filled_qty_written) {
  bid_filled_qty_at = 0;
  do
  :: bid_filled_qty_at < 8 -> assert(bid_filled_qty_read.mantissa[bid_filled_qty_at] == bid_filled_qty_written.mantissa[bid_filled_qty_at]); bid_filled_qty_at = bid_filled_qty_at + 1
  :: else -> break
  od;
  assert(bid_filled_qty_read.exponent == bid_filled_qty_written.exponent);
  skip
}

/* ---- Ask Filled Qty: 9 bytes ------------------------------------------------- */

/* quotes */
typedef AskFilledQty {
  byte mantissa[8];
  byte exponent
};

int ask_filled_qty_at;

/* every byte of Ask Filled Qty set to one value */
inline fill_ask_filled_qty(ask_filled_qty_record, ask_filled_qty_value) {
  ask_filled_qty_at = 0;
  do
  :: ask_filled_qty_at < 8 -> ask_filled_qty_record.mantissa[ask_filled_qty_at] = ask_filled_qty_value; ask_filled_qty_at = ask_filled_qty_at + 1
  :: else -> break
  od;
  ask_filled_qty_record.exponent = ask_filled_qty_value;
  skip
}

/* each byte of Ask Filled Qty set to where it lies, so a field read out of place says so */
inline ramp_ask_filled_qty(ask_filled_qty_record, ask_filled_qty_base) {
  ask_filled_qty_at = 0;
  do
  :: ask_filled_qty_at < 8 -> ask_filled_qty_record.mantissa[ask_filled_qty_at] = (ask_filled_qty_base + 0 + ask_filled_qty_at + 1) % 256; ask_filled_qty_at = ask_filled_qty_at + 1
  :: else -> break
  od;
  ask_filled_qty_record.exponent = (ask_filled_qty_base + 8 + 1) % 256;
  skip
}

/* Ask Filled Qty to the wire, 9 bytes from where the cursor stands */
inline encode_ask_filled_qty(ask_filled_qty_record) {
  ask_filled_qty_at = 0;
  do
  :: ask_filled_qty_at < 8 -> wire[at] = ask_filled_qty_record.mantissa[ask_filled_qty_at]; at = at + 1; ask_filled_qty_at = ask_filled_qty_at + 1
  :: else -> break
  od;
  wire[at] = ask_filled_qty_record.exponent; at = at + 1;
  skip
}

/* Ask Filled Qty off the wire, 9 bytes from where the cursor stands */
inline decode_ask_filled_qty(ask_filled_qty_record) {
  ask_filled_qty_at = 0;
  do
  :: ask_filled_qty_at < 8 -> ask_filled_qty_record.mantissa[ask_filled_qty_at] = wire[at]; at = at + 1; ask_filled_qty_at = ask_filled_qty_at + 1
  :: else -> break
  od;
  ask_filled_qty_record.exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Ask Filled Qty is what was written, byte for byte */
inline equal_ask_filled_qty(ask_filled_qty_read, ask_filled_qty_written) {
  ask_filled_qty_at = 0;
  do
  :: ask_filled_qty_at < 8 -> assert(ask_filled_qty_read.mantissa[ask_filled_qty_at] == ask_filled_qty_written.mantissa[ask_filled_qty_at]); ask_filled_qty_at = ask_filled_qty_at + 1
  :: else -> break
  od;
  assert(ask_filled_qty_read.exponent == ask_filled_qty_written.exponent);
  skip
}

/* ---- Mass Cancel Response Message: 36 bytes ---------------------------------- */

/* MassCancelResponseMessage */
typedef MassCancelResponseMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte correlation_id[8];
  byte receive_time[8];
  byte total_order_count[4]
};

int mass_cancel_response_message_at;

/* every byte of Mass Cancel Response Message set to one value */
inline fill_mass_cancel_response_message(mass_cancel_response_message_record, mass_cancel_response_message_value) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.exec_id[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.correlation_id[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.receive_time[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.total_order_count[mass_cancel_response_message_at] = mass_cancel_response_message_value; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Cancel Response Message set to where it lies, so a field read out of place says so */
inline ramp_mass_cancel_response_message(mass_cancel_response_message_record, mass_cancel_response_message_base) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 0 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.exec_id[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 8 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.correlation_id[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 16 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.receive_time[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 24 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.total_order_count[mass_cancel_response_message_at] = (mass_cancel_response_message_base + 32 + mass_cancel_response_message_at + 1) % 256; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response Message to the wire, 36 bytes from where the cursor stands */
inline encode_mass_cancel_response_message(mass_cancel_response_message_record) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> wire[at] = mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> wire[at] = mass_cancel_response_message_record.exec_id[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> wire[at] = mass_cancel_response_message_record.correlation_id[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> wire[at] = mass_cancel_response_message_record.receive_time[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> wire[at] = mass_cancel_response_message_record.total_order_count[mass_cancel_response_message_at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Cancel Response Message off the wire, 36 bytes from where the cursor stands */
inline decode_mass_cancel_response_message(mass_cancel_response_message_record) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.timestamp[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.exec_id[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.correlation_id[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> mass_cancel_response_message_record.receive_time[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> mass_cancel_response_message_record.total_order_count[mass_cancel_response_message_at] = wire[at]; at = at + 1; mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Cancel Response Message is what was written, byte for byte */
inline equal_mass_cancel_response_message(mass_cancel_response_message_read, mass_cancel_response_message_written) {
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> assert(mass_cancel_response_message_read.timestamp[mass_cancel_response_message_at] == mass_cancel_response_message_written.timestamp[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> assert(mass_cancel_response_message_read.exec_id[mass_cancel_response_message_at] == mass_cancel_response_message_written.exec_id[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> assert(mass_cancel_response_message_read.correlation_id[mass_cancel_response_message_at] == mass_cancel_response_message_written.correlation_id[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 8 -> assert(mass_cancel_response_message_read.receive_time[mass_cancel_response_message_at] == mass_cancel_response_message_written.receive_time[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  mass_cancel_response_message_at = 0;
  do
  :: mass_cancel_response_message_at < 4 -> assert(mass_cancel_response_message_read.total_order_count[mass_cancel_response_message_at] == mass_cancel_response_message_written.total_order_count[mass_cancel_response_message_at]); mass_cancel_response_message_at = mass_cancel_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Get Mass Quote Mmp Status Response Message: 32 bytes -------------------- */

/* GetMassQuoteMmpStatusResponseMessage */
typedef GetMassQuoteMmpStatusResponseMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte mmp_group_id[8];
  byte frozen_until_time[8]
};

int get_mass_quote_mmp_status_response_message_at;

/* every byte of Get Mass Quote Mmp Status Response Message set to one value */
inline fill_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_record, get_mass_quote_mmp_status_response_message_value) {
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.timestamp[get_mass_quote_mmp_status_response_message_at] = get_mass_quote_mmp_status_response_message_value; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.correlation_id[get_mass_quote_mmp_status_response_message_at] = get_mass_quote_mmp_status_response_message_value; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.mmp_group_id[get_mass_quote_mmp_status_response_message_at] = get_mass_quote_mmp_status_response_message_value; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.frozen_until_time[get_mass_quote_mmp_status_response_message_at] = get_mass_quote_mmp_status_response_message_value; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Get Mass Quote Mmp Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_record, get_mass_quote_mmp_status_response_message_base) {
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.timestamp[get_mass_quote_mmp_status_response_message_at] = (get_mass_quote_mmp_status_response_message_base + 0 + get_mass_quote_mmp_status_response_message_at + 1) % 256; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.correlation_id[get_mass_quote_mmp_status_response_message_at] = (get_mass_quote_mmp_status_response_message_base + 8 + get_mass_quote_mmp_status_response_message_at + 1) % 256; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.mmp_group_id[get_mass_quote_mmp_status_response_message_at] = (get_mass_quote_mmp_status_response_message_base + 16 + get_mass_quote_mmp_status_response_message_at + 1) % 256; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.frozen_until_time[get_mass_quote_mmp_status_response_message_at] = (get_mass_quote_mmp_status_response_message_base + 24 + get_mass_quote_mmp_status_response_message_at + 1) % 256; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Mass Quote Mmp Status Response Message to the wire, 32 bytes from where the cursor stands */
inline encode_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_record) {
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_response_message_record.timestamp[get_mass_quote_mmp_status_response_message_at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_response_message_record.correlation_id[get_mass_quote_mmp_status_response_message_at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_response_message_record.mmp_group_id[get_mass_quote_mmp_status_response_message_at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_response_message_record.frozen_until_time[get_mass_quote_mmp_status_response_message_at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Mass Quote Mmp Status Response Message off the wire, 32 bytes from where the cursor stands */
inline decode_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_record) {
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.timestamp[get_mass_quote_mmp_status_response_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.correlation_id[get_mass_quote_mmp_status_response_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.mmp_group_id[get_mass_quote_mmp_status_response_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> get_mass_quote_mmp_status_response_message_record.frozen_until_time[get_mass_quote_mmp_status_response_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Get Mass Quote Mmp Status Response Message is what was written, byte for byte */
inline equal_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_read, get_mass_quote_mmp_status_response_message_written) {
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> assert(get_mass_quote_mmp_status_response_message_read.timestamp[get_mass_quote_mmp_status_response_message_at] == get_mass_quote_mmp_status_response_message_written.timestamp[get_mass_quote_mmp_status_response_message_at]); get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> assert(get_mass_quote_mmp_status_response_message_read.correlation_id[get_mass_quote_mmp_status_response_message_at] == get_mass_quote_mmp_status_response_message_written.correlation_id[get_mass_quote_mmp_status_response_message_at]); get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> assert(get_mass_quote_mmp_status_response_message_read.mmp_group_id[get_mass_quote_mmp_status_response_message_at] == get_mass_quote_mmp_status_response_message_written.mmp_group_id[get_mass_quote_mmp_status_response_message_at]); get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_response_message_at = 0;
  do
  :: get_mass_quote_mmp_status_response_message_at < 8 -> assert(get_mass_quote_mmp_status_response_message_read.frozen_until_time[get_mass_quote_mmp_status_response_message_at] == get_mass_quote_mmp_status_response_message_written.frozen_until_time[get_mass_quote_mmp_status_response_message_at]); get_mass_quote_mmp_status_response_message_at = get_mass_quote_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Get Mass Quote Mmp Status Reject Message: 17 bytes ---------------------- */

/* GetMassQuoteMmpStatusRejectMessage */
typedef GetMassQuoteMmpStatusRejectMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte reason_mmp_status_reject_reason
};

int get_mass_quote_mmp_status_reject_message_at;

/* every byte of Get Mass Quote Mmp Status Reject Message set to one value */
inline fill_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_record, get_mass_quote_mmp_status_reject_message_value) {
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.timestamp[get_mass_quote_mmp_status_reject_message_at] = get_mass_quote_mmp_status_reject_message_value; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.correlation_id[get_mass_quote_mmp_status_reject_message_at] = get_mass_quote_mmp_status_reject_message_value; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_record.reason_mmp_status_reject_reason = get_mass_quote_mmp_status_reject_message_value;
  skip
}

/* each byte of Get Mass Quote Mmp Status Reject Message set to where it lies, so a field read out of place says so */
inline ramp_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_record, get_mass_quote_mmp_status_reject_message_base) {
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.timestamp[get_mass_quote_mmp_status_reject_message_at] = (get_mass_quote_mmp_status_reject_message_base + 0 + get_mass_quote_mmp_status_reject_message_at + 1) % 256; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.correlation_id[get_mass_quote_mmp_status_reject_message_at] = (get_mass_quote_mmp_status_reject_message_base + 8 + get_mass_quote_mmp_status_reject_message_at + 1) % 256; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_record.reason_mmp_status_reject_reason = (get_mass_quote_mmp_status_reject_message_base + 16 + 1) % 256;
  skip
}

/* Get Mass Quote Mmp Status Reject Message to the wire, 17 bytes from where the cursor stands */
inline encode_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_record) {
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_reject_message_record.timestamp[get_mass_quote_mmp_status_reject_message_at]; at = at + 1; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> wire[at] = get_mass_quote_mmp_status_reject_message_record.correlation_id[get_mass_quote_mmp_status_reject_message_at]; at = at + 1; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = get_mass_quote_mmp_status_reject_message_record.reason_mmp_status_reject_reason; at = at + 1;
  skip
}

/* Get Mass Quote Mmp Status Reject Message off the wire, 17 bytes from where the cursor stands */
inline decode_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_record) {
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.timestamp[get_mass_quote_mmp_status_reject_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> get_mass_quote_mmp_status_reject_message_record.correlation_id[get_mass_quote_mmp_status_reject_message_at] = wire[at]; at = at + 1; get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_record.reason_mmp_status_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Get Mass Quote Mmp Status Reject Message is what was written, byte for byte */
inline equal_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_read, get_mass_quote_mmp_status_reject_message_written) {
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> assert(get_mass_quote_mmp_status_reject_message_read.timestamp[get_mass_quote_mmp_status_reject_message_at] == get_mass_quote_mmp_status_reject_message_written.timestamp[get_mass_quote_mmp_status_reject_message_at]); get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_mass_quote_mmp_status_reject_message_at = 0;
  do
  :: get_mass_quote_mmp_status_reject_message_at < 8 -> assert(get_mass_quote_mmp_status_reject_message_read.correlation_id[get_mass_quote_mmp_status_reject_message_at] == get_mass_quote_mmp_status_reject_message_written.correlation_id[get_mass_quote_mmp_status_reject_message_at]); get_mass_quote_mmp_status_reject_message_at = get_mass_quote_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  assert(get_mass_quote_mmp_status_reject_message_read.reason_mmp_status_reject_reason == get_mass_quote_mmp_status_reject_message_written.reason_mmp_status_reject_reason);
  skip
}

/* ---- Get Orders Mmp Status Response Message: 32 bytes ------------------------ */

/* GetOrdersMmpStatusResponseMessage */
typedef GetOrdersMmpStatusResponseMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte currency_pair_id[8];
  byte frozen_until_time[8]
};

int get_orders_mmp_status_response_message_at;

/* every byte of Get Orders Mmp Status Response Message set to one value */
inline fill_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_record, get_orders_mmp_status_response_message_value) {
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.timestamp[get_orders_mmp_status_response_message_at] = get_orders_mmp_status_response_message_value; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.correlation_id[get_orders_mmp_status_response_message_at] = get_orders_mmp_status_response_message_value; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.currency_pair_id[get_orders_mmp_status_response_message_at] = get_orders_mmp_status_response_message_value; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.frozen_until_time[get_orders_mmp_status_response_message_at] = get_orders_mmp_status_response_message_value; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Get Orders Mmp Status Response Message set to where it lies, so a field read out of place says so */
inline ramp_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_record, get_orders_mmp_status_response_message_base) {
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.timestamp[get_orders_mmp_status_response_message_at] = (get_orders_mmp_status_response_message_base + 0 + get_orders_mmp_status_response_message_at + 1) % 256; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.correlation_id[get_orders_mmp_status_response_message_at] = (get_orders_mmp_status_response_message_base + 8 + get_orders_mmp_status_response_message_at + 1) % 256; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.currency_pair_id[get_orders_mmp_status_response_message_at] = (get_orders_mmp_status_response_message_base + 16 + get_orders_mmp_status_response_message_at + 1) % 256; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.frozen_until_time[get_orders_mmp_status_response_message_at] = (get_orders_mmp_status_response_message_base + 24 + get_orders_mmp_status_response_message_at + 1) % 256; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Orders Mmp Status Response Message to the wire, 32 bytes from where the cursor stands */
inline encode_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_record) {
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> wire[at] = get_orders_mmp_status_response_message_record.timestamp[get_orders_mmp_status_response_message_at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> wire[at] = get_orders_mmp_status_response_message_record.correlation_id[get_orders_mmp_status_response_message_at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> wire[at] = get_orders_mmp_status_response_message_record.currency_pair_id[get_orders_mmp_status_response_message_at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> wire[at] = get_orders_mmp_status_response_message_record.frozen_until_time[get_orders_mmp_status_response_message_at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Get Orders Mmp Status Response Message off the wire, 32 bytes from where the cursor stands */
inline decode_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_record) {
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.timestamp[get_orders_mmp_status_response_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.correlation_id[get_orders_mmp_status_response_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.currency_pair_id[get_orders_mmp_status_response_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> get_orders_mmp_status_response_message_record.frozen_until_time[get_orders_mmp_status_response_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Get Orders Mmp Status Response Message is what was written, byte for byte */
inline equal_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_read, get_orders_mmp_status_response_message_written) {
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> assert(get_orders_mmp_status_response_message_read.timestamp[get_orders_mmp_status_response_message_at] == get_orders_mmp_status_response_message_written.timestamp[get_orders_mmp_status_response_message_at]); get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> assert(get_orders_mmp_status_response_message_read.correlation_id[get_orders_mmp_status_response_message_at] == get_orders_mmp_status_response_message_written.correlation_id[get_orders_mmp_status_response_message_at]); get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> assert(get_orders_mmp_status_response_message_read.currency_pair_id[get_orders_mmp_status_response_message_at] == get_orders_mmp_status_response_message_written.currency_pair_id[get_orders_mmp_status_response_message_at]); get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_response_message_at = 0;
  do
  :: get_orders_mmp_status_response_message_at < 8 -> assert(get_orders_mmp_status_response_message_read.frozen_until_time[get_orders_mmp_status_response_message_at] == get_orders_mmp_status_response_message_written.frozen_until_time[get_orders_mmp_status_response_message_at]); get_orders_mmp_status_response_message_at = get_orders_mmp_status_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Get Orders Mmp Status Reject Message: 17 bytes -------------------------- */

/* GetOrdersMmpStatusRejectMessage */
typedef GetOrdersMmpStatusRejectMessage {
  byte timestamp[8];
  byte correlation_id[8];
  byte reason_mmp_status_reject_reason
};

int get_orders_mmp_status_reject_message_at;

/* every byte of Get Orders Mmp Status Reject Message set to one value */
inline fill_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_record, get_orders_mmp_status_reject_message_value) {
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.timestamp[get_orders_mmp_status_reject_message_at] = get_orders_mmp_status_reject_message_value; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.correlation_id[get_orders_mmp_status_reject_message_at] = get_orders_mmp_status_reject_message_value; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_record.reason_mmp_status_reject_reason = get_orders_mmp_status_reject_message_value;
  skip
}

/* each byte of Get Orders Mmp Status Reject Message set to where it lies, so a field read out of place says so */
inline ramp_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_record, get_orders_mmp_status_reject_message_base) {
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.timestamp[get_orders_mmp_status_reject_message_at] = (get_orders_mmp_status_reject_message_base + 0 + get_orders_mmp_status_reject_message_at + 1) % 256; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.correlation_id[get_orders_mmp_status_reject_message_at] = (get_orders_mmp_status_reject_message_base + 8 + get_orders_mmp_status_reject_message_at + 1) % 256; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_record.reason_mmp_status_reject_reason = (get_orders_mmp_status_reject_message_base + 16 + 1) % 256;
  skip
}

/* Get Orders Mmp Status Reject Message to the wire, 17 bytes from where the cursor stands */
inline encode_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_record) {
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> wire[at] = get_orders_mmp_status_reject_message_record.timestamp[get_orders_mmp_status_reject_message_at]; at = at + 1; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> wire[at] = get_orders_mmp_status_reject_message_record.correlation_id[get_orders_mmp_status_reject_message_at]; at = at + 1; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = get_orders_mmp_status_reject_message_record.reason_mmp_status_reject_reason; at = at + 1;
  skip
}

/* Get Orders Mmp Status Reject Message off the wire, 17 bytes from where the cursor stands */
inline decode_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_record) {
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.timestamp[get_orders_mmp_status_reject_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> get_orders_mmp_status_reject_message_record.correlation_id[get_orders_mmp_status_reject_message_at] = wire[at]; at = at + 1; get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_record.reason_mmp_status_reject_reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Get Orders Mmp Status Reject Message is what was written, byte for byte */
inline equal_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_read, get_orders_mmp_status_reject_message_written) {
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> assert(get_orders_mmp_status_reject_message_read.timestamp[get_orders_mmp_status_reject_message_at] == get_orders_mmp_status_reject_message_written.timestamp[get_orders_mmp_status_reject_message_at]); get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  get_orders_mmp_status_reject_message_at = 0;
  do
  :: get_orders_mmp_status_reject_message_at < 8 -> assert(get_orders_mmp_status_reject_message_read.correlation_id[get_orders_mmp_status_reject_message_at] == get_orders_mmp_status_reject_message_written.correlation_id[get_orders_mmp_status_reject_message_at]); get_orders_mmp_status_reject_message_at = get_orders_mmp_status_reject_message_at + 1
  :: else -> break
  od;
  assert(get_orders_mmp_status_reject_message_read.reason_mmp_status_reject_reason == get_orders_mmp_status_reject_message_written.reason_mmp_status_reject_reason);
  skip
}

/* ---- Mass Quote Mmp Triggered Message: 57 bytes ------------------------------ */

/* MassQuoteMmpTriggeredMessage */
typedef MassQuoteMmpTriggeredMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte mmp_group_id[8];
  byte frozen_until[8];
  byte quantity_level[8];
  byte vega_level[8];
  byte delta_level[8];
  byte trigger
};

int mass_quote_mmp_triggered_message_at;

/* every byte of Mass Quote Mmp Triggered Message set to one value */
inline fill_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_record, mass_quote_mmp_triggered_message_value) {
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.timestamp[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.exec_id[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.mmp_group_id[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.frozen_until[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.quantity_level[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.vega_level[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.delta_level[mass_quote_mmp_triggered_message_at] = mass_quote_mmp_triggered_message_value; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_record.trigger = mass_quote_mmp_triggered_message_value;
  skip
}

/* each byte of Mass Quote Mmp Triggered Message set to where it lies, so a field read out of place says so */
inline ramp_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_record, mass_quote_mmp_triggered_message_base) {
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.timestamp[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 0 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.exec_id[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 8 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.mmp_group_id[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 16 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.frozen_until[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 24 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.quantity_level[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 32 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.vega_level[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 40 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.delta_level[mass_quote_mmp_triggered_message_at] = (mass_quote_mmp_triggered_message_base + 48 + mass_quote_mmp_triggered_message_at + 1) % 256; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_record.trigger = (mass_quote_mmp_triggered_message_base + 56 + 1) % 256;
  skip
}

/* Mass Quote Mmp Triggered Message to the wire, 57 bytes from where the cursor stands */
inline encode_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_record) {
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.timestamp[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.exec_id[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.mmp_group_id[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.frozen_until[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.quantity_level[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.vega_level[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> wire[at] = mass_quote_mmp_triggered_message_record.delta_level[mass_quote_mmp_triggered_message_at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  wire[at] = mass_quote_mmp_triggered_message_record.trigger; at = at + 1;
  skip
}

/* Mass Quote Mmp Triggered Message off the wire, 57 bytes from where the cursor stands */
inline decode_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_record) {
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.timestamp[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.exec_id[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.mmp_group_id[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.frozen_until[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.quantity_level[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.vega_level[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> mass_quote_mmp_triggered_message_record.delta_level[mass_quote_mmp_triggered_message_at] = wire[at]; at = at + 1; mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_record.trigger = wire[at]; at = at + 1;
  skip
}

/* what was read of Mass Quote Mmp Triggered Message is what was written, byte for byte */
inline equal_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_read, mass_quote_mmp_triggered_message_written) {
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.timestamp[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.timestamp[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.exec_id[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.exec_id[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.mmp_group_id[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.mmp_group_id[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.frozen_until[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.frozen_until[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.quantity_level[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.quantity_level[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.vega_level[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.vega_level[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_triggered_message_at = 0;
  do
  :: mass_quote_mmp_triggered_message_at < 8 -> assert(mass_quote_mmp_triggered_message_read.delta_level[mass_quote_mmp_triggered_message_at] == mass_quote_mmp_triggered_message_written.delta_level[mass_quote_mmp_triggered_message_at]); mass_quote_mmp_triggered_message_at = mass_quote_mmp_triggered_message_at + 1
  :: else -> break
  od;
  assert(mass_quote_mmp_triggered_message_read.trigger == mass_quote_mmp_triggered_message_written.trigger);
  skip
}

/* ---- Orders Mmp Triggered Message: 57 bytes ---------------------------------- */

/* OrdersMmpTriggeredMessage */
typedef OrdersMmpTriggeredMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte currency_pair_id[8];
  byte frozen_until[8];
  byte quantity_level[8];
  byte vega_level[8];
  byte delta_level[8];
  byte trigger
};

int orders_mmp_triggered_message_at;

/* every byte of Orders Mmp Triggered Message set to one value */
inline fill_orders_mmp_triggered_message(orders_mmp_triggered_message_record, orders_mmp_triggered_message_value) {
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.timestamp[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.exec_id[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.currency_pair_id[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.frozen_until[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.quantity_level[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.vega_level[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.delta_level[orders_mmp_triggered_message_at] = orders_mmp_triggered_message_value; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_record.trigger = orders_mmp_triggered_message_value;
  skip
}

/* each byte of Orders Mmp Triggered Message set to where it lies, so a field read out of place says so */
inline ramp_orders_mmp_triggered_message(orders_mmp_triggered_message_record, orders_mmp_triggered_message_base) {
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.timestamp[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 0 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.exec_id[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 8 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.currency_pair_id[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 16 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.frozen_until[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 24 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.quantity_level[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 32 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.vega_level[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 40 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.delta_level[orders_mmp_triggered_message_at] = (orders_mmp_triggered_message_base + 48 + orders_mmp_triggered_message_at + 1) % 256; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_record.trigger = (orders_mmp_triggered_message_base + 56 + 1) % 256;
  skip
}

/* Orders Mmp Triggered Message to the wire, 57 bytes from where the cursor stands */
inline encode_orders_mmp_triggered_message(orders_mmp_triggered_message_record) {
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.timestamp[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.exec_id[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.currency_pair_id[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.frozen_until[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.quantity_level[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.vega_level[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> wire[at] = orders_mmp_triggered_message_record.delta_level[orders_mmp_triggered_message_at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  wire[at] = orders_mmp_triggered_message_record.trigger; at = at + 1;
  skip
}

/* Orders Mmp Triggered Message off the wire, 57 bytes from where the cursor stands */
inline decode_orders_mmp_triggered_message(orders_mmp_triggered_message_record) {
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.timestamp[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.exec_id[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.currency_pair_id[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.frozen_until[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.quantity_level[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.vega_level[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> orders_mmp_triggered_message_record.delta_level[orders_mmp_triggered_message_at] = wire[at]; at = at + 1; orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_record.trigger = wire[at]; at = at + 1;
  skip
}

/* what was read of Orders Mmp Triggered Message is what was written, byte for byte */
inline equal_orders_mmp_triggered_message(orders_mmp_triggered_message_read, orders_mmp_triggered_message_written) {
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.timestamp[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.timestamp[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.exec_id[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.exec_id[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.currency_pair_id[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.currency_pair_id[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.frozen_until[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.frozen_until[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.quantity_level[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.quantity_level[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.vega_level[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.vega_level[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  orders_mmp_triggered_message_at = 0;
  do
  :: orders_mmp_triggered_message_at < 8 -> assert(orders_mmp_triggered_message_read.delta_level[orders_mmp_triggered_message_at] == orders_mmp_triggered_message_written.delta_level[orders_mmp_triggered_message_at]); orders_mmp_triggered_message_at = orders_mmp_triggered_message_at + 1
  :: else -> break
  od;
  assert(orders_mmp_triggered_message_read.trigger == orders_mmp_triggered_message_written.trigger);
  skip
}

/* ---- Mass Quote Mmp Unfrozen Message: 32 bytes ------------------------------- */

/* MassQuoteMmpUnfrozenMessage */
typedef MassQuoteMmpUnfrozenMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte mmp_group_id[8];
  byte correlation_id_optional[8]
};

int mass_quote_mmp_unfrozen_message_at;

/* every byte of Mass Quote Mmp Unfrozen Message set to one value */
inline fill_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_record, mass_quote_mmp_unfrozen_message_value) {
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.timestamp[mass_quote_mmp_unfrozen_message_at] = mass_quote_mmp_unfrozen_message_value; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.exec_id[mass_quote_mmp_unfrozen_message_at] = mass_quote_mmp_unfrozen_message_value; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.mmp_group_id[mass_quote_mmp_unfrozen_message_at] = mass_quote_mmp_unfrozen_message_value; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.correlation_id_optional[mass_quote_mmp_unfrozen_message_at] = mass_quote_mmp_unfrozen_message_value; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Mass Quote Mmp Unfrozen Message set to where it lies, so a field read out of place says so */
inline ramp_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_record, mass_quote_mmp_unfrozen_message_base) {
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.timestamp[mass_quote_mmp_unfrozen_message_at] = (mass_quote_mmp_unfrozen_message_base + 0 + mass_quote_mmp_unfrozen_message_at + 1) % 256; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.exec_id[mass_quote_mmp_unfrozen_message_at] = (mass_quote_mmp_unfrozen_message_base + 8 + mass_quote_mmp_unfrozen_message_at + 1) % 256; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.mmp_group_id[mass_quote_mmp_unfrozen_message_at] = (mass_quote_mmp_unfrozen_message_base + 16 + mass_quote_mmp_unfrozen_message_at + 1) % 256; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.correlation_id_optional[mass_quote_mmp_unfrozen_message_at] = (mass_quote_mmp_unfrozen_message_base + 24 + mass_quote_mmp_unfrozen_message_at + 1) % 256; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Quote Mmp Unfrozen Message to the wire, 32 bytes from where the cursor stands */
inline encode_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_record) {
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> wire[at] = mass_quote_mmp_unfrozen_message_record.timestamp[mass_quote_mmp_unfrozen_message_at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> wire[at] = mass_quote_mmp_unfrozen_message_record.exec_id[mass_quote_mmp_unfrozen_message_at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> wire[at] = mass_quote_mmp_unfrozen_message_record.mmp_group_id[mass_quote_mmp_unfrozen_message_at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> wire[at] = mass_quote_mmp_unfrozen_message_record.correlation_id_optional[mass_quote_mmp_unfrozen_message_at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* Mass Quote Mmp Unfrozen Message off the wire, 32 bytes from where the cursor stands */
inline decode_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_record) {
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.timestamp[mass_quote_mmp_unfrozen_message_at] = wire[at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.exec_id[mass_quote_mmp_unfrozen_message_at] = wire[at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.mmp_group_id[mass_quote_mmp_unfrozen_message_at] = wire[at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> mass_quote_mmp_unfrozen_message_record.correlation_id_optional[mass_quote_mmp_unfrozen_message_at] = wire[at]; at = at + 1; mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Mass Quote Mmp Unfrozen Message is what was written, byte for byte */
inline equal_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_read, mass_quote_mmp_unfrozen_message_written) {
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> assert(mass_quote_mmp_unfrozen_message_read.timestamp[mass_quote_mmp_unfrozen_message_at] == mass_quote_mmp_unfrozen_message_written.timestamp[mass_quote_mmp_unfrozen_message_at]); mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> assert(mass_quote_mmp_unfrozen_message_read.exec_id[mass_quote_mmp_unfrozen_message_at] == mass_quote_mmp_unfrozen_message_written.exec_id[mass_quote_mmp_unfrozen_message_at]); mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> assert(mass_quote_mmp_unfrozen_message_read.mmp_group_id[mass_quote_mmp_unfrozen_message_at] == mass_quote_mmp_unfrozen_message_written.mmp_group_id[mass_quote_mmp_unfrozen_message_at]); mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  mass_quote_mmp_unfrozen_message_at = 0;
  do
  :: mass_quote_mmp_unfrozen_message_at < 8 -> assert(mass_quote_mmp_unfrozen_message_read.correlation_id_optional[mass_quote_mmp_unfrozen_message_at] == mass_quote_mmp_unfrozen_message_written.correlation_id_optional[mass_quote_mmp_unfrozen_message_at]); mass_quote_mmp_unfrozen_message_at = mass_quote_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Orders Mmp Unfrozen Message: 32 bytes ----------------------------------- */

/* OrdersMmpUnfrozenMessage */
typedef OrdersMmpUnfrozenMessage {
  byte timestamp[8];
  byte exec_id[8];
  byte currency_pair_id[8];
  byte correlation_id_optional[8]
};

int orders_mmp_unfrozen_message_at;

/* every byte of Orders Mmp Unfrozen Message set to one value */
inline fill_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_record, orders_mmp_unfrozen_message_value) {
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.timestamp[orders_mmp_unfrozen_message_at] = orders_mmp_unfrozen_message_value; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.exec_id[orders_mmp_unfrozen_message_at] = orders_mmp_unfrozen_message_value; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.currency_pair_id[orders_mmp_unfrozen_message_at] = orders_mmp_unfrozen_message_value; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.correlation_id_optional[orders_mmp_unfrozen_message_at] = orders_mmp_unfrozen_message_value; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Orders Mmp Unfrozen Message set to where it lies, so a field read out of place says so */
inline ramp_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_record, orders_mmp_unfrozen_message_base) {
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.timestamp[orders_mmp_unfrozen_message_at] = (orders_mmp_unfrozen_message_base + 0 + orders_mmp_unfrozen_message_at + 1) % 256; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.exec_id[orders_mmp_unfrozen_message_at] = (orders_mmp_unfrozen_message_base + 8 + orders_mmp_unfrozen_message_at + 1) % 256; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.currency_pair_id[orders_mmp_unfrozen_message_at] = (orders_mmp_unfrozen_message_base + 16 + orders_mmp_unfrozen_message_at + 1) % 256; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.correlation_id_optional[orders_mmp_unfrozen_message_at] = (orders_mmp_unfrozen_message_base + 24 + orders_mmp_unfrozen_message_at + 1) % 256; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orders Mmp Unfrozen Message to the wire, 32 bytes from where the cursor stands */
inline encode_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_record) {
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> wire[at] = orders_mmp_unfrozen_message_record.timestamp[orders_mmp_unfrozen_message_at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> wire[at] = orders_mmp_unfrozen_message_record.exec_id[orders_mmp_unfrozen_message_at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> wire[at] = orders_mmp_unfrozen_message_record.currency_pair_id[orders_mmp_unfrozen_message_at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> wire[at] = orders_mmp_unfrozen_message_record.correlation_id_optional[orders_mmp_unfrozen_message_at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* Orders Mmp Unfrozen Message off the wire, 32 bytes from where the cursor stands */
inline decode_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_record) {
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.timestamp[orders_mmp_unfrozen_message_at] = wire[at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.exec_id[orders_mmp_unfrozen_message_at] = wire[at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.currency_pair_id[orders_mmp_unfrozen_message_at] = wire[at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> orders_mmp_unfrozen_message_record.correlation_id_optional[orders_mmp_unfrozen_message_at] = wire[at]; at = at + 1; orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Orders Mmp Unfrozen Message is what was written, byte for byte */
inline equal_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_read, orders_mmp_unfrozen_message_written) {
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> assert(orders_mmp_unfrozen_message_read.timestamp[orders_mmp_unfrozen_message_at] == orders_mmp_unfrozen_message_written.timestamp[orders_mmp_unfrozen_message_at]); orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> assert(orders_mmp_unfrozen_message_read.exec_id[orders_mmp_unfrozen_message_at] == orders_mmp_unfrozen_message_written.exec_id[orders_mmp_unfrozen_message_at]); orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> assert(orders_mmp_unfrozen_message_read.currency_pair_id[orders_mmp_unfrozen_message_at] == orders_mmp_unfrozen_message_written.currency_pair_id[orders_mmp_unfrozen_message_at]); orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
  orders_mmp_unfrozen_message_at = 0;
  do
  :: orders_mmp_unfrozen_message_at < 8 -> assert(orders_mmp_unfrozen_message_read.correlation_id_optional[orders_mmp_unfrozen_message_at] == orders_mmp_unfrozen_message_written.correlation_id_optional[orders_mmp_unfrozen_message_at]); orders_mmp_unfrozen_message_at = orders_mmp_unfrozen_message_at + 1
  :: else -> break
  od;
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
    assert(at == 67);
    at = 0;
    decode_logon_message(logon_message_got);
    assert(at == 67);
    equal_logon_message(logon_message_got, logon_message_sent)
  }
}

/* Logon Conf Message: encoded, read back, and compared */
proctype check_logon_conf_message() {
  LogonConfMessage logon_conf_message_sent;
  LogonConfMessage logon_conf_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logon_conf_message(logon_conf_message_sent, 0)
  :: pattern == 1 -> fill_logon_conf_message(logon_conf_message_sent, 32)
  :: pattern == 2 -> fill_logon_conf_message(logon_conf_message_sent, 255)
  :: else -> ramp_logon_conf_message(logon_conf_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logon_conf_message(logon_conf_message_sent);
    assert(at == 6);
    at = 0;
    decode_logon_conf_message(logon_conf_message_got);
    assert(at == 6);
    equal_logon_conf_message(logon_conf_message_got, logon_conf_message_sent)
  }
}

/* Heartbeat Message: encoded, read back, and compared */
proctype check_heartbeat_message() {
  HeartbeatMessage heartbeat_message_sent;
  HeartbeatMessage heartbeat_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_heartbeat_message(heartbeat_message_sent, 0)
  :: pattern == 1 -> fill_heartbeat_message(heartbeat_message_sent, 32)
  :: pattern == 2 -> fill_heartbeat_message(heartbeat_message_sent, 255)
  :: else -> ramp_heartbeat_message(heartbeat_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_heartbeat_message(heartbeat_message_sent);
    assert(at == 8);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 8);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* Test Request Message: encoded, read back, and compared */
proctype check_test_request_message() {
  TestRequestMessage test_request_message_sent;
  TestRequestMessage test_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_test_request_message(test_request_message_sent, 0)
  :: pattern == 1 -> fill_test_request_message(test_request_message_sent, 32)
  :: pattern == 2 -> fill_test_request_message(test_request_message_sent, 255)
  :: else -> ramp_test_request_message(test_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_test_request_message(test_request_message_sent);
    assert(at == 8);
    at = 0;
    decode_test_request_message(test_request_message_got);
    assert(at == 8);
    equal_test_request_message(test_request_message_got, test_request_message_sent)
  }
}

/* Resend Request Message: encoded, read back, and compared */
proctype check_resend_request_message() {
  ResendRequestMessage resend_request_message_sent;
  ResendRequestMessage resend_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_resend_request_message(resend_request_message_sent, 0)
  :: pattern == 1 -> fill_resend_request_message(resend_request_message_sent, 32)
  :: pattern == 2 -> fill_resend_request_message(resend_request_message_sent, 255)
  :: else -> ramp_resend_request_message(resend_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_resend_request_message(resend_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_resend_request_message(resend_request_message_got);
    assert(at == 16);
    equal_resend_request_message(resend_request_message_got, resend_request_message_sent)
  }
}

/* Gap Fill Message: encoded, read back, and compared */
proctype check_gap_fill_message() {
  GapFillMessage gap_fill_message_sent;
  GapFillMessage gap_fill_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_gap_fill_message(gap_fill_message_sent, 0)
  :: pattern == 1 -> fill_gap_fill_message(gap_fill_message_sent, 32)
  :: pattern == 2 -> fill_gap_fill_message(gap_fill_message_sent, 255)
  :: else -> ramp_gap_fill_message(gap_fill_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_gap_fill_message(gap_fill_message_sent);
    assert(at == 8);
    at = 0;
    decode_gap_fill_message(gap_fill_message_got);
    assert(at == 8);
    equal_gap_fill_message(gap_fill_message_got, gap_fill_message_sent)
  }
}

/* Quantity: encoded, read back, and compared */
proctype check_quantity() {
  Quantity quantity_sent;
  Quantity quantity_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quantity(quantity_sent, 0)
  :: pattern == 1 -> fill_quantity(quantity_sent, 32)
  :: pattern == 2 -> fill_quantity(quantity_sent, 255)
  :: else -> ramp_quantity(quantity_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quantity(quantity_sent);
    assert(at == 9);
    at = 0;
    decode_quantity(quantity_got);
    assert(at == 9);
    equal_quantity(quantity_got, quantity_sent)
  }
}

/* Show Qty: encoded, read back, and compared */
proctype check_show_qty() {
  ShowQty show_qty_sent;
  ShowQty show_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_show_qty(show_qty_sent, 0)
  :: pattern == 1 -> fill_show_qty(show_qty_sent, 32)
  :: pattern == 2 -> fill_show_qty(show_qty_sent, 255)
  :: else -> ramp_show_qty(show_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_show_qty(show_qty_sent);
    assert(at == 9);
    at = 0;
    decode_show_qty(show_qty_got);
    assert(at == 9);
    equal_show_qty(show_qty_got, show_qty_sent)
  }
}

/* Cancel Order Request Message: encoded, read back, and compared */
proctype check_cancel_order_request_message() {
  CancelOrderRequestMessage cancel_order_request_message_sent;
  CancelOrderRequestMessage cancel_order_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_request_message(cancel_order_request_message_sent, 255)
  :: else -> ramp_cancel_order_request_message(cancel_order_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_request_message(cancel_order_request_message_sent);
    assert(at == 24);
    at = 0;
    decode_cancel_order_request_message(cancel_order_request_message_got);
    assert(at == 24);
    equal_cancel_order_request_message(cancel_order_request_message_got, cancel_order_request_message_sent)
  }
}

/* Cancel Order By Id Request Message: encoded, read back, and compared */
proctype check_cancel_order_by_id_request_message() {
  CancelOrderByIdRequestMessage cancel_order_by_id_request_message_sent;
  CancelOrderByIdRequestMessage cancel_order_by_id_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_by_id_request_message(cancel_order_by_id_request_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_by_id_request_message(cancel_order_by_id_request_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_by_id_request_message(cancel_order_by_id_request_message_sent, 255)
  :: else -> ramp_cancel_order_by_id_request_message(cancel_order_by_id_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_by_id_request_message(cancel_order_by_id_request_message_sent);
    assert(at == 24);
    at = 0;
    decode_cancel_order_by_id_request_message(cancel_order_by_id_request_message_got);
    assert(at == 24);
    equal_cancel_order_by_id_request_message(cancel_order_by_id_request_message_got, cancel_order_by_id_request_message_sent)
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
    assert(at == 4);
    at = 0;
    decode_group_size_encoding(group_size_encoding_got);
    assert(at == 4);
    equal_group_size_encoding(group_size_encoding_got, group_size_encoding_sent)
  }
}

/* Bid Qty: encoded, read back, and compared */
proctype check_bid_qty() {
  BidQty bid_qty_sent;
  BidQty bid_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_qty(bid_qty_sent, 0)
  :: pattern == 1 -> fill_bid_qty(bid_qty_sent, 32)
  :: pattern == 2 -> fill_bid_qty(bid_qty_sent, 255)
  :: else -> ramp_bid_qty(bid_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_qty(bid_qty_sent);
    assert(at == 9);
    at = 0;
    decode_bid_qty(bid_qty_got);
    assert(at == 9);
    equal_bid_qty(bid_qty_got, bid_qty_sent)
  }
}

/* Ask Qty: encoded, read back, and compared */
proctype check_ask_qty() {
  AskQty ask_qty_sent;
  AskQty ask_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_qty(ask_qty_sent, 0)
  :: pattern == 1 -> fill_ask_qty(ask_qty_sent, 32)
  :: pattern == 2 -> fill_ask_qty(ask_qty_sent, 255)
  :: else -> ramp_ask_qty(ask_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_qty(ask_qty_sent);
    assert(at == 9);
    at = 0;
    decode_ask_qty(ask_qty_got);
    assert(at == 9);
    equal_ask_qty(ask_qty_got, ask_qty_sent)
  }
}

/* Mass Cancel Request Message: encoded, read back, and compared */
proctype check_mass_cancel_request_message() {
  MassCancelRequestMessage mass_cancel_request_message_sent;
  MassCancelRequestMessage mass_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_request_message(mass_cancel_request_message_sent, 255)
  :: else -> ramp_mass_cancel_request_message(mass_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_request_message(mass_cancel_request_message_sent);
    assert(at == 26);
    at = 0;
    decode_mass_cancel_request_message(mass_cancel_request_message_got);
    assert(at == 26);
    equal_mass_cancel_request_message(mass_cancel_request_message_got, mass_cancel_request_message_sent)
  }
}

/* Mass Quote Cancel Request Message: encoded, read back, and compared */
proctype check_mass_quote_cancel_request_message() {
  MassQuoteCancelRequestMessage mass_quote_cancel_request_message_sent;
  MassQuoteCancelRequestMessage mass_quote_cancel_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_quote_cancel_request_message(mass_quote_cancel_request_message_sent, 0)
  :: pattern == 1 -> fill_mass_quote_cancel_request_message(mass_quote_cancel_request_message_sent, 32)
  :: pattern == 2 -> fill_mass_quote_cancel_request_message(mass_quote_cancel_request_message_sent, 255)
  :: else -> ramp_mass_quote_cancel_request_message(mass_quote_cancel_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_quote_cancel_request_message(mass_quote_cancel_request_message_sent);
    assert(at == 17);
    at = 0;
    decode_mass_quote_cancel_request_message(mass_quote_cancel_request_message_got);
    assert(at == 17);
    equal_mass_quote_cancel_request_message(mass_quote_cancel_request_message_got, mass_quote_cancel_request_message_sent)
  }
}

/* Get Mass Quote Mmp Status Request Message: encoded, read back, and compared */
proctype check_get_mass_quote_mmp_status_request_message() {
  GetMassQuoteMmpStatusRequestMessage get_mass_quote_mmp_status_request_message_sent;
  GetMassQuoteMmpStatusRequestMessage get_mass_quote_mmp_status_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_sent, 0)
  :: pattern == 1 -> fill_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_sent, 32)
  :: pattern == 2 -> fill_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_sent, 255)
  :: else -> ramp_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_got);
    assert(at == 16);
    equal_get_mass_quote_mmp_status_request_message(get_mass_quote_mmp_status_request_message_got, get_mass_quote_mmp_status_request_message_sent)
  }
}

/* Get Orders Mmp Status Request Message: encoded, read back, and compared */
proctype check_get_orders_mmp_status_request_message() {
  GetOrdersMmpStatusRequestMessage get_orders_mmp_status_request_message_sent;
  GetOrdersMmpStatusRequestMessage get_orders_mmp_status_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_sent, 0)
  :: pattern == 1 -> fill_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_sent, 32)
  :: pattern == 2 -> fill_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_sent, 255)
  :: else -> ramp_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_sent);
    assert(at == 16);
    at = 0;
    decode_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_got);
    assert(at == 16);
    equal_get_orders_mmp_status_request_message(get_orders_mmp_status_request_message_got, get_orders_mmp_status_request_message_sent)
  }
}

/* Total Filled: encoded, read back, and compared */
proctype check_total_filled() {
  TotalFilled total_filled_sent;
  TotalFilled total_filled_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_total_filled(total_filled_sent, 0)
  :: pattern == 1 -> fill_total_filled(total_filled_sent, 32)
  :: pattern == 2 -> fill_total_filled(total_filled_sent, 255)
  :: else -> ramp_total_filled(total_filled_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_total_filled(total_filled_sent);
    assert(at == 9);
    at = 0;
    decode_total_filled(total_filled_got);
    assert(at == 9);
    equal_total_filled(total_filled_got, total_filled_sent)
  }
}

/* Visible Qty: encoded, read back, and compared */
proctype check_visible_qty() {
  VisibleQty visible_qty_sent;
  VisibleQty visible_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_visible_qty(visible_qty_sent, 0)
  :: pattern == 1 -> fill_visible_qty(visible_qty_sent, 32)
  :: pattern == 2 -> fill_visible_qty(visible_qty_sent, 255)
  :: else -> ramp_visible_qty(visible_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_visible_qty(visible_qty_sent);
    assert(at == 9);
    at = 0;
    decode_visible_qty(visible_qty_got);
    assert(at == 9);
    equal_visible_qty(visible_qty_got, visible_qty_sent)
  }
}

/* Fill Qty: encoded, read back, and compared */
proctype check_fill_qty() {
  FillQty fill_qty_sent;
  FillQty fill_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_fill_qty(fill_qty_sent, 0)
  :: pattern == 1 -> fill_fill_qty(fill_qty_sent, 32)
  :: pattern == 2 -> fill_fill_qty(fill_qty_sent, 255)
  :: else -> ramp_fill_qty(fill_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_fill_qty(fill_qty_sent);
    assert(at == 9);
    at = 0;
    decode_fill_qty(fill_qty_got);
    assert(at == 9);
    equal_fill_qty(fill_qty_got, fill_qty_sent)
  }
}

/* Cancel Order Response Message: encoded, read back, and compared */
proctype check_cancel_order_response_message() {
  CancelOrderResponseMessage cancel_order_response_message_sent;
  CancelOrderResponseMessage cancel_order_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 0)
  :: pattern == 1 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 32)
  :: pattern == 2 -> fill_cancel_order_response_message(cancel_order_response_message_sent, 255)
  :: else -> ramp_cancel_order_response_message(cancel_order_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_cancel_order_response_message(cancel_order_response_message_sent);
    assert(at == 56);
    at = 0;
    decode_cancel_order_response_message(cancel_order_response_message_got);
    assert(at == 56);
    equal_cancel_order_response_message(cancel_order_response_message_got, cancel_order_response_message_sent)
  }
}

/* Bid Filled Qty: encoded, read back, and compared */
proctype check_bid_filled_qty() {
  BidFilledQty bid_filled_qty_sent;
  BidFilledQty bid_filled_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_filled_qty(bid_filled_qty_sent, 0)
  :: pattern == 1 -> fill_bid_filled_qty(bid_filled_qty_sent, 32)
  :: pattern == 2 -> fill_bid_filled_qty(bid_filled_qty_sent, 255)
  :: else -> ramp_bid_filled_qty(bid_filled_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_filled_qty(bid_filled_qty_sent);
    assert(at == 9);
    at = 0;
    decode_bid_filled_qty(bid_filled_qty_got);
    assert(at == 9);
    equal_bid_filled_qty(bid_filled_qty_got, bid_filled_qty_sent)
  }
}

/* Ask Filled Qty: encoded, read back, and compared */
proctype check_ask_filled_qty() {
  AskFilledQty ask_filled_qty_sent;
  AskFilledQty ask_filled_qty_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_filled_qty(ask_filled_qty_sent, 0)
  :: pattern == 1 -> fill_ask_filled_qty(ask_filled_qty_sent, 32)
  :: pattern == 2 -> fill_ask_filled_qty(ask_filled_qty_sent, 255)
  :: else -> ramp_ask_filled_qty(ask_filled_qty_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_filled_qty(ask_filled_qty_sent);
    assert(at == 9);
    at = 0;
    decode_ask_filled_qty(ask_filled_qty_got);
    assert(at == 9);
    equal_ask_filled_qty(ask_filled_qty_got, ask_filled_qty_sent)
  }
}

/* Mass Cancel Response Message: encoded, read back, and compared */
proctype check_mass_cancel_response_message() {
  MassCancelResponseMessage mass_cancel_response_message_sent;
  MassCancelResponseMessage mass_cancel_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 0)
  :: pattern == 1 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 32)
  :: pattern == 2 -> fill_mass_cancel_response_message(mass_cancel_response_message_sent, 255)
  :: else -> ramp_mass_cancel_response_message(mass_cancel_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_cancel_response_message(mass_cancel_response_message_sent);
    assert(at == 36);
    at = 0;
    decode_mass_cancel_response_message(mass_cancel_response_message_got);
    assert(at == 36);
    equal_mass_cancel_response_message(mass_cancel_response_message_got, mass_cancel_response_message_sent)
  }
}

/* Get Mass Quote Mmp Status Response Message: encoded, read back, and compared */
proctype check_get_mass_quote_mmp_status_response_message() {
  GetMassQuoteMmpStatusResponseMessage get_mass_quote_mmp_status_response_message_sent;
  GetMassQuoteMmpStatusResponseMessage get_mass_quote_mmp_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_sent, 0)
  :: pattern == 1 -> fill_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_sent, 32)
  :: pattern == 2 -> fill_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_sent, 255)
  :: else -> ramp_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_sent);
    assert(at == 32);
    at = 0;
    decode_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_got);
    assert(at == 32);
    equal_get_mass_quote_mmp_status_response_message(get_mass_quote_mmp_status_response_message_got, get_mass_quote_mmp_status_response_message_sent)
  }
}

/* Get Mass Quote Mmp Status Reject Message: encoded, read back, and compared */
proctype check_get_mass_quote_mmp_status_reject_message() {
  GetMassQuoteMmpStatusRejectMessage get_mass_quote_mmp_status_reject_message_sent;
  GetMassQuoteMmpStatusRejectMessage get_mass_quote_mmp_status_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_sent, 0)
  :: pattern == 1 -> fill_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_sent, 32)
  :: pattern == 2 -> fill_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_sent, 255)
  :: else -> ramp_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_sent);
    assert(at == 17);
    at = 0;
    decode_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_got);
    assert(at == 17);
    equal_get_mass_quote_mmp_status_reject_message(get_mass_quote_mmp_status_reject_message_got, get_mass_quote_mmp_status_reject_message_sent)
  }
}

/* Get Orders Mmp Status Response Message: encoded, read back, and compared */
proctype check_get_orders_mmp_status_response_message() {
  GetOrdersMmpStatusResponseMessage get_orders_mmp_status_response_message_sent;
  GetOrdersMmpStatusResponseMessage get_orders_mmp_status_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_sent, 0)
  :: pattern == 1 -> fill_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_sent, 32)
  :: pattern == 2 -> fill_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_sent, 255)
  :: else -> ramp_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_sent);
    assert(at == 32);
    at = 0;
    decode_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_got);
    assert(at == 32);
    equal_get_orders_mmp_status_response_message(get_orders_mmp_status_response_message_got, get_orders_mmp_status_response_message_sent)
  }
}

/* Get Orders Mmp Status Reject Message: encoded, read back, and compared */
proctype check_get_orders_mmp_status_reject_message() {
  GetOrdersMmpStatusRejectMessage get_orders_mmp_status_reject_message_sent;
  GetOrdersMmpStatusRejectMessage get_orders_mmp_status_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_sent, 0)
  :: pattern == 1 -> fill_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_sent, 32)
  :: pattern == 2 -> fill_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_sent, 255)
  :: else -> ramp_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_sent);
    assert(at == 17);
    at = 0;
    decode_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_got);
    assert(at == 17);
    equal_get_orders_mmp_status_reject_message(get_orders_mmp_status_reject_message_got, get_orders_mmp_status_reject_message_sent)
  }
}

/* Mass Quote Mmp Triggered Message: encoded, read back, and compared */
proctype check_mass_quote_mmp_triggered_message() {
  MassQuoteMmpTriggeredMessage mass_quote_mmp_triggered_message_sent;
  MassQuoteMmpTriggeredMessage mass_quote_mmp_triggered_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_sent, 0)
  :: pattern == 1 -> fill_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_sent, 32)
  :: pattern == 2 -> fill_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_sent, 255)
  :: else -> ramp_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_sent);
    assert(at == 57);
    at = 0;
    decode_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_got);
    assert(at == 57);
    equal_mass_quote_mmp_triggered_message(mass_quote_mmp_triggered_message_got, mass_quote_mmp_triggered_message_sent)
  }
}

/* Orders Mmp Triggered Message: encoded, read back, and compared */
proctype check_orders_mmp_triggered_message() {
  OrdersMmpTriggeredMessage orders_mmp_triggered_message_sent;
  OrdersMmpTriggeredMessage orders_mmp_triggered_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orders_mmp_triggered_message(orders_mmp_triggered_message_sent, 0)
  :: pattern == 1 -> fill_orders_mmp_triggered_message(orders_mmp_triggered_message_sent, 32)
  :: pattern == 2 -> fill_orders_mmp_triggered_message(orders_mmp_triggered_message_sent, 255)
  :: else -> ramp_orders_mmp_triggered_message(orders_mmp_triggered_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orders_mmp_triggered_message(orders_mmp_triggered_message_sent);
    assert(at == 57);
    at = 0;
    decode_orders_mmp_triggered_message(orders_mmp_triggered_message_got);
    assert(at == 57);
    equal_orders_mmp_triggered_message(orders_mmp_triggered_message_got, orders_mmp_triggered_message_sent)
  }
}

/* Mass Quote Mmp Unfrozen Message: encoded, read back, and compared */
proctype check_mass_quote_mmp_unfrozen_message() {
  MassQuoteMmpUnfrozenMessage mass_quote_mmp_unfrozen_message_sent;
  MassQuoteMmpUnfrozenMessage mass_quote_mmp_unfrozen_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_sent, 0)
  :: pattern == 1 -> fill_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_sent, 32)
  :: pattern == 2 -> fill_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_sent, 255)
  :: else -> ramp_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_sent);
    assert(at == 32);
    at = 0;
    decode_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_got);
    assert(at == 32);
    equal_mass_quote_mmp_unfrozen_message(mass_quote_mmp_unfrozen_message_got, mass_quote_mmp_unfrozen_message_sent)
  }
}

/* Orders Mmp Unfrozen Message: encoded, read back, and compared */
proctype check_orders_mmp_unfrozen_message() {
  OrdersMmpUnfrozenMessage orders_mmp_unfrozen_message_sent;
  OrdersMmpUnfrozenMessage orders_mmp_unfrozen_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_sent, 0)
  :: pattern == 1 -> fill_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_sent, 32)
  :: pattern == 2 -> fill_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_sent, 255)
  :: else -> ramp_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_sent);
    assert(at == 32);
    at = 0;
    decode_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_got);
    assert(at == 32);
    equal_orders_mmp_unfrozen_message(orders_mmp_unfrozen_message_got, orders_mmp_unfrozen_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_logon_message()
  :: run check_logon_conf_message()
  :: run check_heartbeat_message()
  :: run check_test_request_message()
  :: run check_resend_request_message()
  :: run check_gap_fill_message()
  :: run check_quantity()
  :: run check_show_qty()
  :: run check_cancel_order_request_message()
  :: run check_cancel_order_by_id_request_message()
  :: run check_group_size_encoding()
  :: run check_bid_qty()
  :: run check_ask_qty()
  :: run check_mass_cancel_request_message()
  :: run check_mass_quote_cancel_request_message()
  :: run check_get_mass_quote_mmp_status_request_message()
  :: run check_get_orders_mmp_status_request_message()
  :: run check_total_filled()
  :: run check_visible_qty()
  :: run check_fill_qty()
  :: run check_cancel_order_response_message()
  :: run check_bid_filled_qty()
  :: run check_ask_filled_qty()
  :: run check_mass_cancel_response_message()
  :: run check_get_mass_quote_mmp_status_response_message()
  :: run check_get_mass_quote_mmp_status_reject_message()
  :: run check_get_orders_mmp_status_response_message()
  :: run check_get_orders_mmp_status_reject_message()
  :: run check_mass_quote_mmp_triggered_message()
  :: run check_orders_mmp_triggered_message()
  :: run check_mass_quote_mmp_unfrozen_message()
  :: run check_orders_mmp_unfrozen_message()
  fi
}
