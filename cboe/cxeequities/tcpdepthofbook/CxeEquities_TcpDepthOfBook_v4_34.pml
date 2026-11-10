/*
 * Chicago Board Options Exchange Tcp Depth Of Book
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
 *   - the dispatch that chooses a message by its type
 *   - a field filling what is left of what holds it
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 93

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Debug Packet: 1 bytes --------------------------------------------------- */

/* Debug packets are intended to provide human readable text that may aid in debugging problems. */
typedef DebugPacket {
  byte text
};

/* every byte of Debug Packet set to one value */
inline fill_debug_packet(debug_packet_record, debug_packet_value) {
  debug_packet_record.text = debug_packet_value;
  skip
}

/* each byte of Debug Packet set to where it lies, so a field read out of place says so */
inline ramp_debug_packet(debug_packet_record, debug_packet_base) {
  debug_packet_record.text = (debug_packet_base + 0 + 1) % 256;
  skip
}

/* Debug Packet to the wire, 1 bytes from where the cursor stands */
inline encode_debug_packet(debug_packet_record) {
  wire[at] = debug_packet_record.text; at = at + 1;
  skip
}

/* Debug Packet off the wire, 1 bytes from where the cursor stands */
inline decode_debug_packet(debug_packet_record) {
  debug_packet_record.text = wire[at]; at = at + 1;
  skip
}

/* what was read of Debug Packet is what was written, byte for byte */
inline equal_debug_packet(debug_packet_read, debug_packet_written) {
  assert(debug_packet_read.text == debug_packet_written.text);
  skip
}

/* ---- Login Accepted Packet: 20 bytes ----------------------------------------- */

/* The Soup 2.0 server sends a Login Accepted Packet in response to receiving a valid Login Request  from the client. */
typedef LoginAcceptedPacket {
  byte session[10];
  byte sequence_number[10]
};

int login_accepted_packet_at;

