/*
 * Chicago Board Options Exchange Auction Feed
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

/* ---- Auction Update Message: 59 bytes ---------------------------------------- */

/* Auction Update messages disseminate Cboe price and size information during auctions for Cboe listed securities and for CMC. */
typedef AuctionUpdateMessage {
  byte stock_symbol[8];
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
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol[auction_update_message_at] = auction_update_message_value; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol[auction_update_message_at] = (auction_update_message_base + 0 + auction_update_message_at + 1) % 256; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> wire[at] = auction_update_message_record.stock_symbol[auction_update_message_at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> auction_update_message_record.stock_symbol[auction_update_message_at] = wire[at]; at = at + 1; auction_update_message_at = auction_update_message_at + 1
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
  :: auction_update_message_at < 8 -> assert(auction_update_message_read.stock_symbol[auction_update_message_at] == auction_update_message_written.stock_symbol[auction_update_message_at]); auction_update_message_at = auction_update_message_at + 1
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

/* The extended version of the Auction Update message accommodates larger prices. */
typedef ExtendedAuctionUpdateMessage {
  byte stock_symbol[8];
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
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol[extended_auction_update_message_at] = extended_auction_update_message_value; extended_auction_update_message_at = extended_auction_update_message_at + 1
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
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol[extended_auction_update_message_at] = (extended_auction_update_message_base + 0 + extended_auction_update_message_at + 1) % 256; extended_auction_update_message_at = extended_auction_update_message_at + 1
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
  :: extended_auction_update_message_at < 8 -> wire[at] = extended_auction_update_message_record.stock_symbol[extended_auction_update_message_at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
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
  :: extended_auction_update_message_at < 8 -> extended_auction_update_message_record.stock_symbol[extended_auction_update_message_at] = wire[at]; at = at + 1; extended_auction_update_message_at = extended_auction_update_message_at + 1
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
  :: extended_auction_update_message_at < 8 -> assert(extended_auction_update_message_read.stock_symbol[extended_auction_update_message_at] == extended_auction_update_message_written.stock_symbol[extended_auction_update_message_at]); extended_auction_update_message_at = extended_auction_update_message_at + 1
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

/* Auction Summary messages disseminate the results of a Cboe listed security auction and for Cboe Market Close. */
typedef AuctionSummaryMessage {
  byte stock_symbol[8];
  byte auction_type;
  byte price_short[10];
  byte shares[10]
};

int auction_summary_message_at;

/* every byte of Auction Summary Message set to one value */
inline fill_auction_summary_message(auction_summary_message_record, auction_summary_message_value) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares[auction_summary_message_at] = auction_summary_message_value; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_auction_summary_message(auction_summary_message_record, auction_summary_message_base) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = (auction_summary_message_base + 0 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares[auction_summary_message_at] = (auction_summary_message_base + 19 + auction_summary_message_at + 1) % 256; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message to the wire, 29 bytes from where the cursor stands */
inline encode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> wire[at] = auction_summary_message_record.stock_symbol[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 10 -> wire[at] = auction_summary_message_record.shares[auction_summary_message_at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Auction Summary Message off the wire, 29 bytes from where the cursor stands */
inline decode_auction_summary_message(auction_summary_message_record) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> auction_summary_message_record.stock_symbol[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 10 -> auction_summary_message_record.shares[auction_summary_message_at] = wire[at]; at = at + 1; auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Auction Summary Message is what was written, byte for byte */
inline equal_auction_summary_message(auction_summary_message_read, auction_summary_message_written) {
  auction_summary_message_at = 0;
  do
  :: auction_summary_message_at < 8 -> assert(auction_summary_message_read.stock_symbol[auction_summary_message_at] == auction_summary_message_written.stock_symbol[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
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
  :: auction_summary_message_at < 10 -> assert(auction_summary_message_read.shares[auction_summary_message_at] == auction_summary_message_written.shares[auction_summary_message_at]); auction_summary_message_at = auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Extended Auction Summary Message: 33 bytes ------------------------------ */

/* The extended version of the Auction Summary message accommodates larger prices. */
typedef ExtendedAuctionSummaryMessage {
  byte stock_symbol[8];
  byte auction_type;
  byte price_long[14];
  byte shares[10]
};

int extended_auction_summary_message_at;

/* every byte of Extended Auction Summary Message set to one value */
inline fill_extended_auction_summary_message(extended_auction_summary_message_record, extended_auction_summary_message_value) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol[extended_auction_summary_message_at] = extended_auction_summary_message_value; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares[extended_auction_summary_message_at] = extended_auction_summary_message_value; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Extended Auction Summary Message set to where it lies, so a field read out of place says so */
inline ramp_extended_auction_summary_message(extended_auction_summary_message_record, extended_auction_summary_message_base) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol[extended_auction_summary_message_at] = (extended_auction_summary_message_base + 0 + extended_auction_summary_message_at + 1) % 256; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares[extended_auction_summary_message_at] = (extended_auction_summary_message_base + 23 + extended_auction_summary_message_at + 1) % 256; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Summary Message to the wire, 33 bytes from where the cursor stands */
inline encode_extended_auction_summary_message(extended_auction_summary_message_record) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> wire[at] = extended_auction_summary_message_record.stock_symbol[extended_auction_summary_message_at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
  :: extended_auction_summary_message_at < 10 -> wire[at] = extended_auction_summary_message_record.shares[extended_auction_summary_message_at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* Extended Auction Summary Message off the wire, 33 bytes from where the cursor stands */
inline decode_extended_auction_summary_message(extended_auction_summary_message_record) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> extended_auction_summary_message_record.stock_symbol[extended_auction_summary_message_at] = wire[at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
  :: extended_auction_summary_message_at < 10 -> extended_auction_summary_message_record.shares[extended_auction_summary_message_at] = wire[at]; at = at + 1; extended_auction_summary_message_at = extended_auction_summary_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Extended Auction Summary Message is what was written, byte for byte */
inline equal_extended_auction_summary_message(extended_auction_summary_message_read, extended_auction_summary_message_written) {
  extended_auction_summary_message_at = 0;
  do
  :: extended_auction_summary_message_at < 8 -> assert(extended_auction_summary_message_read.stock_symbol[extended_auction_summary_message_at] == extended_auction_summary_message_written.stock_symbol[extended_auction_summary_message_at]); extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
  :: extended_auction_summary_message_at < 10 -> assert(extended_auction_summary_message_read.shares[extended_auction_summary_message_at] == extended_auction_summary_message_written.shares[extended_auction_summary_message_at]); extended_auction_summary_message_at = extended_auction_summary_message_at + 1
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
    assert(at == 9);
    at = 0;
    decode_sequenced_message_header(sequenced_message_header_got);
    assert(at == 9);
    equal_sequenced_message_header(sequenced_message_header_got, sequenced_message_header_sent)
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
  :: run check_auction_update_message()
  :: run check_extended_auction_update_message()
  :: run check_auction_summary_message()
  :: run check_extended_auction_summary_message()
  :: run check_login_request_packet()
  fi
}
