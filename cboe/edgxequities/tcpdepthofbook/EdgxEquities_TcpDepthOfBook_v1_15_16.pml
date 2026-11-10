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
#define WIRE 71

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

/* ---- Sequenced Message Header: 9 bytes --------------------------------------- */

/* Sequenced Message Header */
typedef SequencedMessageHeader {
  byte timestamp[8];
  byte sequenced_message_type
};

int sequenced_message_header_at;

/* every byte of Sequenced Message Header set to one value */
inline fill_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_value) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = sequenced_message_header_value; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = sequenced_message_header_value;
  skip
}

/* each byte of Sequenced Message Header set to where it lies, so a field read out of place says so */
inline ramp_sequenced_message_header(sequenced_message_header_record, sequenced_message_header_base) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = (sequenced_message_header_base + 0 + sequenced_message_header_at + 1) % 256; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = (sequenced_message_header_base + 8 + 1) % 256;
  skip
}

/* Sequenced Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> wire[at] = sequenced_message_header_record.timestamp[sequenced_message_header_at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  wire[at] = sequenced_message_header_record.sequenced_message_type; at = at + 1;
  skip
}

/* Sequenced Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_sequenced_message_header(sequenced_message_header_record) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> sequenced_message_header_record.timestamp[sequenced_message_header_at] = wire[at]; at = at + 1; sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  sequenced_message_header_record.sequenced_message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Sequenced Message Header is what was written, byte for byte */
inline equal_sequenced_message_header(sequenced_message_header_read, sequenced_message_header_written) {
  sequenced_message_header_at = 0;
  do
  :: sequenced_message_header_at < 8 -> assert(sequenced_message_header_read.timestamp[sequenced_message_header_at] == sequenced_message_header_written.timestamp[sequenced_message_header_at]); sequenced_message_header_at = sequenced_message_header_at + 1
  :: else -> break
  od;
  assert(sequenced_message_header_read.sequenced_message_type == sequenced_message_header_written.sequenced_message_type);
  skip
}

/* ---- Symbol Clear Message: 8 bytes ------------------------------------------- */

/* The Symbol Clear message instructs feed recipients to clear all orders for the Cboe book in the specified symbol. */
typedef SymbolClearMessage {
  byte stock_symbol_long[8]
};

int symbol_clear_message_at;

