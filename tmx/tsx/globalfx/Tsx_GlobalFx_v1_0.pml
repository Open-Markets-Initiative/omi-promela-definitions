/*
 * TMX Group Global Fx Feed
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
#define WIRE 5

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Bid Price: 5 bytes ------------------------------------------------------ */

/* Bid Price mantissa, which Bid Price Exponent scales. Zero for Tier Status Z */
typedef BidPrice {
  byte bid_price_mantissa[4];
  byte bid_price_exponent
};

int bid_price_at;

/* every byte of Bid Price set to one value */
inline fill_bid_price(bid_price_record, bid_price_value) {
  bid_price_at = 0;
  do
  :: bid_price_at < 4 -> bid_price_record.bid_price_mantissa[bid_price_at] = bid_price_value; bid_price_at = bid_price_at + 1
  :: else -> break
  od;
  bid_price_record.bid_price_exponent = bid_price_value;
  skip
}

/* each byte of Bid Price set to where it lies, so a field read out of place says so */
inline ramp_bid_price(bid_price_record, bid_price_base) {
  bid_price_at = 0;
  do
  :: bid_price_at < 4 -> bid_price_record.bid_price_mantissa[bid_price_at] = (bid_price_base + 0 + bid_price_at + 1) % 256; bid_price_at = bid_price_at + 1
  :: else -> break
  od;
  bid_price_record.bid_price_exponent = (bid_price_base + 4 + 1) % 256;
  skip
}

/* Bid Price to the wire, 5 bytes from where the cursor stands */
inline encode_bid_price(bid_price_record) {
  bid_price_at = 0;
  do
  :: bid_price_at < 4 -> wire[at] = bid_price_record.bid_price_mantissa[bid_price_at]; at = at + 1; bid_price_at = bid_price_at + 1
  :: else -> break
  od;
  wire[at] = bid_price_record.bid_price_exponent; at = at + 1;
  skip
}

/* Bid Price off the wire, 5 bytes from where the cursor stands */
inline decode_bid_price(bid_price_record) {
  bid_price_at = 0;
  do
  :: bid_price_at < 4 -> bid_price_record.bid_price_mantissa[bid_price_at] = wire[at]; at = at + 1; bid_price_at = bid_price_at + 1
  :: else -> break
  od;
  bid_price_record.bid_price_exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Bid Price is what was written, byte for byte */
inline equal_bid_price(bid_price_read, bid_price_written) {
  bid_price_at = 0;
  do
  :: bid_price_at < 4 -> assert(bid_price_read.bid_price_mantissa[bid_price_at] == bid_price_written.bid_price_mantissa[bid_price_at]); bid_price_at = bid_price_at + 1
  :: else -> break
  od;
  assert(bid_price_read.bid_price_exponent == bid_price_written.bid_price_exponent);
  skip
}

/* ---- Offer Price: 5 bytes ---------------------------------------------------- */

/* Offer Price mantissa, which Offer Price Exponent scales. Zero for Tier Status Z */
typedef OfferPrice {
  byte offer_price_mantissa[4];
  byte offer_price_exponent
};

int offer_price_at;

/* every byte of Offer Price set to one value */
inline fill_offer_price(offer_price_record, offer_price_value) {
  offer_price_at = 0;
  do
  :: offer_price_at < 4 -> offer_price_record.offer_price_mantissa[offer_price_at] = offer_price_value; offer_price_at = offer_price_at + 1
  :: else -> break
  od;
  offer_price_record.offer_price_exponent = offer_price_value;
  skip
}

/* each byte of Offer Price set to where it lies, so a field read out of place says so */
inline ramp_offer_price(offer_price_record, offer_price_base) {
  offer_price_at = 0;
  do
  :: offer_price_at < 4 -> offer_price_record.offer_price_mantissa[offer_price_at] = (offer_price_base + 0 + offer_price_at + 1) % 256; offer_price_at = offer_price_at + 1
  :: else -> break
  od;
  offer_price_record.offer_price_exponent = (offer_price_base + 4 + 1) % 256;
  skip
}

/* Offer Price to the wire, 5 bytes from where the cursor stands */
inline encode_offer_price(offer_price_record) {
  offer_price_at = 0;
  do
  :: offer_price_at < 4 -> wire[at] = offer_price_record.offer_price_mantissa[offer_price_at]; at = at + 1; offer_price_at = offer_price_at + 1
  :: else -> break
  od;
  wire[at] = offer_price_record.offer_price_exponent; at = at + 1;
  skip
}

/* Offer Price off the wire, 5 bytes from where the cursor stands */
inline decode_offer_price(offer_price_record) {
  offer_price_at = 0;
  do
  :: offer_price_at < 4 -> offer_price_record.offer_price_mantissa[offer_price_at] = wire[at]; at = at + 1; offer_price_at = offer_price_at + 1
  :: else -> break
  od;
  offer_price_record.offer_price_exponent = wire[at]; at = at + 1;
  skip
}

/* what was read of Offer Price is what was written, byte for byte */
inline equal_offer_price(offer_price_read, offer_price_written) {
  offer_price_at = 0;
  do
  :: offer_price_at < 4 -> assert(offer_price_read.offer_price_mantissa[offer_price_at] == offer_price_written.offer_price_mantissa[offer_price_at]); offer_price_at = offer_price_at + 1
  :: else -> break
  od;
  assert(offer_price_read.offer_price_exponent == offer_price_written.offer_price_exponent);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Bid Price: encoded, read back, and compared */
proctype check_bid_price() {
  BidPrice bid_price_sent;
  BidPrice bid_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_price(bid_price_sent, 0)
  :: pattern == 1 -> fill_bid_price(bid_price_sent, 32)
  :: pattern == 2 -> fill_bid_price(bid_price_sent, 255)
  :: else -> ramp_bid_price(bid_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_price(bid_price_sent);
    assert(at == 5);
    at = 0;
    decode_bid_price(bid_price_got);
    assert(at == 5);
    equal_bid_price(bid_price_got, bid_price_sent)
  }
}

/* Offer Price: encoded, read back, and compared */
proctype check_offer_price() {
  OfferPrice offer_price_sent;
  OfferPrice offer_price_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_offer_price(offer_price_sent, 0)
  :: pattern == 1 -> fill_offer_price(offer_price_sent, 32)
  :: pattern == 2 -> fill_offer_price(offer_price_sent, 255)
  :: else -> ramp_offer_price(offer_price_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_offer_price(offer_price_sent);
    assert(at == 5);
    at = 0;
    decode_offer_price(offer_price_got);
    assert(at == 5);
    equal_offer_price(offer_price_got, offer_price_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_bid_price()
  :: run check_offer_price()
  fi
}
