/*
 * National Association of Securities Dealers Automated Quotations (Nasdaq) Match View
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
 *   - the dispatch that chooses a message by its type
 *   - a run counted by a field
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 28

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Packet Header: 16 bytes ------------------------------------------------- */

typedef PacketHeader {
  byte session[10];
  byte sequence_number[4];
  byte message_count[2]
};

int packet_header_at;

/* every byte of Packet Header set to one value */
inline fill_packet_header(packet_header_record, packet_header_value) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = packet_header_value; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Packet Header set to where it lies, so a field read out of place says so */
inline ramp_packet_header(packet_header_record, packet_header_base) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = (packet_header_base + 0 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = (packet_header_base + 10 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = (packet_header_base + 14 + packet_header_at + 1) % 256; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header to the wire, 16 bytes from where the cursor stands */
inline encode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> wire[at] = packet_header_record.session[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> wire[at] = packet_header_record.sequence_number[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> wire[at] = packet_header_record.message_count[packet_header_at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* Packet Header off the wire, 16 bytes from where the cursor stands */
inline decode_packet_header(packet_header_record) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> packet_header_record.session[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> packet_header_record.sequence_number[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> packet_header_record.message_count[packet_header_at] = wire[at]; at = at + 1; packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Packet Header is what was written, byte for byte */
inline equal_packet_header(packet_header_read, packet_header_written) {
  packet_header_at = 0;
  do
  :: packet_header_at < 10 -> assert(packet_header_read.session[packet_header_at] == packet_header_written.session[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 4 -> assert(packet_header_read.sequence_number[packet_header_at] == packet_header_written.sequence_number[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  packet_header_at = 0;
  do
  :: packet_header_at < 2 -> assert(packet_header_read.message_count[packet_header_at] == packet_header_written.message_count[packet_header_at]); packet_header_at = packet_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Message Header: 9 bytes ------------------------------------------------- */

typedef MessageHeader {
  byte timestamp[8];
  byte message_type
};

int message_header_at;

/* every byte of Message Header set to one value */
inline fill_message_header(message_header_record, message_header_value) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = message_header_value; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = message_header_value;
  skip
}

/* each byte of Message Header set to where it lies, so a field read out of place says so */
inline ramp_message_header(message_header_record, message_header_base) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = (message_header_base + 0 + message_header_at + 1) % 256; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = (message_header_base + 8 + 1) % 256;
  skip
}

/* Message Header to the wire, 9 bytes from where the cursor stands */
inline encode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> wire[at] = message_header_record.timestamp[message_header_at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  wire[at] = message_header_record.message_type; at = at + 1;
  skip
}

/* Message Header off the wire, 9 bytes from where the cursor stands */
inline decode_message_header(message_header_record) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> message_header_record.timestamp[message_header_at] = wire[at]; at = at + 1; message_header_at = message_header_at + 1
  :: else -> break
  od;
  message_header_record.message_type = wire[at]; at = at + 1;
  skip
}

/* what was read of Message Header is what was written, byte for byte */
inline equal_message_header(message_header_read, message_header_written) {
  message_header_at = 0;
  do
  :: message_header_at < 8 -> assert(message_header_read.timestamp[message_header_at] == message_header_written.timestamp[message_header_at]); message_header_at = message_header_at + 1
  :: else -> break
  od;
  assert(message_header_read.message_type == message_header_written.message_type);
  skip
}

/* ---- Best Bid And Offer Message: 28 bytes ------------------------------------ */

/* What the Nasdaq PSX execution system sees as the prevailing best bid and offer of the other exchanges. For this feed, the only message type is "U". */
typedef BestBidAndOfferMessage {
  byte symbol[8];
  byte bid_price[10];
  byte ask_price[10]
};

int best_bid_and_offer_message_at;

/* every byte of Best Bid And Offer Message set to one value */
inline fill_best_bid_and_offer_message(best_bid_and_offer_message_record, best_bid_and_offer_message_value) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.symbol[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.bid_price[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.ask_price[best_bid_and_offer_message_at] = best_bid_and_offer_message_value; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Best Bid And Offer Message set to where it lies, so a field read out of place says so */
inline ramp_best_bid_and_offer_message(best_bid_and_offer_message_record, best_bid_and_offer_message_base) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.symbol[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 0 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.bid_price[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 8 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.ask_price[best_bid_and_offer_message_at] = (best_bid_and_offer_message_base + 18 + best_bid_and_offer_message_at + 1) % 256; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Offer Message to the wire, 28 bytes from where the cursor stands */
inline encode_best_bid_and_offer_message(best_bid_and_offer_message_record) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> wire[at] = best_bid_and_offer_message_record.symbol[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> wire[at] = best_bid_and_offer_message_record.bid_price[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> wire[at] = best_bid_and_offer_message_record.ask_price[best_bid_and_offer_message_at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Best Bid And Offer Message off the wire, 28 bytes from where the cursor stands */
inline decode_best_bid_and_offer_message(best_bid_and_offer_message_record) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> best_bid_and_offer_message_record.symbol[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.bid_price[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> best_bid_and_offer_message_record.ask_price[best_bid_and_offer_message_at] = wire[at]; at = at + 1; best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Best Bid And Offer Message is what was written, byte for byte */
inline equal_best_bid_and_offer_message(best_bid_and_offer_message_read, best_bid_and_offer_message_written) {
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 8 -> assert(best_bid_and_offer_message_read.symbol[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.symbol[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> assert(best_bid_and_offer_message_read.bid_price[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.bid_price[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  best_bid_and_offer_message_at = 0;
  do
  :: best_bid_and_offer_message_at < 10 -> assert(best_bid_and_offer_message_read.ask_price[best_bid_and_offer_message_at] == best_bid_and_offer_message_written.ask_price[best_bid_and_offer_message_at]); best_bid_and_offer_message_at = best_bid_and_offer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Packet Header: encoded, read back, and compared */
proctype check_packet_header() {
  PacketHeader packet_header_sent;
  PacketHeader packet_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_packet_header(packet_header_sent, 0)
  :: pattern == 1 -> fill_packet_header(packet_header_sent, 32)
  :: pattern == 2 -> fill_packet_header(packet_header_sent, 255)
  :: else -> ramp_packet_header(packet_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_packet_header(packet_header_sent);
    assert(at == 16);
    at = 0;
    decode_packet_header(packet_header_got);
    assert(at == 16);
    equal_packet_header(packet_header_got, packet_header_sent)
  }
}

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
    assert(at == 9);
    at = 0;
    decode_message_header(message_header_got);
    assert(at == 9);
    equal_message_header(message_header_got, message_header_sent)
  }
}

/* Best Bid And Offer Message: encoded, read back, and compared */
proctype check_best_bid_and_offer_message() {
  BestBidAndOfferMessage best_bid_and_offer_message_sent;
  BestBidAndOfferMessage best_bid_and_offer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 0)
  :: pattern == 1 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 32)
  :: pattern == 2 -> fill_best_bid_and_offer_message(best_bid_and_offer_message_sent, 255)
  :: else -> ramp_best_bid_and_offer_message(best_bid_and_offer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_best_bid_and_offer_message(best_bid_and_offer_message_sent);
    assert(at == 28);
    at = 0;
    decode_best_bid_and_offer_message(best_bid_and_offer_message_got);
    assert(at == 28);
    equal_best_bid_and_offer_message(best_bid_and_offer_message_got, best_bid_and_offer_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_packet_header()
  :: run check_message_header()
  :: run check_best_bid_and_offer_message()
  fi
}
