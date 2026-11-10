/*
 * OTC Markets Group OTC Top of Book
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
 *   - a run counted by a field
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

/* Otc Udp Message Header */
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

/* After a Spin Response Message, with status 'S', this message appears on all channels and indicates the beginning of a spin message cycle. */
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

/* This message appears on all channels and indicates the end of a spin message cycle. It will be followed by a Spin Response Message, with status 'E'. */
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

/* This message appears on all channels and is sent out at the start of each MOON trading session: Order Acceptance at 7:30 PM, Market Open at 8:00 PM, Market Close at 4 AM. The message can also be sent mid-day if a technical outage caused a temporary closure of the market. */
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

/* ---- Top Of Book Message: 43 bytes ------------------------------------------- */

/* This message appears on the TOB channel. Provides best bid and offer aggregated top-of-book. */
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

/* This message appears on all channels. This message is not available in the Overnight TradingSession. */
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

/* In case of a catastrophic issue at the exchange, the system sends a System Recovery Event. The first event (type 'S') instructs clients to prepare and reset caches; clients must clean all cached state. A second event (type 'B') indicates recovery begins, after which the system performs a spin for all symbols and open orders. */
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

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_start_of_spin_message()
  :: run check_end_of_spin_message()
  :: run check_trading_session_message()
  :: run check_top_of_book_message()
  :: run check_imbalance_message()
  :: run check_system_recovery_event_message()
  fi
}