/* every byte of Login Accepted Packet set to one value */
inline fill_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_value) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = login_accepted_packet_value; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Accepted Packet set to where it lies, so a field read out of place says so */
inline ramp_login_accepted_packet(login_accepted_packet_record, login_accepted_packet_base) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = (login_accepted_packet_base + 0 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = (login_accepted_packet_base + 10 + login_accepted_packet_at + 1) % 256; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet to the wire, 20 bytes from where the cursor stands */
inline encode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.session[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> wire[at] = login_accepted_packet_record.sequence_number[login_accepted_packet_at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Accepted Packet off the wire, 20 bytes from where the cursor stands */
inline decode_login_accepted_packet(login_accepted_packet_record) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.session[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> login_accepted_packet_record.sequence_number[login_accepted_packet_at] = wire[at]; at = at + 1; login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Accepted Packet is what was written, byte for byte */
inline equal_login_accepted_packet(login_accepted_packet_read, login_accepted_packet_written) {
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.session[login_accepted_packet_at] == login_accepted_packet_written.session[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  login_accepted_packet_at = 0;
  do
  :: login_accepted_packet_at < 10 -> assert(login_accepted_packet_read.sequence_number[login_accepted_packet_at] == login_accepted_packet_written.sequence_number[login_accepted_packet_at]); login_accepted_packet_at = login_accepted_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Rejected Packet: 1 bytes ------------------------------------------ */

/* The Soup 2.0 server sends this packet in response to an invalid Login Request Packet from the client. */
typedef LoginRejectedPacket {
  byte reject_reason_code
};

/* every byte of Login Rejected Packet set to one value */
inline fill_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_value) {
  login_rejected_packet_record.reject_reason_code = login_rejected_packet_value;
  skip
}

/* each byte of Login Rejected Packet set to where it lies, so a field read out of place says so */
inline ramp_login_rejected_packet(login_rejected_packet_record, login_rejected_packet_base) {
  login_rejected_packet_record.reject_reason_code = (login_rejected_packet_base + 0 + 1) % 256;
  skip
}

/* Login Rejected Packet to the wire, 1 bytes from where the cursor stands */
inline encode_login_rejected_packet(login_rejected_packet_record) {
  wire[at] = login_rejected_packet_record.reject_reason_code; at = at + 1;
  skip
}

/* Login Rejected Packet off the wire, 1 bytes from where the cursor stands */
inline decode_login_rejected_packet(login_rejected_packet_record) {
  login_rejected_packet_record.reject_reason_code = wire[at]; at = at + 1;
  skip
}

/* what was read of Login Rejected Packet is what was written, byte for byte */
inline equal_login_rejected_packet(login_rejected_packet_read, login_rejected_packet_written) {
  assert(login_rejected_packet_read.reject_reason_code == login_rejected_packet_written.reject_reason_code);
  skip
}

/* ---- Sequenced Message Header: 12 bytes -------------------------------------- */

/* Cboe Europe ASCII Soup sequenced message header (microsecond timestamp) */
typedef SequencedMessageHeader {
  byte timestamp[11];
  byte sequenced_message_type
};

int sequenced_message_header_at;

/* every byte of Sequenced Message Header set to one value */
inline fill_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_value) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 11 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = sequenced_message_header_value; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = sequenced_message_header_value;
  skip
}

/* each byte of Sequenced Message Header set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_base) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 11 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = (sequenced_message_header_base + 0 + sequenced_message_header_at + 1) % 256; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = (sequenced_message_header_base + 11 + 1) % 256;
  skip
}

/* Sequenced Message Header to the wire, 12 bytes from where the cursor stands */
inline encode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 11 -> wire[at] = sequenced_message_header_record.timestamp[sequenced_message_header_at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  wire[at] = sequenced_message_header_record.sequenced_message_type; at = at + 1;
  skip
}

/* Sequenced Message Header off the wire, 12 bytes from where the cursor stands */
inline decode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 11 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = wire[at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequenced Message Header is what was written, byte for byte */
inline equal_sequenced_message_header(sequenced_message_header_read, sequenced_message_header_written) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 11 -> assert(sequenced_message_header_read.timestamp[sequenced_message_header_at] == sequenced_message_header_written.timestamp[sequenced_message_header_at]); sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  assert(sequenced_message_header_read.sequenced_message_type == sequenced_message_header_written.sequenced_message_type);
  skip
}

/* ---- Symbol Clear Message: 8 bytes ------------------------------------------- */

/* Instructs feed recipients to clear all orders for the Cboe book in the specified symbol; sent in recovery events such as a data centre fail-over. */
typedef SymbolClearMessage {
  byte symbol_long[8]
};

int symbol_clear_message_at;

/* every byte of Symbol Clear Message set to one value */
inline fill_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_value) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.symbol_long[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Clear Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_base) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.symbol_long[symbol_clear_message_at] = (symbol_clear_message_base + 0 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message to the wire, 8 bytes from where the cursor stands */
inline encode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> wire[at] = symbol_clear_message_record.symbol_long[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message off the wire, 8 bytes from where the cursor stands */
inline decode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.symbol_long[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Clear Message is what was written, byte for byte */
inline equal_symbol_clear_message(symbol_clear_message_read, symbol_clear_message_written) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> assert(symbol_clear_message_read.symbol_long[symbol_clear_message_at] == symbol_clear_message_written.symbol_long[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Message: 36 bytes --------------------------------------------- */

/* Represents a newly accepted visible order on the Cboe book with a day-specific Order ID. */
typedef AddOrderMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte symbol_short[6];
  byte price_short[10];
  byte display
};

int add_order_message_at;

/* every byte of Add Order Message set to one value */
inline fill_add_order_message(add_order_message_record, add_order_message_value) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.order_id[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = add_order_message_value;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares_short[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol_short[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price_short[add_order_message_at] = add_order_message_value; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = add_order_message_value;
  skip
}

/* each byte of Add Order Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_message(add_order_message_record, add_order_message_base) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.order_id[add_order_message_at] = (add_order_message_base + 0 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = (add_order_message_base + 12 + 1) % 256;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares_short[add_order_message_at] = (add_order_message_base + 13 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol_short[add_order_message_at] = (add_order_message_base + 19 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price_short[add_order_message_at] = (add_order_message_base + 25 + add_order_message_at + 1) % 256; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = (add_order_message_base + 35 + 1) % 256;
  skip
}

/* Add Order Message to the wire, 36 bytes from where the cursor stands */
inline encode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> wire[at] = add_order_message_record.order_id[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.side_indicator; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.shares_short[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> wire[at] = add_order_message_record.symbol_short[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> wire[at] = add_order_message_record.price_short[add_order_message_at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_record.display; at = at + 1;
  skip
}

/* Add Order Message off the wire, 36 bytes from where the cursor stands */
inline decode_add_order_message(add_order_message_record) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> add_order_message_record.order_id[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.shares_short[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> add_order_message_record.symbol_short[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> add_order_message_record.price_short[add_order_message_at] = wire[at]; at = at + 1; add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_record.display = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message is what was written, byte for byte */
inline equal_add_order_message(add_order_message_read, add_order_message_written) {
  add_order_message_at = 0;
  do
  :: add_order_message_at < 12 -> assert(add_order_message_read.order_id[add_order_message_at] == add_order_message_written.order_id[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.side_indicator == add_order_message_written.side_indicator);
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.shares_short[add_order_message_at] == add_order_message_written.shares_short[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 6 -> assert(add_order_message_read.symbol_short[add_order_message_at] == add_order_message_written.symbol_short[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  add_order_message_at = 0;
  do
  :: add_order_message_at < 10 -> assert(add_order_message_read.price_short[add_order_message_at] == add_order_message_written.price_short[add_order_message_at]); add_order_message_at = add_order_message_at + 1
  :: else -> break
  od;
  assert(add_order_message_read.display == add_order_message_written.display);
  skip
}

/* ---- Add Order Message Long Form: 51 bytes ----------------------------------- */

/* Cboe European platform only. As Add Order Message but with longer Shares, Symbol and Price fields. */
typedef AddOrderMessageLongForm {
  byte order_id[12];
  byte side_indicator;
  byte shares_long[10];
  byte symbol_long[8];
  byte price_long[19];
  byte display
};

int add_order_message_long_form_at;

/* every byte of Add Order Message Long Form set to one value */
inline fill_add_order_message_long_form(add_order_message_long_form_record, add_order_message_long_form_value) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 12 -> add_order_message_long_form_record.order_id[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.side_indicator = add_order_message_long_form_value;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 10 -> add_order_message_long_form_record.shares_long[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 8 -> add_order_message_long_form_record.symbol_long[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 19 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = add_order_message_long_form_value; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.display = add_order_message_long_form_value;
  skip
}

/* each byte of Add Order Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_add_order_message_long_form(add_order_message_long_form_record, add_order_message_long_form_base) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 12 -> add_order_message_long_form_record.order_id[add_order_message_long_form_at] = (add_order_message_long_form_base + 0 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.side_indicator = (add_order_message_long_form_base + 12 + 1) % 256;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 10 -> add_order_message_long_form_record.shares_long[add_order_message_long_form_at] = (add_order_message_long_form_base + 13 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 8 -> add_order_message_long_form_record.symbol_long[add_order_message_long_form_at] = (add_order_message_long_form_base + 23 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 19 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = (add_order_message_long_form_base + 31 + add_order_message_long_form_at + 1) % 256; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.display = (add_order_message_long_form_base + 50 + 1) % 256;
  skip
}

/* Add Order Message Long Form to the wire, 51 bytes from where the cursor stands */
inline encode_add_order_message_long_form(add_order_message_long_form_record) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 12 -> wire[at] = add_order_message_long_form_record.order_id[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_long_form_record.side_indicator; at = at + 1;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 10 -> wire[at] = add_order_message_long_form_record.shares_long[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 8 -> wire[at] = add_order_message_long_form_record.symbol_long[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 19 -> wire[at] = add_order_message_long_form_record.price_long[add_order_message_long_form_at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  wire[at] = add_order_message_long_form_record.display; at = at + 1;
  skip
}

/* Add Order Message Long Form off the wire, 51 bytes from where the cursor stands */
inline decode_add_order_message_long_form(add_order_message_long_form_record) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 12 -> add_order_message_long_form_record.order_id[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.side_indicator = wire[at]; at = at + 1;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 10 -> add_order_message_long_form_record.shares_long[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 8 -> add_order_message_long_form_record.symbol_long[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 19 -> add_order_message_long_form_record.price_long[add_order_message_long_form_at] = wire[at]; at = at + 1; add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_record.display = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Message Long Form is what was written, byte for byte */
inline equal_add_order_message_long_form(add_order_message_long_form_read, add_order_message_long_form_written) {
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 12 -> assert(add_order_message_long_form_read.order_id[add_order_message_long_form_at] == add_order_message_long_form_written.order_id[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  assert(add_order_message_long_form_read.side_indicator == add_order_message_long_form_written.side_indicator);
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 10 -> assert(add_order_message_long_form_read.shares_long[add_order_message_long_form_at] == add_order_message_long_form_written.shares_long[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 8 -> assert(add_order_message_long_form_read.symbol_long[add_order_message_long_form_at] == add_order_message_long_form_written.symbol_long[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  add_order_message_long_form_at = 0;
  do
  :: add_order_message_long_form_at < 19 -> assert(add_order_message_long_form_read.price_long[add_order_message_long_form_at] == add_order_message_long_form_written.price_long[add_order_message_long_form_at]); add_order_message_long_form_at = add_order_message_long_form_at + 1
  :: else -> break
  od;
  assert(add_order_message_long_form_read.display == add_order_message_long_form_written.display);
  skip
}

/* ---- Order Executed Message: 34 bytes ---------------------------------------- */

/* Sent when a visible order on the Cboe book is executed in whole or in part at the original Add Order price. */
typedef OrderExecutedMessage {
  byte order_id[12];
  byte executed_shares_short[6];
  byte execution_id[12];
  byte execution_flag[4]
};

int order_executed_message_at;

/* every byte of Order Executed Message set to one value */
inline fill_order_executed_message(order_executed_message_record, order_executed_message_value) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.order_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares_short[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_flag[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message(order_executed_message_record, order_executed_message_base) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.order_id[order_executed_message_at] = (order_executed_message_base + 0 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares_short[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 18 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_flag[order_executed_message_at] = (order_executed_message_base + 30 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 34 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.executed_shares_short[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> wire[at] = order_executed_message_record.execution_flag[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 34 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares_short[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> order_executed_message_record.execution_flag[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message is what was written, byte for byte */
inline equal_order_executed_message(order_executed_message_read, order_executed_message_written) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> assert(order_executed_message_read.order_id[order_executed_message_at] == order_executed_message_written.order_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.executed_shares_short[order_executed_message_at] == order_executed_message_written.executed_shares_short[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 4 -> assert(order_executed_message_read.execution_flag[order_executed_message_at] == order_executed_message_written.execution_flag[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Executed Message Long Form: 38 bytes ------------------------------ */

/* Cboe European platform only. As Order Executed Message but with a longer Executed Shares field. */
typedef OrderExecutedMessageLongForm {
  byte order_id[12];
  byte executed_shares_long[10];
  byte execution_id[12];
  byte execution_flags[4]
};

int order_executed_message_long_form_at;

/* every byte of Order Executed Message Long Form set to one value */
inline fill_order_executed_message_long_form(order_executed_message_long_form_record, order_executed_message_long_form_value) {
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.order_id[order_executed_message_long_form_at] = order_executed_message_long_form_value; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 10 -> order_executed_message_long_form_record.executed_shares_long[order_executed_message_long_form_at] = order_executed_message_long_form_value; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.execution_id[order_executed_message_long_form_at] = order_executed_message_long_form_value; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 4 -> order_executed_message_long_form_record.execution_flags[order_executed_message_long_form_at] = order_executed_message_long_form_value; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Executed Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_order_executed_message_long_form(order_executed_message_long_form_record, order_executed_message_long_form_base) {
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.order_id[order_executed_message_long_form_at] = (order_executed_message_long_form_base + 0 + order_executed_message_long_form_at + 1) % 256; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 10 -> order_executed_message_long_form_record.executed_shares_long[order_executed_message_long_form_at] = (order_executed_message_long_form_base + 12 + order_executed_message_long_form_at + 1) % 256; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.execution_id[order_executed_message_long_form_at] = (order_executed_message_long_form_base + 22 + order_executed_message_long_form_at + 1) % 256; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 4 -> order_executed_message_long_form_record.execution_flags[order_executed_message_long_form_at] = (order_executed_message_long_form_base + 34 + order_executed_message_long_form_at + 1) % 256; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message Long Form to the wire, 38 bytes from where the cursor stands */
inline encode_order_executed_message_long_form(order_executed_message_long_form_record) {
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> wire[at] = order_executed_message_long_form_record.order_id[order_executed_message_long_form_at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 10 -> wire[at] = order_executed_message_long_form_record.executed_shares_long[order_executed_message_long_form_at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> wire[at] = order_executed_message_long_form_record.execution_id[order_executed_message_long_form_at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 4 -> wire[at] = order_executed_message_long_form_record.execution_flags[order_executed_message_long_form_at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message Long Form off the wire, 38 bytes from where the cursor stands */
inline decode_order_executed_message_long_form(order_executed_message_long_form_record) {
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.order_id[order_executed_message_long_form_at] = wire[at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 10 -> order_executed_message_long_form_record.executed_shares_long[order_executed_message_long_form_at] = wire[at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> order_executed_message_long_form_record.execution_id[order_executed_message_long_form_at] = wire[at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 4 -> order_executed_message_long_form_record.execution_flags[order_executed_message_long_form_at] = wire[at]; at = at + 1; order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Executed Message Long Form is what was written, byte for byte */
inline equal_order_executed_message_long_form(order_executed_message_long_form_read, order_executed_message_long_form_written) {
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> assert(order_executed_message_long_form_read.order_id[order_executed_message_long_form_at] == order_executed_message_long_form_written.order_id[order_executed_message_long_form_at]); order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 10 -> assert(order_executed_message_long_form_read.executed_shares_long[order_executed_message_long_form_at] == order_executed_message_long_form_written.executed_shares_long[order_executed_message_long_form_at]); order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 12 -> assert(order_executed_message_long_form_read.execution_id[order_executed_message_long_form_at] == order_executed_message_long_form_written.execution_id[order_executed_message_long_form_at]); order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  order_executed_message_long_form_at = 0;
  do
  :: order_executed_message_long_form_at < 4 -> assert(order_executed_message_long_form_read.execution_flags[order_executed_message_long_form_at] == order_executed_message_long_form_written.execution_flags[order_executed_message_long_form_at]); order_executed_message_long_form_at = order_executed_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 18 bytes ------------------------------------------ */

/* Sent when a visible order on the Cboe book is cancelled in whole or in part. */
typedef OrderCancelMessage {
  byte order_id[12];
  byte cancelled_shares_short[6]
};

int order_cancel_message_at;

/* every byte of Order Cancel Message set to one value */
inline fill_order_cancel_message(order_cancel_message_record, order_cancel_message_value) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 12 -> order_cancel_message_record.order_id[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.cancelled_shares_short[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message(order_cancel_message_record, order_cancel_message_base) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 12 -> order_cancel_message_record.order_id[order_cancel_message_at] = (order_cancel_message_base + 0 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.cancelled_shares_short[order_cancel_message_at] = (order_cancel_message_base + 12 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message to the wire, 18 bytes from where the cursor stands */
inline encode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 12 -> wire[at] = order_cancel_message_record.order_id[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> wire[at] = order_cancel_message_record.cancelled_shares_short[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message off the wire, 18 bytes from where the cursor stands */
inline decode_order_cancel_message(order_cancel_message_record) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 12 -> order_cancel_message_record.order_id[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> order_cancel_message_record.cancelled_shares_short[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message is what was written, byte for byte */
inline equal_order_cancel_message(order_cancel_message_read, order_cancel_message_written) {
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 12 -> assert(order_cancel_message_read.order_id[order_cancel_message_at] == order_cancel_message_written.order_id[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  order_cancel_message_at = 0;
  do
  :: order_cancel_message_at < 6 -> assert(order_cancel_message_read.cancelled_shares_short[order_cancel_message_at] == order_cancel_message_written.cancelled_shares_short[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message Long Form: 22 bytes -------------------------------- */

/* Cboe European platform only. As Order Cancel Message but with a longer Cancelled Shares field. */
typedef OrderCancelMessageLongForm {
  byte order_id[12];
  byte cancelled_shares_long[10]
};

int order_cancel_message_long_form_at;

/* every byte of Order Cancel Message Long Form set to one value */
inline fill_order_cancel_message_long_form(order_cancel_message_long_form_record, order_cancel_message_long_form_value) {
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 12 -> order_cancel_message_long_form_record.order_id[order_cancel_message_long_form_at] = order_cancel_message_long_form_value; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 10 -> order_cancel_message_long_form_record.cancelled_shares_long[order_cancel_message_long_form_at] = order_cancel_message_long_form_value; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Order Cancel Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_order_cancel_message_long_form(order_cancel_message_long_form_record, order_cancel_message_long_form_base) {
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 12 -> order_cancel_message_long_form_record.order_id[order_cancel_message_long_form_at] = (order_cancel_message_long_form_base + 0 + order_cancel_message_long_form_at + 1) % 256; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 10 -> order_cancel_message_long_form_record.cancelled_shares_long[order_cancel_message_long_form_at] = (order_cancel_message_long_form_base + 12 + order_cancel_message_long_form_at + 1) % 256; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message Long Form to the wire, 22 bytes from where the cursor stands */
inline encode_order_cancel_message_long_form(order_cancel_message_long_form_record) {
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 12 -> wire[at] = order_cancel_message_long_form_record.order_id[order_cancel_message_long_form_at]; at = at + 1; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 10 -> wire[at] = order_cancel_message_long_form_record.cancelled_shares_long[order_cancel_message_long_form_at]; at = at + 1; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Order Cancel Message Long Form off the wire, 22 bytes from where the cursor stands */
inline decode_order_cancel_message_long_form(order_cancel_message_long_form_record) {
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 12 -> order_cancel_message_long_form_record.order_id[order_cancel_message_long_form_at] = wire[at]; at = at + 1; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 10 -> order_cancel_message_long_form_record.cancelled_shares_long[order_cancel_message_long_form_at] = wire[at]; at = at + 1; order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Order Cancel Message Long Form is what was written, byte for byte */
inline equal_order_cancel_message_long_form(order_cancel_message_long_form_read, order_cancel_message_long_form_written) {
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 12 -> assert(order_cancel_message_long_form_read.order_id[order_cancel_message_long_form_at] == order_cancel_message_long_form_written.order_id[order_cancel_message_long_form_at]); order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  order_cancel_message_long_form_at = 0;
  do
  :: order_cancel_message_long_form_at < 10 -> assert(order_cancel_message_long_form_read.cancelled_shares_long[order_cancel_message_long_form_at] == order_cancel_message_long_form_written.cancelled_shares_long[order_cancel_message_long_form_at]); order_cancel_message_long_form_at = order_cancel_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message: 52 bytes ------------------------------------------------- */

/* Provides information about executions of non-displayed orders/shares and negotiated trades. Does not alter the book. */
typedef TradeMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte symbol_short[6];
  byte price_short[10];
  byte execution_id[12];
  byte trade_flags[5]
};

int trade_message_at;

/* every byte of Trade Message set to one value */
inline fill_trade_message(trade_message_record, trade_message_value) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.order_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = trade_message_value;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares_short[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.symbol_short[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price_short[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.execution_id[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.trade_flags[trade_message_at] = trade_message_value; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message set to where it lies, so a field read out of place says so */
inline ramp_trade_message(trade_message_record, trade_message_base) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.order_id[trade_message_at] = (trade_message_base + 0 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = (trade_message_base + 12 + 1) % 256;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares_short[trade_message_at] = (trade_message_base + 13 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.symbol_short[trade_message_at] = (trade_message_base + 19 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price_short[trade_message_at] = (trade_message_base + 25 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.execution_id[trade_message_at] = (trade_message_base + 35 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.trade_flags[trade_message_at] = (trade_message_base + 47 + trade_message_at + 1) % 256; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message to the wire, 52 bytes from where the cursor stands */
inline encode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.order_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_record.side_indicator; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.shares_short[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> wire[at] = trade_message_record.symbol_short[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> wire[at] = trade_message_record.price_short[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> wire[at] = trade_message_record.execution_id[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> wire[at] = trade_message_record.trade_flags[trade_message_at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message off the wire, 52 bytes from where the cursor stands */
inline decode_trade_message(trade_message_record) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.order_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_record.side_indicator = wire[at]; at = at + 1;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.shares_short[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> trade_message_record.symbol_short[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> trade_message_record.price_short[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> trade_message_record.execution_id[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> trade_message_record.trade_flags[trade_message_at] = wire[at]; at = at + 1; trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message is what was written, byte for byte */
inline equal_trade_message(trade_message_read, trade_message_written) {
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.order_id[trade_message_at] == trade_message_written.order_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  assert(trade_message_read.side_indicator == trade_message_written.side_indicator);
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.shares_short[trade_message_at] == trade_message_written.shares_short[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 6 -> assert(trade_message_read.symbol_short[trade_message_at] == trade_message_written.symbol_short[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 10 -> assert(trade_message_read.price_short[trade_message_at] == trade_message_written.price_short[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 12 -> assert(trade_message_read.execution_id[trade_message_at] == trade_message_written.execution_id[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  trade_message_at = 0;
  do
  :: trade_message_at < 5 -> assert(trade_message_read.trade_flags[trade_message_at] == trade_message_written.trade_flags[trade_message_at]); trade_message_at = trade_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message Long Form: 67 bytes --------------------------------------- */

/* Cboe European platform only. As Trade Message but with longer Shares and Price fields. */
typedef TradeMessageLongForm {
  byte order_id[12];
  byte side_indicator;
  byte shares_long[10];
  byte symbol_long[8];
  byte price_long[19];
  byte execution_id[12];
  byte trade_flags[5]
};

int trade_message_long_form_at;

/* every byte of Trade Message Long Form set to one value */
inline fill_trade_message_long_form(trade_message_long_form_record, trade_message_long_form_value) {
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.order_id[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_record.side_indicator = trade_message_long_form_value;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 10 -> trade_message_long_form_record.shares_long[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 8 -> trade_message_long_form_record.symbol_long[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 19 -> trade_message_long_form_record.price_long[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.execution_id[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 5 -> trade_message_long_form_record.trade_flags[trade_message_long_form_at] = trade_message_long_form_value; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message Long Form set to where it lies, so a field read out of place says so */
inline ramp_trade_message_long_form(trade_message_long_form_record, trade_message_long_form_base) {
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.order_id[trade_message_long_form_at] = (trade_message_long_form_base + 0 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_record.side_indicator = (trade_message_long_form_base + 12 + 1) % 256;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 10 -> trade_message_long_form_record.shares_long[trade_message_long_form_at] = (trade_message_long_form_base + 13 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 8 -> trade_message_long_form_record.symbol_long[trade_message_long_form_at] = (trade_message_long_form_base + 23 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 19 -> trade_message_long_form_record.price_long[trade_message_long_form_at] = (trade_message_long_form_base + 31 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.execution_id[trade_message_long_form_at] = (trade_message_long_form_base + 50 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 5 -> trade_message_long_form_record.trade_flags[trade_message_long_form_at] = (trade_message_long_form_base + 62 + trade_message_long_form_at + 1) % 256; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Long Form to the wire, 67 bytes from where the cursor stands */
inline encode_trade_message_long_form(trade_message_long_form_record) {
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> wire[at] = trade_message_long_form_record.order_id[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_long_form_record.side_indicator; at = at + 1;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 10 -> wire[at] = trade_message_long_form_record.shares_long[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 8 -> wire[at] = trade_message_long_form_record.symbol_long[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 19 -> wire[at] = trade_message_long_form_record.price_long[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> wire[at] = trade_message_long_form_record.execution_id[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 5 -> wire[at] = trade_message_long_form_record.trade_flags[trade_message_long_form_at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Long Form off the wire, 67 bytes from where the cursor stands */
inline decode_trade_message_long_form(trade_message_long_form_record) {
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.order_id[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_record.side_indicator = wire[at]; at = at + 1;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 10 -> trade_message_long_form_record.shares_long[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 8 -> trade_message_long_form_record.symbol_long[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 19 -> trade_message_long_form_record.price_long[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> trade_message_long_form_record.execution_id[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 5 -> trade_message_long_form_record.trade_flags[trade_message_long_form_at] = wire[at]; at = at + 1; trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message Long Form is what was written, byte for byte */
inline equal_trade_message_long_form(trade_message_long_form_read, trade_message_long_form_written) {
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> assert(trade_message_long_form_read.order_id[trade_message_long_form_at] == trade_message_long_form_written.order_id[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  assert(trade_message_long_form_read.side_indicator == trade_message_long_form_written.side_indicator);
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 10 -> assert(trade_message_long_form_read.shares_long[trade_message_long_form_at] == trade_message_long_form_written.shares_long[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 8 -> assert(trade_message_long_form_read.symbol_long[trade_message_long_form_at] == trade_message_long_form_written.symbol_long[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 19 -> assert(trade_message_long_form_read.price_long[trade_message_long_form_at] == trade_message_long_form_written.price_long[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 12 -> assert(trade_message_long_form_read.execution_id[trade_message_long_form_at] == trade_message_long_form_written.execution_id[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  trade_message_long_form_at = 0;
  do
  :: trade_message_long_form_at < 5 -> assert(trade_message_long_form_read.trade_flags[trade_message_long_form_at] == trade_message_long_form_written.trade_flags[trade_message_long_form_at]); trade_message_long_form_at = trade_message_long_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message Extended Form: 89 bytes ----------------------------------- */

/* Cboe European platform only. Extended details of trades reported to or executed by Cboe (e.g. privately negotiated trades brought on-exchange). */
typedef TradeMessageExtendedForm {
  byte shares_extended[12];
  byte symbol_long[8];
  byte price_long[19];
  byte trade_id[12];
  byte trade_date[8];
  byte trade_time[8];
  byte execution_venue[4];
  byte currency[3];
  byte cboe_trade_flags;
  byte extended_trade_flags[14]
};

int trade_message_extended_form_at;

/* every byte of Trade Message Extended Form set to one value */
inline fill_trade_message_extended_form(trade_message_extended_form_record, trade_message_extended_form_value) {
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.shares_extended[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.symbol_long[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 19 -> trade_message_extended_form_record.price_long[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.trade_id[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_date[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_time[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 4 -> trade_message_extended_form_record.execution_venue[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 3 -> trade_message_extended_form_record.currency[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_record.cboe_trade_flags = trade_message_extended_form_value;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 14 -> trade_message_extended_form_record.extended_trade_flags[trade_message_extended_form_at] = trade_message_extended_form_value; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message Extended Form set to where it lies, so a field read out of place says so */
inline ramp_trade_message_extended_form(trade_message_extended_form_record, trade_message_extended_form_base) {
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.shares_extended[trade_message_extended_form_at] = (trade_message_extended_form_base + 0 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.symbol_long[trade_message_extended_form_at] = (trade_message_extended_form_base + 12 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 19 -> trade_message_extended_form_record.price_long[trade_message_extended_form_at] = (trade_message_extended_form_base + 20 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.trade_id[trade_message_extended_form_at] = (trade_message_extended_form_base + 39 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_date[trade_message_extended_form_at] = (trade_message_extended_form_base + 51 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_time[trade_message_extended_form_at] = (trade_message_extended_form_base + 59 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 4 -> trade_message_extended_form_record.execution_venue[trade_message_extended_form_at] = (trade_message_extended_form_base + 67 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 3 -> trade_message_extended_form_record.currency[trade_message_extended_form_at] = (trade_message_extended_form_base + 71 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_record.cboe_trade_flags = (trade_message_extended_form_base + 74 + 1) % 256;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 14 -> trade_message_extended_form_record.extended_trade_flags[trade_message_extended_form_at] = (trade_message_extended_form_base + 75 + trade_message_extended_form_at + 1) % 256; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Extended Form to the wire, 89 bytes from where the cursor stands */
inline encode_trade_message_extended_form(trade_message_extended_form_record) {
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> wire[at] = trade_message_extended_form_record.shares_extended[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> wire[at] = trade_message_extended_form_record.symbol_long[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 19 -> wire[at] = trade_message_extended_form_record.price_long[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> wire[at] = trade_message_extended_form_record.trade_id[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> wire[at] = trade_message_extended_form_record.trade_date[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> wire[at] = trade_message_extended_form_record.trade_time[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 4 -> wire[at] = trade_message_extended_form_record.execution_venue[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 3 -> wire[at] = trade_message_extended_form_record.currency[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_extended_form_record.cboe_trade_flags; at = at + 1;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 14 -> wire[at] = trade_message_extended_form_record.extended_trade_flags[trade_message_extended_form_at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Extended Form off the wire, 89 bytes from where the cursor stands */
inline decode_trade_message_extended_form(trade_message_extended_form_record) {
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.shares_extended[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.symbol_long[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 19 -> trade_message_extended_form_record.price_long[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> trade_message_extended_form_record.trade_id[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_date[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> trade_message_extended_form_record.trade_time[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 4 -> trade_message_extended_form_record.execution_venue[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 3 -> trade_message_extended_form_record.currency[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_record.cboe_trade_flags = wire[at]; at = at + 1;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 14 -> trade_message_extended_form_record.extended_trade_flags[trade_message_extended_form_at] = wire[at]; at = at + 1; trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message Extended Form is what was written, byte for byte */
inline equal_trade_message_extended_form(trade_message_extended_form_read, trade_message_extended_form_written) {
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> assert(trade_message_extended_form_read.shares_extended[trade_message_extended_form_at] == trade_message_extended_form_written.shares_extended[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> assert(trade_message_extended_form_read.symbol_long[trade_message_extended_form_at] == trade_message_extended_form_written.symbol_long[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 19 -> assert(trade_message_extended_form_read.price_long[trade_message_extended_form_at] == trade_message_extended_form_written.price_long[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 12 -> assert(trade_message_extended_form_read.trade_id[trade_message_extended_form_at] == trade_message_extended_form_written.trade_id[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> assert(trade_message_extended_form_read.trade_date[trade_message_extended_form_at] == trade_message_extended_form_written.trade_date[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 8 -> assert(trade_message_extended_form_read.trade_time[trade_message_extended_form_at] == trade_message_extended_form_written.trade_time[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 4 -> assert(trade_message_extended_form_read.execution_venue[trade_message_extended_form_at] == trade_message_extended_form_written.execution_venue[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 3 -> assert(trade_message_extended_form_read.currency[trade_message_extended_form_at] == trade_message_extended_form_written.currency[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  assert(trade_message_extended_form_read.cboe_trade_flags == trade_message_extended_form_written.cboe_trade_flags);
  trade_message_extended_form_at = 0;
  do
  :: trade_message_extended_form_at < 14 -> assert(trade_message_extended_form_read.extended_trade_flags[trade_message_extended_form_at] == trade_message_extended_form_written.extended_trade_flags[trade_message_extended_form_at]); trade_message_extended_form_at = trade_message_extended_form_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Message Unknown Symbol: 93 bytes ---------------------------------- */

/* Cboe European Trade Reporting Facility only. Trades reported to Cboe on a symbol not currently known, identified by ISIN and currency. */
typedef TradeMessageUnknownSymbol {
  byte shares_extended[12];
  byte symbol_extended[12];
  byte price_long[19];
  byte trade_id[12];
  byte trade_date[8];
  byte trade_time[8];
  byte execution_venue[4];
  byte currency[3];
  byte cboe_trade_flags;
  byte extended_trade_flags[14]
};

int trade_message_unknown_symbol_at;

/* every byte of Trade Message Unknown Symbol set to one value */
inline fill_trade_message_unknown_symbol(trade_message_unknown_symbol_record, trade_message_unknown_symbol_value) {
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.shares_extended[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.symbol_extended[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 19 -> trade_message_unknown_symbol_record.price_long[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.trade_id[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_date[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_time[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 4 -> trade_message_unknown_symbol_record.execution_venue[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 3 -> trade_message_unknown_symbol_record.currency[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_record.cboe_trade_flags = trade_message_unknown_symbol_value;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 14 -> trade_message_unknown_symbol_record.extended_trade_flags[trade_message_unknown_symbol_at] = trade_message_unknown_symbol_value; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Message Unknown Symbol set to where it lies, so a field read out of place says so */
inline ramp_trade_message_unknown_symbol(trade_message_unknown_symbol_record, trade_message_unknown_symbol_base) {
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.shares_extended[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 0 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.symbol_extended[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 12 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 19 -> trade_message_unknown_symbol_record.price_long[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 24 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.trade_id[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 43 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_date[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 55 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_time[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 63 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 4 -> trade_message_unknown_symbol_record.execution_venue[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 71 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 3 -> trade_message_unknown_symbol_record.currency[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 75 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_record.cboe_trade_flags = (trade_message_unknown_symbol_base + 78 + 1) % 256;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 14 -> trade_message_unknown_symbol_record.extended_trade_flags[trade_message_unknown_symbol_at] = (trade_message_unknown_symbol_base + 79 + trade_message_unknown_symbol_at + 1) % 256; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Unknown Symbol to the wire, 93 bytes from where the cursor stands */
inline encode_trade_message_unknown_symbol(trade_message_unknown_symbol_record) {
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> wire[at] = trade_message_unknown_symbol_record.shares_extended[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> wire[at] = trade_message_unknown_symbol_record.symbol_extended[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 19 -> wire[at] = trade_message_unknown_symbol_record.price_long[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> wire[at] = trade_message_unknown_symbol_record.trade_id[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> wire[at] = trade_message_unknown_symbol_record.trade_date[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> wire[at] = trade_message_unknown_symbol_record.trade_time[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 4 -> wire[at] = trade_message_unknown_symbol_record.execution_venue[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 3 -> wire[at] = trade_message_unknown_symbol_record.currency[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  wire[at] = trade_message_unknown_symbol_record.cboe_trade_flags; at = at + 1;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 14 -> wire[at] = trade_message_unknown_symbol_record.extended_trade_flags[trade_message_unknown_symbol_at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Message Unknown Symbol off the wire, 93 bytes from where the cursor stands */
inline decode_trade_message_unknown_symbol(trade_message_unknown_symbol_record) {
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.shares_extended[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.symbol_extended[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 19 -> trade_message_unknown_symbol_record.price_long[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> trade_message_unknown_symbol_record.trade_id[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_date[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> trade_message_unknown_symbol_record.trade_time[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 4 -> trade_message_unknown_symbol_record.execution_venue[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 3 -> trade_message_unknown_symbol_record.currency[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_record.cboe_trade_flags = wire[at]; at = at + 1;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 14 -> trade_message_unknown_symbol_record.extended_trade_flags[trade_message_unknown_symbol_at] = wire[at]; at = at + 1; trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Message Unknown Symbol is what was written, byte for byte */
inline equal_trade_message_unknown_symbol(trade_message_unknown_symbol_read, trade_message_unknown_symbol_written) {
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> assert(trade_message_unknown_symbol_read.shares_extended[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.shares_extended[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> assert(trade_message_unknown_symbol_read.symbol_extended[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.symbol_extended[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 19 -> assert(trade_message_unknown_symbol_read.price_long[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.price_long[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 12 -> assert(trade_message_unknown_symbol_read.trade_id[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.trade_id[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> assert(trade_message_unknown_symbol_read.trade_date[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.trade_date[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 8 -> assert(trade_message_unknown_symbol_read.trade_time[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.trade_time[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 4 -> assert(trade_message_unknown_symbol_read.execution_venue[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.execution_venue[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 3 -> assert(trade_message_unknown_symbol_read.currency[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.currency[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  assert(trade_message_unknown_symbol_read.cboe_trade_flags == trade_message_unknown_symbol_written.cboe_trade_flags);
  trade_message_unknown_symbol_at = 0;
  do
  :: trade_message_unknown_symbol_at < 14 -> assert(trade_message_unknown_symbol_read.extended_trade_flags[trade_message_unknown_symbol_at] == trade_message_unknown_symbol_written.extended_trade_flags[trade_message_unknown_symbol_at]); trade_message_unknown_symbol_at = trade_message_unknown_symbol_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 12 bytes ---------------------------------------- */

/* Indicates the current trading status of a security; sent whenever the status changes and for all Suspended securities before trading hours. */
typedef TradingStatusMessage {
  byte symbol_long[8];
  byte status;
  byte reserved[3]
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = trading_status_message_value;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = (trading_status_message_base + 8 + 1) % 256;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved[trading_status_message_at] = (trading_status_message_base + 9 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message to the wire, 12 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.symbol_long[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.status; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> wire[at] = trading_status_message_record.reserved[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trading Status Message off the wire, 12 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.symbol_long[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.status = wire[at]; at = at + 1;
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> trading_status_message_record.reserved[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.symbol_long[trading_status_message_at] == trading_status_message_written.symbol_long[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.status == trading_status_message_written.status);
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 3 -> assert(trading_status_message_read.reserved[trading_status_message_at] == trading_status_message_written.reserved[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Statistics Message: 29 bytes -------------------------------------------- */

/* Cboe European platform only. Disseminates statistics prices: opening, closing, high, low, previous close. */
typedef StatisticsMessage {
  byte symbol_long[8];
  byte price_long[19];
  byte statistic_type;
  byte price_determination
};

int statistics_message_at;

/* every byte of Statistics Message set to one value */
inline fill_statistics_message(statistics_message_record, statistics_message_value) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.symbol_long[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 19 -> statistics_message_record.price_long[statistics_message_at] = statistics_message_value; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = statistics_message_value;
  statistics_message_record.price_determination = statistics_message_value;
  skip
}

/* each byte of Statistics Message set to where it lies, so a field read out of place says so */
inline ramp_statistics_message(statistics_message_record, statistics_message_base) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.symbol_long[statistics_message_at] = (statistics_message_base + 0 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 19 -> statistics_message_record.price_long[statistics_message_at] = (statistics_message_base + 8 + statistics_message_at + 1) % 256; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = (statistics_message_base + 27 + 1) % 256;
  statistics_message_record.price_determination = (statistics_message_base + 28 + 1) % 256;
  skip
}

/* Statistics Message to the wire, 29 bytes from where the cursor stands */
inline encode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> wire[at] = statistics_message_record.symbol_long[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 19 -> wire[at] = statistics_message_record.price_long[statistics_message_at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  wire[at] = statistics_message_record.statistic_type; at = at + 1;
  wire[at] = statistics_message_record.price_determination; at = at + 1;
  skip
}

/* Statistics Message off the wire, 29 bytes from where the cursor stands */
inline decode_statistics_message(statistics_message_record) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> statistics_message_record.symbol_long[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 19 -> statistics_message_record.price_long[statistics_message_at] = wire[at]; at = at + 1; statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_record.statistic_type = wire[at]; at = at + 1;
  statistics_message_record.price_determination = wire[at]; at = at + 1;
  skip
}

/* what was read of Statistics Message is what was written, byte for byte */
inline equal_statistics_message(statistics_message_read, statistics_message_written) {
  statistics_message_at = 0;
  do
  :: statistics_message_at < 8 -> assert(statistics_message_read.symbol_long[statistics_message_at] == statistics_message_written.symbol_long[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  statistics_message_at = 0;
  do
  :: statistics_message_at < 19 -> assert(statistics_message_read.price_long[statistics_message_at] == statistics_message_written.price_long[statistics_message_at]); statistics_message_at = statistics_message_at + 1
  :: else -> break
  od;
  assert(statistics_message_read.statistic_type == statistics_message_written.statistic_type);
  assert(statistics_message_read.price_determination == statistics_message_written.price_determination);
  skip
}

/* ---- Auction Update Message: 59 bytes ---------------------------------------- */

/* Disseminates indicative price and size information during auctions for Cboe auction-eligible securities. */
typedef AuctionUpdateMessage {
  byte symbol_long[8];
  byte auction_type;
  byte reference_price[19];
  byte indicative_price[19];
  byte indicative_shares[10];
  byte outside_tolerance;
  byte includes_primary
};

int auction_update_message_at;

/* every byte of Auction Update Message set to one value */
inline fill_auction_update_message(auction_update_message_record, auction_update_message_value) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_long[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = auction_update_message_value;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.reference_price[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.indicative_price[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = auction_update_message_value;
  auction_update_message_record.includes_primary = auction_update_message_value;
  skip
}

/* each byte of Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_auction_update_message(auction_update_message_record, auction_update_message_base) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_long[auction_update_message_at] = (auction_update_message_base + 0 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = (auction_update_message_base + 8 + 1) % 256;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.reference_price[auction_update_message_at] = (auction_update_message_base + 9 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.indicative_price[auction_update_message_at] = (auction_update_message_base + 28 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_shares[auction_update_message_at] = (auction_update_message_base + 47 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = (auction_update_message_base + 57 + 1) % 256;
  auction_update_message_record.includes_primary = (auction_update_message_base + 58 + 1) % 256;
  skip
}

/* Auction Update Message to the wire, 59 bytes from where the cursor stands */
inline encode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.symbol_long[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.auction_type; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> wire[at] = auction_update_message_record.reference_price[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> wire[at] = auction_update_message_record.indicative_price[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.indicative_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.outside_tolerance; at = at + 1;
  wire[at] = auction_update_message_record.includes_primary; at = at + 1;
  skip
}

/* Auction Update Message off the wire, 59 bytes from where the cursor stands */
inline decode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.symbol_long[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = wire[at]; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.reference_price[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> auction_update_message_record.indicative_price[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.outside_tolerance = wire[at]; at = at + 1;
  auction_update_message_record.includes_primary = wire[at]; at = at + 1;
  skip
}

/* what was read of Auction Update Message is what was written, byte for byte */
inline equal_auction_update_message(auction_update_message_read, auction_update_message_written) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.symbol_long[auction_update_message_at] == auction_update_message_written.symbol_long[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.auction_type == auction_update_message_written.auction_type);
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> assert(auction_update_message_read.reference_price[auction_update_message_at] == auction_update_message_written.reference_price[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 19 -> assert(auction_update_message_read.indicative_price[auction_update_message_at] == auction_update_message_written.indicative_price[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.indicative_shares[auction_update_message_at] == auction_update_message_written.indicative_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.outside_tolerance == auction_update_message_written.outside_tolerance);
  assert(auction_update_message_read.includes_primary == auction_update_message_written.includes_primary);
  skip
}

/* ---- Auction Summary Message: 38 bytes --------------------------------------- */

/* Disseminates the results of an auction in a Cboe auction-eligible security. */
typedef AuctionSummaryMessage {
  byte symbol_long[8];
  byte auction_type;
  byte price_long[19];
  byte shares_long[10]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 19 -> auction_summary_message_record.price_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 8 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 19 -> auction_summary_message_record.price_long[auction_summary_message_at] = (auction_summary_message_base + 9 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares_long[auction_summary_message_at] = (auction_summary_message_base + 28 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 38 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.symbol_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 19 -> wire[at] = auction_summary_message_record.price_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> wire[at] = auction_summary_message_record.shares_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 38 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.symbol_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 19 -> auction_summary_message_record.price_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.symbol_long[auction_summary_message_at] == auction_summary_message_written.symbol_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 19 -> assert(auction_summary_message_read.price_long[auction_summary_message_at] == auction_summary_message_written.price_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> assert(auction_summary_message_read.shares_long[auction_summary_message_at] == auction_summary_message_written.shares_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Login Request Packet: 36 bytes ------------------------------------------ */

/* The Soup 2.0 client must send a Login Request Packet immediately upon establishing a new TCP/IP socket connection to the server. */
typedef LoginRequestPacket {
  byte username[6];
  byte password[10];
  byte requested_session[10];
  byte requested_sequence_number[10]
};

int login_request_packet_at;

/* every byte of Login Request Packet set to one value */
inline fill_login_request_packet(login_request_packet_record, login_request_packet_value) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = login_request_packet_value; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Login Request Packet set to where it lies, so a field read out of place says so */
inline ramp_login_request_packet(login_request_packet_record, login_request_packet_base) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = (login_request_packet_base + 0 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = (login_request_packet_base + 6 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = (login_request_packet_base + 16 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = (login_request_packet_base + 26 + login_request_packet_at + 1) % 256; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet to the wire, 36 bytes from where the cursor stands */
inline encode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> wire[at] = login_request_packet_record.username[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.password[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_session[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> wire[at] = login_request_packet_record.requested_sequence_number[login_request_packet_at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* Login Request Packet off the wire, 36 bytes from where the cursor stands */
inline decode_login_request_packet(login_request_packet_record) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> login_request_packet_record.username[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.password[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_session[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> login_request_packet_record.requested_sequence_number[login_request_packet_at] = wire[at]; at = at + 1; login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Login Request Packet is what was written, byte for byte */
inline equal_login_request_packet(login_request_packet_read, login_request_packet_written) {
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 6 -> assert(login_request_packet_read.username[login_request_packet_at] == login_request_packet_written.username[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.password[login_request_packet_at] == login_request_packet_written.password[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_session[login_request_packet_at] == login_request_packet_written.requested_session[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  login_request_packet_at = 0;
  do
  :: login_request_packet_at < 10 -> assert(login_request_packet_read.requested_sequence_number[login_request_packet_at] == login_request_packet_written.requested_sequence_number[login_request_packet_at]); login_request_packet_at = login_request_packet_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Debug Packet: encoded, read back, and compared */
proctype check_debug_packet() {
  DebugPacket debug_packet_sent;
  DebugPacket debug_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_debug_packet(debug_packet_sent, 0)
  :: pattern == 1 -> fill_debug_packet(debug_packet_sent, 32)
  :: pattern == 2 -> fill_debug_packet(debug_packet_sent, 255)
  :: else -> ramp_debug_packet(debug_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_debug_packet(debug_packet_sent);
    assert(at == 1);
    at = 0;
    decode_debug_packet(debug_packet_got);
    assert(at == 1);
    equal_debug_packet(debug_packet_got, debug_packet_sent)
  }
}

/* Login Accepted Packet: encoded, read back, and compared */
proctype check_login_accepted_packet() {
  LoginAcceptedPacket login_accepted_packet_sent;
  LoginAcceptedPacket login_accepted_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_accepted_packet(login_accepted_packet_sent, 0)
  :: pattern == 1 -> fill_login_accepted_packet(login_accepted_packet_sent, 32)
  :: pattern == 2 -> fill_login_accepted_packet(login_accepted_packet_sent, 255)
  :: else -> ramp_login_accepted_packet(login_accepted_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_accepted_packet(login_accepted_packet_sent);
    assert(at == 20);
    at = 0;
    decode_login_accepted_packet(login_accepted_packet_got);
    assert(at == 20);
    equal_login_accepted_packet(login_accepted_packet_got, login_accepted_packet_sent)
  }
}

/* Login Rejected Packet: encoded, read back, and compared */
proctype check_login_rejected_packet() {
  LoginRejectedPacket login_rejected_packet_sent;
  LoginRejectedPacket login_rejected_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_rejected_packet(login_rejected_packet_sent, 0)
  :: pattern == 1 -> fill_login_rejected_packet(login_rejected_packet_sent, 32)
  :: pattern == 2 -> fill_login_rejected_packet(login_rejected_packet_sent, 255)
  :: else -> ramp_login_rejected_packet(login_rejected_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_rejected_packet(login_rejected_packet_sent);
    assert(at == 1);
    at = 0;
    decode_login_rejected_packet(login_rejected_packet_got);
    assert(at == 1);
    equal_login_rejected_packet(login_rejected_packet_got, login_rejected_packet_sent)
  }
}

/* Sequenced Message Header: encoded, read back, and compared */
proctype check_sequenced_message_header() {
  SequencedMessageHeader sequenced_message_header_sent;
  SequencedMessageHeader sequenced_message_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_sequenced_message_header(sequenced_message_header_sent, 0)
  :: pattern == 1 -> fill_sequenced_message_header(sequenced_message_header_sent, 32)
  :: pattern == 2 -> fill_sequenced_message_header(sequenced_message_header_sent, 255)
  :: else -> ramp_sequenced_message_header(sequenced_message_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_sequenced_message_header(sequenced_message_header_sent);
    assert(at == 12);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 12);
    equal_sequenced_message_header(sequenced_message_header_got, sequenced_message_header_sent)
  }
}

/* Symbol Clear Message: encoded, read back, and compared */
proctype check_symbol_clear_message() {
  SymbolClearMessage symbol_clear_message_sent;
  SymbolClearMessage symbol_clear_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_clear_message(symbol_clear_message_sent, 0)
  :: pattern == 1 -> fill_symbol_clear_message(symbol_clear_message_sent, 32)
  :: pattern == 2 -> fill_symbol_clear_message(symbol_clear_message_sent, 255)
  :: else -> ramp_symbol_clear_message(symbol_clear_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_clear_message(symbol_clear_message_sent);
    assert(at == 8);
    at = 0;
    decode_symbol_clear_message(symbol_clear_message_got);
    assert(at == 8);
    equal_symbol_clear_message(symbol_clear_message_got, symbol_clear_message_sent)
  }
}

/* Add Order Message: encoded, read back, and compared */
proctype check_add_order_message() {
  AddOrderMessage add_order_message_sent;
  AddOrderMessage add_order_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message(add_order_message_sent, 0)
  :: pattern == 1 -> fill_add_order_message(add_order_message_sent, 32)
  :: pattern == 2 -> fill_add_order_message(add_order_message_sent, 255)
  :: else -> ramp_add_order_message(add_order_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message(add_order_message_sent);
    assert(at == 36);
    at = 0;
    decode_add_order_message(add_order_message_got);
    assert(at == 36);
    equal_add_order_message(add_order_message_got, add_order_message_sent)
  }
}

/* Add Order Message Long Form: encoded, read back, and compared */
proctype check_add_order_message_long_form() {
  AddOrderMessageLongForm add_order_message_long_form_sent;
  AddOrderMessageLongForm add_order_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 0)
  :: pattern == 1 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 32)
  :: pattern == 2 -> fill_add_order_message_long_form(add_order_message_long_form_sent, 255)
  :: else -> ramp_add_order_message_long_form(add_order_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_message_long_form(add_order_message_long_form_sent);
    assert(at == 51);
    at = 0;
    decode_add_order_message_long_form(add_order_message_long_form_got);
    assert(at == 51);
    equal_add_order_message_long_form(add_order_message_long_form_got, add_order_message_long_form_sent)
  }
}

/* Order Executed Message: encoded, read back, and compared */
proctype check_order_executed_message() {
  OrderExecutedMessage order_executed_message_sent;
  OrderExecutedMessage order_executed_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message(order_executed_message_sent, 0)
  :: pattern == 1 -> fill_order_executed_message(order_executed_message_sent, 32)
  :: pattern == 2 -> fill_order_executed_message(order_executed_message_sent, 255)
  :: else -> ramp_order_executed_message(order_executed_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message(order_executed_message_sent);
    assert(at == 34);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 34);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
  }
}

/* Order Executed Message Long Form: encoded, read back, and compared */
proctype check_order_executed_message_long_form() {
  OrderExecutedMessageLongForm order_executed_message_long_form_sent;
  OrderExecutedMessageLongForm order_executed_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_executed_message_long_form(order_executed_message_long_form_sent, 0)
  :: pattern == 1 -> fill_order_executed_message_long_form(order_executed_message_long_form_sent, 32)
  :: pattern == 2 -> fill_order_executed_message_long_form(order_executed_message_long_form_sent, 255)
  :: else -> ramp_order_executed_message_long_form(order_executed_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_executed_message_long_form(order_executed_message_long_form_sent);
    assert(at == 38);
    at = 0;
    decode_order_executed_message_long_form(order_executed_message_long_form_got);
    assert(at == 38);
    equal_order_executed_message_long_form(order_executed_message_long_form_got, order_executed_message_long_form_sent)
  }
}

/* Order Cancel Message: encoded, read back, and compared */
proctype check_order_cancel_message() {
  OrderCancelMessage order_cancel_message_sent;
  OrderCancelMessage order_cancel_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message(order_cancel_message_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message(order_cancel_message_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message(order_cancel_message_sent, 255)
  :: else -> ramp_order_cancel_message(order_cancel_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message(order_cancel_message_sent);
    assert(at == 18);
    at = 0;
    decode_order_cancel_message(order_cancel_message_got);
    assert(at == 18);
    equal_order_cancel_message(order_cancel_message_got, order_cancel_message_sent)
  }
}

/* Order Cancel Message Long Form: encoded, read back, and compared */
proctype check_order_cancel_message_long_form() {
  OrderCancelMessageLongForm order_cancel_message_long_form_sent;
  OrderCancelMessageLongForm order_cancel_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_order_cancel_message_long_form(order_cancel_message_long_form_sent, 0)
  :: pattern == 1 -> fill_order_cancel_message_long_form(order_cancel_message_long_form_sent, 32)
  :: pattern == 2 -> fill_order_cancel_message_long_form(order_cancel_message_long_form_sent, 255)
  :: else -> ramp_order_cancel_message_long_form(order_cancel_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_order_cancel_message_long_form(order_cancel_message_long_form_sent);
    assert(at == 22);
    at = 0;
    decode_order_cancel_message_long_form(order_cancel_message_long_form_got);
    assert(at == 22);
    equal_order_cancel_message_long_form(order_cancel_message_long_form_got, order_cancel_message_long_form_sent)
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
    assert(at == 52);
    at = 0;
    decode_trade_message(trade_message_got);
    assert(at == 52);
    equal_trade_message(trade_message_got, trade_message_sent)
  }
}

/* Trade Message Long Form: encoded, read back, and compared */
proctype check_trade_message_long_form() {
  TradeMessageLongForm trade_message_long_form_sent;
  TradeMessageLongForm trade_message_long_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message_long_form(trade_message_long_form_sent, 0)
  :: pattern == 1 -> fill_trade_message_long_form(trade_message_long_form_sent, 32)
  :: pattern == 2 -> fill_trade_message_long_form(trade_message_long_form_sent, 255)
  :: else -> ramp_trade_message_long_form(trade_message_long_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message_long_form(trade_message_long_form_sent);
    assert(at == 67);
    at = 0;
    decode_trade_message_long_form(trade_message_long_form_got);
    assert(at == 67);
    equal_trade_message_long_form(trade_message_long_form_got, trade_message_long_form_sent)
  }
}

/* Trade Message Extended Form: encoded, read back, and compared */
proctype check_trade_message_extended_form() {
  TradeMessageExtendedForm trade_message_extended_form_sent;
  TradeMessageExtendedForm trade_message_extended_form_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message_extended_form(trade_message_extended_form_sent, 0)
  :: pattern == 1 -> fill_trade_message_extended_form(trade_message_extended_form_sent, 32)
  :: pattern == 2 -> fill_trade_message_extended_form(trade_message_extended_form_sent, 255)
  :: else -> ramp_trade_message_extended_form(trade_message_extended_form_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message_extended_form(trade_message_extended_form_sent);
    assert(at == 89);
    at = 0;
    decode_trade_message_extended_form(trade_message_extended_form_got);
    assert(at == 89);
    equal_trade_message_extended_form(trade_message_extended_form_got, trade_message_extended_form_sent)
  }
}

/* Trade Message Unknown Symbol: encoded, read back, and compared */
proctype check_trade_message_unknown_symbol() {
  TradeMessageUnknownSymbol trade_message_unknown_symbol_sent;
  TradeMessageUnknownSymbol trade_message_unknown_symbol_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_message_unknown_symbol(trade_message_unknown_symbol_sent, 0)
  :: pattern == 1 -> fill_trade_message_unknown_symbol(trade_message_unknown_symbol_sent, 32)
  :: pattern == 2 -> fill_trade_message_unknown_symbol(trade_message_unknown_symbol_sent, 255)
  :: else -> ramp_trade_message_unknown_symbol(trade_message_unknown_symbol_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_message_unknown_symbol(trade_message_unknown_symbol_sent);
    assert(at == 93);
    at = 0;
    decode_trade_message_unknown_symbol(trade_message_unknown_symbol_got);
    assert(at == 93);
    equal_trade_message_unknown_symbol(trade_message_unknown_symbol_got, trade_message_unknown_symbol_sent)
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

/* Statistics Message: encoded, read back, and compared */
proctype check_statistics_message() {
  StatisticsMessage statistics_message_sent;
  StatisticsMessage statistics_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_statistics_message(statistics_message_sent, 0)
  :: pattern == 1 -> fill_statistics_message(statistics_message_sent, 32)
  :: pattern == 2 -> fill_statistics_message(statistics_message_sent, 255)
  :: else -> ramp_statistics_message(statistics_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_statistics_message(statistics_message_sent);
    assert(at == 29);
    at = 0;
    decode_statistics_message(statistics_message_got);
    assert(at == 29);
    equal_statistics_message(statistics_message_got, statistics_message_sent)
  }
}

/* Auction Update Message: encoded, read back, and compared */
proctype check_auction_update_message() {
  AuctionUpdateMessage auction_update_message_sent;
  AuctionUpdateMessage auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_update_message(auction_update_message_sent, 0)
  :: pattern == 1 -> fill_auction_update_message(auction_update_message_sent, 32)
  :: pattern == 2 -> fill_auction_update_message(auction_update_message_sent, 255)
  :: else -> ramp_auction_update_message(auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_update_message(auction_update_message_sent);
    assert(at == 59);
    at = 0;
    decode_auction_update_message(auction_update_message_got);
    assert(at == 59);
    equal_auction_update_message(auction_update_message_got, auction_update_message_sent)
  }
}

/* Auction Summary Message: encoded, read back, and compared */
proctype check_auction_summary_message() {
  AuctionSummaryMessage auction_summary_message_sent;
  AuctionSummaryMessage auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_auction_summary_message(auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_auction_summary_message(auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_auction_summary_message(auction_summary_message_sent, 255)
  :: else -> ramp_auction_summary_message(auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_auction_summary_message(auction_summary_message_sent);
    assert(at == 38);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 38);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Login Request Packet: encoded, read back, and compared */
proctype check_login_request_packet() {
  LoginRequestPacket login_request_packet_sent;
  LoginRequestPacket login_request_packet_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_login_request_packet(login_request_packet_sent, 0)
  :: pattern == 1 -> fill_login_request_packet(login_request_packet_sent, 32)
  :: pattern == 2 -> fill_login_request_packet(login_request_packet_sent, 255)
  :: else -> ramp_login_request_packet(login_request_packet_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_login_request_packet(login_request_packet_sent);
    assert(at == 36);
    at = 0;
    decode_login_request_packet(login_request_packet_got);
    assert(at == 36);
    equal_login_request_packet(login_request_packet_got, login_request_packet_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_debug_packet()
  :: run check_login_accepted_packet()
  :: run check_login_rejected_packet()
  :: run check_sequenced_message_header()
  :: run check_symbol_clear_message()
  :: run check_add_order_message()
  :: run check_add_order_message_long_form()
  :: run check_order_executed_message()
  :: run check_order_executed_message_long_form()
  :: run check_order_cancel_message()
  :: run check_order_cancel_message_long_form()
  :: run check_trade_message()
  :: run check_trade_message_long_form()
  :: run check_trade_message_extended_form()
  :: run check_trade_message_unknown_symbol()
  :: run check_trading_status_message()
  :: run check_statistics_message()
  :: run check_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_login_request_packet()
  fi
}
