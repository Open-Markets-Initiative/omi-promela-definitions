/*
 * New York Stock Exchange Quote
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
#define WIRE 72

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Message Header: 16 bytes ------------------------------------------------ */

/* Nyse Pdp common message header */
typedef MessageHeader {
  byte msg_size[2];
  byte msg_type[2];
  byte msg_seq_num[4];
  byte send_time[4];
  byte product_id;
  byte retrans_flag;
  byte num_body_entries;
  byte filler
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.send_time[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.product_id = message_header_value;
  message_header_record.retrans_flag = message_header_value;
  message_header_record.num_body_entries = message_header_value;
  message_header_record.filler = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = (message_header_base + 2 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = (message_header_base + 4 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.send_time[message_header_at] = (message_header_base + 8 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.product_id = (message_header_base + 12 + 1) % 256;
  message_header_record.retrans_flag = (message_header_base + 13 + 1) % 256;
  message_header_record.num_body_entries = (message_header_base + 14 + 1) % 256;
  message_header_record.filler = (message_header_base + 15 + 1) % 256;
  skip
}

/* Message Header to the wire, 16 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_size[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> wire[at] = message_header_record.msg_type[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.msg_seq_num[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> wire[at] = message_header_record.send_time[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.product_id; at = at + 1;
  wire[at] = message_header_record.retrans_flag; at = at + 1;
  wire[at] = message_header_record.num_body_entries; at = at + 1;
  wire[at] = message_header_record.filler; at = at + 1;
  skip
}

/* Message Header off the wire, 16 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_size[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> message_header_record.msg_type[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.msg_seq_num[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> message_header_record.send_time[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.product_id = wire[at]; at = at + 1;
  message_header_record.retrans_flag = wire[at]; at = at + 1;
  message_header_record.num_body_entries = wire[at]; at = at + 1;
  message_header_record.filler = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.msg_size[message_header_at] == message_header_written.msg_size[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 2 -> assert(message_header_read.msg_type[message_header_at] == message_header_written.msg_type[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.msg_seq_num[message_header_at] == message_header_written.msg_seq_num[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_at = 0;
  do
  :: message_header_at < 4 -> assert(message_header_read.send_time[message_header_at] == message_header_written.send_time[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.product_id == message_header_written.product_id);
  assert(message_header_read.retrans_flag == message_header_written.retrans_flag);
  assert(message_header_read.num_body_entries == message_header_written.num_body_entries);
  assert(message_header_read.filler == message_header_written.filler);
  skip
}

/* ---- Sequence Number Reset Message: 4 bytes ---------------------------------- */

/* Sent to reset the sequence number at start of day and in response to failures. The message carries its own valid sequence number in the header. */
typedef SequenceNumberResetMessage {
  byte next_seq_number[4]
};

int sequence_number_reset_message_at;

/* every byte of Sequence Number Reset Message set to one value */
inline fill_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_value) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = sequence_number_reset_message_value; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Sequence Number Reset Message set to where it lies, so a field read out of place says so */
inline ramp_sequence_number_reset_message(sequence_number_reset_message_record, sequence_number_reset_message_base) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = (sequence_number_reset_message_base + 0 + sequence_number_reset_message_at + 1) % 256; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message to the wire, 4 bytes from where the cursor stands */
inline encode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> wire[at] = sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* Sequence Number Reset Message off the wire, 4 bytes from where the cursor stands */
inline decode_sequence_number_reset_message(sequence_number_reset_message_record) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> sequence_number_reset_message_record.next_seq_number[sequence_number_reset_message_at] = wire[at]; at = at + 1; sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Sequence Number Reset Message is what was written, byte for byte */
inline equal_sequence_number_reset_message(sequence_number_reset_message_read, sequence_number_reset_message_written) {
  sequence_number_reset_message_at = 0;
  do
  :: sequence_number_reset_message_at < 4 -> assert(sequence_number_reset_message_read.next_seq_number[sequence_number_reset_message_at] == sequence_number_reset_message_written.next_seq_number[sequence_number_reset_message_at]); sequence_number_reset_message_at = sequence_number_reset_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Unavailable Message: 8 bytes ------------------------------------ */

/* Sent when the requested messages cannot be retransmitted. */
typedef MessageUnavailableMessage {
  byte begin_seq_num[4];
  byte end_seq_num[4]
};

int message_unavailable_message_at;

/* every byte of Message Unavailable Message set to one value */
inline fill_message_unavailable_message(message_unavailable_message_record, message_unavailable_message_value) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = message_unavailable_message_value; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = message_unavailable_message_value; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Message Unavailable Message set to where it lies, so a field read out of place says so */
inline ramp_message_unavailable_message(message_unavailable_message_record, message_unavailable_message_base) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = (message_unavailable_message_base + 0 + message_unavailable_message_at + 1) % 256; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = (message_unavailable_message_base + 4 + message_unavailable_message_at + 1) % 256; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Unavailable Message to the wire, 8 bytes from where the cursor stands */
inline encode_message_unavailable_message(message_unavailable_message_record) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> wire[at] = message_unavailable_message_record.begin_seq_num[message_unavailable_message_at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> wire[at] = message_unavailable_message_record.end_seq_num[message_unavailable_message_at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* Message Unavailable Message off the wire, 8 bytes from where the cursor stands */
inline decode_message_unavailable_message(message_unavailable_message_record) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.begin_seq_num[message_unavailable_message_at] = wire[at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> message_unavailable_message_record.end_seq_num[message_unavailable_message_at] = wire[at]; at = at + 1; message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Message Unavailable Message is what was written, byte for byte */
inline equal_message_unavailable_message(message_unavailable_message_read, message_unavailable_message_written) {
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> assert(message_unavailable_message_read.begin_seq_num[message_unavailable_message_at] == message_unavailable_message_written.begin_seq_num[message_unavailable_message_at]); message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  message_unavailable_message_at = 0;
  do
  :: message_unavailable_message_at < 4 -> assert(message_unavailable_message_read.end_seq_num[message_unavailable_message_at] == message_unavailable_message_written.end_seq_num[message_unavailable_message_at]); message_unavailable_message_at = message_unavailable_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Refresh Quote Message: 72 bytes ----------------------------------------- */

/* Sent in response to a Refresh Quote Request, and automatically when there are intraday symbol additions. The same body as a Quote message with the symbol and Cusip appended. */
typedef RefreshQuoteMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte quote_link_id[4];
  byte ask_price_numerator[4];
  byte ask_size[4];
  byte bid_price_numerator[4];
  byte bid_size[4];
  byte price_scale_code;
  byte exchange_id;
  byte security_type;
  byte quote_condition;
  byte flat_pricing;
  byte trading_action;
  byte filler_ascii_2[2];
  byte symbol[22];
  byte cusip[14]
};

int refresh_quote_message_at;

/* every byte of Refresh Quote Message set to one value */
inline fill_refresh_quote_message(refresh_quote_message_record, refresh_quote_message_value) {
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.symbol_index[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.source_time[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.quote_link_id[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_price_numerator[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_size[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_price_numerator[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_size[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_record.price_scale_code = refresh_quote_message_value;
  refresh_quote_message_record.exchange_id = refresh_quote_message_value;
  refresh_quote_message_record.security_type = refresh_quote_message_value;
  refresh_quote_message_record.quote_condition = refresh_quote_message_value;
  refresh_quote_message_record.flat_pricing = refresh_quote_message_value;
  refresh_quote_message_record.trading_action = refresh_quote_message_value;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 2 -> refresh_quote_message_record.filler_ascii_2[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 22 -> refresh_quote_message_record.symbol[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 14 -> refresh_quote_message_record.cusip[refresh_quote_message_at] = refresh_quote_message_value; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Refresh Quote Message set to where it lies, so a field read out of place says so */
inline ramp_refresh_quote_message(refresh_quote_message_record, refresh_quote_message_base) {
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.symbol_index[refresh_quote_message_at] = (refresh_quote_message_base + 0 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.source_time[refresh_quote_message_at] = (refresh_quote_message_base + 4 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.quote_link_id[refresh_quote_message_at] = (refresh_quote_message_base + 8 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_price_numerator[refresh_quote_message_at] = (refresh_quote_message_base + 12 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_size[refresh_quote_message_at] = (refresh_quote_message_base + 16 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_price_numerator[refresh_quote_message_at] = (refresh_quote_message_base + 20 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_size[refresh_quote_message_at] = (refresh_quote_message_base + 24 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_record.price_scale_code = (refresh_quote_message_base + 28 + 1) % 256;
  refresh_quote_message_record.exchange_id = (refresh_quote_message_base + 29 + 1) % 256;
  refresh_quote_message_record.security_type = (refresh_quote_message_base + 30 + 1) % 256;
  refresh_quote_message_record.quote_condition = (refresh_quote_message_base + 31 + 1) % 256;
  refresh_quote_message_record.flat_pricing = (refresh_quote_message_base + 32 + 1) % 256;
  refresh_quote_message_record.trading_action = (refresh_quote_message_base + 33 + 1) % 256;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 2 -> refresh_quote_message_record.filler_ascii_2[refresh_quote_message_at] = (refresh_quote_message_base + 34 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 22 -> refresh_quote_message_record.symbol[refresh_quote_message_at] = (refresh_quote_message_base + 36 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 14 -> refresh_quote_message_record.cusip[refresh_quote_message_at] = (refresh_quote_message_base + 58 + refresh_quote_message_at + 1) % 256; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Quote Message to the wire, 72 bytes from where the cursor stands */
inline encode_refresh_quote_message(refresh_quote_message_record) {
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.symbol_index[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.source_time[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.quote_link_id[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.ask_price_numerator[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.ask_size[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.bid_price_numerator[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> wire[at] = refresh_quote_message_record.bid_size[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  wire[at] = refresh_quote_message_record.price_scale_code; at = at + 1;
  wire[at] = refresh_quote_message_record.exchange_id; at = at + 1;
  wire[at] = refresh_quote_message_record.security_type; at = at + 1;
  wire[at] = refresh_quote_message_record.quote_condition; at = at + 1;
  wire[at] = refresh_quote_message_record.flat_pricing; at = at + 1;
  wire[at] = refresh_quote_message_record.trading_action; at = at + 1;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 2 -> wire[at] = refresh_quote_message_record.filler_ascii_2[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 22 -> wire[at] = refresh_quote_message_record.symbol[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 14 -> wire[at] = refresh_quote_message_record.cusip[refresh_quote_message_at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Refresh Quote Message off the wire, 72 bytes from where the cursor stands */
inline decode_refresh_quote_message(refresh_quote_message_record) {
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.symbol_index[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.source_time[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.quote_link_id[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_price_numerator[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.ask_size[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_price_numerator[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> refresh_quote_message_record.bid_size[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_record.price_scale_code = wire[at]; at = at + 1;
  refresh_quote_message_record.exchange_id = wire[at]; at = at + 1;
  refresh_quote_message_record.security_type = wire[at]; at = at + 1;
  refresh_quote_message_record.quote_condition = wire[at]; at = at + 1;
  refresh_quote_message_record.flat_pricing = wire[at]; at = at + 1;
  refresh_quote_message_record.trading_action = wire[at]; at = at + 1;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 2 -> refresh_quote_message_record.filler_ascii_2[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 22 -> refresh_quote_message_record.symbol[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 14 -> refresh_quote_message_record.cusip[refresh_quote_message_at] = wire[at]; at = at + 1; refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Refresh Quote Message is what was written, byte for byte */
inline equal_refresh_quote_message(refresh_quote_message_read, refresh_quote_message_written) {
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.symbol_index[refresh_quote_message_at] == refresh_quote_message_written.symbol_index[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.source_time[refresh_quote_message_at] == refresh_quote_message_written.source_time[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.quote_link_id[refresh_quote_message_at] == refresh_quote_message_written.quote_link_id[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.ask_price_numerator[refresh_quote_message_at] == refresh_quote_message_written.ask_price_numerator[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.ask_size[refresh_quote_message_at] == refresh_quote_message_written.ask_size[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.bid_price_numerator[refresh_quote_message_at] == refresh_quote_message_written.bid_price_numerator[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 4 -> assert(refresh_quote_message_read.bid_size[refresh_quote_message_at] == refresh_quote_message_written.bid_size[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  assert(refresh_quote_message_read.price_scale_code == refresh_quote_message_written.price_scale_code);
  assert(refresh_quote_message_read.exchange_id == refresh_quote_message_written.exchange_id);
  assert(refresh_quote_message_read.security_type == refresh_quote_message_written.security_type);
  assert(refresh_quote_message_read.quote_condition == refresh_quote_message_written.quote_condition);
  assert(refresh_quote_message_read.flat_pricing == refresh_quote_message_written.flat_pricing);
  assert(refresh_quote_message_read.trading_action == refresh_quote_message_written.trading_action);
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 2 -> assert(refresh_quote_message_read.filler_ascii_2[refresh_quote_message_at] == refresh_quote_message_written.filler_ascii_2[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 22 -> assert(refresh_quote_message_read.symbol[refresh_quote_message_at] == refresh_quote_message_written.symbol[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  refresh_quote_message_at = 0;
  do
  :: refresh_quote_message_at < 14 -> assert(refresh_quote_message_read.cusip[refresh_quote_message_at] == refresh_quote_message_written.cusip[refresh_quote_message_at]); refresh_quote_message_at = refresh_quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Symbol Index Mapping Message: 44 bytes ---------------------------------- */

/* Maps a symbol index to its bond symbol and Cusip. */
typedef SymbolIndexMappingMessage {
  byte symbol_index[4];
  byte symbol[22];
  byte cusip[14];
  byte filler_ascii_4[4]
};

int symbol_index_mapping_message_at;

/* every byte of Symbol Index Mapping Message set to one value */
inline fill_symbol_index_mapping_message(symbol_index_mapping_message_record, symbol_index_mapping_message_value) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 22 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 14 -> symbol_index_mapping_message_record.cusip[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.filler_ascii_4[symbol_index_mapping_message_at] = symbol_index_mapping_message_value; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Index Mapping Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_index_mapping_message(symbol_index_mapping_message_record, symbol_index_mapping_message_base) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 0 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 22 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 4 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 14 -> symbol_index_mapping_message_record.cusip[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 26 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.filler_ascii_4[symbol_index_mapping_message_at] = (symbol_index_mapping_message_base + 40 + symbol_index_mapping_message_at + 1) % 256; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Message to the wire, 44 bytes from where the cursor stands */
inline encode_symbol_index_mapping_message(symbol_index_mapping_message_record) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> wire[at] = symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 22 -> wire[at] = symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 14 -> wire[at] = symbol_index_mapping_message_record.cusip[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> wire[at] = symbol_index_mapping_message_record.filler_ascii_4[symbol_index_mapping_message_at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Index Mapping Message off the wire, 44 bytes from where the cursor stands */
inline decode_symbol_index_mapping_message(symbol_index_mapping_message_record) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.symbol_index[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 22 -> symbol_index_mapping_message_record.symbol[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 14 -> symbol_index_mapping_message_record.cusip[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> symbol_index_mapping_message_record.filler_ascii_4[symbol_index_mapping_message_at] = wire[at]; at = at + 1; symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Index Mapping Message is what was written, byte for byte */
inline equal_symbol_index_mapping_message(symbol_index_mapping_message_read, symbol_index_mapping_message_written) {
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> assert(symbol_index_mapping_message_read.symbol_index[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.symbol_index[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 22 -> assert(symbol_index_mapping_message_read.symbol[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.symbol[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 14 -> assert(symbol_index_mapping_message_read.cusip[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.cusip[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  symbol_index_mapping_message_at = 0;
  do
  :: symbol_index_mapping_message_at < 4 -> assert(symbol_index_mapping_message_read.filler_ascii_4[symbol_index_mapping_message_at] == symbol_index_mapping_message_written.filler_ascii_4[symbol_index_mapping_message_at]); symbol_index_mapping_message_at = symbol_index_mapping_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Quote Message: 36 bytes ------------------------------------------------- */

/* The L1 top of book quote for a bond. */
typedef QuoteMessage {
  byte symbol_index[4];
  byte source_time[4];
  byte quote_link_id[4];
  byte ask_price_numerator[4];
  byte ask_size[4];
  byte bid_price_numerator[4];
  byte bid_size[4];
  byte price_scale_code;
  byte exchange_id;
  byte security_type;
  byte quote_condition;
  byte flat_pricing;
  byte trading_action;
  byte filler_ascii_2[2]
};

int quote_message_at;

/* every byte of Quote Message set to one value */
inline fill_quote_message(quote_message_record, quote_message_value) {
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.symbol_index[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.source_time[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.quote_link_id[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_price_numerator[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_price_numerator[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_record.price_scale_code = quote_message_value;
  quote_message_record.exchange_id = quote_message_value;
  quote_message_record.security_type = quote_message_value;
  quote_message_record.quote_condition = quote_message_value;
  quote_message_record.flat_pricing = quote_message_value;
  quote_message_record.trading_action = quote_message_value;
  quote_message_at = 0;
  do
  :: quote_message_at < 2 -> quote_message_record.filler_ascii_2[quote_message_at] = quote_message_value; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Quote Message set to where it lies, so a field read out of place says so */
inline ramp_quote_message(quote_message_record, quote_message_base) {
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.symbol_index[quote_message_at] = (quote_message_base + 0 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.source_time[quote_message_at] = (quote_message_base + 4 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.quote_link_id[quote_message_at] = (quote_message_base + 8 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_price_numerator[quote_message_at] = (quote_message_base + 12 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = (quote_message_base + 16 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_price_numerator[quote_message_at] = (quote_message_base + 20 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = (quote_message_base + 24 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_record.price_scale_code = (quote_message_base + 28 + 1) % 256;
  quote_message_record.exchange_id = (quote_message_base + 29 + 1) % 256;
  quote_message_record.security_type = (quote_message_base + 30 + 1) % 256;
  quote_message_record.quote_condition = (quote_message_base + 31 + 1) % 256;
  quote_message_record.flat_pricing = (quote_message_base + 32 + 1) % 256;
  quote_message_record.trading_action = (quote_message_base + 33 + 1) % 256;
  quote_message_at = 0;
  do
  :: quote_message_at < 2 -> quote_message_record.filler_ascii_2[quote_message_at] = (quote_message_base + 34 + quote_message_at + 1) % 256; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message to the wire, 36 bytes from where the cursor stands */
inline encode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.symbol_index[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.source_time[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.quote_link_id[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.ask_price_numerator[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.ask_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.bid_price_numerator[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> wire[at] = quote_message_record.bid_size[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  wire[at] = quote_message_record.price_scale_code; at = at + 1;
  wire[at] = quote_message_record.exchange_id; at = at + 1;
  wire[at] = quote_message_record.security_type; at = at + 1;
  wire[at] = quote_message_record.quote_condition; at = at + 1;
  wire[at] = quote_message_record.flat_pricing; at = at + 1;
  wire[at] = quote_message_record.trading_action; at = at + 1;
  quote_message_at = 0;
  do
  :: quote_message_at < 2 -> wire[at] = quote_message_record.filler_ascii_2[quote_message_at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* Quote Message off the wire, 36 bytes from where the cursor stands */
inline decode_quote_message(quote_message_record) {
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.symbol_index[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.source_time[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.quote_link_id[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_price_numerator[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.ask_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_price_numerator[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> quote_message_record.bid_size[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_record.price_scale_code = wire[at]; at = at + 1;
  quote_message_record.exchange_id = wire[at]; at = at + 1;
  quote_message_record.security_type = wire[at]; at = at + 1;
  quote_message_record.quote_condition = wire[at]; at = at + 1;
  quote_message_record.flat_pricing = wire[at]; at = at + 1;
  quote_message_record.trading_action = wire[at]; at = at + 1;
  quote_message_at = 0;
  do
  :: quote_message_at < 2 -> quote_message_record.filler_ascii_2[quote_message_at] = wire[at]; at = at + 1; quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Quote Message is what was written, byte for byte */
inline equal_quote_message(quote_message_read, quote_message_written) {
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.symbol_index[quote_message_at] == quote_message_written.symbol_index[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.source_time[quote_message_at] == quote_message_written.source_time[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.quote_link_id[quote_message_at] == quote_message_written.quote_link_id[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.ask_price_numerator[quote_message_at] == quote_message_written.ask_price_numerator[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.ask_size[quote_message_at] == quote_message_written.ask_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.bid_price_numerator[quote_message_at] == quote_message_written.bid_price_numerator[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  quote_message_at = 0;
  do
  :: quote_message_at < 4 -> assert(quote_message_read.bid_size[quote_message_at] == quote_message_written.bid_size[quote_message_at]); quote_message_at = quote_message_at + 1
  :: else -> break
  od;
  assert(quote_message_read.price_scale_code == quote_message_written.price_scale_code);
  assert(quote_message_read.exchange_id == quote_message_written.exchange_id);
  assert(quote_message_read.security_type == quote_message_written.security_type);
  assert(quote_message_read.quote_condition == quote_message_written.quote_condition);
  assert(quote_message_read.flat_pricing == quote_message_written.flat_pricing);
  assert(quote_message_read.trading_action == quote_message_written.trading_action);
  quote_message_at = 0;
  do
  :: quote_message_at < 2 -> assert(quote_message_read.filler_ascii_2[quote_message_at] == quote_message_written.filler_ascii_2[quote_message_at]); quote_message_at = quote_message_at + 1
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
    assert(at == 16);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 16);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Sequence Number Reset Message: encoded, read back, and compared */
proctype check_sequence_number_reset_message() {
  SequenceNumberResetMessage sequence_number_reset_message_sent;
  SequenceNumberResetMessage sequence_number_reset_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  :: pattern == 1 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 32)
  :: pattern == 2 -> fill_sequence_number_reset_message(sequence_number_reset_message_sent, 255)
  :: else -> ramp_sequence_number_reset_message(sequence_number_reset_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequence_number_reset_message(sequence_number_reset_message_sent);
    assert(at == 4);
    at = 0;
    decode_sequence_number_reset_message(sequence_number_reset_message_got);
    assert(at == 4);
    equal_sequence_number_reset_message(sequence_number_reset_message_got, sequence_number_reset_message_sent)
  }
}

/* Message Unavailable Message: encoded, read back, and compared */
proctype check_message_unavailable_message() {
  MessageUnavailableMessage message_unavailable_message_sent;
  MessageUnavailableMessage message_unavailable_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_message_unavailable_message(message_unavailable_message_sent, 0)
  :: pattern == 1 -> fill_message_unavailable_message(message_unavailable_message_sent, 32)
  :: pattern == 2 -> fill_message_unavailable_message(message_unavailable_message_sent, 255)
  :: else -> ramp_message_unavailable_message(message_unavailable_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_message_unavailable_message(message_unavailable_message_sent);
    assert(at == 8);
    at = 0;
    decode_message_unavailable_message(message_unavailable_message_got);
    assert(at == 8);
    equal_message_unavailable_message(message_unavailable_message_got, message_unavailable_message_sent)
  }
}

/* Refresh Quote Message: encoded, read back, and compared */
proctype check_refresh_quote_message() {
  RefreshQuoteMessage refresh_quote_message_sent;
  RefreshQuoteMessage refresh_quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_refresh_quote_message(refresh_quote_message_sent, 0)
  :: pattern == 1 -> fill_refresh_quote_message(refresh_quote_message_sent, 32)
  :: pattern == 2 -> fill_refresh_quote_message(refresh_quote_message_sent, 255)
  :: else -> ramp_refresh_quote_message(refresh_quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_refresh_quote_message(refresh_quote_message_sent);
    assert(at == 72);
    at = 0;
    decode_refresh_quote_message(refresh_quote_message_got);
    assert(at == 72);
    equal_refresh_quote_message(refresh_quote_message_got, refresh_quote_message_sent)
  }
}

/* Symbol Index Mapping Message: encoded, read back, and compared */
proctype check_symbol_index_mapping_message() {
  SymbolIndexMappingMessage symbol_index_mapping_message_sent;
  SymbolIndexMappingMessage symbol_index_mapping_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 0)
  :: pattern == 1 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 32)
  :: pattern == 2 -> fill_symbol_index_mapping_message(symbol_index_mapping_message_sent, 255)
  :: else -> ramp_symbol_index_mapping_message(symbol_index_mapping_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_index_mapping_message(symbol_index_mapping_message_sent);
    assert(at == 44);
    at = 0;
    decode_symbol_index_mapping_message(symbol_index_mapping_message_got);
    assert(at == 44);
    equal_symbol_index_mapping_message(symbol_index_mapping_message_got, symbol_index_mapping_message_sent)
  }
}

/* Quote Message: encoded, read back, and compared */
proctype check_quote_message() {
  QuoteMessage quote_message_sent;
  QuoteMessage quote_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_quote_message(quote_message_sent, 0)
  :: pattern == 1 -> fill_quote_message(quote_message_sent, 32)
  :: pattern == 2 -> fill_quote_message(quote_message_sent, 255)
  :: else -> ramp_quote_message(quote_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_quote_message(quote_message_sent);
    assert(at == 36);
    at = 0;
    decode_quote_message(quote_message_got);
    assert(at == 36);
    equal_quote_message(quote_message_got, quote_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_message_header()
  :: run check_sequence_number_reset_message()
  :: run check_message_unavailable_message()
  :: run check_refresh_quote_message()
  :: run check_symbol_index_mapping_message()
  :: run check_quote_message()
  fi
}