/* every byte of Symbol Clear Message set to one value */
inline fill_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_value) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.stock_symbol_long[symbol_clear_message_at] = symbol_clear_message_value; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Clear Message set to where it lies, so a field read out of place says so */
inline ramp_symbol_clear_message(symbol_clear_message_record, symbol_clear_message_base) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.stock_symbol_long[symbol_clear_message_at] = (symbol_clear_message_base + 0 + symbol_clear_message_at + 1) % 256; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message to the wire, 8 bytes from where the cursor stands */
inline encode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> wire[at] = symbol_clear_message_record.stock_symbol_long[symbol_clear_message_at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Clear Message off the wire, 8 bytes from where the cursor stands */
inline decode_symbol_clear_message(symbol_clear_message_record) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> symbol_clear_message_record.stock_symbol_long[symbol_clear_message_at] = wire[at]; at = at + 1; symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Clear Message is what was written, byte for byte */
inline equal_symbol_clear_message(symbol_clear_message_read, symbol_clear_message_written) {
  symbol_clear_message_at = 0;
  do
  :: symbol_clear_message_at < 8 -> assert(symbol_clear_message_read.stock_symbol_long[symbol_clear_message_at] == symbol_clear_message_written.stock_symbol_long[symbol_clear_message_at]); symbol_clear_message_at = symbol_clear_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Add Order Short Message: 36 bytes --------------------------------------- */

/* An Add Order message represents a newly accepted visible order on the Cboe book. */
typedef AddOrderShortMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_short[6];
  byte price_short[10];
  byte reserved
};

int add_order_short_message_at;

/* every byte of Add Order Short Message set to one value */
inline fill_add_order_short_message(add_order_short_message_record, add_order_short_message_value) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 12 -> add_order_short_message_record.order_id[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = add_order_short_message_value;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.shares_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.stock_symbol_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 10 -> add_order_short_message_record.price_short[add_order_short_message_at] = add_order_short_message_value; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.reserved = add_order_short_message_value;
  skip
}

/* each byte of Add Order Short Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_short_message(add_order_short_message_record, add_order_short_message_base) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 12 -> add_order_short_message_record.order_id[add_order_short_message_at] = (add_order_short_message_base + 0 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = (add_order_short_message_base + 12 + 1) % 256;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.shares_short[add_order_short_message_at] = (add_order_short_message_base + 13 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.stock_symbol_short[add_order_short_message_at] = (add_order_short_message_base + 19 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 10 -> add_order_short_message_record.price_short[add_order_short_message_at] = (add_order_short_message_base + 25 + add_order_short_message_at + 1) % 256; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.reserved = (add_order_short_message_base + 35 + 1) % 256;
  skip
}

/* Add Order Short Message to the wire, 36 bytes from where the cursor stands */
inline encode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 12 -> wire[at] = add_order_short_message_record.order_id[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.side_indicator; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.shares_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> wire[at] = add_order_short_message_record.stock_symbol_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 10 -> wire[at] = add_order_short_message_record.price_short[add_order_short_message_at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_short_message_record.reserved; at = at + 1;
  skip
}

/* Add Order Short Message off the wire, 36 bytes from where the cursor stands */
inline decode_add_order_short_message(add_order_short_message_record) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 12 -> add_order_short_message_record.order_id[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.shares_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> add_order_short_message_record.stock_symbol_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 10 -> add_order_short_message_record.price_short[add_order_short_message_at] = wire[at]; at = at + 1; add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_record.reserved = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Short Message is what was written, byte for byte */
inline equal_add_order_short_message(add_order_short_message_read, add_order_short_message_written) {
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 12 -> assert(add_order_short_message_read.order_id[add_order_short_message_at] == add_order_short_message_written.order_id[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.side_indicator == add_order_short_message_written.side_indicator);
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.shares_short[add_order_short_message_at] == add_order_short_message_written.shares_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 6 -> assert(add_order_short_message_read.stock_symbol_short[add_order_short_message_at] == add_order_short_message_written.stock_symbol_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  add_order_short_message_at = 0;
  do
  :: add_order_short_message_at < 10 -> assert(add_order_short_message_read.price_short[add_order_short_message_at] == add_order_short_message_written.price_short[add_order_short_message_at]); add_order_short_message_at = add_order_short_message_at + 1
  :: else -> break
  od;
  assert(add_order_short_message_read.reserved == add_order_short_message_written.reserved);
  skip
}

/* ---- Add Order Long Message: 43 bytes ---------------------------------------- */

/* The long version of the Add Order message accommodates larger symbol sizes possible through the ISRA plan. */
typedef AddOrderLongMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_long[8];
  byte price_short[10];
  byte reserved;
  byte participant_id[4];
  byte customer_indicator
};

int add_order_long_message_at;

/* every byte of Add Order Long Message set to one value */
inline fill_add_order_long_message(add_order_long_message_record, add_order_long_message_value) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 12 -> add_order_long_message_record.order_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.shares_short[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.stock_symbol_long[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 10 -> add_order_long_message_record.price_short[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.reserved = add_order_long_message_value;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.participant_id[add_order_long_message_at] = add_order_long_message_value; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.customer_indicator = add_order_long_message_value;
  skip
}

/* each byte of Add Order Long Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_long_message(add_order_long_message_record, add_order_long_message_base) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 12 -> add_order_long_message_record.order_id[add_order_long_message_at] = (add_order_long_message_base + 0 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = (add_order_long_message_base + 12 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.shares_short[add_order_long_message_at] = (add_order_long_message_base + 13 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.stock_symbol_long[add_order_long_message_at] = (add_order_long_message_base + 19 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 10 -> add_order_long_message_record.price_short[add_order_long_message_at] = (add_order_long_message_base + 27 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.reserved = (add_order_long_message_base + 37 + 1) % 256;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.participant_id[add_order_long_message_at] = (add_order_long_message_base + 38 + add_order_long_message_at + 1) % 256; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.customer_indicator = (add_order_long_message_base + 42 + 1) % 256;
  skip
}

/* Add Order Long Message to the wire, 43 bytes from where the cursor stands */
inline encode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 12 -> wire[at] = add_order_long_message_record.order_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.side_indicator; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> wire[at] = add_order_long_message_record.shares_short[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> wire[at] = add_order_long_message_record.stock_symbol_long[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 10 -> wire[at] = add_order_long_message_record.price_short[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.reserved; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> wire[at] = add_order_long_message_record.participant_id[add_order_long_message_at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_long_message_record.customer_indicator; at = at + 1;
  skip
}

/* Add Order Long Message off the wire, 43 bytes from where the cursor stands */
inline decode_add_order_long_message(add_order_long_message_record) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 12 -> add_order_long_message_record.order_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> add_order_long_message_record.shares_short[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> add_order_long_message_record.stock_symbol_long[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 10 -> add_order_long_message_record.price_short[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.reserved = wire[at]; at = at + 1;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> add_order_long_message_record.participant_id[add_order_long_message_at] = wire[at]; at = at + 1; add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_record.customer_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Long Message is what was written, byte for byte */
inline equal_add_order_long_message(add_order_long_message_read, add_order_long_message_written) {
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 12 -> assert(add_order_long_message_read.order_id[add_order_long_message_at] == add_order_long_message_written.order_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.side_indicator == add_order_long_message_written.side_indicator);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 6 -> assert(add_order_long_message_read.shares_short[add_order_long_message_at] == add_order_long_message_written.shares_short[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 8 -> assert(add_order_long_message_read.stock_symbol_long[add_order_long_message_at] == add_order_long_message_written.stock_symbol_long[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 10 -> assert(add_order_long_message_read.price_short[add_order_long_message_at] == add_order_long_message_written.price_short[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.reserved == add_order_long_message_written.reserved);
  add_order_long_message_at = 0;
  do
  :: add_order_long_message_at < 4 -> assert(add_order_long_message_read.participant_id[add_order_long_message_at] == add_order_long_message_written.participant_id[add_order_long_message_at]); add_order_long_message_at = add_order_long_message_at + 1
  :: else -> break
  od;
  assert(add_order_long_message_read.customer_indicator == add_order_long_message_written.customer_indicator);
  skip
}

/* ---- Add Order Extended Message: 47 bytes ------------------------------------ */

/* The extended version of the Add Order message accommodates larger prices. */
typedef AddOrderExtendedMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_long[8];
  byte price_long[14];
  byte display;
  byte participant_id[4];
  byte customer_indicator
};

int add_order_extended_message_at;

/* every byte of Add Order Extended Message set to one value */
inline fill_add_order_extended_message(add_order_extended_message_record, add_order_extended_message_value) {
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 12 -> add_order_extended_message_record.order_id[add_order_extended_message_at] = add_order_extended_message_value; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.side_indicator = add_order_extended_message_value;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 6 -> add_order_extended_message_record.shares_short[add_order_extended_message_at] = add_order_extended_message_value; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 8 -> add_order_extended_message_record.stock_symbol_long[add_order_extended_message_at] = add_order_extended_message_value; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 14 -> add_order_extended_message_record.price_long[add_order_extended_message_at] = add_order_extended_message_value; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.display = add_order_extended_message_value;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 4 -> add_order_extended_message_record.participant_id[add_order_extended_message_at] = add_order_extended_message_value; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.customer_indicator = add_order_extended_message_value;
  skip
}

/* each byte of Add Order Extended Message set to where it lies, so a field read out of place says so */
inline ramp_add_order_extended_message(add_order_extended_message_record, add_order_extended_message_base) {
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 12 -> add_order_extended_message_record.order_id[add_order_extended_message_at] = (add_order_extended_message_base + 0 + add_order_extended_message_at + 1) % 256; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.side_indicator = (add_order_extended_message_base + 12 + 1) % 256;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 6 -> add_order_extended_message_record.shares_short[add_order_extended_message_at] = (add_order_extended_message_base + 13 + add_order_extended_message_at + 1) % 256; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 8 -> add_order_extended_message_record.stock_symbol_long[add_order_extended_message_at] = (add_order_extended_message_base + 19 + add_order_extended_message_at + 1) % 256; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 14 -> add_order_extended_message_record.price_long[add_order_extended_message_at] = (add_order_extended_message_base + 27 + add_order_extended_message_at + 1) % 256; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.display = (add_order_extended_message_base + 41 + 1) % 256;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 4 -> add_order_extended_message_record.participant_id[add_order_extended_message_at] = (add_order_extended_message_base + 42 + add_order_extended_message_at + 1) % 256; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.customer_indicator = (add_order_extended_message_base + 46 + 1) % 256;
  skip
}

/* Add Order Extended Message to the wire, 47 bytes from where the cursor stands */
inline encode_add_order_extended_message(add_order_extended_message_record) {
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 12 -> wire[at] = add_order_extended_message_record.order_id[add_order_extended_message_at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_extended_message_record.side_indicator; at = at + 1;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 6 -> wire[at] = add_order_extended_message_record.shares_short[add_order_extended_message_at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 8 -> wire[at] = add_order_extended_message_record.stock_symbol_long[add_order_extended_message_at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 14 -> wire[at] = add_order_extended_message_record.price_long[add_order_extended_message_at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_extended_message_record.display; at = at + 1;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 4 -> wire[at] = add_order_extended_message_record.participant_id[add_order_extended_message_at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = add_order_extended_message_record.customer_indicator; at = at + 1;
  skip
}

/* Add Order Extended Message off the wire, 47 bytes from where the cursor stands */
inline decode_add_order_extended_message(add_order_extended_message_record) {
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 12 -> add_order_extended_message_record.order_id[add_order_extended_message_at] = wire[at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.side_indicator = wire[at]; at = at + 1;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 6 -> add_order_extended_message_record.shares_short[add_order_extended_message_at] = wire[at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 8 -> add_order_extended_message_record.stock_symbol_long[add_order_extended_message_at] = wire[at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 14 -> add_order_extended_message_record.price_long[add_order_extended_message_at] = wire[at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.display = wire[at]; at = at + 1;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 4 -> add_order_extended_message_record.participant_id[add_order_extended_message_at] = wire[at]; at = at + 1; add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_record.customer_indicator = wire[at]; at = at + 1;
  skip
}

/* what was read of Add Order Extended Message is what was written, byte for byte */
inline equal_add_order_extended_message(add_order_extended_message_read, add_order_extended_message_written) {
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 12 -> assert(add_order_extended_message_read.order_id[add_order_extended_message_at] == add_order_extended_message_written.order_id[add_order_extended_message_at]); add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  assert(add_order_extended_message_read.side_indicator == add_order_extended_message_written.side_indicator);
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 6 -> assert(add_order_extended_message_read.shares_short[add_order_extended_message_at] == add_order_extended_message_written.shares_short[add_order_extended_message_at]); add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 8 -> assert(add_order_extended_message_read.stock_symbol_long[add_order_extended_message_at] == add_order_extended_message_written.stock_symbol_long[add_order_extended_message_at]); add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 14 -> assert(add_order_extended_message_read.price_long[add_order_extended_message_at] == add_order_extended_message_written.price_long[add_order_extended_message_at]); add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  assert(add_order_extended_message_read.display == add_order_extended_message_written.display);
  add_order_extended_message_at = 0;
  do
  :: add_order_extended_message_at < 4 -> assert(add_order_extended_message_read.participant_id[add_order_extended_message_at] == add_order_extended_message_written.participant_id[add_order_extended_message_at]); add_order_extended_message_at = add_order_extended_message_at + 1
  :: else -> break
  od;
  assert(add_order_extended_message_read.customer_indicator == add_order_extended_message_written.customer_indicator);
  skip
}

/* ---- Order Executed Message: 30 bytes ---------------------------------------- */

/* Order Executed messages are sent when a visible order on the Cboe book is executed in whole or in part. */
typedef OrderExecutedMessage {
  byte order_id[12];
  byte executed_shares[6];
  byte execution_id[12]
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
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = order_executed_message_value; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares[order_executed_message_at] = (order_executed_message_base + 12 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = (order_executed_message_base + 18 + order_executed_message_at + 1) % 256; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message to the wire, 30 bytes from where the cursor stands */
inline encode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> wire[at] = order_executed_message_record.order_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> wire[at] = order_executed_message_record.executed_shares[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> wire[at] = order_executed_message_record.execution_id[order_executed_message_at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* Order Executed Message off the wire, 30 bytes from where the cursor stands */
inline decode_order_executed_message(order_executed_message_record) {
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.order_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 6 -> order_executed_message_record.executed_shares[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> order_executed_message_record.execution_id[order_executed_message_at] = wire[at]; at = at + 1; order_executed_message_at = order_executed_message_at + 1
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
  :: order_executed_message_at < 6 -> assert(order_executed_message_read.executed_shares[order_executed_message_at] == order_executed_message_written.executed_shares[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  order_executed_message_at = 0;
  do
  :: order_executed_message_at < 12 -> assert(order_executed_message_read.execution_id[order_executed_message_at] == order_executed_message_written.execution_id[order_executed_message_at]); order_executed_message_at = order_executed_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Order Cancel Message: 18 bytes ------------------------------------------ */

/* Order Cancel messages are sent when a visible order on the Cboe book is canceled in whole or in part. */
typedef OrderCancelMessage {
  byte order_id[12];
  byte canceled_shares[6]
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
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = order_cancel_message_value; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = (order_cancel_message_base + 12 + order_cancel_message_at + 1) % 256; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 6 -> wire[at] = order_cancel_message_record.canceled_shares[order_cancel_message_at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 6 -> order_cancel_message_record.canceled_shares[order_cancel_message_at] = wire[at]; at = at + 1; order_cancel_message_at = order_cancel_message_at + 1
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
  :: order_cancel_message_at < 6 -> assert(order_cancel_message_read.canceled_shares[order_cancel_message_at] == order_cancel_message_written.canceled_shares[order_cancel_message_at]); order_cancel_message_at = order_cancel_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Time Reference Message: 28 bytes ---------------------------------------- */

/* The Time Reference message is used to provide a midnight reference point for recipients of the feed. It is sent whenever the system starts up and when the system crosses a midnight boundary. All subsequent Timestamp values will use the last Midnight Reference until another Time Reference message is received. The Timestamp field will contain the offset from the Trade Date of the Time Reference message. */
typedef TimeReferenceMessage {
  byte midnight_reference[10];
  byte time[10];
  byte trade_date[8]
};

int time_reference_message_at;

/* every byte of Time Reference Message set to one value */
inline fill_time_reference_message(time_reference_message_record, time_reference_message_value) {
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
  :: time_reference_message_at < 10 -> time_reference_message_record.midnight_reference[time_reference_message_at] = (time_reference_message_base + 0 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 10 -> time_reference_message_record.time[time_reference_message_at] = (time_reference_message_base + 10 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  time_reference_message_at = 0;
  do
  :: time_reference_message_at < 8 -> time_reference_message_record.trade_date[time_reference_message_at] = (time_reference_message_base + 20 + time_reference_message_at + 1) % 256; time_reference_message_at = time_reference_message_at + 1
  :: else -> break
  od;
  skip
}

/* Time Reference Message to the wire, 28 bytes from where the cursor stands */
inline encode_time_reference_message(time_reference_message_record) {
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

/* Time Reference Message off the wire, 28 bytes from where the cursor stands */
inline decode_time_reference_message(time_reference_message_record) {
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

/* ---- Trade Short Message: 47 bytes ------------------------------------------- */

/* The Trade message provides information about executions of non-displayed orders or shares on the Cboe book and routed orders. */
typedef TradeShortMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_short[6];
  byte price_short[10];
  byte execution_id[12]
};

int trade_short_message_at;

/* every byte of Trade Short Message set to one value */
inline fill_trade_short_message(trade_short_message_record, trade_short_message_value) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.order_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = trade_short_message_value;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.shares_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.stock_symbol_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 10 -> trade_short_message_record.price_short[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.execution_id[trade_short_message_at] = trade_short_message_value; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Short Message set to where it lies, so a field read out of place says so */
inline ramp_trade_short_message(trade_short_message_record, trade_short_message_base) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.order_id[trade_short_message_at] = (trade_short_message_base + 0 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = (trade_short_message_base + 12 + 1) % 256;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.shares_short[trade_short_message_at] = (trade_short_message_base + 13 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.stock_symbol_short[trade_short_message_at] = (trade_short_message_base + 19 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 10 -> trade_short_message_record.price_short[trade_short_message_at] = (trade_short_message_base + 25 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.execution_id[trade_short_message_at] = (trade_short_message_base + 35 + trade_short_message_at + 1) % 256; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Short Message to the wire, 47 bytes from where the cursor stands */
inline encode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> wire[at] = trade_short_message_record.order_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_short_message_record.side_indicator; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.shares_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> wire[at] = trade_short_message_record.stock_symbol_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 10 -> wire[at] = trade_short_message_record.price_short[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> wire[at] = trade_short_message_record.execution_id[trade_short_message_at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Short Message off the wire, 47 bytes from where the cursor stands */
inline decode_trade_short_message(trade_short_message_record) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.order_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_record.side_indicator = wire[at]; at = at + 1;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.shares_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> trade_short_message_record.stock_symbol_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 10 -> trade_short_message_record.price_short[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> trade_short_message_record.execution_id[trade_short_message_at] = wire[at]; at = at + 1; trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Short Message is what was written, byte for byte */
inline equal_trade_short_message(trade_short_message_read, trade_short_message_written) {
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> assert(trade_short_message_read.order_id[trade_short_message_at] == trade_short_message_written.order_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  assert(trade_short_message_read.side_indicator == trade_short_message_written.side_indicator);
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.shares_short[trade_short_message_at] == trade_short_message_written.shares_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 6 -> assert(trade_short_message_read.stock_symbol_short[trade_short_message_at] == trade_short_message_written.stock_symbol_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 10 -> assert(trade_short_message_read.price_short[trade_short_message_at] == trade_short_message_written.price_short[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  trade_short_message_at = 0;
  do
  :: trade_short_message_at < 12 -> assert(trade_short_message_read.execution_id[trade_short_message_at] == trade_short_message_written.execution_id[trade_short_message_at]); trade_short_message_at = trade_short_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Long Message: 49 bytes -------------------------------------------- */

/* The long version of the Trade message accommodates larger symbol sizes possible through the ISRA plan. */
typedef TradeLongMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_long[8];
  byte price_short[10];
  byte execution_id[12]
};

int trade_long_message_at;

/* every byte of Trade Long Message set to one value */
inline fill_trade_long_message(trade_long_message_record, trade_long_message_value) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.order_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = trade_long_message_value;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.shares_short[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.stock_symbol_long[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 10 -> trade_long_message_record.price_short[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.execution_id[trade_long_message_at] = trade_long_message_value; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Long Message set to where it lies, so a field read out of place says so */
inline ramp_trade_long_message(trade_long_message_record, trade_long_message_base) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.order_id[trade_long_message_at] = (trade_long_message_base + 0 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = (trade_long_message_base + 12 + 1) % 256;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.shares_short[trade_long_message_at] = (trade_long_message_base + 13 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.stock_symbol_long[trade_long_message_at] = (trade_long_message_base + 19 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 10 -> trade_long_message_record.price_short[trade_long_message_at] = (trade_long_message_base + 27 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.execution_id[trade_long_message_at] = (trade_long_message_base + 37 + trade_long_message_at + 1) % 256; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Long Message to the wire, 49 bytes from where the cursor stands */
inline encode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> wire[at] = trade_long_message_record.order_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_long_message_record.side_indicator; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> wire[at] = trade_long_message_record.shares_short[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> wire[at] = trade_long_message_record.stock_symbol_long[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 10 -> wire[at] = trade_long_message_record.price_short[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> wire[at] = trade_long_message_record.execution_id[trade_long_message_at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Long Message off the wire, 49 bytes from where the cursor stands */
inline decode_trade_long_message(trade_long_message_record) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.order_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_record.side_indicator = wire[at]; at = at + 1;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> trade_long_message_record.shares_short[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> trade_long_message_record.stock_symbol_long[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 10 -> trade_long_message_record.price_short[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> trade_long_message_record.execution_id[trade_long_message_at] = wire[at]; at = at + 1; trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Long Message is what was written, byte for byte */
inline equal_trade_long_message(trade_long_message_read, trade_long_message_written) {
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> assert(trade_long_message_read.order_id[trade_long_message_at] == trade_long_message_written.order_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  assert(trade_long_message_read.side_indicator == trade_long_message_written.side_indicator);
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 6 -> assert(trade_long_message_read.shares_short[trade_long_message_at] == trade_long_message_written.shares_short[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 8 -> assert(trade_long_message_read.stock_symbol_long[trade_long_message_at] == trade_long_message_written.stock_symbol_long[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 10 -> assert(trade_long_message_read.price_short[trade_long_message_at] == trade_long_message_written.price_short[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  trade_long_message_at = 0;
  do
  :: trade_long_message_at < 12 -> assert(trade_long_message_read.execution_id[trade_long_message_at] == trade_long_message_written.execution_id[trade_long_message_at]); trade_long_message_at = trade_long_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Extended Message: 53 bytes ---------------------------------------- */

/* The extended version of the Trade message accommodates larger prices. */
typedef TradeExtendedMessage {
  byte order_id[12];
  byte side_indicator;
  byte shares_short[6];
  byte stock_symbol_long[8];
  byte price_long[14];
  byte execution_id[12]
};

int trade_extended_message_at;

/* every byte of Trade Extended Message set to one value */
inline fill_trade_extended_message(trade_extended_message_record, trade_extended_message_value) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.order_id[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.side_indicator = trade_extended_message_value;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.shares_short[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.stock_symbol_long[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 14 -> trade_extended_message_record.price_long[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.execution_id[trade_extended_message_at] = trade_extended_message_value; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Extended Message set to where it lies, so a field read out of place says so */
inline ramp_trade_extended_message(trade_extended_message_record, trade_extended_message_base) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.order_id[trade_extended_message_at] = (trade_extended_message_base + 0 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.side_indicator = (trade_extended_message_base + 12 + 1) % 256;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.shares_short[trade_extended_message_at] = (trade_extended_message_base + 13 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.stock_symbol_long[trade_extended_message_at] = (trade_extended_message_base + 19 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 14 -> trade_extended_message_record.price_long[trade_extended_message_at] = (trade_extended_message_base + 27 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.execution_id[trade_extended_message_at] = (trade_extended_message_base + 41 + trade_extended_message_at + 1) % 256; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Extended Message to the wire, 53 bytes from where the cursor stands */
inline encode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> wire[at] = trade_extended_message_record.order_id[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  wire[at] = trade_extended_message_record.side_indicator; at = at + 1;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> wire[at] = trade_extended_message_record.shares_short[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> wire[at] = trade_extended_message_record.stock_symbol_long[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 14 -> wire[at] = trade_extended_message_record.price_long[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> wire[at] = trade_extended_message_record.execution_id[trade_extended_message_at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Extended Message off the wire, 53 bytes from where the cursor stands */
inline decode_trade_extended_message(trade_extended_message_record) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.order_id[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_record.side_indicator = wire[at]; at = at + 1;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> trade_extended_message_record.shares_short[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> trade_extended_message_record.stock_symbol_long[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 14 -> trade_extended_message_record.price_long[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> trade_extended_message_record.execution_id[trade_extended_message_at] = wire[at]; at = at + 1; trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Extended Message is what was written, byte for byte */
inline equal_trade_extended_message(trade_extended_message_read, trade_extended_message_written) {
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> assert(trade_extended_message_read.order_id[trade_extended_message_at] == trade_extended_message_written.order_id[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  assert(trade_extended_message_read.side_indicator == trade_extended_message_written.side_indicator);
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 6 -> assert(trade_extended_message_read.shares_short[trade_extended_message_at] == trade_extended_message_written.shares_short[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 8 -> assert(trade_extended_message_read.stock_symbol_long[trade_extended_message_at] == trade_extended_message_written.stock_symbol_long[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 14 -> assert(trade_extended_message_read.price_long[trade_extended_message_at] == trade_extended_message_written.price_long[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  trade_extended_message_at = 0;
  do
  :: trade_extended_message_at < 12 -> assert(trade_extended_message_read.execution_id[trade_extended_message_at] == trade_extended_message_written.execution_id[trade_extended_message_at]); trade_extended_message_at = trade_extended_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trade Break Message: 12 bytes ------------------------------------------- */

/* The Trade Break message is sent whenever an execution on Cboe is broken. */
typedef TradeBreakMessage {
  byte execution_id[12]
};

int trade_break_message_at;

/* every byte of Trade Break Message set to one value */
inline fill_trade_break_message(trade_break_message_record, trade_break_message_value) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 12 -> trade_break_message_record.execution_id[trade_break_message_at] = trade_break_message_value; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Trade Break Message set to where it lies, so a field read out of place says so */
inline ramp_trade_break_message(trade_break_message_record, trade_break_message_base) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 12 -> trade_break_message_record.execution_id[trade_break_message_at] = (trade_break_message_base + 0 + trade_break_message_at + 1) % 256; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message to the wire, 12 bytes from where the cursor stands */
inline encode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 12 -> wire[at] = trade_break_message_record.execution_id[trade_break_message_at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* Trade Break Message off the wire, 12 bytes from where the cursor stands */
inline decode_trade_break_message(trade_break_message_record) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 12 -> trade_break_message_record.execution_id[trade_break_message_at] = wire[at]; at = at + 1; trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Trade Break Message is what was written, byte for byte */
inline equal_trade_break_message(trade_break_message_read, trade_break_message_written) {
  trade_break_message_at = 0;
  do
  :: trade_break_message_at < 12 -> assert(trade_break_message_read.execution_id[trade_break_message_at] == trade_break_message_written.execution_id[trade_break_message_at]); trade_break_message_at = trade_break_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Message: 12 bytes ---------------------------------------- */

/* The Trading Status message is used to indicate the current trading status of a security. */
typedef TradingStatusMessage {
  byte stock_symbol_long[8];
  byte halt_status;
  byte reg_sho_action;
  byte reserved_1;
  byte reserved_2
};

int trading_status_message_at;

/* every byte of Trading Status Message set to one value */
inline fill_trading_status_message(trading_status_message_record, trading_status_message_value) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.stock_symbol_long[trading_status_message_at] = trading_status_message_value; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = trading_status_message_value;
  trading_status_message_record.reg_sho_action = trading_status_message_value;
  trading_status_message_record.reserved_1 = trading_status_message_value;
  trading_status_message_record.reserved_2 = trading_status_message_value;
  skip
}

/* each byte of Trading Status Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_message(trading_status_message_record, trading_status_message_base) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.stock_symbol_long[trading_status_message_at] = (trading_status_message_base + 0 + trading_status_message_at + 1) % 256; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = (trading_status_message_base + 8 + 1) % 256;
  trading_status_message_record.reg_sho_action = (trading_status_message_base + 9 + 1) % 256;
  trading_status_message_record.reserved_1 = (trading_status_message_base + 10 + 1) % 256;
  trading_status_message_record.reserved_2 = (trading_status_message_base + 11 + 1) % 256;
  skip
}

/* Trading Status Message to the wire, 12 bytes from where the cursor stands */
inline encode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> wire[at] = trading_status_message_record.stock_symbol_long[trading_status_message_at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_message_record.halt_status; at = at + 1;
  wire[at] = trading_status_message_record.reg_sho_action; at = at + 1;
  wire[at] = trading_status_message_record.reserved_1; at = at + 1;
  wire[at] = trading_status_message_record.reserved_2; at = at + 1;
  skip
}

/* Trading Status Message off the wire, 12 bytes from where the cursor stands */
inline decode_trading_status_message(trading_status_message_record) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> trading_status_message_record.stock_symbol_long[trading_status_message_at] = wire[at]; at = at + 1; trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  trading_status_message_record.halt_status = wire[at]; at = at + 1;
  trading_status_message_record.reg_sho_action = wire[at]; at = at + 1;
  trading_status_message_record.reserved_1 = wire[at]; at = at + 1;
  trading_status_message_record.reserved_2 = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Message is what was written, byte for byte */
inline equal_trading_status_message(trading_status_message_read, trading_status_message_written) {
  trading_status_message_at = 0;
  do
  :: trading_status_message_at < 8 -> assert(trading_status_message_read.stock_symbol_long[trading_status_message_at] == trading_status_message_written.stock_symbol_long[trading_status_message_at]); trading_status_message_at = trading_status_message_at + 1
  :: else -> break
  od;
  assert(trading_status_message_read.halt_status == trading_status_message_written.halt_status);
  assert(trading_status_message_read.reg_sho_action == trading_status_message_written.reg_sho_action);
  assert(trading_status_message_read.reserved_1 == trading_status_message_written.reserved_1);
  assert(trading_status_message_read.reserved_2 == trading_status_message_written.reserved_2);
  skip
}

/* ---- Auction Update Message: 59 bytes ---------------------------------------- */

/* Auction Update messages are used to disseminate Cboe price and size information during auctions for Cboe listed securities on BZX, and for Periodic Auctions on BYX. */
typedef AuctionUpdateMessage {
  byte stock_symbol_long[8];
  byte auction_type;
  byte reference_price_short[10];
  byte buy_shares[10];
  byte sell_shares[10];
  byte indicative_price_short[10];
  byte auction_only_price_short[10]
};

int auction_update_message_at;

/* every byte of Auction Update Message set to one value */
inline fill_auction_update_message(auction_update_message_record, auction_update_message_value) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol_long[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = auction_update_message_value;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.reference_price_short[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.buy_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.sell_shares[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_price_short[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.auction_only_price_short[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_auction_update_message(auction_update_message_record, auction_update_message_base) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol_long[auction_update_message_at] = (auction_update_message_base + 0 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = (auction_update_message_base + 8 + 1) % 256;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.reference_price_short[auction_update_message_at] = (auction_update_message_base + 9 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.buy_shares[auction_update_message_at] = (auction_update_message_base + 19 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.sell_shares[auction_update_message_at] = (auction_update_message_base + 29 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_price_short[auction_update_message_at] = (auction_update_message_base + 39 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.auction_only_price_short[auction_update_message_at] = (auction_update_message_base + 49 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Update Message to the wire, 59 bytes from where the cursor stands */
inline encode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.stock_symbol_long[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_update_message_record.auction_type; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.reference_price_short[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.buy_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.sell_shares[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.indicative_price_short[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> wire[at] = auction_update_message_record.auction_only_price_short[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Update Message off the wire, 59 bytes from where the cursor stands */
inline decode_auction_update_message(auction_update_message_record) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol_long[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_record.auction_type = wire[at]; at = at + 1;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.reference_price_short[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.buy_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.sell_shares[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.indicative_price_short[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> auction_update_message_record.auction_only_price_short[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Update Message is what was written, byte for byte */
inline equal_auction_update_message(auction_update_message_read, auction_update_message_written) {
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.stock_symbol_long[auction_update_message_at] == auction_update_message_written.stock_symbol_long[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  assert(auction_update_message_read.auction_type == auction_update_message_written.auction_type);
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.reference_price_short[auction_update_message_at] == auction_update_message_written.reference_price_short[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.buy_shares[auction_update_message_at] == auction_update_message_written.buy_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.sell_shares[auction_update_message_at] == auction_update_message_written.sell_shares[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.indicative_price_short[auction_update_message_at] == auction_update_message_written.indicative_price_short[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  auction_update_message_at = 0;
  do
  :: auction_update_message_at < 10 -> assert(auction_update_message_read.auction_only_price_short[auction_update_message_at] == auction_update_message_written.auction_only_price_short[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Auction Update Message: 71 bytes ------------------------------- */

/* The extended version of the BZX Auction Update message accommodates larger prices. */
typedef ExtendedAuctionUpdateMessage {
  byte stock_symbol_long[8];
  byte auction_type;
  byte reference_price_long[14];
  byte buy_shares[10];
  byte sell_shares[10];
  byte indicative_price_long[14];
  byte auction_only_price_long[14]
};

int extended_auction_update_message_at;

/* every byte of Extended Auction Update Message set to one value */
inline fill_extended_auction_update_message(extended_auction_update_message_record, extended_auction_update_message_value) {
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol_long[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_record.auction_type = extended_auction_update_message_value;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.reference_price_long[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.buy_shares[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.sell_shares[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.indicative_price_long[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.auction_only_price_long[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Auction Update Message set to where it lies, so a field read out of place says so */
inline ramp_extended_auction_update_message(extended_auction_update_message_record, extended_auction_update_message_base) {
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol_long[extended_auction_update_message_at] = (extended_auction_update_message_base + 0 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_record.auction_type = (extended_auction_update_message_base + 8 + 1) % 256;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.reference_price_long[extended_auction_update_message_at] = (extended_auction_update_message_base + 9 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.buy_shares[extended_auction_update_message_at] = (extended_auction_update_message_base + 23 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.sell_shares[extended_auction_update_message_at] = (extended_auction_update_message_base + 33 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.indicative_price_long[extended_auction_update_message_at] = (extended_auction_update_message_base + 43 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.auction_only_price_long[extended_auction_update_message_at] = (extended_auction_update_message_base + 57 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Update Message to the wire, 71 bytes from where the cursor stands */
inline encode_extended_auction_update_message(extended_auction_update_message_record) {
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 8 -> wire[at] = extended_auction_update_message_record.stock_symbol_long[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_auction_update_message_record.auction_type; at = at + 1;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> wire[at] = extended_auction_update_message_record.reference_price_long[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> wire[at] = extended_auction_update_message_record.buy_shares[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> wire[at] = extended_auction_update_message_record.sell_shares[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> wire[at] = extended_auction_update_message_record.indicative_price_long[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> wire[at] = extended_auction_update_message_record.auction_only_price_long[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Update Message off the wire, 71 bytes from where the cursor stands */
inline decode_extended_auction_update_message(extended_auction_update_message_record) {
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol_long[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_record.auction_type = wire[at]; at = at + 1;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.reference_price_long[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.buy_shares[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> extended_auction_update_message_record.sell_shares[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.indicative_price_long[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> extended_auction_update_message_record.auction_only_price_long[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Auction Update Message is what was written, byte for byte */
inline equal_extended_auction_update_message(extended_auction_update_message_read, extended_auction_update_message_written) {
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 8 -> assert(extended_auction_update_message_read.stock_symbol_long[extended_auction_update_message_at] == extended_auction_update_message_written.stock_symbol_long[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  assert(extended_auction_update_message_read.auction_type == extended_auction_update_message_written.auction_type);
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> assert(extended_auction_update_message_read.reference_price_long[extended_auction_update_message_at] == extended_auction_update_message_written.reference_price_long[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> assert(extended_auction_update_message_read.buy_shares[extended_auction_update_message_at] == extended_auction_update_message_written.buy_shares[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 10 -> assert(extended_auction_update_message_read.sell_shares[extended_auction_update_message_at] == extended_auction_update_message_written.sell_shares[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> assert(extended_auction_update_message_read.indicative_price_long[extended_auction_update_message_at] == extended_auction_update_message_written.indicative_price_long[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  extended_auction_update_message_at = 0;
  do
  :: extended_auction_update_message_at < 14 -> assert(extended_auction_update_message_read.auction_only_price_long[extended_auction_update_message_at] == extended_auction_update_message_written.auction_only_price_long[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Auction Summary Message: 29 bytes --------------------------------------- */

/* Auction Summary messages are used to disseminate the results of an auction of a Cboe listed security on BZX, and for Periodic Auctions on BYX. */
typedef AuctionSummaryMessage {
  byte stock_symbol_long[8];
  byte auction_type;
  byte price_short[10];
  byte shares_long[10]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol_long[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = auction_summary_message_value;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.price_short[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol_long[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = (auction_summary_message_base + 8 + 1) % 256;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.price_short[auction_summary_message_at] = (auction_summary_message_base + 9 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares_long[auction_summary_message_at] = (auction_summary_message_base + 19 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 29 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.stock_symbol_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = auction_summary_message_record.auction_type; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> wire[at] = auction_summary_message_record.price_short[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> wire[at] = auction_summary_message_record.shares_long[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 29 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol_long[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> auction_summary_message_record.price_short[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.stock_symbol_long[auction_summary_message_at] == auction_summary_message_written.stock_symbol_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  assert(auction_summary_message_read.auction_type == auction_summary_message_written.auction_type);
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> assert(auction_summary_message_read.price_short[auction_summary_message_at] == auction_summary_message_written.price_short[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 10 -> assert(auction_summary_message_read.shares_long[auction_summary_message_at] == auction_summary_message_written.shares_long[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Auction Summary Message: 33 bytes ------------------------------ */

/* The extended version of the Auction Summary message accommodates larger prices. */
typedef ExtendedAuctionSummaryMessage {
  byte stock_symbol_long[8];
  byte auction_type;
  byte price_long[14];
  byte shares_long[10]
};

int extended_auction_summary_message_at;

/* every byte of Extended Auction Summary Message set to one value */
inline fill_extended_auction_summary_message(extended_auction_summary_message_record, extended_auction_summary_message_value) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol_long[extended_auction_summary_message_at] = extended_auction_summary_message_value; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_record.auction_type = extended_auction_summary_message_value;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 14 -> extended_auction_summary_message_record.price_long[extended_auction_summary_message_at] = extended_auction_summary_message_value; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares_long[extended_auction_summary_message_at] = extended_auction_summary_message_value; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_extended_auction_summary_message(extended_auction_summary_message_record, extended_auction_summary_message_base) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol_long[extended_auction_summary_message_at] = (extended_auction_summary_message_base + 0 + extended_auction_summary_message_at + 1) % 256; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_record.auction_type = (extended_auction_summary_message_base + 8 + 1) % 256;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 14 -> extended_auction_summary_message_record.price_long[extended_auction_summary_message_at] = (extended_auction_summary_message_base + 9 + extended_auction_summary_message_at + 1) % 256; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares_long[extended_auction_summary_message_at] = (extended_auction_summary_message_base + 23 + extended_auction_summary_message_at + 1) % 256; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Summary Message to the wire, 33 bytes from where the cursor stands */
inline encode_extended_auction_summary_message(extended_auction_summary_message_record) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> wire[at] = extended_auction_summary_message_record.stock_symbol_long[extended_auction_summary_message_at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  wire[at] = extended_auction_summary_message_record.auction_type; at = at + 1;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 14 -> wire[at] = extended_auction_summary_message_record.price_long[extended_auction_summary_message_at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 10 -> wire[at] = extended_auction_summary_message_record.shares_long[extended_auction_summary_message_at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Summary Message off the wire, 33 bytes from where the cursor stands */
inline decode_extended_auction_summary_message(extended_auction_summary_message_record) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol_long[extended_auction_summary_message_at] = wire[at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_record.auction_type = wire[at]; at = at + 1;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 14 -> extended_auction_summary_message_record.price_long[extended_auction_summary_message_at] = wire[at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares_long[extended_auction_summary_message_at] = wire[at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Auction Summary Message is what was written, byte for byte */
inline equal_extended_auction_summary_message(extended_auction_summary_message_read, extended_auction_summary_message_written) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> assert(extended_auction_summary_message_read.stock_symbol_long[extended_auction_summary_message_at] == extended_auction_summary_message_written.stock_symbol_long[extended_auction_summary_message_at]); extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  assert(extended_auction_summary_message_read.auction_type == extended_auction_summary_message_written.auction_type);
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 14 -> assert(extended_auction_summary_message_read.price_long[extended_auction_summary_message_at] == extended_auction_summary_message_written.price_long[extended_auction_summary_message_at]); extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 10 -> assert(extended_auction_summary_message_read.shares_long[extended_auction_summary_message_at] == extended_auction_summary_message_written.shares_long[extended_auction_summary_message_at]); extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retail Price Improvement Message: 9 bytes ------------------------------- */

/* The Retail Price Improvement message is only available on the BYX and EDGX Exchanges. This message is a Retail Liquidity Indicator (RLI) that includes symbol and side, but not price and size. */
typedef RetailPriceImprovementMessage {
  byte stock_symbol_long[8];
  byte retail_price_improvement
};

int retail_price_improvement_message_at;

/* every byte of Retail Price Improvement Message set to one value */
inline fill_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_value) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock_symbol_long[retail_price_improvement_message_at] = retail_price_improvement_message_value; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.retail_price_improvement = retail_price_improvement_message_value;
  skip
}

/* each byte of Retail Price Improvement Message set to where it lies, so a field read out of place says so */
inline ramp_retail_price_improvement_message(retail_price_improvement_message_record, retail_price_improvement_message_base) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock_symbol_long[retail_price_improvement_message_at] = (retail_price_improvement_message_base + 0 + retail_price_improvement_message_at + 1) % 256; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.retail_price_improvement = (retail_price_improvement_message_base + 8 + 1) % 256;
  skip
}

/* Retail Price Improvement Message to the wire, 9 bytes from where the cursor stands */
inline encode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> wire[at] = retail_price_improvement_message_record.stock_symbol_long[retail_price_improvement_message_at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  wire[at] = retail_price_improvement_message_record.retail_price_improvement; at = at + 1;
  skip
}

/* Retail Price Improvement Message off the wire, 9 bytes from where the cursor stands */
inline decode_retail_price_improvement_message(retail_price_improvement_message_record) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> retail_price_improvement_message_record.stock_symbol_long[retail_price_improvement_message_at] = wire[at]; at = at + 1; retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  retail_price_improvement_message_record.retail_price_improvement = wire[at]; at = at + 1;
  skip
}

/* what was read of Retail Price Improvement Message is what was written, byte for byte */
inline equal_retail_price_improvement_message(retail_price_improvement_message_read, retail_price_improvement_message_written) {
  retail_price_improvement_message_at = 0;
  do
  :: retail_price_improvement_message_at < 8 -> assert(retail_price_improvement_message_read.stock_symbol_long[retail_price_improvement_message_at] == retail_price_improvement_message_written.stock_symbol_long[retail_price_improvement_message_at]); retail_price_improvement_message_at = retail_price_improvement_message_at + 1
  :: else -> break
  od;
  assert(retail_price_improvement_message_read.retail_price_improvement == retail_price_improvement_message_written.retail_price_improvement);
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
    assert(at == 9);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 9);
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

/* Add Order Short Message: encoded, read back, and compared */
proctype check_add_order_short_message() {
  AddOrderShortMessage add_order_short_message_sent;
  AddOrderShortMessage add_order_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_short_message(add_order_short_message_sent, 0)
  :: pattern == 1 -> fill_add_order_short_message(add_order_short_message_sent, 32)
  :: pattern == 2 -> fill_add_order_short_message(add_order_short_message_sent, 255)
  :: else -> ramp_add_order_short_message(add_order_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_short_message(add_order_short_message_sent);
    assert(at == 36);
    at = 0;
    decode_add_order_short_message(add_order_short_message_got);
    assert(at == 36);
    equal_add_order_short_message(add_order_short_message_got, add_order_short_message_sent)
  }
}

/* Add Order Long Message: encoded, read back, and compared */
proctype check_add_order_long_message() {
  AddOrderLongMessage add_order_long_message_sent;
  AddOrderLongMessage add_order_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_long_message(add_order_long_message_sent, 0)
  :: pattern == 1 -> fill_add_order_long_message(add_order_long_message_sent, 32)
  :: pattern == 2 -> fill_add_order_long_message(add_order_long_message_sent, 255)
  :: else -> ramp_add_order_long_message(add_order_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_long_message(add_order_long_message_sent);
    assert(at == 43);
    at = 0;
    decode_add_order_long_message(add_order_long_message_got);
    assert(at == 43);
    equal_add_order_long_message(add_order_long_message_got, add_order_long_message_sent)
  }
}

/* Add Order Extended Message: encoded, read back, and compared */
proctype check_add_order_extended_message() {
  AddOrderExtendedMessage add_order_extended_message_sent;
  AddOrderExtendedMessage add_order_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_add_order_extended_message(add_order_extended_message_sent, 0)
  :: pattern == 1 -> fill_add_order_extended_message(add_order_extended_message_sent, 32)
  :: pattern == 2 -> fill_add_order_extended_message(add_order_extended_message_sent, 255)
  :: else -> ramp_add_order_extended_message(add_order_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_add_order_extended_message(add_order_extended_message_sent);
    assert(at == 47);
    at = 0;
    decode_add_order_extended_message(add_order_extended_message_got);
    assert(at == 47);
    equal_add_order_extended_message(add_order_extended_message_got, add_order_extended_message_sent)
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
    assert(at == 30);
    at = 0;
    decode_order_executed_message(order_executed_message_got);
    assert(at == 30);
    equal_order_executed_message(order_executed_message_got, order_executed_message_sent)
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
    assert(at == 28);
    at = 0;
    decode_time_reference_message(time_reference_message_got);
    assert(at == 28);
    equal_time_reference_message(time_reference_message_got, time_reference_message_sent)
  }
}

/* Trade Short Message: encoded, read back, and compared */
proctype check_trade_short_message() {
  TradeShortMessage trade_short_message_sent;
  TradeShortMessage trade_short_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_short_message(trade_short_message_sent, 0)
  :: pattern == 1 -> fill_trade_short_message(trade_short_message_sent, 32)
  :: pattern == 2 -> fill_trade_short_message(trade_short_message_sent, 255)
  :: else -> ramp_trade_short_message(trade_short_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_short_message(trade_short_message_sent);
    assert(at == 47);
    at = 0;
    decode_trade_short_message(trade_short_message_got);
    assert(at == 47);
    equal_trade_short_message(trade_short_message_got, trade_short_message_sent)
  }
}

/* Trade Long Message: encoded, read back, and compared */
proctype check_trade_long_message() {
  TradeLongMessage trade_long_message_sent;
  TradeLongMessage trade_long_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_long_message(trade_long_message_sent, 0)
  :: pattern == 1 -> fill_trade_long_message(trade_long_message_sent, 32)
  :: pattern == 2 -> fill_trade_long_message(trade_long_message_sent, 255)
  :: else -> ramp_trade_long_message(trade_long_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_long_message(trade_long_message_sent);
    assert(at == 49);
    at = 0;
    decode_trade_long_message(trade_long_message_got);
    assert(at == 49);
    equal_trade_long_message(trade_long_message_got, trade_long_message_sent)
  }
}

/* Trade Extended Message: encoded, read back, and compared */
proctype check_trade_extended_message() {
  TradeExtendedMessage trade_extended_message_sent;
  TradeExtendedMessage trade_extended_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_extended_message(trade_extended_message_sent, 0)
  :: pattern == 1 -> fill_trade_extended_message(trade_extended_message_sent, 32)
  :: pattern == 2 -> fill_trade_extended_message(trade_extended_message_sent, 255)
  :: else -> ramp_trade_extended_message(trade_extended_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_extended_message(trade_extended_message_sent);
    assert(at == 53);
    at = 0;
    decode_trade_extended_message(trade_extended_message_got);
    assert(at == 53);
    equal_trade_extended_message(trade_extended_message_got, trade_extended_message_sent)
  }
}

/* Trade Break Message: encoded, read back, and compared */
proctype check_trade_break_message() {
  TradeBreakMessage trade_break_message_sent;
  TradeBreakMessage trade_break_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trade_break_message(trade_break_message_sent, 0)
  :: pattern == 1 -> fill_trade_break_message(trade_break_message_sent, 32)
  :: pattern == 2 -> fill_trade_break_message(trade_break_message_sent, 255)
  :: else -> ramp_trade_break_message(trade_break_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trade_break_message(trade_break_message_sent);
    assert(at == 12);
    at = 0;
    decode_trade_break_message(trade_break_message_got);
    assert(at == 12);
    equal_trade_break_message(trade_break_message_got, trade_break_message_sent)
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

/* Extended Auction Update Message: encoded, read back, and compared */
proctype check_extended_auction_update_message() {
  ExtendedAuctionUpdateMessage extended_auction_update_message_sent;
  ExtendedAuctionUpdateMessage extended_auction_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_auction_update_message(extended_auction_update_message_sent, 0)
  :: pattern == 1 -> fill_extended_auction_update_message(extended_auction_update_message_sent, 32)
  :: pattern == 2 -> fill_extended_auction_update_message(extended_auction_update_message_sent, 255)
  :: else -> ramp_extended_auction_update_message(extended_auction_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_auction_update_message(extended_auction_update_message_sent);
    assert(at == 71);
    at = 0;
    decode_extended_auction_update_message(extended_auction_update_message_got);
    assert(at == 71);
    equal_extended_auction_update_message(extended_auction_update_message_got, extended_auction_update_message_sent)
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
    assert(at == 29);
    at = 0;
    decode_auction_summary_message(auction_summary_message_got);
    assert(at == 29);
    equal_auction_summary_message(auction_summary_message_got, auction_summary_message_sent)
  }
}

/* Extended Auction Summary Message: encoded, read back, and compared */
proctype check_extended_auction_summary_message() {
  ExtendedAuctionSummaryMessage extended_auction_summary_message_sent;
  ExtendedAuctionSummaryMessage extended_auction_summary_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_extended_auction_summary_message(extended_auction_summary_message_sent, 0)
  :: pattern == 1 -> fill_extended_auction_summary_message(extended_auction_summary_message_sent, 32)
  :: pattern == 2 -> fill_extended_auction_summary_message(extended_auction_summary_message_sent, 255)
  :: else -> ramp_extended_auction_summary_message(extended_auction_summary_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_extended_auction_summary_message(extended_auction_summary_message_sent);
    assert(at == 33);
    at = 0;
    decode_extended_auction_summary_message(extended_auction_summary_message_got);
    assert(at == 33);
    equal_extended_auction_summary_message(extended_auction_summary_message_got, extended_auction_summary_message_sent)
  }
}

/* Retail Price Improvement Message: encoded, read back, and compared */
proctype check_retail_price_improvement_message() {
  RetailPriceImprovementMessage retail_price_improvement_message_sent;
  RetailPriceImprovementMessage retail_price_improvement_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  :: pattern == 1 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 32)
  :: pattern == 2 -> fill_retail_price_improvement_message(retail_price_improvement_message_sent, 255)
  :: else -> ramp_retail_price_improvement_message(retail_price_improvement_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retail_price_improvement_message(retail_price_improvement_message_sent);
    assert(at == 9);
    at = 0;
    decode_retail_price_improvement_message(retail_price_improvement_message_got);
    assert(at == 9);
    equal_retail_price_improvement_message(retail_price_improvement_message_got, retail_price_improvement_message_sent)
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
  :: run check_add_order_short_message()
  :: run check_add_order_long_message()
  :: run check_add_order_extended_message()
  :: run check_order_executed_message()
  :: run check_order_cancel_message()
  :: run check_time_reference_message()
  :: run check_trade_short_message()
  :: run check_trade_long_message()
  :: run check_trade_extended_message()
  :: run check_trade_break_message()
  :: run check_trading_status_message()
  :: run check_auction_update_message()
  :: run check_extended_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_extended_auction_summary_message()
  :: run check_retail_price_improvement_message()
  :: run check_login_request_packet()
  fi
}
