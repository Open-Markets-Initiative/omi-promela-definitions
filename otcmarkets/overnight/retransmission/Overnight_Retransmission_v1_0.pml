/*
 * OTC Markets Group OTC Retransmission
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
 *   - a Reassemble rule
 *   - a length prefix framing what follows
 *   - a field read in bits
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 52

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 3 bytes ------------------------------------------------- */

/* MoonAts Tcp Message Header */
typedef MessageHeader {
  byte message_size[2];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 2 + 1) % 256;
  skip
}

/* Message Header to the wire, 3 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.message_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 3 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.message_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.message_size[message_header_at] == message_header_written.message_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Start Of Spin Message: 13 bytes ----------------------------------------- */

/* Appears within the TCP spin response cycle (between Spin Response 'S' and 'E') and also on the UDP multicast feeds at the daily spin-out. Indicates the beginning of a spin message cycle. */
typedef StartOfSpinMessage {
  byte spin_type;
  byte spin_start_time_milli[8];
  byte spin_last_seq_num[4]
};

int start_of_spin_message_at;

/* every byte of Start Of Spin Message set to one value */
inline fill_start_of_spin_message(start_of_spin_message_record, start_of_spin_message_value) {
  start_of_spin_message_record.spin_type = start_of_spin_message_value;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> start_of_spin_message_record.spin_start_time_milli[start_of_spin_message_at] = start_of_spin_message_value; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.spin_last_seq_num[start_of_spin_message_at] = start_of_spin_message_value; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Start Of Spin Message set to where it lies, so a field read out of place says so */
inline ramp_start_of_spin_message(start_of_spin_message_record, start_of_spin_message_base) {
  start_of_spin_message_record.spin_type = (start_of_spin_message_base + 0 + 1) % 256;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> start_of_spin_message_record.spin_start_time_milli[start_of_spin_message_at] = (start_of_spin_message_base + 1 + start_of_spin_message_at + 1) % 256; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.spin_last_seq_num[start_of_spin_message_at] = (start_of_spin_message_base + 9 + start_of_spin_message_at + 1) % 256; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Spin Message to the wire, 13 bytes from where the cursor stands */
inline encode_start_of_spin_message(start_of_spin_message_record) {
  wire[at] = start_of_spin_message_record.spin_type; at = at + 1;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> wire[at] = start_of_spin_message_record.spin_start_time_milli[start_of_spin_message_at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> wire[at] = start_of_spin_message_record.spin_last_seq_num[start_of_spin_message_at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Spin Message off the wire, 13 bytes from where the cursor stands */
inline decode_start_of_spin_message(start_of_spin_message_record) {
  start_of_spin_message_record.spin_type = wire[at]; at = at + 1;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> start_of_spin_message_record.spin_start_time_milli[start_of_spin_message_at] = wire[at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.spin_last_seq_num[start_of_spin_message_at] = wire[at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Start Of Spin Message is what was written, byte for byte */
inline equal_start_of_spin_message(start_of_spin_message_read, start_of_spin_message_written) {
  assert(start_of_spin_message_read.spin_type == start_of_spin_message_written.spin_type);
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> assert(start_of_spin_message_read.spin_start_time_milli[start_of_spin_message_at] == start_of_spin_message_written.spin_start_time_milli[start_of_spin_message_at]); start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> assert(start_of_spin_message_read.spin_last_seq_num[start_of_spin_message_at] == start_of_spin_message_written.spin_last_seq_num[start_of_spin_message_at]); start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Spin Message: 17 bytes ------------------------------------------- */

/* Appears within the TCP spin response cycle (between Spin Response 'S' and 'E') and also on the UDP multicast feeds at the daily spin-out. Indicates the end of a spin message cycle. */
typedef EndOfSpinMessage {
  byte spin_type;
  byte spin_msg_ct[4];
  byte spin_end_time_milli[8];
  byte spin_last_seq_num[4]
};

int end_of_spin_message_at;

/* every byte of End Of Spin Message set to one value */
inline fill_end_of_spin_message(end_of_spin_message_record, end_of_spin_message_value) {
  end_of_spin_message_record.spin_type = end_of_spin_message_value;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_msg_ct[end_of_spin_message_at] = end_of_spin_message_value; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> end_of_spin_message_record.spin_end_time_milli[end_of_spin_message_at] = end_of_spin_message_value; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_last_seq_num[end_of_spin_message_at] = end_of_spin_message_value; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Spin Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_spin_message(end_of_spin_message_record, end_of_spin_message_base) {
  end_of_spin_message_record.spin_type = (end_of_spin_message_base + 0 + 1) % 256;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_msg_ct[end_of_spin_message_at] = (end_of_spin_message_base + 1 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> end_of_spin_message_record.spin_end_time_milli[end_of_spin_message_at] = (end_of_spin_message_base + 5 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_last_seq_num[end_of_spin_message_at] = (end_of_spin_message_base + 13 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Spin Message to the wire, 17 bytes from where the cursor stands */
inline encode_end_of_spin_message(end_of_spin_message_record) {
  wire[at] = end_of_spin_message_record.spin_type; at = at + 1;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> wire[at] = end_of_spin_message_record.spin_msg_ct[end_of_spin_message_at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> wire[at] = end_of_spin_message_record.spin_end_time_milli[end_of_spin_message_at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> wire[at] = end_of_spin_message_record.spin_last_seq_num[end_of_spin_message_at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Spin Message off the wire, 17 bytes from where the cursor stands */
inline decode_end_of_spin_message(end_of_spin_message_record) {
  end_of_spin_message_record.spin_type = wire[at]; at = at + 1;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_msg_ct[end_of_spin_message_at] = wire[at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> end_of_spin_message_record.spin_end_time_milli[end_of_spin_message_at] = wire[at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_last_seq_num[end_of_spin_message_at] = wire[at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Spin Message is what was written, byte for byte */
inline equal_end_of_spin_message(end_of_spin_message_read, end_of_spin_message_written) {
  assert(end_of_spin_message_read.spin_type == end_of_spin_message_written.spin_type);
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> assert(end_of_spin_message_read.spin_msg_ct[end_of_spin_message_at] == end_of_spin_message_written.spin_msg_ct[end_of_spin_message_at]); end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> assert(end_of_spin_message_read.spin_end_time_milli[end_of_spin_message_at] == end_of_spin_message_written.spin_end_time_milli[end_of_spin_message_at]); end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> assert(end_of_spin_message_read.spin_last_seq_num[end_of_spin_message_at] == end_of_spin_message_written.spin_last_seq_num[end_of_spin_message_at]); end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Session Message: 9 bytes ---------------------------------------- */

/* Appears in the TCP spin response payload (and on all UDP channels). Sent at the start of each Overnight OTC IDQS trading session: Order Acceptance at 7:00 PM, Market Open at 8:00 PM, Market Close at 7:45 AM. */
typedef TradingSessionMessage {
  byte session_time[8];
  byte trading_session
};

int trading_session_message_at;

/* every byte of Trading Session Message set to one value */
inline fill_trading_session_message(trading_session_message_record, trading_session_message_value) {
  trading_session_message_at = 0;
  do
  :: trading_session_message_at < 8 -> trading_session_message_record.session_time[trading_session_message_at] = trading_session_message_value; trading_session_message_at = trading_session_message_at + 1
  :: else -> break
  od;
  trading_session_message_record.trading_session = trading_session_message_value;
  skip
}

/* each byte of Trading Session Message set to where it lies, so a field read out of place says so */
inline ramp_trading_session_message(trading_session_message_record, trading_session_message_base) {
  trading_session_message_at = 0;
  do
  :: trading_session_message_at < 8 -> trading_session_message_record.session_time[trading_session_message_at] = (trading_session_message_base + 0 + trading_session_message_at + 1) % 256; trading_session_message_at = trading_session_message_at + 1
  :: else -> break
  od;
  trading_session_message_record.trading_session = (trading_session_message_base + 8 + 1) % 256;
  skip
}

/* Trading Session Message to the wire, 9 bytes from where the cursor stands */
inline encode_trading_session_message(trading_session_message_record) {
  trading_session_message_at = 0;
  do
  :: trading_session_message_at < 8 -> wire[at] = trading_session_message_record.session_time[trading_session_message_at]; at = at + 1; trading_session_message_at = trading_session_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_session_message_record.trading_session; at = at + 1;
  skip
}

/* Trading Session Message off the wire, 9 bytes from where the cursor stands */
inline decode_trading_session_message(trading_session_message_record) {
  trading_session_message_at = 0;
  do
  :: trading_session_message_at < 8 -> trading_session_message_record.session_time[trading_session_message_at] = wire[at]; at = at + 1; trading_session_message_at = trading_session_message_at + 1
  :: else -> break
  od;
  trading_session_message_record.trading_session = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Session Message is what was written, byte for byte */
inline equal_trading_session_message(trading_session_message_read, trading_session_message_written) {
  trading_session_message_at = 0;
  do
  :: trading_session_message_at < 8 -> assert(trading_session_message_read.session_time[trading_session_message_at] == trading_session_message_written.session_time[trading_session_message_at]); trading_session_message_at = trading_session_message_at + 1
  :: else -> break
  od;
  assert(trading_session_message_read.trading_session == trading_session_message_written.trading_session);
  skip
}

/* ---- Order Add Message: 52 bytes --------------------------------------------- */

/* Appears in the TCP spin response payload during DOB replay. Indicates a new order added to the book. */
typedef OrderAddMessage {
  byte time[4];
  byte order_id[14];
  byte side_indicator;
  byte quantity[4];
  byte symbol[14];
  byte price[8];
  byte firm_id[4];
  byte unsolicited;
  byte order_flags[2]
};

int order_add_message_at;

/* every byte of Order Add Message set to one value */
inline fill_order_add_message(order_add_message_record, order_add_message_value) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.time[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.order_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side_indicator = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.symbol[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.firm_id[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.unsolicited = order_add_message_value;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.order_flags[order_add_message_at] = order_add_message_value; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Add Message set to where it lies, so a field read out of place says so */
inline ramp_order_add_message(order_add_message_record, order_add_message_base) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.time[order_add_message_at] = (order_add_message_base + 0 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.order_id[order_add_message_at] = (order_add_message_base + 4 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side_indicator = (order_add_message_base + 18 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = (order_add_message_base + 19 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.symbol[order_add_message_at] = (order_add_message_base + 23 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = (order_add_message_base + 37 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.firm_id[order_add_message_at] = (order_add_message_base + 45 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.unsolicited = (order_add_message_base + 49 + 1) % 256;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.order_flags[order_add_message_at] = (order_add_message_base + 50 + order_add_message_at + 1) % 256; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message to the wire, 52 bytes from where the cursor stands */
inline encode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.time[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> wire[at] = order_add_message_record.order_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.side_indicator; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.quantity[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> wire[at] = order_add_message_record.symbol[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> wire[at] = order_add_message_record.price[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> wire[at] = order_add_message_record.firm_id[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  wire[at] = order_add_message_record.unsolicited; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> wire[at] = order_add_message_record.order_flags[order_add_message_at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Add Message off the wire, 52 bytes from where the cursor stands */
inline decode_order_add_message(order_add_message_record) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.time[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.order_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.side_indicator = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.quantity[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> order_add_message_record.symbol[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> order_add_message_record.price[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> order_add_message_record.firm_id[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_record.unsolicited = wire[at]; at = at + 1;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> order_add_message_record.order_flags[order_add_message_at] = wire[at]; at = at + 1; order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Add Message is what was written, byte for byte */
inline equal_order_add_message(order_add_message_read, order_add_message_written) {
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.time[order_add_message_at] == order_add_message_written.time[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> assert(order_add_message_read.order_id[order_add_message_at] == order_add_message_written.order_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.side_indicator == order_add_message_written.side_indicator);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.quantity[order_add_message_at] == order_add_message_written.quantity[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 14 -> assert(order_add_message_read.symbol[order_add_message_at] == order_add_message_written.symbol[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 8 -> assert(order_add_message_read.price[order_add_message_at] == order_add_message_written.price[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  order_add_message_at = 0;
  do
  :: order_add_message_at < 4 -> assert(order_add_message_read.firm_id[order_add_message_at] == order_add_message_written.firm_id[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  assert(order_add_message_read.unsolicited == order_add_message_written.unsolicited);
  order_add_message_at = 0;
  do
  :: order_add_message_at < 2 -> assert(order_add_message_read.order_flags[order_add_message_at] == order_add_message_written.order_flags[order_add_message_at]); order_add_message_at = order_add_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Update Message: 32 bytes ------------------------------------------ */

/* Appears in the TCP spin response payload during DOB replay. Indicates an existing order has been modified. */
typedef OrderUpdateMessage {
  byte time[4];
  byte order_id[14];
  byte quantity[4];
  byte price[8];
  byte order_flags[2]
};

int order_update_message_at;

/* every byte of Order Update Message set to one value */
inline fill_order_update_message(order_update_message_record, order_update_message_value) {
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.time[order_update_message_at] = order_update_message_value; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 14 -> order_update_message_record.order_id[order_update_message_at] = order_update_message_value; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.quantity[order_update_message_at] = order_update_message_value; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 8 -> order_update_message_record.price[order_update_message_at] = order_update_message_value; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 2 -> order_update_message_record.order_flags[order_update_message_at] = order_update_message_value; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Update Message set to where it lies, so a field read out of place says so */
inline ramp_order_update_message(order_update_message_record, order_update_message_base) {
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.time[order_update_message_at] = (order_update_message_base + 0 + order_update_message_at + 1) % 256; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 14 -> order_update_message_record.order_id[order_update_message_at] = (order_update_message_base + 4 + order_update_message_at + 1) % 256; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.quantity[order_update_message_at] = (order_update_message_base + 18 + order_update_message_at + 1) % 256; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 8 -> order_update_message_record.price[order_update_message_at] = (order_update_message_base + 22 + order_update_message_at + 1) % 256; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 2 -> order_update_message_record.order_flags[order_update_message_at] = (order_update_message_base + 30 + order_update_message_at + 1) % 256; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Update Message to the wire, 32 bytes from where the cursor stands */
inline encode_order_update_message(order_update_message_record) {
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> wire[at] = order_update_message_record.time[order_update_message_at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 14 -> wire[at] = order_update_message_record.order_id[order_update_message_at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> wire[at] = order_update_message_record.quantity[order_update_message_at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 8 -> wire[at] = order_update_message_record.price[order_update_message_at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 2 -> wire[at] = order_update_message_record.order_flags[order_update_message_at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Update Message off the wire, 32 bytes from where the cursor stands */
inline decode_order_update_message(order_update_message_record) {
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.time[order_update_message_at] = wire[at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 14 -> order_update_message_record.order_id[order_update_message_at] = wire[at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> order_update_message_record.quantity[order_update_message_at] = wire[at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 8 -> order_update_message_record.price[order_update_message_at] = wire[at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 2 -> order_update_message_record.order_flags[order_update_message_at] = wire[at]; at = at + 1; order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Update Message is what was written, byte for byte */
inline equal_order_update_message(order_update_message_read, order_update_message_written) {
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> assert(order_update_message_read.time[order_update_message_at] == order_update_message_written.time[order_update_message_at]); order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 14 -> assert(order_update_message_read.order_id[order_update_message_at] == order_update_message_written.order_id[order_update_message_at]); order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 4 -> assert(order_update_message_read.quantity[order_update_message_at] == order_update_message_written.quantity[order_update_message_at]); order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 8 -> assert(order_update_message_read.price[order_update_message_at] == order_update_message_written.price[order_update_message_at]); order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  order_update_message_at = 0;
  do
  :: order_update_message_at < 2 -> assert(order_update_message_read.order_flags[order_update_message_at] == order_update_message_written.order_flags[order_update_message_at]); order_update_message_at = order_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Delete Message: 18 bytes ------------------------------------------ */

/* Appears in the TCP spin response payload during DOB replay. Indicates an existing order has been deleted from the book. */
typedef OrderDeleteMessage {
  byte time[4];
  byte order_id[14]
};

int order_delete_message_at;

/* every byte of Order Delete Message set to one value */
inline fill_order_delete_message(order_delete_message_record, order_delete_message_value) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 14 -> order_delete_message_record.order_id[order_delete_message_at] = order_delete_message_value; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Delete Message set to where it lies, so a field read out of place says so */
inline ramp_order_delete_message(order_delete_message_record, order_delete_message_base) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time[order_delete_message_at] = (order_delete_message_base + 0 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 14 -> order_delete_message_record.order_id[order_delete_message_at] = (order_delete_message_base + 4 + order_delete_message_at + 1) % 256; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> wire[at] = order_delete_message_record.time[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 14 -> wire[at] = order_delete_message_record.order_id[order_delete_message_at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Delete Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_delete_message(order_delete_message_record) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> order_delete_message_record.time[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 14 -> order_delete_message_record.order_id[order_delete_message_at] = wire[at]; at = at + 1; order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Delete Message is what was written, byte for byte */
inline equal_order_delete_message(order_delete_message_read, order_delete_message_written) {
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 4 -> assert(order_delete_message_read.time[order_delete_message_at] == order_delete_message_written.time[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  order_delete_message_at = 0;
  do
  :: order_delete_message_at < 14 -> assert(order_delete_message_read.order_id[order_delete_message_at] == order_delete_message_written.order_id[order_delete_message_at]); order_delete_message_at = order_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution Message: 34 bytes --------------------------------------- */

/* Appears in the TCP spin response payload during DOB replay. Published when all or some of the displayed quantity of a previously published order executes at the published price. */
typedef OrderExecutionMessage {
  byte time[4];
  byte order_id[14];
  byte executed_quantity[4];
  byte remaining_quantity[4];
  byte execution_id[8]
};

int order_execution_message_at;

/* every byte of Order Execution Message set to one value */
inline fill_order_execution_message(order_execution_message_record, order_execution_message_value) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.time[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 14 -> order_execution_message_record.order_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_quantity[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_quantity[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.execution_id[order_execution_message_at] = order_execution_message_value; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_message(order_execution_message_record, order_execution_message_base) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.time[order_execution_message_at] = (order_execution_message_base + 0 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 14 -> order_execution_message_record.order_id[order_execution_message_at] = (order_execution_message_base + 4 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_quantity[order_execution_message_at] = (order_execution_message_base + 18 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_quantity[order_execution_message_at] = (order_execution_message_base + 22 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.execution_id[order_execution_message_at] = (order_execution_message_base + 26 + order_execution_message_at + 1) % 256; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.time[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 14 -> wire[at] = order_execution_message_record.order_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.executed_quantity[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> wire[at] = order_execution_message_record.remaining_quantity[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> wire[at] = order_execution_message_record.execution_id[order_execution_message_at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_execution_message(order_execution_message_record) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.time[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 14 -> order_execution_message_record.order_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.executed_quantity[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> order_execution_message_record.remaining_quantity[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> order_execution_message_record.execution_id[order_execution_message_at] = wire[at]; at = at + 1; order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution Message is what was written, byte for byte */
inline equal_order_execution_message(order_execution_message_read, order_execution_message_written) {
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.time[order_execution_message_at] == order_execution_message_written.time[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 14 -> assert(order_execution_message_read.order_id[order_execution_message_at] == order_execution_message_written.order_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.executed_quantity[order_execution_message_at] == order_execution_message_written.executed_quantity[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 4 -> assert(order_execution_message_read.remaining_quantity[order_execution_message_at] == order_execution_message_written.remaining_quantity[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  order_execution_message_at = 0;
  do
  :: order_execution_message_at < 8 -> assert(order_execution_message_read.execution_id[order_execution_message_at] == order_execution_message_written.execution_id[order_execution_message_at]); order_execution_message_at = order_execution_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Execution With Price Message: 42 bytes ---------------------------- */

/* Appears in the TCP spin response payload during DOB replay. Published when all or some of the displayed quantity of a previously published order executes at a price different than the published price. */
typedef OrderExecutionWithPriceMessage {
  byte time[4];
  byte order_id[14];
  byte executed_quantity[4];
  byte remaining_quantity[4];
  byte execution_id[8];
  byte price[8]
};

int order_execution_with_price_message_at;

/* every byte of Order Execution With Price Message set to one value */
inline fill_order_execution_with_price_message(order_execution_with_price_message_record, order_execution_with_price_message_value) {
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.time[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 14 -> order_execution_with_price_message_record.order_id[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.executed_quantity[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.remaining_quantity[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.execution_id[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.price[order_execution_with_price_message_at] = order_execution_with_price_message_value; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Execution With Price Message set to where it lies, so a field read out of place says so */
inline ramp_order_execution_with_price_message(order_execution_with_price_message_record, order_execution_with_price_message_base) {
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.time[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 0 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 14 -> order_execution_with_price_message_record.order_id[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 4 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.executed_quantity[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 18 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.remaining_quantity[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 22 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.execution_id[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 26 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.price[order_execution_with_price_message_at] = (order_execution_with_price_message_base + 34 + order_execution_with_price_message_at + 1) % 256; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution With Price Message to the wire, 42 bytes from where the cursor stands */
inline encode_order_execution_with_price_message(order_execution_with_price_message_record) {
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> wire[at] = order_execution_with_price_message_record.time[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 14 -> wire[at] = order_execution_with_price_message_record.order_id[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> wire[at] = order_execution_with_price_message_record.executed_quantity[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> wire[at] = order_execution_with_price_message_record.remaining_quantity[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> wire[at] = order_execution_with_price_message_record.execution_id[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> wire[at] = order_execution_with_price_message_record.price[order_execution_with_price_message_at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Execution With Price Message off the wire, 42 bytes from where the cursor stands */
inline decode_order_execution_with_price_message(order_execution_with_price_message_record) {
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.time[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 14 -> order_execution_with_price_message_record.order_id[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.executed_quantity[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> order_execution_with_price_message_record.remaining_quantity[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.execution_id[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> order_execution_with_price_message_record.price[order_execution_with_price_message_at] = wire[at]; at = at + 1; order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Execution With Price Message is what was written, byte for byte */
inline equal_order_execution_with_price_message(order_execution_with_price_message_read, order_execution_with_price_message_written) {
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> assert(order_execution_with_price_message_read.time[order_execution_with_price_message_at] == order_execution_with_price_message_written.time[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 14 -> assert(order_execution_with_price_message_read.order_id[order_execution_with_price_message_at] == order_execution_with_price_message_written.order_id[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> assert(order_execution_with_price_message_read.executed_quantity[order_execution_with_price_message_at] == order_execution_with_price_message_written.executed_quantity[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 4 -> assert(order_execution_with_price_message_read.remaining_quantity[order_execution_with_price_message_at] == order_execution_with_price_message_written.remaining_quantity[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> assert(order_execution_with_price_message_read.execution_id[order_execution_with_price_message_at] == order_execution_with_price_message_written.execution_id[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  order_execution_with_price_message_at = 0;
  do
  :: order_execution_with_price_message_at < 8 -> assert(order_execution_with_price_message_read.price[order_execution_with_price_message_at] == order_execution_with_price_message_written.price[order_execution_with_price_message_at]); order_execution_with_price_message_at = order_execution_with_price_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 47 bytes ------------------------------------------------- */

/* Appears in the TCP spin response payload during DOB replay. Published when non-displayed quantity of a previously published reserve order executes or when an order executes that is less than Min Quote Size and does not currently have an active Order Add message. */
typedef TradeMessage {
  byte time[4];
  byte side_indicator;
  byte quantity[4];
  byte symbol[14];
  byte price[8];
  byte execution_id[8];
  byte reserved_binary_long_8[8]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.symbol[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_binary_long_8[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = (trade_message_base + 4 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = (trade_message_base + 5 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.symbol[trade_message_at] = (trade_message_base + 9 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = (trade_message_base + 23 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = (trade_message_base + 31 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_binary_long_8[trade_message_at] = (trade_message_base + 39 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 47 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.time[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> wire[at] = trade_message_record.quantity[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> wire[at] = trade_message_record.symbol[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.price[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.execution_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> wire[at] = trade_message_record.reserved_binary_long_8[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 47 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.time[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> trade_message_record.quantity[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> trade_message_record.symbol[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.price[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.execution_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> trade_message_record.reserved_binary_long_8[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.time[trade_message_at] == trade_message_written.time[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side_indicator == trade_message_written.side_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 4 -> assert(trade_message_read.quantity[trade_message_at] == trade_message_written.quantity[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 14 -> assert(trade_message_read.symbol[trade_message_at] == trade_message_written.symbol[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.price[trade_message_at] == trade_message_written.price[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.execution_id[trade_message_at] == trade_message_written.execution_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 8 -> assert(trade_message_read.reserved_binary_long_8[trade_message_at] == trade_message_written.reserved_binary_long_8[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Top Of Book Message: 43 bytes ------------------------------------------- */

/* Appears in the TCP spin response payload during TOB replay. Provides best bid and offer aggregated top-of-book. */
typedef TopOfBookMessage {
  byte time[4];
  byte symbol[14];
  byte ask_price[8];
  byte ask_volume[4];
  byte bid_price[8];
  byte bid_volume[4];
  byte unsolicited
};

int top_of_book_message_at;

/* every byte of Top Of Book Message set to one value */
inline fill_top_of_book_message(top_of_book_message_record, top_of_book_message_value) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.time[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 14 -> top_of_book_message_record.symbol[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_volume[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_price[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_volume[top_of_book_message_at] = top_of_book_message_value; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_record.unsolicited = top_of_book_message_value;
  skip
}

/* each byte of Top Of Book Message set to where it lies, so a field read out of place says so */
inline ramp_top_of_book_message(top_of_book_message_record, top_of_book_message_base) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.time[top_of_book_message_at] = (top_of_book_message_base + 0 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 14 -> top_of_book_message_record.symbol[top_of_book_message_at] = (top_of_book_message_base + 4 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_price[top_of_book_message_at] = (top_of_book_message_base + 18 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_volume[top_of_book_message_at] = (top_of_book_message_base + 26 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_price[top_of_book_message_at] = (top_of_book_message_base + 30 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_volume[top_of_book_message_at] = (top_of_book_message_base + 38 + top_of_book_message_at + 1) % 256; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_record.unsolicited = (top_of_book_message_base + 42 + 1) % 256;
  skip
}

/* Top Of Book Message to the wire, 43 bytes from where the cursor stands */
inline encode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.time[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 14 -> wire[at] = top_of_book_message_record.symbol[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.ask_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.ask_volume[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> wire[at] = top_of_book_message_record.bid_price[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> wire[at] = top_of_book_message_record.bid_volume[top_of_book_message_at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  wire[at] = top_of_book_message_record.unsolicited; at = at + 1;
  skip
}

/* Top Of Book Message off the wire, 43 bytes from where the cursor stands */
inline decode_top_of_book_message(top_of_book_message_record) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.time[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 14 -> top_of_book_message_record.symbol[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.ask_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.ask_volume[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> top_of_book_message_record.bid_price[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> top_of_book_message_record.bid_volume[top_of_book_message_at] = wire[at]; at = at + 1; top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_record.unsolicited = wire[at]; at = at + 1;
  skip
}

/* what was read of Top Of Book Message is what was written, byte for byte */
inline equal_top_of_book_message(top_of_book_message_read, top_of_book_message_written) {
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.time[top_of_book_message_at] == top_of_book_message_written.time[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 14 -> assert(top_of_book_message_read.symbol[top_of_book_message_at] == top_of_book_message_written.symbol[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.ask_price[top_of_book_message_at] == top_of_book_message_written.ask_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.ask_volume[top_of_book_message_at] == top_of_book_message_written.ask_volume[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 8 -> assert(top_of_book_message_read.bid_price[top_of_book_message_at] == top_of_book_message_written.bid_price[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  top_of_book_message_at = 0;
  do
  :: top_of_book_message_at < 4 -> assert(top_of_book_message_read.bid_volume[top_of_book_message_at] == top_of_book_message_written.bid_volume[top_of_book_message_at]); top_of_book_message_at = top_of_book_message_at + 1
  :: else -> break
  od;
  assert(top_of_book_message_read.unsolicited == top_of_book_message_written.unsolicited);
  skip
}

/* ---- Imbalance Message: 52 bytes --------------------------------------------- */

/* Appears in the TCP spin response payload. Not available in the Overnight TradingSession. */
typedef ImbalanceMessage {
  byte time[4];
  byte symbol[14];
  byte current_inside_paired_shares[4];
  byte current_inside_closing_price[8];
  byte current_inside_imbalance_quantity[4];
  byte current_inside_imbalance_side;
  byte full_closing_price[8];
  byte ocio_only_closing_price[8];
  byte moc_shares_unmatched
};

int imbalance_message_at;

/* every byte of Imbalance Message set to one value */
inline fill_imbalance_message(imbalance_message_record, imbalance_message_value) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.symbol[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_paired_shares[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.current_inside_closing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_imbalance_quantity[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.current_inside_imbalance_side = imbalance_message_value;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.full_closing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.ocio_only_closing_price[imbalance_message_at] = imbalance_message_value; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.moc_shares_unmatched = imbalance_message_value;
  skip
}

/* each byte of Imbalance Message set to where it lies, so a field read out of place says so */
inline ramp_imbalance_message(imbalance_message_record, imbalance_message_base) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = (imbalance_message_base + 0 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.symbol[imbalance_message_at] = (imbalance_message_base + 4 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_paired_shares[imbalance_message_at] = (imbalance_message_base + 18 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.current_inside_closing_price[imbalance_message_at] = (imbalance_message_base + 22 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_imbalance_quantity[imbalance_message_at] = (imbalance_message_base + 30 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.current_inside_imbalance_side = (imbalance_message_base + 34 + 1) % 256;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.full_closing_price[imbalance_message_at] = (imbalance_message_base + 35 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.ocio_only_closing_price[imbalance_message_at] = (imbalance_message_base + 43 + imbalance_message_at + 1) % 256; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.moc_shares_unmatched = (imbalance_message_base + 51 + 1) % 256;
  skip
}

/* Imbalance Message to the wire, 52 bytes from where the cursor stands */
inline encode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.time[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> wire[at] = imbalance_message_record.symbol[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.current_inside_paired_shares[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> wire[at] = imbalance_message_record.current_inside_closing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> wire[at] = imbalance_message_record.current_inside_imbalance_quantity[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.current_inside_imbalance_side; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> wire[at] = imbalance_message_record.full_closing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> wire[at] = imbalance_message_record.ocio_only_closing_price[imbalance_message_at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_message_record.moc_shares_unmatched; at = at + 1;
  skip
}

/* Imbalance Message off the wire, 52 bytes from where the cursor stands */
inline decode_imbalance_message(imbalance_message_record) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.time[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> imbalance_message_record.symbol[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_paired_shares[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.current_inside_closing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> imbalance_message_record.current_inside_imbalance_quantity[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.current_inside_imbalance_side = wire[at]; at = at + 1;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.full_closing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> imbalance_message_record.ocio_only_closing_price[imbalance_message_at] = wire[at]; at = at + 1; imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_record.moc_shares_unmatched = wire[at]; at = at + 1;
  skip
}

/* what was read of Imbalance Message is what was written, byte for byte */
inline equal_imbalance_message(imbalance_message_read, imbalance_message_written) {
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.time[imbalance_message_at] == imbalance_message_written.time[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 14 -> assert(imbalance_message_read.symbol[imbalance_message_at] == imbalance_message_written.symbol[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.current_inside_paired_shares[imbalance_message_at] == imbalance_message_written.current_inside_paired_shares[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> assert(imbalance_message_read.current_inside_closing_price[imbalance_message_at] == imbalance_message_written.current_inside_closing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 4 -> assert(imbalance_message_read.current_inside_imbalance_quantity[imbalance_message_at] == imbalance_message_written.current_inside_imbalance_quantity[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.current_inside_imbalance_side == imbalance_message_written.current_inside_imbalance_side);
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> assert(imbalance_message_read.full_closing_price[imbalance_message_at] == imbalance_message_written.full_closing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  imbalance_message_at = 0;
  do
  :: imbalance_message_at < 8 -> assert(imbalance_message_read.ocio_only_closing_price[imbalance_message_at] == imbalance_message_written.ocio_only_closing_price[imbalance_message_at]); imbalance_message_at = imbalance_message_at + 1
  :: else -> break
  od;
  assert(imbalance_message_read.moc_shares_unmatched == imbalance_message_written.moc_shares_unmatched);
  skip
}

/* ---- System Recovery Event Message: 17 bytes --------------------------------- */

/* System Recovery event. The first event (type 'S') instructs clients to prepare and reset caches; clients must clean all cached state. A second event (type 'B') indicates recovery begins, after which the system performs a spin for all symbols and open orders. */
typedef SystemRecoveryEventMessage {
  byte deprecated[4];
  byte recovery_type;
  byte next_sequence_number[4];
  byte recovery_start_time[8]
};

int system_recovery_event_message_at;

/* every byte of System Recovery Event Message set to one value */
inline fill_system_recovery_event_message(system_recovery_event_message_record, system_recovery_event_message_value) {
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.deprecated[system_recovery_event_message_at] = system_recovery_event_message_value; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_record.recovery_type = system_recovery_event_message_value;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.next_sequence_number[system_recovery_event_message_at] = system_recovery_event_message_value; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 8 -> system_recovery_event_message_record.recovery_start_time[system_recovery_event_message_at] = system_recovery_event_message_value; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of System Recovery Event Message set to where it lies, so a field read out of place says so */
inline ramp_system_recovery_event_message(system_recovery_event_message_record, system_recovery_event_message_base) {
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.deprecated[system_recovery_event_message_at] = (system_recovery_event_message_base + 0 + system_recovery_event_message_at + 1) % 256; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_record.recovery_type = (system_recovery_event_message_base + 4 + 1) % 256;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.next_sequence_number[system_recovery_event_message_at] = (system_recovery_event_message_base + 5 + system_recovery_event_message_at + 1) % 256; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 8 -> system_recovery_event_message_record.recovery_start_time[system_recovery_event_message_at] = (system_recovery_event_message_base + 9 + system_recovery_event_message_at + 1) % 256; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Recovery Event Message to the wire, 17 bytes from where the cursor stands */
inline encode_system_recovery_event_message(system_recovery_event_message_record) {
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> wire[at] = system_recovery_event_message_record.deprecated[system_recovery_event_message_at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  wire[at] = system_recovery_event_message_record.recovery_type; at = at + 1;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> wire[at] = system_recovery_event_message_record.next_sequence_number[system_recovery_event_message_at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 8 -> wire[at] = system_recovery_event_message_record.recovery_start_time[system_recovery_event_message_at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* System Recovery Event Message off the wire, 17 bytes from where the cursor stands */
inline decode_system_recovery_event_message(system_recovery_event_message_record) {
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.deprecated[system_recovery_event_message_at] = wire[at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_record.recovery_type = wire[at]; at = at + 1;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> system_recovery_event_message_record.next_sequence_number[system_recovery_event_message_at] = wire[at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 8 -> system_recovery_event_message_record.recovery_start_time[system_recovery_event_message_at] = wire[at]; at = at + 1; system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of System Recovery Event Message is what was written, byte for byte */
inline equal_system_recovery_event_message(system_recovery_event_message_read, system_recovery_event_message_written) {
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> assert(system_recovery_event_message_read.deprecated[system_recovery_event_message_at] == system_recovery_event_message_written.deprecated[system_recovery_event_message_at]); system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  assert(system_recovery_event_message_read.recovery_type == system_recovery_event_message_written.recovery_type);
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 4 -> assert(system_recovery_event_message_read.next_sequence_number[system_recovery_event_message_at] == system_recovery_event_message_written.next_sequence_number[system_recovery_event_message_at]); system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  system_recovery_event_message_at = 0;
  do
  :: system_recovery_event_message_at < 8 -> assert(system_recovery_event_message_read.recovery_start_time[system_recovery_event_message_at] == system_recovery_event_message_written.recovery_start_time[system_recovery_event_message_at]); system_recovery_event_message_at = system_recovery_event_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Message: 32 bytes ----------------------------------------- */

/* "l" (lowercase L). Logon message is the first message required to send to the server once a connection is established. At minimum, the firm and user id should be provided. */
typedef LoginRequestMessage {
  byte user_id[16];
  byte password[16]
};

int login_request_message_at;

/* every byte of Login Request Message set to one value */
inline fill_login_request_message(login_request_message_record, login_request_message_value) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.user_id[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.password[login_request_message_at] = login_request_message_value; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Message set to where it lies, so a field read out of place says so */
inline ramp_login_request_message(login_request_message_record, login_request_message_base) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.user_id[login_request_message_at] = (login_request_message_base + 0 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.password[login_request_message_at] = (login_request_message_base + 16 + login_request_message_at + 1) % 256; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message to the wire, 32 bytes from where the cursor stands */
inline encode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> wire[at] = login_request_message_record.user_id[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> wire[at] = login_request_message_record.password[login_request_message_at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Message off the wire, 32 bytes from where the cursor stands */
inline decode_login_request_message(login_request_message_record) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.user_id[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> login_request_message_record.password[login_request_message_at] = wire[at]; at = at + 1; login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Message is what was written, byte for byte */
inline equal_login_request_message(login_request_message_read, login_request_message_written) {
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> assert(login_request_message_read.user_id[login_request_message_at] == login_request_message_written.user_id[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  login_request_message_at = 0;
  do
  :: login_request_message_at < 16 -> assert(login_request_message_read.password[login_request_message_at] == login_request_message_written.password[login_request_message_at]); login_request_message_at = login_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Response Message: 17 bytes ---------------------------------------- */

/* "a". The Login Response Message is sent to a client's response to a TCP/IP Login Message. The status field is used to reflect an accepted login or the reason the session was not accepted. If login fails, the TCP/IP connection will be dropped. */
typedef LoginResponseMessage {
  byte user_id[16];
  byte login_status
};

int login_response_message_at;

/* every byte of Login Response Message set to one value */
inline fill_login_response_message(login_response_message_record, login_response_message_value) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.user_id[login_response_message_at] = login_response_message_value; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.login_status = login_response_message_value;
  skip
}

/* each byte of Login Response Message set to where it lies, so a field read out of place says so */
inline ramp_login_response_message(login_response_message_record, login_response_message_base) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.user_id[login_response_message_at] = (login_response_message_base + 0 + login_response_message_at + 1) % 256; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.login_status = (login_response_message_base + 16 + 1) % 256;
  skip
}

/* Login Response Message to the wire, 17 bytes from where the cursor stands */
inline encode_login_response_message(login_response_message_record) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> wire[at] = login_response_message_record.user_id[login_response_message_at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  wire[at] = login_response_message_record.login_status; at = at + 1;
  skip
}

/* Login Response Message off the wire, 17 bytes from where the cursor stands */
inline decode_login_response_message(login_response_message_record) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> login_response_message_record.user_id[login_response_message_at] = wire[at]; at = at + 1; login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  login_response_message_record.login_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Response Message is what was written, byte for byte */
inline equal_login_response_message(login_response_message_read, login_response_message_written) {
  login_response_message_at = 0;
  do
  :: login_response_message_at < 16 -> assert(login_response_message_read.user_id[login_response_message_at] == login_response_message_written.user_id[login_response_message_at]); login_response_message_at = login_response_message_at + 1
  :: else -> break
  od;
  assert(login_response_message_read.login_status == login_response_message_written.login_status);
  skip
}

/* ---- Retransmission Request Message: 9 bytes --------------------------------- */

/* "r". Request retransmission of a range of messages. */
typedef RetransmissionRequestMessage {
  byte start_sequence[4];
  byte number_of_messages[4];
  byte retran_via_tcp
};

int retransmission_request_message_at;

/* every byte of Retransmission Request Message set to one value */
inline fill_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_value) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.start_sequence[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.number_of_messages[retransmission_request_message_at] = retransmission_request_message_value; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.retran_via_tcp = retransmission_request_message_value;
  skip
}

/* each byte of Retransmission Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_request_message(retransmission_request_message_record, retransmission_request_message_base) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.start_sequence[retransmission_request_message_at] = (retransmission_request_message_base + 0 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.number_of_messages[retransmission_request_message_at] = (retransmission_request_message_base + 4 + retransmission_request_message_at + 1) % 256; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.retran_via_tcp = (retransmission_request_message_base + 8 + 1) % 256;
  skip
}

/* Retransmission Request Message to the wire, 9 bytes from where the cursor stands */
inline encode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.start_sequence[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> wire[at] = retransmission_request_message_record.number_of_messages[retransmission_request_message_at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_request_message_record.retran_via_tcp; at = at + 1;
  skip
}

/* Retransmission Request Message off the wire, 9 bytes from where the cursor stands */
inline decode_retransmission_request_message(retransmission_request_message_record) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.start_sequence[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> retransmission_request_message_record.number_of_messages[retransmission_request_message_at] = wire[at]; at = at + 1; retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_record.retran_via_tcp = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission Request Message is what was written, byte for byte */
inline equal_retransmission_request_message(retransmission_request_message_read, retransmission_request_message_written) {
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.start_sequence[retransmission_request_message_at] == retransmission_request_message_written.start_sequence[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  retransmission_request_message_at = 0;
  do
  :: retransmission_request_message_at < 4 -> assert(retransmission_request_message_read.number_of_messages[retransmission_request_message_at] == retransmission_request_message_written.number_of_messages[retransmission_request_message_at]); retransmission_request_message_at = retransmission_request_message_at + 1
  :: else -> break
  od;
  assert(retransmission_request_message_read.retran_via_tcp == retransmission_request_message_written.retran_via_tcp);
  skip
}

/* ---- Retransmission Response Message: 9 bytes -------------------------------- */

/* "b". Response to a Retransmission Request. The replay server sends a heartbeat message every second. If the server replay response to a request takes too much time, then it is up to the client to either wait for a few heartbeats, or arbitrary time, then disconnect and send another replay request. */
typedef RetransmissionResponseMessage {
  byte start_sequence[4];
  byte number_of_messages[4];
  byte retransmission_status
};

int retransmission_response_message_at;

/* every byte of Retransmission Response Message set to one value */
inline fill_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_value) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.start_sequence[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.number_of_messages[retransmission_response_message_at] = retransmission_response_message_value; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retransmission_status = retransmission_response_message_value;
  skip
}

/* each byte of Retransmission Response Message set to where it lies, so a field read out of place says so */
inline ramp_retransmission_response_message(retransmission_response_message_record, retransmission_response_message_base) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.start_sequence[retransmission_response_message_at] = (retransmission_response_message_base + 0 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.number_of_messages[retransmission_response_message_at] = (retransmission_response_message_base + 4 + retransmission_response_message_at + 1) % 256; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retransmission_status = (retransmission_response_message_base + 8 + 1) % 256;
  skip
}

/* Retransmission Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.start_sequence[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> wire[at] = retransmission_response_message_record.number_of_messages[retransmission_response_message_at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmission_response_message_record.retransmission_status; at = at + 1;
  skip
}

/* Retransmission Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_retransmission_response_message(retransmission_response_message_record) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.start_sequence[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> retransmission_response_message_record.number_of_messages[retransmission_response_message_at] = wire[at]; at = at + 1; retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_record.retransmission_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmission Response Message is what was written, byte for byte */
inline equal_retransmission_response_message(retransmission_response_message_read, retransmission_response_message_written) {
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.start_sequence[retransmission_response_message_at] == retransmission_response_message_written.start_sequence[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  retransmission_response_message_at = 0;
  do
  :: retransmission_response_message_at < 4 -> assert(retransmission_response_message_read.number_of_messages[retransmission_response_message_at] == retransmission_response_message_written.number_of_messages[retransmission_response_message_at]); retransmission_response_message_at = retransmission_response_message_at + 1
  :: else -> break
  od;
  assert(retransmission_response_message_read.retransmission_status == retransmission_response_message_written.retransmission_status);
  skip
}

/* ---- Spin Request Message: 4 bytes ------------------------------------------- */

/* "s". Request a refresh spin of state from the server. */
typedef SpinRequestMessage {
  byte client_identifier[4]
};

int spin_request_message_at;

/* every byte of Spin Request Message set to one value */
inline fill_spin_request_message(spin_request_message_record, spin_request_message_value) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.client_identifier[spin_request_message_at] = spin_request_message_value; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Spin Request Message set to where it lies, so a field read out of place says so */
inline ramp_spin_request_message(spin_request_message_record, spin_request_message_base) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.client_identifier[spin_request_message_at] = (spin_request_message_base + 0 + spin_request_message_at + 1) % 256; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> wire[at] = spin_request_message_record.client_identifier[spin_request_message_at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Spin Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_spin_request_message(spin_request_message_record) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> spin_request_message_record.client_identifier[spin_request_message_at] = wire[at]; at = at + 1; spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Spin Request Message is what was written, byte for byte */
inline equal_spin_request_message(spin_request_message_read, spin_request_message_written) {
  spin_request_message_at = 0;
  do
  :: spin_request_message_at < 4 -> assert(spin_request_message_read.client_identifier[spin_request_message_at] == spin_request_message_written.client_identifier[spin_request_message_at]); spin_request_message_at = spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Spin Response Message: 5 bytes ------------------------------------------ */

/* "c". The server will send a Spin Response ("c") with status Start of Spin ("S"). It will then transmit Trading Session, Security, Orders or TOB, etc., followed by another Spin Response ("c") with status End of Spin ("E"). Ignore any Heartbeat messages. Spin messages are always returned to the same TCP socket from where they originated. */
typedef SpinResponseMessage {
  byte client_identifier[4];
  byte spin_status
};

int spin_response_message_at;

/* every byte of Spin Response Message set to one value */
inline fill_spin_response_message(spin_response_message_record, spin_response_message_value) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.client_identifier[spin_response_message_at] = spin_response_message_value; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_status = spin_response_message_value;
  skip
}

/* each byte of Spin Response Message set to where it lies, so a field read out of place says so */
inline ramp_spin_response_message(spin_response_message_record, spin_response_message_base) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.client_identifier[spin_response_message_at] = (spin_response_message_base + 0 + spin_response_message_at + 1) % 256; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_status = (spin_response_message_base + 4 + 1) % 256;
  skip
}

/* Spin Response Message to the wire, 5 bytes from where the cursor stands */
inline encode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> wire[at] = spin_response_message_record.client_identifier[spin_response_message_at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  wire[at] = spin_response_message_record.spin_status; at = at + 1;
  skip
}

/* Spin Response Message off the wire, 5 bytes from where the cursor stands */
inline decode_spin_response_message(spin_response_message_record) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> spin_response_message_record.client_identifier[spin_response_message_at] = wire[at]; at = at + 1; spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  spin_response_message_record.spin_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Spin Response Message is what was written, byte for byte */
inline equal_spin_response_message(spin_response_message_read, spin_response_message_written) {
  spin_response_message_at = 0;
  do
  :: spin_response_message_at < 4 -> assert(spin_response_message_read.client_identifier[spin_response_message_at] == spin_response_message_written.client_identifier[spin_response_message_at]); spin_response_message_at = spin_response_message_at + 1
  :: else -> break
  od;
  assert(spin_response_message_read.spin_status == spin_response_message_written.spin_status);
  skip
}

/* ---- Enhanced Spin Request Message: 4 bytes ---------------------------------- */

/* "t". Request an enhanced spin which includes a last-sequence-number marker for syncing real time data. */
typedef EnhancedSpinRequestMessage {
  byte client_identifier[4]
};

int enhanced_spin_request_message_at;

/* every byte of Enhanced Spin Request Message set to one value */
inline fill_enhanced_spin_request_message(enhanced_spin_request_message_record, enhanced_spin_request_message_value) {
  enhanced_spin_request_message_at = 0;
  do
  :: enhanced_spin_request_message_at < 4 -> enhanced_spin_request_message_record.client_identifier[enhanced_spin_request_message_at] = enhanced_spin_request_message_value; enhanced_spin_request_message_at = enhanced_spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enhanced Spin Request Message set to where it lies, so a field read out of place says so */
inline ramp_enhanced_spin_request_message(enhanced_spin_request_message_record, enhanced_spin_request_message_base) {
  enhanced_spin_request_message_at = 0;
  do
  :: enhanced_spin_request_message_at < 4 -> enhanced_spin_request_message_record.client_identifier[enhanced_spin_request_message_at] = (enhanced_spin_request_message_base + 0 + enhanced_spin_request_message_at + 1) % 256; enhanced_spin_request_message_at = enhanced_spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Spin Request Message to the wire, 4 bytes from where the cursor stands */
inline encode_enhanced_spin_request_message(enhanced_spin_request_message_record) {
  enhanced_spin_request_message_at = 0;
  do
  :: enhanced_spin_request_message_at < 4 -> wire[at] = enhanced_spin_request_message_record.client_identifier[enhanced_spin_request_message_at]; at = at + 1; enhanced_spin_request_message_at = enhanced_spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Spin Request Message off the wire, 4 bytes from where the cursor stands */
inline decode_enhanced_spin_request_message(enhanced_spin_request_message_record) {
  enhanced_spin_request_message_at = 0;
  do
  :: enhanced_spin_request_message_at < 4 -> enhanced_spin_request_message_record.client_identifier[enhanced_spin_request_message_at] = wire[at]; at = at + 1; enhanced_spin_request_message_at = enhanced_spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enhanced Spin Request Message is what was written, byte for byte */
inline equal_enhanced_spin_request_message(enhanced_spin_request_message_read, enhanced_spin_request_message_written) {
  enhanced_spin_request_message_at = 0;
  do
  :: enhanced_spin_request_message_at < 4 -> assert(enhanced_spin_request_message_read.client_identifier[enhanced_spin_request_message_at] == enhanced_spin_request_message_written.client_identifier[enhanced_spin_request_message_at]); enhanced_spin_request_message_at = enhanced_spin_request_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Enhanced Spin Response Message: 9 bytes --------------------------------- */

/* "d". The server will send an Enhanced Spin Response ("d") with status Start of Spin ("S"). It will then transmit Trading Session, Security, Orders or TOB, etc., followed by another Enhanced Spin Response ("d") with status End of Spin ("E"). Ignore any Heartbeat messages. Spin messages are always returned to the same TCP socket from where they originated. */
typedef EnhancedSpinResponseMessage {
  byte client_identifier[4];
  byte enhanced_spin_status;
  byte last_seq_num[4]
};

int enhanced_spin_response_message_at;

/* every byte of Enhanced Spin Response Message set to one value */
inline fill_enhanced_spin_response_message(enhanced_spin_response_message_record, enhanced_spin_response_message_value) {
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.client_identifier[enhanced_spin_response_message_at] = enhanced_spin_response_message_value; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  enhanced_spin_response_message_record.enhanced_spin_status = enhanced_spin_response_message_value;
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.last_seq_num[enhanced_spin_response_message_at] = enhanced_spin_response_message_value; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Enhanced Spin Response Message set to where it lies, so a field read out of place says so */
inline ramp_enhanced_spin_response_message(enhanced_spin_response_message_record, enhanced_spin_response_message_base) {
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.client_identifier[enhanced_spin_response_message_at] = (enhanced_spin_response_message_base + 0 + enhanced_spin_response_message_at + 1) % 256; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  enhanced_spin_response_message_record.enhanced_spin_status = (enhanced_spin_response_message_base + 4 + 1) % 256;
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.last_seq_num[enhanced_spin_response_message_at] = (enhanced_spin_response_message_base + 5 + enhanced_spin_response_message_at + 1) % 256; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Spin Response Message to the wire, 9 bytes from where the cursor stands */
inline encode_enhanced_spin_response_message(enhanced_spin_response_message_record) {
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> wire[at] = enhanced_spin_response_message_record.client_identifier[enhanced_spin_response_message_at]; at = at + 1; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  wire[at] = enhanced_spin_response_message_record.enhanced_spin_status; at = at + 1;
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> wire[at] = enhanced_spin_response_message_record.last_seq_num[enhanced_spin_response_message_at]; at = at + 1; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* Enhanced Spin Response Message off the wire, 9 bytes from where the cursor stands */
inline decode_enhanced_spin_response_message(enhanced_spin_response_message_record) {
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.client_identifier[enhanced_spin_response_message_at] = wire[at]; at = at + 1; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  enhanced_spin_response_message_record.enhanced_spin_status = wire[at]; at = at + 1;
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> enhanced_spin_response_message_record.last_seq_num[enhanced_spin_response_message_at] = wire[at]; at = at + 1; enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Enhanced Spin Response Message is what was written, byte for byte */
inline equal_enhanced_spin_response_message(enhanced_spin_response_message_read, enhanced_spin_response_message_written) {
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> assert(enhanced_spin_response_message_read.client_identifier[enhanced_spin_response_message_at] == enhanced_spin_response_message_written.client_identifier[enhanced_spin_response_message_at]); enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  assert(enhanced_spin_response_message_read.enhanced_spin_status == enhanced_spin_response_message_written.enhanced_spin_status);
  enhanced_spin_response_message_at = 0;
  do
  :: enhanced_spin_response_message_at < 4 -> assert(enhanced_spin_response_message_read.last_seq_num[enhanced_spin_response_message_at] == enhanced_spin_response_message_written.last_seq_num[enhanced_spin_response_message_at]); enhanced_spin_response_message_at = enhanced_spin_response_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Heartbeat Message: 4 bytes ---------------------------------------------- */

/* "h". After login successful, FI will send a client a heartbeat once every 60 seconds. If there is no heartbeat from client for more than 5 minutes, system will disconnect. */
typedef HeartbeatMessage {
  byte client_identifier[4]
};

int heartbeat_message_at;

/* every byte of Heartbeat Message set to one value */
inline fill_heartbeat_message(heartbeat_message_record, heartbeat_message_value) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.client_identifier[heartbeat_message_at] = heartbeat_message_value; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Heartbeat Message set to where it lies, so a field read out of place says so */
inline ramp_heartbeat_message(heartbeat_message_record, heartbeat_message_base) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.client_identifier[heartbeat_message_at] = (heartbeat_message_base + 0 + heartbeat_message_at + 1) % 256; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message to the wire, 4 bytes from where the cursor stands */
inline encode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> wire[at] = heartbeat_message_record.client_identifier[heartbeat_message_at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* Heartbeat Message off the wire, 4 bytes from where the cursor stands */
inline decode_heartbeat_message(heartbeat_message_record) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> heartbeat_message_record.client_identifier[heartbeat_message_at] = wire[at]; at = at + 1; heartbeat_message_at = heartbeat_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Heartbeat Message is what was written, byte for byte */
inline equal_heartbeat_message(heartbeat_message_read, heartbeat_message_written) {
  heartbeat_message_at = 0;
  do
  :: heartbeat_message_at < 4 -> assert(heartbeat_message_read.client_identifier[heartbeat_message_at] == heartbeat_message_written.client_identifier[heartbeat_message_at]); heartbeat_message_at = heartbeat_message_at + 1
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
    assert(at == 3);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 3);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Start Of Spin Message: encoded, read back, and compared */
proctype check_start_of_spin_message() {
  StartOfSpinMessage start_of_spin_message_sent;
  StartOfSpinMessage start_of_spin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_start_of_spin_message(start_of_spin_message_sent, 0)
  :: pattern == 1 -> fill_start_of_spin_message(start_of_spin_message_sent, 32)
  :: pattern == 2 -> fill_start_of_spin_message(start_of_spin_message_sent, 255)
  :: else -> ramp_start_of_spin_message(start_of_spin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_start_of_spin_message(start_of_spin_message_sent);
    assert(at == 13);
    at = 0;
    decode_start_of_spin_message(start_of_spin_message_got);
    assert(at == 13);
    equal_start_of_spin_message(start_of_spin_message_got, start_of_spin_message_sent)
  }
}

/* End Of Spin Message: encoded, read back, and compared */
proctype check_end_of_spin_message() {
  EndOfSpinMessage end_of_spin_message_sent;
  EndOfSpinMessage end_of_spin_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_spin_message(end_of_spin_message_sent, 0)
  :: pattern == 1 -> fill_end_of_spin_message(end_of_spin_message_sent, 32)
  :: pattern == 2 -> fill_end_of_spin_message(end_of_spin_message_sent, 255)
  :: else -> ramp_end_of_spin_message(end_of_spin_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_spin_message(end_of_spin_message_sent);
    assert(at == 17);
    at = 0;
    decode_end_of_spin_message(end_of_spin_message_got);
    assert(at == 17);
    equal_end_of_spin_message(end_of_spin_message_got, end_of_spin_message_sent)
  }
}

/* Trading Session Message: encoded, read back, and compared */
proctype check_trading_session_message() {
  TradingSessionMessage trading_session_message_sent;
  TradingSessionMessage trading_session_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_session_message(trading_session_message_sent, 0)
  :: pattern == 1 -> fill_trading_session_message(trading_session_message_sent, 32)
  :: pattern == 2 -> fill_trading_session_message(trading_session_message_sent, 255)
  :: else -> ramp_trading_session_message(trading_session_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_session_message(trading_session_message_sent);
    assert(at == 9);
    at = 0;
    decode_trading_session_message(trading_session_message_got);
    assert(at == 9);
    equal_trading_session_message(trading_session_message_got, trading_session_message_sent)
  }
}

/* Order Add Message: encoded, read back, and compared */
proctype check_order_add_message() {
  OrderAddMessage order_add_message_sent;
  OrderAddMessage order_add_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_add_message(order_add_message_sent, 0)
  :: pattern == 1 -> fill_order_add_message(order_add_message_sent, 32)
  :: pattern == 2 -> fill_order_add_message(order_add_message_sent, 255)
  :: else -> ramp_order_add_message(order_add_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_add_message(order_add_message_sent);
    assert(at == 52);
    at = 0;
    decode_order_add_message(order_add_message_got);
    assert(at == 52);
    equal_order_add_message(order_add_message_got, order_add_message_sent)
  }
}

/* Order Update Message: encoded, read back, and compared */
proctype check_order_update_message() {
  OrderUpdateMessage order_update_message_sent;
  OrderUpdateMessage order_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_update_message(order_update_message_sent, 0)
  :: pattern == 1 -> fill_order_update_message(order_update_message_sent, 32)
  :: pattern == 2 -> fill_order_update_message(order_update_message_sent, 255)
  :: else -> ramp_order_update_message(order_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_update_message(order_update_message_sent);
    assert(at == 32);
    at = 0;
    decode_order_update_message(order_update_message_got);
    assert(at == 32);
    equal_order_update_message(order_update_message_got, order_update_message_sent)
  }
}

/* Order Delete Message: encoded, read back, and compared */
proctype check_order_delete_message() {
  OrderDeleteMessage order_delete_message_sent;
  OrderDeleteMessage order_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_delete_message(order_delete_message_sent, 0)
  :: pattern == 1 -> fill_order_delete_message(order_delete_message_sent, 32)
  :: pattern == 2 -> fill_order_delete_message(order_delete_message_sent, 255)
  :: else -> ramp_order_delete_message(order_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_delete_message(order_delete_message_sent);
    assert(at == 18);
    at = 0;
    decode_order_delete_message(order_delete_message_got);
    assert(at == 18);
    equal_order_delete_message(order_delete_message_got, order_delete_message_sent)
  }
}

/* Order Execution Message: encoded, read back, and compared */
proctype check_order_execution_message() {
  OrderExecutionMessage order_execution_message_sent;
  OrderExecutionMessage order_execution_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_message(order_execution_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_message(order_execution_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_message(order_execution_message_sent, 255)
  :: else -> ramp_order_execution_message(order_execution_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_message(order_execution_message_sent);
    assert(at == 34);
    at = 0;
    decode_order_execution_message(order_execution_message_got);
    assert(at == 34);
    equal_order_execution_message(order_execution_message_got, order_execution_message_sent)
  }
}

/* Order Execution With Price Message: encoded, read back, and compared */
proctype check_order_execution_with_price_message() {
  OrderExecutionWithPriceMessage order_execution_with_price_message_sent;
  OrderExecutionWithPriceMessage order_execution_with_price_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_execution_with_price_message(order_execution_with_price_message_sent, 0)
  :: pattern == 1 -> fill_order_execution_with_price_message(order_execution_with_price_message_sent, 32)
  :: pattern == 2 -> fill_order_execution_with_price_message(order_execution_with_price_message_sent, 255)
  :: else -> ramp_order_execution_with_price_message(order_execution_with_price_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_execution_with_price_message(order_execution_with_price_message_sent);
    assert(at == 42);
    at = 0;
    decode_order_execution_with_price_message(order_execution_with_price_message_got);
    assert(at == 42);
    equal_order_execution_with_price_message(order_execution_with_price_message_got, order_execution_with_price_message_sent)
  }
}

/* Trade Message: encoded, read back, and compared */
proctype check_trade_message() {
  TradeMessage trade_message_sent;
  TradeMessage trade_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message(trade_message_sent, 0)
  :: pattern == 1 -> fill_trade_message(trade_message_sent, 32)
  :: pattern == 2 -> fill_trade_message(trade_message_sent, 255)
  :: else -> ramp_trade_message(trade_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message(trade_message_sent);
    assert(at == 47);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 47);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Top Of Book Message: encoded, read back, and compared */
proctype check_top_of_book_message() {
  TopOfBookMessage top_of_book_message_sent;
  TopOfBookMessage top_of_book_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_top_of_book_message(top_of_book_message_sent, 0)
  :: pattern == 1 -> fill_top_of_book_message(top_of_book_message_sent, 32)
  :: pattern == 2 -> fill_top_of_book_message(top_of_book_message_sent, 255)
  :: else -> ramp_top_of_book_message(top_of_book_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_top_of_book_message(top_of_book_message_sent);
    assert(at == 43);
    at = 0;
    decode_top_of_book_message(top_of_book_message_got);
    assert(at == 43);
    equal_top_of_book_message(top_of_book_message_got, top_of_book_message_sent)
  }
}

/* Imbalance Message: encoded, read back, and compared */
proctype check_imbalance_message() {
  ImbalanceMessage imbalance_message_sent;
  ImbalanceMessage imbalance_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_imbalance_message(imbalance_message_sent, 0)
  :: pattern == 1 -> fill_imbalance_message(imbalance_message_sent, 32)
  :: pattern == 2 -> fill_imbalance_message(imbalance_message_sent, 255)
  :: else -> ramp_imbalance_message(imbalance_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_imbalance_message(imbalance_message_sent);
    assert(at == 52);
    at = 0;
    decode_imbalance_message(imbalance_message_got);
    assert(at == 52);
    equal_imbalance_message(imbalance_message_got, imbalance_message_sent)
  }
}

/* System Recovery Event Message: encoded, read back, and compared */
proctype check_system_recovery_event_message() {
  SystemRecoveryEventMessage system_recovery_event_message_sent;
  SystemRecoveryEventMessage system_recovery_event_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_recovery_event_message(system_recovery_event_message_sent, 0)
  :: pattern == 1 -> fill_system_recovery_event_message(system_recovery_event_message_sent, 32)
  :: pattern == 2 -> fill_system_recovery_event_message(system_recovery_event_message_sent, 255)
  :: else -> ramp_system_recovery_event_message(system_recovery_event_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_recovery_event_message(system_recovery_event_message_sent);
    assert(at == 17);
    at = 0;
    decode_system_recovery_event_message(system_recovery_event_message_got);
    assert(at == 17);
    equal_system_recovery_event_message(system_recovery_event_message_got, system_recovery_event_message_sent)
  }
}

/* Login Request Message: encoded, read back, and compared */
proctype check_login_request_message() {
  LoginRequestMessage login_request_message_sent;
  LoginRequestMessage login_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_message(login_request_message_sent, 0)
  :: pattern == 1 -> fill_login_request_message(login_request_message_sent, 32)
  :: pattern == 2 -> fill_login_request_message(login_request_message_sent, 255)
  :: else -> ramp_login_request_message(login_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_message(login_request_message_sent);
    assert(at == 32);
    at = 0;
    decode_login_request_message(login_request_message_got);
    assert(at == 32);
    equal_login_request_message(login_request_message_got, login_request_message_sent)
  }
}

/* Login Response Message: encoded, read back, and compared */
proctype check_login_response_message() {
  LoginResponseMessage login_response_message_sent;
  LoginResponseMessage login_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_response_message(login_response_message_sent, 0)
  :: pattern == 1 -> fill_login_response_message(login_response_message_sent, 32)
  :: pattern == 2 -> fill_login_response_message(login_response_message_sent, 255)
  :: else -> ramp_login_response_message(login_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_response_message(login_response_message_sent);
    assert(at == 17);
    at = 0;
    decode_login_response_message(login_response_message_got);
    assert(at == 17);
    equal_login_response_message(login_response_message_got, login_response_message_sent)
  }
}

/* Retransmission Request Message: encoded, read back, and compared */
proctype check_retransmission_request_message() {
  RetransmissionRequestMessage retransmission_request_message_sent;
  RetransmissionRequestMessage retransmission_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_request_message(retransmission_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_request_message(retransmission_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_request_message(retransmission_request_message_sent, 255)
  :: else -> ramp_retransmission_request_message(retransmission_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_request_message(retransmission_request_message_sent);
    assert(at == 9);
    at = 0;
    decode_retransmission_request_message(retransmission_request_message_got);
    assert(at == 9);
    equal_retransmission_request_message(retransmission_request_message_got, retransmission_request_message_sent)
  }
}

/* Retransmission Response Message: encoded, read back, and compared */
proctype check_retransmission_response_message() {
  RetransmissionResponseMessage retransmission_response_message_sent;
  RetransmissionResponseMessage retransmission_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmission_response_message(retransmission_response_message_sent, 0)
  :: pattern == 1 -> fill_retransmission_response_message(retransmission_response_message_sent, 32)
  :: pattern == 2 -> fill_retransmission_response_message(retransmission_response_message_sent, 255)
  :: else -> ramp_retransmission_response_message(retransmission_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmission_response_message(retransmission_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_retransmission_response_message(retransmission_response_message_got);
    assert(at == 9);
    equal_retransmission_response_message(retransmission_response_message_got, retransmission_response_message_sent)
  }
}

/* Spin Request Message: encoded, read back, and compared */
proctype check_spin_request_message() {
  SpinRequestMessage spin_request_message_sent;
  SpinRequestMessage spin_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_request_message(spin_request_message_sent, 0)
  :: pattern == 1 -> fill_spin_request_message(spin_request_message_sent, 32)
  :: pattern == 2 -> fill_spin_request_message(spin_request_message_sent, 255)
  :: else -> ramp_spin_request_message(spin_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_request_message(spin_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_spin_request_message(spin_request_message_got);
    assert(at == 4);
    equal_spin_request_message(spin_request_message_got, spin_request_message_sent)
  }
}

/* Spin Response Message: encoded, read back, and compared */
proctype check_spin_response_message() {
  SpinResponseMessage spin_response_message_sent;
  SpinResponseMessage spin_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_spin_response_message(spin_response_message_sent, 0)
  :: pattern == 1 -> fill_spin_response_message(spin_response_message_sent, 32)
  :: pattern == 2 -> fill_spin_response_message(spin_response_message_sent, 255)
  :: else -> ramp_spin_response_message(spin_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_spin_response_message(spin_response_message_sent);
    assert(at == 5);
    at = 0;
    decode_spin_response_message(spin_response_message_got);
    assert(at == 5);
    equal_spin_response_message(spin_response_message_got, spin_response_message_sent)
  }
}

/* Enhanced Spin Request Message: encoded, read back, and compared */
proctype check_enhanced_spin_request_message() {
  EnhancedSpinRequestMessage enhanced_spin_request_message_sent;
  EnhancedSpinRequestMessage enhanced_spin_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enhanced_spin_request_message(enhanced_spin_request_message_sent, 0)
  :: pattern == 1 -> fill_enhanced_spin_request_message(enhanced_spin_request_message_sent, 32)
  :: pattern == 2 -> fill_enhanced_spin_request_message(enhanced_spin_request_message_sent, 255)
  :: else -> ramp_enhanced_spin_request_message(enhanced_spin_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enhanced_spin_request_message(enhanced_spin_request_message_sent);
    assert(at == 4);
    at = 0;
    decode_enhanced_spin_request_message(enhanced_spin_request_message_got);
    assert(at == 4);
    equal_enhanced_spin_request_message(enhanced_spin_request_message_got, enhanced_spin_request_message_sent)
  }
}

/* Enhanced Spin Response Message: encoded, read back, and compared */
proctype check_enhanced_spin_response_message() {
  EnhancedSpinResponseMessage enhanced_spin_response_message_sent;
  EnhancedSpinResponseMessage enhanced_spin_response_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_enhanced_spin_response_message(enhanced_spin_response_message_sent, 0)
  :: pattern == 1 -> fill_enhanced_spin_response_message(enhanced_spin_response_message_sent, 32)
  :: pattern == 2 -> fill_enhanced_spin_response_message(enhanced_spin_response_message_sent, 255)
  :: else -> ramp_enhanced_spin_response_message(enhanced_spin_response_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_enhanced_spin_response_message(enhanced_spin_response_message_sent);
    assert(at == 9);
    at = 0;
    decode_enhanced_spin_response_message(enhanced_spin_response_message_got);
    assert(at == 9);
    equal_enhanced_spin_response_message(enhanced_spin_response_message_got, enhanced_spin_response_message_sent)
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
    assert(at == 4);
    at = 0;
    decode_heartbeat_message(heartbeat_message_got);
    assert(at == 4);
    equal_heartbeat_message(heartbeat_message_got, heartbeat_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_start_of_spin_message()
  :: run check_end_of_spin_message()
  :: run check_trading_session_message()
  :: run check_order_add_message()
  :: run check_order_update_message()
  :: run check_order_delete_message()
  :: run check_order_execution_message()
  :: run check_order_execution_with_price_message()
  :: run check_trade_message()
  :: run check_top_of_book_message()
  :: run check_imbalance_message()
  :: run check_system_recovery_event_message()
  :: run check_login_request_message()
  :: run check_login_response_message()
  :: run check_retransmission_request_message()
  :: run check_retransmission_response_message()
  :: run check_spin_request_message()
  :: run check_spin_response_message()
  :: run check_enhanced_spin_request_message()
  :: run check_enhanced_spin_response_message()
  :: run check_heartbeat_message()
  fi
}
