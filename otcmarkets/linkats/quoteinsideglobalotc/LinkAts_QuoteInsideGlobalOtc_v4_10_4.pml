/*
 * OTC Markets Group 
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
#define WIRE 21

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

/* ---- Start Of Spin Message: 17 bytes ----------------------------------------- */

/* This message appears on all quote channels and indicates the beginning of a spin message cycle. */
typedef StartOfSpinMessage {
  byte channel_seq_num[4];
  byte spin_type;
  byte spin_start_time_milli[8];
  byte spin_last_seq_num[4]
};

int start_of_spin_message_at;

/* every byte of Start Of Spin Message set to one value */
inline fill_start_of_spin_message(start_of_spin_message_record, start_of_spin_message_value) {
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.channel_seq_num[start_of_spin_message_at] = start_of_spin_message_value; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
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
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.channel_seq_num[start_of_spin_message_at] = (start_of_spin_message_base + 0 + start_of_spin_message_at + 1) % 256; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_record.spin_type = (start_of_spin_message_base + 4 + 1) % 256;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 8 -> start_of_spin_message_record.spin_start_time_milli[start_of_spin_message_at] = (start_of_spin_message_base + 5 + start_of_spin_message_at + 1) % 256; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.spin_last_seq_num[start_of_spin_message_at] = (start_of_spin_message_base + 13 + start_of_spin_message_at + 1) % 256; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* Start Of Spin Message to the wire, 17 bytes from where the cursor stands */
inline encode_start_of_spin_message(start_of_spin_message_record) {
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> wire[at] = start_of_spin_message_record.channel_seq_num[start_of_spin_message_at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
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

/* Start Of Spin Message off the wire, 17 bytes from where the cursor stands */
inline decode_start_of_spin_message(start_of_spin_message_record) {
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> start_of_spin_message_record.channel_seq_num[start_of_spin_message_at] = wire[at]; at = at + 1; start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
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
  start_of_spin_message_at = 0;
  do
  :: start_of_spin_message_at < 4 -> assert(start_of_spin_message_read.channel_seq_num[start_of_spin_message_at] == start_of_spin_message_written.channel_seq_num[start_of_spin_message_at]); start_of_spin_message_at = start_of_spin_message_at + 1
  :: else -> break
  od;
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

/* ---- End Of Spin Message: 21 bytes ------------------------------------------- */

/* This message appears on all quote channels and indicates the end of a spin message cycle. */
typedef EndOfSpinMessage {
  byte channel_seq_num[4];
  byte spin_type;
  byte spin_msg_ct[4];
  byte spin_end_time_milli[8];
  byte spin_last_seq_num[4]
};

int end_of_spin_message_at;

/* every byte of End Of Spin Message set to one value */
inline fill_end_of_spin_message(end_of_spin_message_record, end_of_spin_message_value) {
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.channel_seq_num[end_of_spin_message_at] = end_of_spin_message_value; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
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
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.channel_seq_num[end_of_spin_message_at] = (end_of_spin_message_base + 0 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_record.spin_type = (end_of_spin_message_base + 4 + 1) % 256;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_msg_ct[end_of_spin_message_at] = (end_of_spin_message_base + 5 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 8 -> end_of_spin_message_record.spin_end_time_milli[end_of_spin_message_at] = (end_of_spin_message_base + 9 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.spin_last_seq_num[end_of_spin_message_at] = (end_of_spin_message_base + 17 + end_of_spin_message_at + 1) % 256; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Spin Message to the wire, 21 bytes from where the cursor stands */
inline encode_end_of_spin_message(end_of_spin_message_record) {
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> wire[at] = end_of_spin_message_record.channel_seq_num[end_of_spin_message_at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
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

/* End Of Spin Message off the wire, 21 bytes from where the cursor stands */
inline decode_end_of_spin_message(end_of_spin_message_record) {
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> end_of_spin_message_record.channel_seq_num[end_of_spin_message_at] = wire[at]; at = at + 1; end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
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
  end_of_spin_message_at = 0;
  do
  :: end_of_spin_message_at < 4 -> assert(end_of_spin_message_read.channel_seq_num[end_of_spin_message_at] == end_of_spin_message_written.channel_seq_num[end_of_spin_message_at]); end_of_spin_message_at = end_of_spin_message_at + 1
  :: else -> break
  od;
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

/* ---- Market Open Message: 20 bytes ------------------------------------------- */

/* This message is sent out at 6 AM on all channels. The message can also be sent mid-day if a technical outage caused a temporary closure of the market. */
typedef MarketOpenMessage {
  byte channel_seq_num[4];
  byte market_open[8];
  byte market_close[8]
};

int market_open_message_at;

/* every byte of Market Open Message set to one value */
inline fill_market_open_message(market_open_message_record, market_open_message_value) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 4 -> market_open_message_record.channel_seq_num[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_open[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_close[market_open_message_at] = market_open_message_value; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Open Message set to where it lies, so a field read out of place says so */
inline ramp_market_open_message(market_open_message_record, market_open_message_base) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 4 -> market_open_message_record.channel_seq_num[market_open_message_at] = (market_open_message_base + 0 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_open[market_open_message_at] = (market_open_message_base + 4 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_close[market_open_message_at] = (market_open_message_base + 12 + market_open_message_at + 1) % 256; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Open Message to the wire, 20 bytes from where the cursor stands */
inline encode_market_open_message(market_open_message_record) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 4 -> wire[at] = market_open_message_record.channel_seq_num[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> wire[at] = market_open_message_record.market_open[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> wire[at] = market_open_message_record.market_close[market_open_message_at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Open Message off the wire, 20 bytes from where the cursor stands */
inline decode_market_open_message(market_open_message_record) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 4 -> market_open_message_record.channel_seq_num[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_open[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> market_open_message_record.market_close[market_open_message_at] = wire[at]; at = at + 1; market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Open Message is what was written, byte for byte */
inline equal_market_open_message(market_open_message_read, market_open_message_written) {
  market_open_message_at = 0;
  do
  :: market_open_message_at < 4 -> assert(market_open_message_read.channel_seq_num[market_open_message_at] == market_open_message_written.channel_seq_num[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> assert(market_open_message_read.market_open[market_open_message_at] == market_open_message_written.market_open[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  market_open_message_at = 0;
  do
  :: market_open_message_at < 8 -> assert(market_open_message_read.market_close[market_open_message_at] == market_open_message_written.market_close[market_open_message_at]); market_open_message_at = market_open_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Market Close Message: 16 bytes ------------------------------------------ */

/* This message is sent out at 5 PM on all channels. The message can also be sent mid-day if a technical outage causes a temporary closure of the market. */
typedef MarketCloseMessage {
  byte channel_seq_num[4];
  byte market_close_time_milli[8];
  byte market_msg_ct[4]
};

int market_close_message_at;

/* every byte of Market Close Message set to one value */
inline fill_market_close_message(market_close_message_record, market_close_message_value) {
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.channel_seq_num[market_close_message_at] = market_close_message_value; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 8 -> market_close_message_record.market_close_time_milli[market_close_message_at] = market_close_message_value; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.market_msg_ct[market_close_message_at] = market_close_message_value; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Market Close Message set to where it lies, so a field read out of place says so */
inline ramp_market_close_message(market_close_message_record, market_close_message_base) {
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.channel_seq_num[market_close_message_at] = (market_close_message_base + 0 + market_close_message_at + 1) % 256; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 8 -> market_close_message_record.market_close_time_milli[market_close_message_at] = (market_close_message_base + 4 + market_close_message_at + 1) % 256; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.market_msg_ct[market_close_message_at] = (market_close_message_base + 12 + market_close_message_at + 1) % 256; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Close Message to the wire, 16 bytes from where the cursor stands */
inline encode_market_close_message(market_close_message_record) {
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> wire[at] = market_close_message_record.channel_seq_num[market_close_message_at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 8 -> wire[at] = market_close_message_record.market_close_time_milli[market_close_message_at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> wire[at] = market_close_message_record.market_msg_ct[market_close_message_at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* Market Close Message off the wire, 16 bytes from where the cursor stands */
inline decode_market_close_message(market_close_message_record) {
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.channel_seq_num[market_close_message_at] = wire[at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 8 -> market_close_message_record.market_close_time_milli[market_close_message_at] = wire[at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> market_close_message_record.market_msg_ct[market_close_message_at] = wire[at]; at = at + 1; market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Market Close Message is what was written, byte for byte */
inline equal_market_close_message(market_close_message_read, market_close_message_written) {
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> assert(market_close_message_read.channel_seq_num[market_close_message_at] == market_close_message_written.channel_seq_num[market_close_message_at]); market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 8 -> assert(market_close_message_read.market_close_time_milli[market_close_message_at] == market_close_message_written.market_close_time_milli[market_close_message_at]); market_close_message_at = market_close_message_at + 1
  :: else -> break
  od;
  market_close_message_at = 0;
  do
  :: market_close_message_at < 4 -> assert(market_close_message_read.market_msg_ct[market_close_message_at] == market_close_message_written.market_msg_ct[market_close_message_at]); market_close_message_at = market_close_message_at + 1
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
    assert(at == 17);
    at = 0;
    decode_start_of_spin_message(start_of_spin_message_got);
    assert(at == 17);
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
    assert(at == 21);
    at = 0;
    decode_end_of_spin_message(end_of_spin_message_got);
    assert(at == 21);
    equal_end_of_spin_message(end_of_spin_message_got, end_of_spin_message_sent)
  }
}

/* Market Open Message: encoded, read back, and compared */
proctype check_market_open_message() {
  MarketOpenMessage market_open_message_sent;
  MarketOpenMessage market_open_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_open_message(market_open_message_sent, 0)
  :: pattern == 1 -> fill_market_open_message(market_open_message_sent, 32)
  :: pattern == 2 -> fill_market_open_message(market_open_message_sent, 255)
  :: else -> ramp_market_open_message(market_open_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_open_message(market_open_message_sent);
    assert(at == 20);
    at = 0;
    decode_market_open_message(market_open_message_got);
    assert(at == 20);
    equal_market_open_message(market_open_message_got, market_open_message_sent)
  }
}

/* Market Close Message: encoded, read back, and compared */
proctype check_market_close_message() {
  MarketCloseMessage market_close_message_sent;
  MarketCloseMessage market_close_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_market_close_message(market_close_message_sent, 0)
  :: pattern == 1 -> fill_market_close_message(market_close_message_sent, 32)
  :: pattern == 2 -> fill_market_close_message(market_close_message_sent, 255)
  :: else -> ramp_market_close_message(market_close_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_market_close_message(market_close_message_sent);
    assert(at == 16);
    at = 0;
    decode_market_close_message(market_close_message_got);
    assert(at == 16);
    equal_market_close_message(market_close_message_got, market_close_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_start_of_spin_message()
  :: run check_end_of_spin_message()
  :: run check_market_open_message()
  :: run check_market_close_message()
  fi
}
