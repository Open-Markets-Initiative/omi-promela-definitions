/*
 * Databento Normalized
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
 *   - a length prefix framing what follows
 *   - a run counted by a field
 *   - a run filling what frames it
 *   - a field read in bits
 *   - a run of a stated number of entries
 *
 * License: MIT No Attribution
 */

/* ---- The wire ---------------------------------------------------------------- */

/* the widest record this protocol states, which is the most a check writes at once */
#define WIRE 384

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Record Header: 16 bytes ------------------------------------------------- */

/* DBN common header of every record */
typedef RecordHeader {
  byte record_length;
  byte rtype;
  byte publisher_id[2];
  byte instrument_id[4];
  byte ts_event[8]
};

int record_header_at;

/* every byte of Record Header set to one value */
inline fill_record_header(record_header_record, record_header_value) {
  record_header_record.record_length = record_header_value;
  record_header_record.rtype = record_header_value;
  record_header_at = 0;
  do
  :: record_header_at < 2 -> record_header_record.publisher_id[record_header_at] = record_header_value; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 4 -> record_header_record.instrument_id[record_header_at] = record_header_value; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 8 -> record_header_record.ts_event[record_header_at] = record_header_value; record_header_at = record_header_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Record Header set to where it lies, so a field read out of place says so */
inline ramp_record_header(record_header_record, record_header_base) {
  record_header_record.record_length = (record_header_base + 0 + 1) % 256;
  record_header_record.rtype = (record_header_base + 1 + 1) % 256;
  record_header_at = 0;
  do
  :: record_header_at < 2 -> record_header_record.publisher_id[record_header_at] = (record_header_base + 2 + record_header_at + 1) % 256; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 4 -> record_header_record.instrument_id[record_header_at] = (record_header_base + 4 + record_header_at + 1) % 256; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 8 -> record_header_record.ts_event[record_header_at] = (record_header_base + 8 + record_header_at + 1) % 256; record_header_at = record_header_at + 1
  :: else -> break
  od;
  skip
}

/* Record Header to the wire, 16 bytes from where the cursor stands */
inline encode_record_header(record_header_record) {
  wire[at] = record_header_record.record_length; at = at + 1;
  wire[at] = record_header_record.rtype; at = at + 1;
  record_header_at = 0;
  do
  :: record_header_at < 2 -> wire[at] = record_header_record.publisher_id[record_header_at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 4 -> wire[at] = record_header_record.instrument_id[record_header_at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 8 -> wire[at] = record_header_record.ts_event[record_header_at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  skip
}

/* Record Header off the wire, 16 bytes from where the cursor stands */
inline decode_record_header(record_header_record) {
  record_header_record.record_length = wire[at]; at = at + 1;
  record_header_record.rtype = wire[at]; at = at + 1;
  record_header_at = 0;
  do
  :: record_header_at < 2 -> record_header_record.publisher_id[record_header_at] = wire[at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 4 -> record_header_record.instrument_id[record_header_at] = wire[at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 8 -> record_header_record.ts_event[record_header_at] = wire[at]; at = at + 1; record_header_at = record_header_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Record Header is what was written, byte for byte */
inline equal_record_header(record_header_read, record_header_written) {
  assert(record_header_read.record_length == record_header_written.record_length);
  assert(record_header_read.rtype == record_header_written.rtype);
  record_header_at = 0;
  do
  :: record_header_at < 2 -> assert(record_header_read.publisher_id[record_header_at] == record_header_written.publisher_id[record_header_at]); record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 4 -> assert(record_header_read.instrument_id[record_header_at] == record_header_written.instrument_id[record_header_at]); record_header_at = record_header_at + 1
  :: else -> break
  od;
  record_header_at = 0;
  do
  :: record_header_at < 8 -> assert(record_header_read.ts_event[record_header_at] == record_header_written.ts_event[record_header_at]); record_header_at = record_header_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Ask Pair: 32 bytes -------------------------------------------------- */

/* A level */
typedef BidAskPair {
  byte bid_px[8];
  byte ask_px[8];
  byte bid_sz[4];
  byte ask_sz[4];
  byte bid_ct[4];
  byte ask_ct[4]
};

int bid_ask_pair_at;

/* every byte of Bid Ask Pair set to one value */
inline fill_bid_ask_pair(bid_ask_pair_record, bid_ask_pair_value) {
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.bid_px[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.ask_px[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_sz[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_sz[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_ct[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_ct[bid_ask_pair_at] = bid_ask_pair_value; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid Ask Pair set to where it lies, so a field read out of place says so */
inline ramp_bid_ask_pair(bid_ask_pair_record, bid_ask_pair_base) {
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.bid_px[bid_ask_pair_at] = (bid_ask_pair_base + 0 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.ask_px[bid_ask_pair_at] = (bid_ask_pair_base + 8 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_sz[bid_ask_pair_at] = (bid_ask_pair_base + 16 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_sz[bid_ask_pair_at] = (bid_ask_pair_base + 20 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_ct[bid_ask_pair_at] = (bid_ask_pair_base + 24 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_ct[bid_ask_pair_at] = (bid_ask_pair_base + 28 + bid_ask_pair_at + 1) % 256; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Ask Pair to the wire, 32 bytes from where the cursor stands */
inline encode_bid_ask_pair(bid_ask_pair_record) {
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> wire[at] = bid_ask_pair_record.bid_px[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> wire[at] = bid_ask_pair_record.ask_px[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> wire[at] = bid_ask_pair_record.bid_sz[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> wire[at] = bid_ask_pair_record.ask_sz[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> wire[at] = bid_ask_pair_record.bid_ct[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> wire[at] = bid_ask_pair_record.ask_ct[bid_ask_pair_at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Ask Pair off the wire, 32 bytes from where the cursor stands */
inline decode_bid_ask_pair(bid_ask_pair_record) {
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.bid_px[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> bid_ask_pair_record.ask_px[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_sz[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_sz[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.bid_ct[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> bid_ask_pair_record.ask_ct[bid_ask_pair_at] = wire[at]; at = at + 1; bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid Ask Pair is what was written, byte for byte */
inline equal_bid_ask_pair(bid_ask_pair_read, bid_ask_pair_written) {
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> assert(bid_ask_pair_read.bid_px[bid_ask_pair_at] == bid_ask_pair_written.bid_px[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 8 -> assert(bid_ask_pair_read.ask_px[bid_ask_pair_at] == bid_ask_pair_written.ask_px[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> assert(bid_ask_pair_read.bid_sz[bid_ask_pair_at] == bid_ask_pair_written.bid_sz[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> assert(bid_ask_pair_read.ask_sz[bid_ask_pair_at] == bid_ask_pair_written.ask_sz[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> assert(bid_ask_pair_read.bid_ct[bid_ask_pair_at] == bid_ask_pair_written.bid_ct[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  bid_ask_pair_at = 0;
  do
  :: bid_ask_pair_at < 4 -> assert(bid_ask_pair_read.ask_ct[bid_ask_pair_at] == bid_ask_pair_written.ask_ct[bid_ask_pair_at]); bid_ask_pair_at = bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ohlcv Msg: 40 bytes ----------------------------------------------------- */

/* Open, high, low, close, and volume; the record of the ohlcv schemas */
typedef OhlcvMsg {
  byte open[8];
  byte high[8];
  byte low[8];
  byte close[8];
  byte volume[8]
};

int ohlcv_msg_at;

/* every byte of Ohlcv Msg set to one value */
inline fill_ohlcv_msg(ohlcv_msg_record, ohlcv_msg_value) {
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.open[ohlcv_msg_at] = ohlcv_msg_value; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.high[ohlcv_msg_at] = ohlcv_msg_value; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.low[ohlcv_msg_at] = ohlcv_msg_value; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.close[ohlcv_msg_at] = ohlcv_msg_value; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.volume[ohlcv_msg_at] = ohlcv_msg_value; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ohlcv Msg set to where it lies, so a field read out of place says so */
inline ramp_ohlcv_msg(ohlcv_msg_record, ohlcv_msg_base) {
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.open[ohlcv_msg_at] = (ohlcv_msg_base + 0 + ohlcv_msg_at + 1) % 256; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.high[ohlcv_msg_at] = (ohlcv_msg_base + 8 + ohlcv_msg_at + 1) % 256; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.low[ohlcv_msg_at] = (ohlcv_msg_base + 16 + ohlcv_msg_at + 1) % 256; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.close[ohlcv_msg_at] = (ohlcv_msg_base + 24 + ohlcv_msg_at + 1) % 256; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.volume[ohlcv_msg_at] = (ohlcv_msg_base + 32 + ohlcv_msg_at + 1) % 256; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Ohlcv Msg to the wire, 40 bytes from where the cursor stands */
inline encode_ohlcv_msg(ohlcv_msg_record) {
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> wire[at] = ohlcv_msg_record.open[ohlcv_msg_at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> wire[at] = ohlcv_msg_record.high[ohlcv_msg_at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> wire[at] = ohlcv_msg_record.low[ohlcv_msg_at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> wire[at] = ohlcv_msg_record.close[ohlcv_msg_at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> wire[at] = ohlcv_msg_record.volume[ohlcv_msg_at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Ohlcv Msg off the wire, 40 bytes from where the cursor stands */
inline decode_ohlcv_msg(ohlcv_msg_record) {
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.open[ohlcv_msg_at] = wire[at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.high[ohlcv_msg_at] = wire[at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.low[ohlcv_msg_at] = wire[at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.close[ohlcv_msg_at] = wire[at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> ohlcv_msg_record.volume[ohlcv_msg_at] = wire[at]; at = at + 1; ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ohlcv Msg is what was written, byte for byte */
inline equal_ohlcv_msg(ohlcv_msg_read, ohlcv_msg_written) {
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> assert(ohlcv_msg_read.open[ohlcv_msg_at] == ohlcv_msg_written.open[ohlcv_msg_at]); ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> assert(ohlcv_msg_read.high[ohlcv_msg_at] == ohlcv_msg_written.high[ohlcv_msg_at]); ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> assert(ohlcv_msg_read.low[ohlcv_msg_at] == ohlcv_msg_written.low[ohlcv_msg_at]); ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> assert(ohlcv_msg_read.close[ohlcv_msg_at] == ohlcv_msg_written.close[ohlcv_msg_at]); ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  ohlcv_msg_at = 0;
  do
  :: ohlcv_msg_at < 8 -> assert(ohlcv_msg_read.volume[ohlcv_msg_at] == ohlcv_msg_written.volume[ohlcv_msg_at]); ohlcv_msg_at = ohlcv_msg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Status Msg: 24 bytes ---------------------------------------------------- */

/* A trading status update message; the record of the status schema */
typedef StatusMsg {
  byte ts_recv[8];
  byte status_action[2];
  byte status_reason[2];
  byte trading_event[2];
  byte is_trading;
  byte is_quoting;
  byte is_short_sell_restricted;
  byte reserved_7[7]
};

int status_msg_at;

/* every byte of Status Msg set to one value */
inline fill_status_msg(status_msg_record, status_msg_value) {
  status_msg_at = 0;
  do
  :: status_msg_at < 8 -> status_msg_record.ts_recv[status_msg_at] = status_msg_value; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_action[status_msg_at] = status_msg_value; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_reason[status_msg_at] = status_msg_value; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.trading_event[status_msg_at] = status_msg_value; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_record.is_trading = status_msg_value;
  status_msg_record.is_quoting = status_msg_value;
  status_msg_record.is_short_sell_restricted = status_msg_value;
  status_msg_at = 0;
  do
  :: status_msg_at < 7 -> status_msg_record.reserved_7[status_msg_at] = status_msg_value; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Status Msg set to where it lies, so a field read out of place says so */
inline ramp_status_msg(status_msg_record, status_msg_base) {
  status_msg_at = 0;
  do
  :: status_msg_at < 8 -> status_msg_record.ts_recv[status_msg_at] = (status_msg_base + 0 + status_msg_at + 1) % 256; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_action[status_msg_at] = (status_msg_base + 8 + status_msg_at + 1) % 256; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_reason[status_msg_at] = (status_msg_base + 10 + status_msg_at + 1) % 256; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.trading_event[status_msg_at] = (status_msg_base + 12 + status_msg_at + 1) % 256; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_record.is_trading = (status_msg_base + 14 + 1) % 256;
  status_msg_record.is_quoting = (status_msg_base + 15 + 1) % 256;
  status_msg_record.is_short_sell_restricted = (status_msg_base + 16 + 1) % 256;
  status_msg_at = 0;
  do
  :: status_msg_at < 7 -> status_msg_record.reserved_7[status_msg_at] = (status_msg_base + 17 + status_msg_at + 1) % 256; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Status Msg to the wire, 24 bytes from where the cursor stands */
inline encode_status_msg(status_msg_record) {
  status_msg_at = 0;
  do
  :: status_msg_at < 8 -> wire[at] = status_msg_record.ts_recv[status_msg_at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> wire[at] = status_msg_record.status_action[status_msg_at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> wire[at] = status_msg_record.status_reason[status_msg_at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> wire[at] = status_msg_record.trading_event[status_msg_at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  wire[at] = status_msg_record.is_trading; at = at + 1;
  wire[at] = status_msg_record.is_quoting; at = at + 1;
  wire[at] = status_msg_record.is_short_sell_restricted; at = at + 1;
  status_msg_at = 0;
  do
  :: status_msg_at < 7 -> wire[at] = status_msg_record.reserved_7[status_msg_at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Status Msg off the wire, 24 bytes from where the cursor stands */
inline decode_status_msg(status_msg_record) {
  status_msg_at = 0;
  do
  :: status_msg_at < 8 -> status_msg_record.ts_recv[status_msg_at] = wire[at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_action[status_msg_at] = wire[at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.status_reason[status_msg_at] = wire[at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> status_msg_record.trading_event[status_msg_at] = wire[at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_record.is_trading = wire[at]; at = at + 1;
  status_msg_record.is_quoting = wire[at]; at = at + 1;
  status_msg_record.is_short_sell_restricted = wire[at]; at = at + 1;
  status_msg_at = 0;
  do
  :: status_msg_at < 7 -> status_msg_record.reserved_7[status_msg_at] = wire[at]; at = at + 1; status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Status Msg is what was written, byte for byte */
inline equal_status_msg(status_msg_read, status_msg_written) {
  status_msg_at = 0;
  do
  :: status_msg_at < 8 -> assert(status_msg_read.ts_recv[status_msg_at] == status_msg_written.ts_recv[status_msg_at]); status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> assert(status_msg_read.status_action[status_msg_at] == status_msg_written.status_action[status_msg_at]); status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> assert(status_msg_read.status_reason[status_msg_at] == status_msg_written.status_reason[status_msg_at]); status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  status_msg_at = 0;
  do
  :: status_msg_at < 2 -> assert(status_msg_read.trading_event[status_msg_at] == status_msg_written.trading_event[status_msg_at]); status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  assert(status_msg_read.is_trading == status_msg_written.is_trading);
  assert(status_msg_read.is_quoting == status_msg_written.is_quoting);
  assert(status_msg_read.is_short_sell_restricted == status_msg_written.is_short_sell_restricted);
  status_msg_at = 0;
  do
  :: status_msg_at < 7 -> assert(status_msg_read.reserved_7[status_msg_at] == status_msg_written.reserved_7[status_msg_at]); status_msg_at = status_msg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Def Msg: 384 bytes ------------------------------------------- */

/* A definition of an instrument; the record of the definition schema */
typedef InstrumentDefMsg {
  byte ts_recv[8];
  byte min_price_increment[8];
  byte display_factor[8];
  byte expiration[8];
  byte activation[8];
  byte high_limit_price[8];
  byte low_limit_price[8];
  byte max_price_variation[8];
  byte trading_reference_price[8];
  byte unit_of_measure_qty[8];
  byte min_price_increment_amount[8];
  byte price_ratio[8];
  byte strike_price[8];
  byte inst_attrib_value[4];
  byte underlying_id[4];
  byte raw_instrument_id[4];
  byte market_depth_implied[4];
  byte market_depth[4];
  byte market_segment_id[4];
  byte max_trade_vol[4];
  byte min_lot_size[4];
  byte min_lot_size_block[4];
  byte min_lot_size_round_lot[4];
  byte min_trade_vol[4];
  byte contract_multiplier[4];
  byte decay_quantity[4];
  byte original_contract_size[4];
  byte trading_reference_date[2];
  byte appl_id[2];
  byte maturity_year[2];
  byte decay_start_date[2];
  byte channel[2];
  byte currency[4];
  byte settl_currency[4];
  byte secsubtype[6];
  byte raw_symbol[71];
  byte group[21];
  byte exchange[5];
  byte asset[7];
  byte cfi[7];
  byte security_type[7];
  byte unit_of_measure[31];
  byte underlying[21];
  byte strike_price_currency[4];
  byte instrument_class;
  byte match_algorithm;
  byte md_security_trading_status;
  byte main_fraction;
  byte price_display_format;
  byte settl_price_type;
  byte sub_fraction;
  byte underlying_product;
  byte security_update_action;
  byte maturity_month;
  byte maturity_day;
  byte maturity_week;
  byte user_defined_instrument;
  byte contract_multiplier_unit;
  byte flow_schedule_type;
  byte tick_rule;
  byte reserved_10[10]
};

int instrument_def_msg_at;

/* every byte of Instrument Def Msg set to one value */
inline fill_instrument_def_msg(instrument_def_msg_record, instrument_def_msg_value) {
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.ts_recv[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.display_factor[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.expiration[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.activation[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.high_limit_price[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.low_limit_price[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.max_price_variation[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.trading_reference_price[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.unit_of_measure_qty[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment_amount[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.price_ratio[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.strike_price[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.inst_attrib_value[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.underlying_id[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.raw_instrument_id[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth_implied[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_segment_id[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.max_trade_vol[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_block[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_round_lot[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_trade_vol[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.contract_multiplier[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.decay_quantity[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.original_contract_size[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.trading_reference_date[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.appl_id[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.maturity_year[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.decay_start_date[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.channel[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.currency[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.settl_currency[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 6 -> instrument_def_msg_record.secsubtype[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 71 -> instrument_def_msg_record.raw_symbol[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.group[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 5 -> instrument_def_msg_record.exchange[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.asset[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.cfi[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.security_type[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 31 -> instrument_def_msg_record.unit_of_measure[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.underlying[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.strike_price_currency[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_record.instrument_class = instrument_def_msg_value;
  instrument_def_msg_record.match_algorithm = instrument_def_msg_value;
  instrument_def_msg_record.md_security_trading_status = instrument_def_msg_value;
  instrument_def_msg_record.main_fraction = instrument_def_msg_value;
  instrument_def_msg_record.price_display_format = instrument_def_msg_value;
  instrument_def_msg_record.settl_price_type = instrument_def_msg_value;
  instrument_def_msg_record.sub_fraction = instrument_def_msg_value;
  instrument_def_msg_record.underlying_product = instrument_def_msg_value;
  instrument_def_msg_record.security_update_action = instrument_def_msg_value;
  instrument_def_msg_record.maturity_month = instrument_def_msg_value;
  instrument_def_msg_record.maturity_day = instrument_def_msg_value;
  instrument_def_msg_record.maturity_week = instrument_def_msg_value;
  instrument_def_msg_record.user_defined_instrument = instrument_def_msg_value;
  instrument_def_msg_record.contract_multiplier_unit = instrument_def_msg_value;
  instrument_def_msg_record.flow_schedule_type = instrument_def_msg_value;
  instrument_def_msg_record.tick_rule = instrument_def_msg_value;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 10 -> instrument_def_msg_record.reserved_10[instrument_def_msg_at] = instrument_def_msg_value; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Def Msg set to where it lies, so a field read out of place says so */
inline ramp_instrument_def_msg(instrument_def_msg_record, instrument_def_msg_base) {
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.ts_recv[instrument_def_msg_at] = (instrument_def_msg_base + 0 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment[instrument_def_msg_at] = (instrument_def_msg_base + 8 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.display_factor[instrument_def_msg_at] = (instrument_def_msg_base + 16 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.expiration[instrument_def_msg_at] = (instrument_def_msg_base + 24 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.activation[instrument_def_msg_at] = (instrument_def_msg_base + 32 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.high_limit_price[instrument_def_msg_at] = (instrument_def_msg_base + 40 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.low_limit_price[instrument_def_msg_at] = (instrument_def_msg_base + 48 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.max_price_variation[instrument_def_msg_at] = (instrument_def_msg_base + 56 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.trading_reference_price[instrument_def_msg_at] = (instrument_def_msg_base + 64 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.unit_of_measure_qty[instrument_def_msg_at] = (instrument_def_msg_base + 72 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment_amount[instrument_def_msg_at] = (instrument_def_msg_base + 80 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.price_ratio[instrument_def_msg_at] = (instrument_def_msg_base + 88 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.strike_price[instrument_def_msg_at] = (instrument_def_msg_base + 96 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.inst_attrib_value[instrument_def_msg_at] = (instrument_def_msg_base + 104 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.underlying_id[instrument_def_msg_at] = (instrument_def_msg_base + 108 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.raw_instrument_id[instrument_def_msg_at] = (instrument_def_msg_base + 112 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth_implied[instrument_def_msg_at] = (instrument_def_msg_base + 116 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth[instrument_def_msg_at] = (instrument_def_msg_base + 120 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_segment_id[instrument_def_msg_at] = (instrument_def_msg_base + 124 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.max_trade_vol[instrument_def_msg_at] = (instrument_def_msg_base + 128 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size[instrument_def_msg_at] = (instrument_def_msg_base + 132 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_block[instrument_def_msg_at] = (instrument_def_msg_base + 136 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_round_lot[instrument_def_msg_at] = (instrument_def_msg_base + 140 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_trade_vol[instrument_def_msg_at] = (instrument_def_msg_base + 144 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.contract_multiplier[instrument_def_msg_at] = (instrument_def_msg_base + 148 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.decay_quantity[instrument_def_msg_at] = (instrument_def_msg_base + 152 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.original_contract_size[instrument_def_msg_at] = (instrument_def_msg_base + 156 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.trading_reference_date[instrument_def_msg_at] = (instrument_def_msg_base + 160 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.appl_id[instrument_def_msg_at] = (instrument_def_msg_base + 162 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.maturity_year[instrument_def_msg_at] = (instrument_def_msg_base + 164 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.decay_start_date[instrument_def_msg_at] = (instrument_def_msg_base + 166 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.channel[instrument_def_msg_at] = (instrument_def_msg_base + 168 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.currency[instrument_def_msg_at] = (instrument_def_msg_base + 170 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.settl_currency[instrument_def_msg_at] = (instrument_def_msg_base + 174 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 6 -> instrument_def_msg_record.secsubtype[instrument_def_msg_at] = (instrument_def_msg_base + 178 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 71 -> instrument_def_msg_record.raw_symbol[instrument_def_msg_at] = (instrument_def_msg_base + 184 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.group[instrument_def_msg_at] = (instrument_def_msg_base + 255 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 5 -> instrument_def_msg_record.exchange[instrument_def_msg_at] = (instrument_def_msg_base + 276 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.asset[instrument_def_msg_at] = (instrument_def_msg_base + 281 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.cfi[instrument_def_msg_at] = (instrument_def_msg_base + 288 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.security_type[instrument_def_msg_at] = (instrument_def_msg_base + 295 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 31 -> instrument_def_msg_record.unit_of_measure[instrument_def_msg_at] = (instrument_def_msg_base + 302 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.underlying[instrument_def_msg_at] = (instrument_def_msg_base + 333 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.strike_price_currency[instrument_def_msg_at] = (instrument_def_msg_base + 354 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_record.instrument_class = (instrument_def_msg_base + 358 + 1) % 256;
  instrument_def_msg_record.match_algorithm = (instrument_def_msg_base + 359 + 1) % 256;
  instrument_def_msg_record.md_security_trading_status = (instrument_def_msg_base + 360 + 1) % 256;
  instrument_def_msg_record.main_fraction = (instrument_def_msg_base + 361 + 1) % 256;
  instrument_def_msg_record.price_display_format = (instrument_def_msg_base + 362 + 1) % 256;
  instrument_def_msg_record.settl_price_type = (instrument_def_msg_base + 363 + 1) % 256;
  instrument_def_msg_record.sub_fraction = (instrument_def_msg_base + 364 + 1) % 256;
  instrument_def_msg_record.underlying_product = (instrument_def_msg_base + 365 + 1) % 256;
  instrument_def_msg_record.security_update_action = (instrument_def_msg_base + 366 + 1) % 256;
  instrument_def_msg_record.maturity_month = (instrument_def_msg_base + 367 + 1) % 256;
  instrument_def_msg_record.maturity_day = (instrument_def_msg_base + 368 + 1) % 256;
  instrument_def_msg_record.maturity_week = (instrument_def_msg_base + 369 + 1) % 256;
  instrument_def_msg_record.user_defined_instrument = (instrument_def_msg_base + 370 + 1) % 256;
  instrument_def_msg_record.contract_multiplier_unit = (instrument_def_msg_base + 371 + 1) % 256;
  instrument_def_msg_record.flow_schedule_type = (instrument_def_msg_base + 372 + 1) % 256;
  instrument_def_msg_record.tick_rule = (instrument_def_msg_base + 373 + 1) % 256;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 10 -> instrument_def_msg_record.reserved_10[instrument_def_msg_at] = (instrument_def_msg_base + 374 + instrument_def_msg_at + 1) % 256; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Def Msg to the wire, 384 bytes from where the cursor stands */
inline encode_instrument_def_msg(instrument_def_msg_record) {
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.ts_recv[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.min_price_increment[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.display_factor[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.expiration[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.activation[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.high_limit_price[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.low_limit_price[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.max_price_variation[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.trading_reference_price[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.unit_of_measure_qty[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.min_price_increment_amount[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.price_ratio[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> wire[at] = instrument_def_msg_record.strike_price[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.inst_attrib_value[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.underlying_id[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.raw_instrument_id[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.market_depth_implied[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.market_depth[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.market_segment_id[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.max_trade_vol[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.min_lot_size[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.min_lot_size_block[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.min_lot_size_round_lot[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.min_trade_vol[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.contract_multiplier[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.decay_quantity[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.original_contract_size[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> wire[at] = instrument_def_msg_record.trading_reference_date[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> wire[at] = instrument_def_msg_record.appl_id[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> wire[at] = instrument_def_msg_record.maturity_year[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> wire[at] = instrument_def_msg_record.decay_start_date[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> wire[at] = instrument_def_msg_record.channel[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.currency[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.settl_currency[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 6 -> wire[at] = instrument_def_msg_record.secsubtype[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 71 -> wire[at] = instrument_def_msg_record.raw_symbol[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> wire[at] = instrument_def_msg_record.group[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 5 -> wire[at] = instrument_def_msg_record.exchange[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> wire[at] = instrument_def_msg_record.asset[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> wire[at] = instrument_def_msg_record.cfi[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> wire[at] = instrument_def_msg_record.security_type[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 31 -> wire[at] = instrument_def_msg_record.unit_of_measure[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> wire[at] = instrument_def_msg_record.underlying[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> wire[at] = instrument_def_msg_record.strike_price_currency[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  wire[at] = instrument_def_msg_record.instrument_class; at = at + 1;
  wire[at] = instrument_def_msg_record.match_algorithm; at = at + 1;
  wire[at] = instrument_def_msg_record.md_security_trading_status; at = at + 1;
  wire[at] = instrument_def_msg_record.main_fraction; at = at + 1;
  wire[at] = instrument_def_msg_record.price_display_format; at = at + 1;
  wire[at] = instrument_def_msg_record.settl_price_type; at = at + 1;
  wire[at] = instrument_def_msg_record.sub_fraction; at = at + 1;
  wire[at] = instrument_def_msg_record.underlying_product; at = at + 1;
  wire[at] = instrument_def_msg_record.security_update_action; at = at + 1;
  wire[at] = instrument_def_msg_record.maturity_month; at = at + 1;
  wire[at] = instrument_def_msg_record.maturity_day; at = at + 1;
  wire[at] = instrument_def_msg_record.maturity_week; at = at + 1;
  wire[at] = instrument_def_msg_record.user_defined_instrument; at = at + 1;
  wire[at] = instrument_def_msg_record.contract_multiplier_unit; at = at + 1;
  wire[at] = instrument_def_msg_record.flow_schedule_type; at = at + 1;
  wire[at] = instrument_def_msg_record.tick_rule; at = at + 1;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 10 -> wire[at] = instrument_def_msg_record.reserved_10[instrument_def_msg_at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Def Msg off the wire, 384 bytes from where the cursor stands */
inline decode_instrument_def_msg(instrument_def_msg_record) {
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.ts_recv[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.display_factor[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.expiration[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.activation[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.high_limit_price[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.low_limit_price[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.max_price_variation[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.trading_reference_price[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.unit_of_measure_qty[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.min_price_increment_amount[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.price_ratio[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> instrument_def_msg_record.strike_price[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.inst_attrib_value[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.underlying_id[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.raw_instrument_id[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth_implied[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_depth[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.market_segment_id[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.max_trade_vol[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_block[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_lot_size_round_lot[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.min_trade_vol[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.contract_multiplier[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.decay_quantity[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.original_contract_size[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.trading_reference_date[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.appl_id[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.maturity_year[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.decay_start_date[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> instrument_def_msg_record.channel[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.currency[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.settl_currency[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 6 -> instrument_def_msg_record.secsubtype[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 71 -> instrument_def_msg_record.raw_symbol[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.group[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 5 -> instrument_def_msg_record.exchange[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.asset[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.cfi[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> instrument_def_msg_record.security_type[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 31 -> instrument_def_msg_record.unit_of_measure[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> instrument_def_msg_record.underlying[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> instrument_def_msg_record.strike_price_currency[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_record.instrument_class = wire[at]; at = at + 1;
  instrument_def_msg_record.match_algorithm = wire[at]; at = at + 1;
  instrument_def_msg_record.md_security_trading_status = wire[at]; at = at + 1;
  instrument_def_msg_record.main_fraction = wire[at]; at = at + 1;
  instrument_def_msg_record.price_display_format = wire[at]; at = at + 1;
  instrument_def_msg_record.settl_price_type = wire[at]; at = at + 1;
  instrument_def_msg_record.sub_fraction = wire[at]; at = at + 1;
  instrument_def_msg_record.underlying_product = wire[at]; at = at + 1;
  instrument_def_msg_record.security_update_action = wire[at]; at = at + 1;
  instrument_def_msg_record.maturity_month = wire[at]; at = at + 1;
  instrument_def_msg_record.maturity_day = wire[at]; at = at + 1;
  instrument_def_msg_record.maturity_week = wire[at]; at = at + 1;
  instrument_def_msg_record.user_defined_instrument = wire[at]; at = at + 1;
  instrument_def_msg_record.contract_multiplier_unit = wire[at]; at = at + 1;
  instrument_def_msg_record.flow_schedule_type = wire[at]; at = at + 1;
  instrument_def_msg_record.tick_rule = wire[at]; at = at + 1;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 10 -> instrument_def_msg_record.reserved_10[instrument_def_msg_at] = wire[at]; at = at + 1; instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Def Msg is what was written, byte for byte */
inline equal_instrument_def_msg(instrument_def_msg_read, instrument_def_msg_written) {
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.ts_recv[instrument_def_msg_at] == instrument_def_msg_written.ts_recv[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.min_price_increment[instrument_def_msg_at] == instrument_def_msg_written.min_price_increment[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.display_factor[instrument_def_msg_at] == instrument_def_msg_written.display_factor[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.expiration[instrument_def_msg_at] == instrument_def_msg_written.expiration[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.activation[instrument_def_msg_at] == instrument_def_msg_written.activation[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.high_limit_price[instrument_def_msg_at] == instrument_def_msg_written.high_limit_price[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.low_limit_price[instrument_def_msg_at] == instrument_def_msg_written.low_limit_price[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.max_price_variation[instrument_def_msg_at] == instrument_def_msg_written.max_price_variation[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.trading_reference_price[instrument_def_msg_at] == instrument_def_msg_written.trading_reference_price[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.unit_of_measure_qty[instrument_def_msg_at] == instrument_def_msg_written.unit_of_measure_qty[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.min_price_increment_amount[instrument_def_msg_at] == instrument_def_msg_written.min_price_increment_amount[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.price_ratio[instrument_def_msg_at] == instrument_def_msg_written.price_ratio[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 8 -> assert(instrument_def_msg_read.strike_price[instrument_def_msg_at] == instrument_def_msg_written.strike_price[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.inst_attrib_value[instrument_def_msg_at] == instrument_def_msg_written.inst_attrib_value[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.underlying_id[instrument_def_msg_at] == instrument_def_msg_written.underlying_id[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.raw_instrument_id[instrument_def_msg_at] == instrument_def_msg_written.raw_instrument_id[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.market_depth_implied[instrument_def_msg_at] == instrument_def_msg_written.market_depth_implied[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.market_depth[instrument_def_msg_at] == instrument_def_msg_written.market_depth[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.market_segment_id[instrument_def_msg_at] == instrument_def_msg_written.market_segment_id[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.max_trade_vol[instrument_def_msg_at] == instrument_def_msg_written.max_trade_vol[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.min_lot_size[instrument_def_msg_at] == instrument_def_msg_written.min_lot_size[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.min_lot_size_block[instrument_def_msg_at] == instrument_def_msg_written.min_lot_size_block[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.min_lot_size_round_lot[instrument_def_msg_at] == instrument_def_msg_written.min_lot_size_round_lot[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.min_trade_vol[instrument_def_msg_at] == instrument_def_msg_written.min_trade_vol[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.contract_multiplier[instrument_def_msg_at] == instrument_def_msg_written.contract_multiplier[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.decay_quantity[instrument_def_msg_at] == instrument_def_msg_written.decay_quantity[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.original_contract_size[instrument_def_msg_at] == instrument_def_msg_written.original_contract_size[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> assert(instrument_def_msg_read.trading_reference_date[instrument_def_msg_at] == instrument_def_msg_written.trading_reference_date[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> assert(instrument_def_msg_read.appl_id[instrument_def_msg_at] == instrument_def_msg_written.appl_id[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> assert(instrument_def_msg_read.maturity_year[instrument_def_msg_at] == instrument_def_msg_written.maturity_year[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> assert(instrument_def_msg_read.decay_start_date[instrument_def_msg_at] == instrument_def_msg_written.decay_start_date[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 2 -> assert(instrument_def_msg_read.channel[instrument_def_msg_at] == instrument_def_msg_written.channel[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.currency[instrument_def_msg_at] == instrument_def_msg_written.currency[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.settl_currency[instrument_def_msg_at] == instrument_def_msg_written.settl_currency[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 6 -> assert(instrument_def_msg_read.secsubtype[instrument_def_msg_at] == instrument_def_msg_written.secsubtype[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 71 -> assert(instrument_def_msg_read.raw_symbol[instrument_def_msg_at] == instrument_def_msg_written.raw_symbol[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> assert(instrument_def_msg_read.group[instrument_def_msg_at] == instrument_def_msg_written.group[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 5 -> assert(instrument_def_msg_read.exchange[instrument_def_msg_at] == instrument_def_msg_written.exchange[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> assert(instrument_def_msg_read.asset[instrument_def_msg_at] == instrument_def_msg_written.asset[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> assert(instrument_def_msg_read.cfi[instrument_def_msg_at] == instrument_def_msg_written.cfi[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 7 -> assert(instrument_def_msg_read.security_type[instrument_def_msg_at] == instrument_def_msg_written.security_type[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 31 -> assert(instrument_def_msg_read.unit_of_measure[instrument_def_msg_at] == instrument_def_msg_written.unit_of_measure[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 21 -> assert(instrument_def_msg_read.underlying[instrument_def_msg_at] == instrument_def_msg_written.underlying[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 4 -> assert(instrument_def_msg_read.strike_price_currency[instrument_def_msg_at] == instrument_def_msg_written.strike_price_currency[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  assert(instrument_def_msg_read.instrument_class == instrument_def_msg_written.instrument_class);
  assert(instrument_def_msg_read.match_algorithm == instrument_def_msg_written.match_algorithm);
  assert(instrument_def_msg_read.md_security_trading_status == instrument_def_msg_written.md_security_trading_status);
  assert(instrument_def_msg_read.main_fraction == instrument_def_msg_written.main_fraction);
  assert(instrument_def_msg_read.price_display_format == instrument_def_msg_written.price_display_format);
  assert(instrument_def_msg_read.settl_price_type == instrument_def_msg_written.settl_price_type);
  assert(instrument_def_msg_read.sub_fraction == instrument_def_msg_written.sub_fraction);
  assert(instrument_def_msg_read.underlying_product == instrument_def_msg_written.underlying_product);
  assert(instrument_def_msg_read.security_update_action == instrument_def_msg_written.security_update_action);
  assert(instrument_def_msg_read.maturity_month == instrument_def_msg_written.maturity_month);
  assert(instrument_def_msg_read.maturity_day == instrument_def_msg_written.maturity_day);
  assert(instrument_def_msg_read.maturity_week == instrument_def_msg_written.maturity_week);
  assert(instrument_def_msg_read.user_defined_instrument == instrument_def_msg_written.user_defined_instrument);
  assert(instrument_def_msg_read.contract_multiplier_unit == instrument_def_msg_written.contract_multiplier_unit);
  assert(instrument_def_msg_read.flow_schedule_type == instrument_def_msg_written.flow_schedule_type);
  assert(instrument_def_msg_read.tick_rule == instrument_def_msg_written.tick_rule);
  instrument_def_msg_at = 0;
  do
  :: instrument_def_msg_at < 10 -> assert(instrument_def_msg_read.reserved_10[instrument_def_msg_at] == instrument_def_msg_written.reserved_10[instrument_def_msg_at]); instrument_def_msg_at = instrument_def_msg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Imbalance Msg: 96 bytes ------------------------------------------------- */

/* An auction imbalance message; the record of the imbalance schema */
typedef ImbalanceMsg {
  byte ts_recv[8];
  byte ref_price[8];
  byte auction_time[8];
  byte cont_book_clr_price[8];
  byte auct_interest_clr_price[8];
  byte ssr_filling_price[8];
  byte ind_match_price[8];
  byte upper_collar[8];
  byte lower_collar[8];
  byte paired_qty[4];
  byte total_imbalance_qty[4];
  byte market_imbalance_qty[4];
  byte unpaired_qty[4];
  byte auction_type;
  byte side;
  byte auction_status;
  byte freeze_status;
  byte num_extensions;
  byte unpaired_side;
  byte significant_imbalance;
  byte reserved_1
};

int imbalance_msg_at;

/* every byte of Imbalance Msg set to one value */
inline fill_imbalance_msg(imbalance_msg_record, imbalance_msg_value) {
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ts_recv[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ref_price[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auction_time[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.cont_book_clr_price[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auct_interest_clr_price[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ssr_filling_price[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ind_match_price[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.upper_collar[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.lower_collar[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.paired_qty[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.total_imbalance_qty[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.market_imbalance_qty[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.unpaired_qty[imbalance_msg_at] = imbalance_msg_value; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_record.auction_type = imbalance_msg_value;
  imbalance_msg_record.side = imbalance_msg_value;
  imbalance_msg_record.auction_status = imbalance_msg_value;
  imbalance_msg_record.freeze_status = imbalance_msg_value;
  imbalance_msg_record.num_extensions = imbalance_msg_value;
  imbalance_msg_record.unpaired_side = imbalance_msg_value;
  imbalance_msg_record.significant_imbalance = imbalance_msg_value;
  imbalance_msg_record.reserved_1 = imbalance_msg_value;
  skip
}

/* each byte of Imbalance Msg set to where it lies, so a field read out of place says so */
inline ramp_imbalance_msg(imbalance_msg_record, imbalance_msg_base) {
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ts_recv[imbalance_msg_at] = (imbalance_msg_base + 0 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ref_price[imbalance_msg_at] = (imbalance_msg_base + 8 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auction_time[imbalance_msg_at] = (imbalance_msg_base + 16 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.cont_book_clr_price[imbalance_msg_at] = (imbalance_msg_base + 24 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auct_interest_clr_price[imbalance_msg_at] = (imbalance_msg_base + 32 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ssr_filling_price[imbalance_msg_at] = (imbalance_msg_base + 40 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ind_match_price[imbalance_msg_at] = (imbalance_msg_base + 48 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.upper_collar[imbalance_msg_at] = (imbalance_msg_base + 56 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.lower_collar[imbalance_msg_at] = (imbalance_msg_base + 64 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.paired_qty[imbalance_msg_at] = (imbalance_msg_base + 72 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.total_imbalance_qty[imbalance_msg_at] = (imbalance_msg_base + 76 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.market_imbalance_qty[imbalance_msg_at] = (imbalance_msg_base + 80 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.unpaired_qty[imbalance_msg_at] = (imbalance_msg_base + 84 + imbalance_msg_at + 1) % 256; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_record.auction_type = (imbalance_msg_base + 88 + 1) % 256;
  imbalance_msg_record.side = (imbalance_msg_base + 89 + 1) % 256;
  imbalance_msg_record.auction_status = (imbalance_msg_base + 90 + 1) % 256;
  imbalance_msg_record.freeze_status = (imbalance_msg_base + 91 + 1) % 256;
  imbalance_msg_record.num_extensions = (imbalance_msg_base + 92 + 1) % 256;
  imbalance_msg_record.unpaired_side = (imbalance_msg_base + 93 + 1) % 256;
  imbalance_msg_record.significant_imbalance = (imbalance_msg_base + 94 + 1) % 256;
  imbalance_msg_record.reserved_1 = (imbalance_msg_base + 95 + 1) % 256;
  skip
}

/* Imbalance Msg to the wire, 96 bytes from where the cursor stands */
inline encode_imbalance_msg(imbalance_msg_record) {
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.ts_recv[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.ref_price[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.auction_time[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.cont_book_clr_price[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.auct_interest_clr_price[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.ssr_filling_price[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.ind_match_price[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.upper_collar[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> wire[at] = imbalance_msg_record.lower_collar[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> wire[at] = imbalance_msg_record.paired_qty[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> wire[at] = imbalance_msg_record.total_imbalance_qty[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> wire[at] = imbalance_msg_record.market_imbalance_qty[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> wire[at] = imbalance_msg_record.unpaired_qty[imbalance_msg_at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  wire[at] = imbalance_msg_record.auction_type; at = at + 1;
  wire[at] = imbalance_msg_record.side; at = at + 1;
  wire[at] = imbalance_msg_record.auction_status; at = at + 1;
  wire[at] = imbalance_msg_record.freeze_status; at = at + 1;
  wire[at] = imbalance_msg_record.num_extensions; at = at + 1;
  wire[at] = imbalance_msg_record.unpaired_side; at = at + 1;
  wire[at] = imbalance_msg_record.significant_imbalance; at = at + 1;
  wire[at] = imbalance_msg_record.reserved_1; at = at + 1;
  skip
}

/* Imbalance Msg off the wire, 96 bytes from where the cursor stands */
inline decode_imbalance_msg(imbalance_msg_record) {
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ts_recv[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ref_price[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auction_time[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.cont_book_clr_price[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.auct_interest_clr_price[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ssr_filling_price[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.ind_match_price[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.upper_collar[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> imbalance_msg_record.lower_collar[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.paired_qty[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.total_imbalance_qty[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.market_imbalance_qty[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> imbalance_msg_record.unpaired_qty[imbalance_msg_at] = wire[at]; at = at + 1; imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_record.auction_type = wire[at]; at = at + 1;
  imbalance_msg_record.side = wire[at]; at = at + 1;
  imbalance_msg_record.auction_status = wire[at]; at = at + 1;
  imbalance_msg_record.freeze_status = wire[at]; at = at + 1;
  imbalance_msg_record.num_extensions = wire[at]; at = at + 1;
  imbalance_msg_record.unpaired_side = wire[at]; at = at + 1;
  imbalance_msg_record.significant_imbalance = wire[at]; at = at + 1;
  imbalance_msg_record.reserved_1 = wire[at]; at = at + 1;
  skip
}

/* what was read of Imbalance Msg is what was written, byte for byte */
inline equal_imbalance_msg(imbalance_msg_read, imbalance_msg_written) {
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.ts_recv[imbalance_msg_at] == imbalance_msg_written.ts_recv[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.ref_price[imbalance_msg_at] == imbalance_msg_written.ref_price[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.auction_time[imbalance_msg_at] == imbalance_msg_written.auction_time[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.cont_book_clr_price[imbalance_msg_at] == imbalance_msg_written.cont_book_clr_price[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.auct_interest_clr_price[imbalance_msg_at] == imbalance_msg_written.auct_interest_clr_price[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.ssr_filling_price[imbalance_msg_at] == imbalance_msg_written.ssr_filling_price[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.ind_match_price[imbalance_msg_at] == imbalance_msg_written.ind_match_price[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.upper_collar[imbalance_msg_at] == imbalance_msg_written.upper_collar[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 8 -> assert(imbalance_msg_read.lower_collar[imbalance_msg_at] == imbalance_msg_written.lower_collar[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> assert(imbalance_msg_read.paired_qty[imbalance_msg_at] == imbalance_msg_written.paired_qty[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> assert(imbalance_msg_read.total_imbalance_qty[imbalance_msg_at] == imbalance_msg_written.total_imbalance_qty[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> assert(imbalance_msg_read.market_imbalance_qty[imbalance_msg_at] == imbalance_msg_written.market_imbalance_qty[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  imbalance_msg_at = 0;
  do
  :: imbalance_msg_at < 4 -> assert(imbalance_msg_read.unpaired_qty[imbalance_msg_at] == imbalance_msg_written.unpaired_qty[imbalance_msg_at]); imbalance_msg_at = imbalance_msg_at + 1
  :: else -> break
  od;
  assert(imbalance_msg_read.auction_type == imbalance_msg_written.auction_type);
  assert(imbalance_msg_read.side == imbalance_msg_written.side);
  assert(imbalance_msg_read.auction_status == imbalance_msg_written.auction_status);
  assert(imbalance_msg_read.freeze_status == imbalance_msg_written.freeze_status);
  assert(imbalance_msg_read.num_extensions == imbalance_msg_written.num_extensions);
  assert(imbalance_msg_read.unpaired_side == imbalance_msg_written.unpaired_side);
  assert(imbalance_msg_read.significant_imbalance == imbalance_msg_written.significant_imbalance);
  assert(imbalance_msg_read.reserved_1 == imbalance_msg_written.reserved_1);
  skip
}

/* ---- Error Msg: 304 bytes ---------------------------------------------------- */

/* An error message from the Databento Live Subscription Gateway (LSG) */
typedef ErrorMsg {
  byte err[302];
  byte error_code;
  byte is_last
};

int error_msg_at;

/* every byte of Error Msg set to one value */
inline fill_error_msg(error_msg_record, error_msg_value) {
  error_msg_at = 0;
  do
  :: error_msg_at < 302 -> error_msg_record.err[error_msg_at] = error_msg_value; error_msg_at = error_msg_at + 1
  :: else -> break
  od;
  error_msg_record.error_code = error_msg_value;
  error_msg_record.is_last = error_msg_value;
  skip
}

/* each byte of Error Msg set to where it lies, so a field read out of place says so */
inline ramp_error_msg(error_msg_record, error_msg_base) {
  error_msg_at = 0;
  do
  :: error_msg_at < 302 -> error_msg_record.err[error_msg_at] = (error_msg_base + 0 + error_msg_at + 1) % 256; error_msg_at = error_msg_at + 1
  :: else -> break
  od;
  error_msg_record.error_code = (error_msg_base + 302 + 1) % 256;
  error_msg_record.is_last = (error_msg_base + 303 + 1) % 256;
  skip
}

/* Error Msg to the wire, 304 bytes from where the cursor stands */
inline encode_error_msg(error_msg_record) {
  error_msg_at = 0;
  do
  :: error_msg_at < 302 -> wire[at] = error_msg_record.err[error_msg_at]; at = at + 1; error_msg_at = error_msg_at + 1
  :: else -> break
  od;
  wire[at] = error_msg_record.error_code; at = at + 1;
  wire[at] = error_msg_record.is_last; at = at + 1;
  skip
}

/* Error Msg off the wire, 304 bytes from where the cursor stands */
inline decode_error_msg(error_msg_record) {
  error_msg_at = 0;
  do
  :: error_msg_at < 302 -> error_msg_record.err[error_msg_at] = wire[at]; at = at + 1; error_msg_at = error_msg_at + 1
  :: else -> break
  od;
  error_msg_record.error_code = wire[at]; at = at + 1;
  error_msg_record.is_last = wire[at]; at = at + 1;
  skip
}

/* what was read of Error Msg is what was written, byte for byte */
inline equal_error_msg(error_msg_read, error_msg_written) {
  error_msg_at = 0;
  do
  :: error_msg_at < 302 -> assert(error_msg_read.err[error_msg_at] == error_msg_written.err[error_msg_at]); error_msg_at = error_msg_at + 1
  :: else -> break
  od;
  assert(error_msg_read.error_code == error_msg_written.error_code);
  assert(error_msg_read.is_last == error_msg_written.is_last);
  skip
}

/* ---- Symbol Mapping Msg: 160 bytes ------------------------------------------- */

/* A symbol mapping message, which maps a symbol of one SType to another */
typedef SymbolMappingMsg {
  byte stype_in;
  byte stype_in_symbol[71];
  byte stype_out;
  byte stype_out_symbol[71];
  byte start_ts[8];
  byte end_ts[8]
};

int symbol_mapping_msg_at;

/* every byte of Symbol Mapping Msg set to one value */
inline fill_symbol_mapping_msg(symbol_mapping_msg_record, symbol_mapping_msg_value) {
  symbol_mapping_msg_record.stype_in = symbol_mapping_msg_value;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_in_symbol[symbol_mapping_msg_at] = symbol_mapping_msg_value; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_record.stype_out = symbol_mapping_msg_value;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_out_symbol[symbol_mapping_msg_at] = symbol_mapping_msg_value; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.start_ts[symbol_mapping_msg_at] = symbol_mapping_msg_value; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.end_ts[symbol_mapping_msg_at] = symbol_mapping_msg_value; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Symbol Mapping Msg set to where it lies, so a field read out of place says so */
inline ramp_symbol_mapping_msg(symbol_mapping_msg_record, symbol_mapping_msg_base) {
  symbol_mapping_msg_record.stype_in = (symbol_mapping_msg_base + 0 + 1) % 256;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_in_symbol[symbol_mapping_msg_at] = (symbol_mapping_msg_base + 1 + symbol_mapping_msg_at + 1) % 256; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_record.stype_out = (symbol_mapping_msg_base + 72 + 1) % 256;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_out_symbol[symbol_mapping_msg_at] = (symbol_mapping_msg_base + 73 + symbol_mapping_msg_at + 1) % 256; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.start_ts[symbol_mapping_msg_at] = (symbol_mapping_msg_base + 144 + symbol_mapping_msg_at + 1) % 256; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.end_ts[symbol_mapping_msg_at] = (symbol_mapping_msg_base + 152 + symbol_mapping_msg_at + 1) % 256; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Msg to the wire, 160 bytes from where the cursor stands */
inline encode_symbol_mapping_msg(symbol_mapping_msg_record) {
  wire[at] = symbol_mapping_msg_record.stype_in; at = at + 1;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> wire[at] = symbol_mapping_msg_record.stype_in_symbol[symbol_mapping_msg_at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  wire[at] = symbol_mapping_msg_record.stype_out; at = at + 1;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> wire[at] = symbol_mapping_msg_record.stype_out_symbol[symbol_mapping_msg_at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> wire[at] = symbol_mapping_msg_record.start_ts[symbol_mapping_msg_at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> wire[at] = symbol_mapping_msg_record.end_ts[symbol_mapping_msg_at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Symbol Mapping Msg off the wire, 160 bytes from where the cursor stands */
inline decode_symbol_mapping_msg(symbol_mapping_msg_record) {
  symbol_mapping_msg_record.stype_in = wire[at]; at = at + 1;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_in_symbol[symbol_mapping_msg_at] = wire[at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_record.stype_out = wire[at]; at = at + 1;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> symbol_mapping_msg_record.stype_out_symbol[symbol_mapping_msg_at] = wire[at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.start_ts[symbol_mapping_msg_at] = wire[at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> symbol_mapping_msg_record.end_ts[symbol_mapping_msg_at] = wire[at]; at = at + 1; symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Symbol Mapping Msg is what was written, byte for byte */
inline equal_symbol_mapping_msg(symbol_mapping_msg_read, symbol_mapping_msg_written) {
  assert(symbol_mapping_msg_read.stype_in == symbol_mapping_msg_written.stype_in);
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> assert(symbol_mapping_msg_read.stype_in_symbol[symbol_mapping_msg_at] == symbol_mapping_msg_written.stype_in_symbol[symbol_mapping_msg_at]); symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  assert(symbol_mapping_msg_read.stype_out == symbol_mapping_msg_written.stype_out);
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 71 -> assert(symbol_mapping_msg_read.stype_out_symbol[symbol_mapping_msg_at] == symbol_mapping_msg_written.stype_out_symbol[symbol_mapping_msg_at]); symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> assert(symbol_mapping_msg_read.start_ts[symbol_mapping_msg_at] == symbol_mapping_msg_written.start_ts[symbol_mapping_msg_at]); symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  symbol_mapping_msg_at = 0;
  do
  :: symbol_mapping_msg_at < 8 -> assert(symbol_mapping_msg_read.end_ts[symbol_mapping_msg_at] == symbol_mapping_msg_written.end_ts[symbol_mapping_msg_at]); symbol_mapping_msg_at = symbol_mapping_msg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- System Msg: 304 bytes --------------------------------------------------- */

/* A non-error message from the Databento Live Subscription Gateway (LSG); also used for heartbeating */
typedef SystemMsg {
  byte msg[303];
  byte system_code
};

int system_msg_at;

/* every byte of System Msg set to one value */
inline fill_system_msg(system_msg_record, system_msg_value) {
  system_msg_at = 0;
  do
  :: system_msg_at < 303 -> system_msg_record.msg[system_msg_at] = system_msg_value; system_msg_at = system_msg_at + 1
  :: else -> break
  od;
  system_msg_record.system_code = system_msg_value;
  skip
}

/* each byte of System Msg set to where it lies, so a field read out of place says so */
inline ramp_system_msg(system_msg_record, system_msg_base) {
  system_msg_at = 0;
  do
  :: system_msg_at < 303 -> system_msg_record.msg[system_msg_at] = (system_msg_base + 0 + system_msg_at + 1) % 256; system_msg_at = system_msg_at + 1
  :: else -> break
  od;
  system_msg_record.system_code = (system_msg_base + 303 + 1) % 256;
  skip
}

/* System Msg to the wire, 304 bytes from where the cursor stands */
inline encode_system_msg(system_msg_record) {
  system_msg_at = 0;
  do
  :: system_msg_at < 303 -> wire[at] = system_msg_record.msg[system_msg_at]; at = at + 1; system_msg_at = system_msg_at + 1
  :: else -> break
  od;
  wire[at] = system_msg_record.system_code; at = at + 1;
  skip
}

/* System Msg off the wire, 304 bytes from where the cursor stands */
inline decode_system_msg(system_msg_record) {
  system_msg_at = 0;
  do
  :: system_msg_at < 303 -> system_msg_record.msg[system_msg_at] = wire[at]; at = at + 1; system_msg_at = system_msg_at + 1
  :: else -> break
  od;
  system_msg_record.system_code = wire[at]; at = at + 1;
  skip
}

/* what was read of System Msg is what was written, byte for byte */
inline equal_system_msg(system_msg_read, system_msg_written) {
  system_msg_at = 0;
  do
  :: system_msg_at < 303 -> assert(system_msg_read.msg[system_msg_at] == system_msg_written.msg[system_msg_at]); system_msg_at = system_msg_at + 1
  :: else -> break
  od;
  assert(system_msg_read.system_code == system_msg_written.system_code);
  skip
}

/* ---- Stat Msg: 48 bytes ------------------------------------------------------ */

/* A statistics message; the record of the statistics schema */
typedef StatMsg {
  byte ts_recv[8];
  byte ts_ref[8];
  byte price[8];
  byte quantity[4];
  byte sequence[4];
  byte ts_in_delta[4];
  byte stat_type[2];
  byte channel[2];
  byte update_action;
  byte stat_flags;
  byte reserved_6[6]
};

int stat_msg_at;

/* every byte of Stat Msg set to one value */
inline fill_stat_msg(stat_msg_record, stat_msg_value) {
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_recv[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_ref[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.price[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.quantity[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.sequence[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.ts_in_delta[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.stat_type[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.channel[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_record.update_action = stat_msg_value;
  stat_msg_record.stat_flags = stat_msg_value;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 6 -> stat_msg_record.reserved_6[stat_msg_at] = stat_msg_value; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Stat Msg set to where it lies, so a field read out of place says so */
inline ramp_stat_msg(stat_msg_record, stat_msg_base) {
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_recv[stat_msg_at] = (stat_msg_base + 0 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_ref[stat_msg_at] = (stat_msg_base + 8 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.price[stat_msg_at] = (stat_msg_base + 16 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.quantity[stat_msg_at] = (stat_msg_base + 24 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.sequence[stat_msg_at] = (stat_msg_base + 28 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.ts_in_delta[stat_msg_at] = (stat_msg_base + 32 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.stat_type[stat_msg_at] = (stat_msg_base + 36 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.channel[stat_msg_at] = (stat_msg_base + 38 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_record.update_action = (stat_msg_base + 40 + 1) % 256;
  stat_msg_record.stat_flags = (stat_msg_base + 41 + 1) % 256;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 6 -> stat_msg_record.reserved_6[stat_msg_at] = (stat_msg_base + 42 + stat_msg_at + 1) % 256; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Stat Msg to the wire, 48 bytes from where the cursor stands */
inline encode_stat_msg(stat_msg_record) {
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> wire[at] = stat_msg_record.ts_recv[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> wire[at] = stat_msg_record.ts_ref[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> wire[at] = stat_msg_record.price[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> wire[at] = stat_msg_record.quantity[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> wire[at] = stat_msg_record.sequence[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> wire[at] = stat_msg_record.ts_in_delta[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> wire[at] = stat_msg_record.stat_type[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> wire[at] = stat_msg_record.channel[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  wire[at] = stat_msg_record.update_action; at = at + 1;
  wire[at] = stat_msg_record.stat_flags; at = at + 1;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 6 -> wire[at] = stat_msg_record.reserved_6[stat_msg_at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  skip
}

/* Stat Msg off the wire, 48 bytes from where the cursor stands */
inline decode_stat_msg(stat_msg_record) {
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_recv[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.ts_ref[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> stat_msg_record.price[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.quantity[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.sequence[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> stat_msg_record.ts_in_delta[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.stat_type[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> stat_msg_record.channel[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_record.update_action = wire[at]; at = at + 1;
  stat_msg_record.stat_flags = wire[at]; at = at + 1;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 6 -> stat_msg_record.reserved_6[stat_msg_at] = wire[at]; at = at + 1; stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Stat Msg is what was written, byte for byte */
inline equal_stat_msg(stat_msg_read, stat_msg_written) {
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> assert(stat_msg_read.ts_recv[stat_msg_at] == stat_msg_written.ts_recv[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> assert(stat_msg_read.ts_ref[stat_msg_at] == stat_msg_written.ts_ref[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 8 -> assert(stat_msg_read.price[stat_msg_at] == stat_msg_written.price[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> assert(stat_msg_read.quantity[stat_msg_at] == stat_msg_written.quantity[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> assert(stat_msg_read.sequence[stat_msg_at] == stat_msg_written.sequence[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 4 -> assert(stat_msg_read.ts_in_delta[stat_msg_at] == stat_msg_written.ts_in_delta[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> assert(stat_msg_read.stat_type[stat_msg_at] == stat_msg_written.stat_type[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  stat_msg_at = 0;
  do
  :: stat_msg_at < 2 -> assert(stat_msg_read.channel[stat_msg_at] == stat_msg_written.channel[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  assert(stat_msg_read.update_action == stat_msg_written.update_action);
  assert(stat_msg_read.stat_flags == stat_msg_written.stat_flags);
  stat_msg_at = 0;
  do
  :: stat_msg_at < 6 -> assert(stat_msg_read.reserved_6[stat_msg_at] == stat_msg_written.reserved_6[stat_msg_at]); stat_msg_at = stat_msg_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Consolidated Bid Ask Pair: 32 bytes ------------------------------------- */

/* A price level consolidated from multiple venues */
typedef ConsolidatedBidAskPair {
  byte bid_px[8];
  byte ask_px[8];
  byte bid_sz[4];
  byte ask_sz[4];
  byte bid_pb[2];
  byte reserved_2[2];
  byte ask_pb[2];
  byte second_reserved_2[2]
};

int consolidated_bid_ask_pair_at;

/* every byte of Consolidated Bid Ask Pair set to one value */
inline fill_consolidated_bid_ask_pair(consolidated_bid_ask_pair_record, consolidated_bid_ask_pair_value) {
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.bid_px[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.ask_px[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.bid_sz[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.ask_sz[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.bid_pb[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.reserved_2[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.ask_pb[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.second_reserved_2[consolidated_bid_ask_pair_at] = consolidated_bid_ask_pair_value; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Consolidated Bid Ask Pair set to where it lies, so a field read out of place says so */
inline ramp_consolidated_bid_ask_pair(consolidated_bid_ask_pair_record, consolidated_bid_ask_pair_base) {
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.bid_px[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 0 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.ask_px[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 8 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.bid_sz[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 16 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.ask_sz[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 20 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.bid_pb[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 24 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.reserved_2[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 26 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.ask_pb[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 28 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.second_reserved_2[consolidated_bid_ask_pair_at] = (consolidated_bid_ask_pair_base + 30 + consolidated_bid_ask_pair_at + 1) % 256; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Bid Ask Pair to the wire, 32 bytes from where the cursor stands */
inline encode_consolidated_bid_ask_pair(consolidated_bid_ask_pair_record) {
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> wire[at] = consolidated_bid_ask_pair_record.bid_px[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> wire[at] = consolidated_bid_ask_pair_record.ask_px[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> wire[at] = consolidated_bid_ask_pair_record.bid_sz[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> wire[at] = consolidated_bid_ask_pair_record.ask_sz[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> wire[at] = consolidated_bid_ask_pair_record.bid_pb[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> wire[at] = consolidated_bid_ask_pair_record.reserved_2[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> wire[at] = consolidated_bid_ask_pair_record.ask_pb[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> wire[at] = consolidated_bid_ask_pair_record.second_reserved_2[consolidated_bid_ask_pair_at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* Consolidated Bid Ask Pair off the wire, 32 bytes from where the cursor stands */
inline decode_consolidated_bid_ask_pair(consolidated_bid_ask_pair_record) {
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.bid_px[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> consolidated_bid_ask_pair_record.ask_px[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.bid_sz[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> consolidated_bid_ask_pair_record.ask_sz[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.bid_pb[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.reserved_2[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.ask_pb[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> consolidated_bid_ask_pair_record.second_reserved_2[consolidated_bid_ask_pair_at] = wire[at]; at = at + 1; consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Consolidated Bid Ask Pair is what was written, byte for byte */
inline equal_consolidated_bid_ask_pair(consolidated_bid_ask_pair_read, consolidated_bid_ask_pair_written) {
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> assert(consolidated_bid_ask_pair_read.bid_px[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.bid_px[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 8 -> assert(consolidated_bid_ask_pair_read.ask_px[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.ask_px[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> assert(consolidated_bid_ask_pair_read.bid_sz[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.bid_sz[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 4 -> assert(consolidated_bid_ask_pair_read.ask_sz[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.ask_sz[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> assert(consolidated_bid_ask_pair_read.bid_pb[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.bid_pb[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> assert(consolidated_bid_ask_pair_read.reserved_2[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.reserved_2[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> assert(consolidated_bid_ask_pair_read.ask_pb[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.ask_pb[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  consolidated_bid_ask_pair_at = 0;
  do
  :: consolidated_bid_ask_pair_at < 2 -> assert(consolidated_bid_ask_pair_read.second_reserved_2[consolidated_bid_ask_pair_at] == consolidated_bid_ask_pair_written.second_reserved_2[consolidated_bid_ask_pair_at]); consolidated_bid_ask_pair_at = consolidated_bid_ask_pair_at + 1
  :: else -> break
  od;
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Record Header: encoded, read back, and compared */
proctype check_record_header() {
  RecordHeader record_header_sent;
  RecordHeader record_header_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_record_header(record_header_sent, 0)
  :: pattern == 1 -> fill_record_header(record_header_sent, 32)
  :: pattern == 2 -> fill_record_header(record_header_sent, 255)
  :: else -> ramp_record_header(record_header_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_record_header(record_header_sent);
    assert(at == 16);
    at = 0;
    decode_record_header(record_header_got);
    assert(at == 16);
    equal_record_header(record_header_got, record_header_sent)
  }
}

/* Bid Ask Pair: encoded, read back, and compared */
proctype check_bid_ask_pair() {
  BidAskPair bid_ask_pair_sent;
  BidAskPair bid_ask_pair_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_ask_pair(bid_ask_pair_sent, 0)
  :: pattern == 1 -> fill_bid_ask_pair(bid_ask_pair_sent, 32)
  :: pattern == 2 -> fill_bid_ask_pair(bid_ask_pair_sent, 255)
  :: else -> ramp_bid_ask_pair(bid_ask_pair_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_ask_pair(bid_ask_pair_sent);
    assert(at == 32);
    at = 0;
    decode_bid_ask_pair(bid_ask_pair_got);
    assert(at == 32);
    equal_bid_ask_pair(bid_ask_pair_got, bid_ask_pair_sent)
  }
}

/* Ohlcv Msg: encoded, read back, and compared */
proctype check_ohlcv_msg() {
  OhlcvMsg ohlcv_msg_sent;
  OhlcvMsg ohlcv_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ohlcv_msg(ohlcv_msg_sent, 0)
  :: pattern == 1 -> fill_ohlcv_msg(ohlcv_msg_sent, 32)
  :: pattern == 2 -> fill_ohlcv_msg(ohlcv_msg_sent, 255)
  :: else -> ramp_ohlcv_msg(ohlcv_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ohlcv_msg(ohlcv_msg_sent);
    assert(at == 40);
    at = 0;
    decode_ohlcv_msg(ohlcv_msg_got);
    assert(at == 40);
    equal_ohlcv_msg(ohlcv_msg_got, ohlcv_msg_sent)
  }
}

/* Status Msg: encoded, read back, and compared */
proctype check_status_msg() {
  StatusMsg status_msg_sent;
  StatusMsg status_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_status_msg(status_msg_sent, 0)
  :: pattern == 1 -> fill_status_msg(status_msg_sent, 32)
  :: pattern == 2 -> fill_status_msg(status_msg_sent, 255)
  :: else -> ramp_status_msg(status_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_status_msg(status_msg_sent);
    assert(at == 24);
    at = 0;
    decode_status_msg(status_msg_got);
    assert(at == 24);
    equal_status_msg(status_msg_got, status_msg_sent)
  }
}

/* Instrument Def Msg: encoded, read back, and compared */
proctype check_instrument_def_msg() {
  InstrumentDefMsg instrument_def_msg_sent;
  InstrumentDefMsg instrument_def_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_def_msg(instrument_def_msg_sent, 0)
  :: pattern == 1 -> fill_instrument_def_msg(instrument_def_msg_sent, 32)
  :: pattern == 2 -> fill_instrument_def_msg(instrument_def_msg_sent, 255)
  :: else -> ramp_instrument_def_msg(instrument_def_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_def_msg(instrument_def_msg_sent);
    assert(at == 384);
    at = 0;
    decode_instrument_def_msg(instrument_def_msg_got);
    assert(at == 384);
    equal_instrument_def_msg(instrument_def_msg_got, instrument_def_msg_sent)
  }
}

/* Imbalance Msg: encoded, read back, and compared */
proctype check_imbalance_msg() {
  ImbalanceMsg imbalance_msg_sent;
  ImbalanceMsg imbalance_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_imbalance_msg(imbalance_msg_sent, 0)
  :: pattern == 1 -> fill_imbalance_msg(imbalance_msg_sent, 32)
  :: pattern == 2 -> fill_imbalance_msg(imbalance_msg_sent, 255)
  :: else -> ramp_imbalance_msg(imbalance_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_imbalance_msg(imbalance_msg_sent);
    assert(at == 96);
    at = 0;
    decode_imbalance_msg(imbalance_msg_got);
    assert(at == 96);
    equal_imbalance_msg(imbalance_msg_got, imbalance_msg_sent)
  }
}

/* Error Msg: encoded, read back, and compared */
proctype check_error_msg() {
  ErrorMsg error_msg_sent;
  ErrorMsg error_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_error_msg(error_msg_sent, 0)
  :: pattern == 1 -> fill_error_msg(error_msg_sent, 32)
  :: pattern == 2 -> fill_error_msg(error_msg_sent, 255)
  :: else -> ramp_error_msg(error_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_error_msg(error_msg_sent);
    assert(at == 304);
    at = 0;
    decode_error_msg(error_msg_got);
    assert(at == 304);
    equal_error_msg(error_msg_got, error_msg_sent)
  }
}

/* Symbol Mapping Msg: encoded, read back, and compared */
proctype check_symbol_mapping_msg() {
  SymbolMappingMsg symbol_mapping_msg_sent;
  SymbolMappingMsg symbol_mapping_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_symbol_mapping_msg(symbol_mapping_msg_sent, 0)
  :: pattern == 1 -> fill_symbol_mapping_msg(symbol_mapping_msg_sent, 32)
  :: pattern == 2 -> fill_symbol_mapping_msg(symbol_mapping_msg_sent, 255)
  :: else -> ramp_symbol_mapping_msg(symbol_mapping_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_symbol_mapping_msg(symbol_mapping_msg_sent);
    assert(at == 160);
    at = 0;
    decode_symbol_mapping_msg(symbol_mapping_msg_got);
    assert(at == 160);
    equal_symbol_mapping_msg(symbol_mapping_msg_got, symbol_mapping_msg_sent)
  }
}

/* System Msg: encoded, read back, and compared */
proctype check_system_msg() {
  SystemMsg system_msg_sent;
  SystemMsg system_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_system_msg(system_msg_sent, 0)
  :: pattern == 1 -> fill_system_msg(system_msg_sent, 32)
  :: pattern == 2 -> fill_system_msg(system_msg_sent, 255)
  :: else -> ramp_system_msg(system_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_system_msg(system_msg_sent);
    assert(at == 304);
    at = 0;
    decode_system_msg(system_msg_got);
    assert(at == 304);
    equal_system_msg(system_msg_got, system_msg_sent)
  }
}

/* Stat Msg: encoded, read back, and compared */
proctype check_stat_msg() {
  StatMsg stat_msg_sent;
  StatMsg stat_msg_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_stat_msg(stat_msg_sent, 0)
  :: pattern == 1 -> fill_stat_msg(stat_msg_sent, 32)
  :: pattern == 2 -> fill_stat_msg(stat_msg_sent, 255)
  :: else -> ramp_stat_msg(stat_msg_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_stat_msg(stat_msg_sent);
    assert(at == 48);
    at = 0;
    decode_stat_msg(stat_msg_got);
    assert(at == 48);
    equal_stat_msg(stat_msg_got, stat_msg_sent)
  }
}

/* Consolidated Bid Ask Pair: encoded, read back, and compared */
proctype check_consolidated_bid_ask_pair() {
  ConsolidatedBidAskPair consolidated_bid_ask_pair_sent;
  ConsolidatedBidAskPair consolidated_bid_ask_pair_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_consolidated_bid_ask_pair(consolidated_bid_ask_pair_sent, 0)
  :: pattern == 1 -> fill_consolidated_bid_ask_pair(consolidated_bid_ask_pair_sent, 32)
  :: pattern == 2 -> fill_consolidated_bid_ask_pair(consolidated_bid_ask_pair_sent, 255)
  :: else -> ramp_consolidated_bid_ask_pair(consolidated_bid_ask_pair_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_consolidated_bid_ask_pair(consolidated_bid_ask_pair_sent);
    assert(at == 32);
    at = 0;
    decode_consolidated_bid_ask_pair(consolidated_bid_ask_pair_got);
    assert(at == 32);
    equal_consolidated_bid_ask_pair(consolidated_bid_ask_pair_got, consolidated_bid_ask_pair_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_record_header()
  :: run check_bid_ask_pair()
  :: run check_ohlcv_msg()
  :: run check_status_msg()
  :: run check_instrument_def_msg()
  :: run check_imbalance_msg()
  :: run check_error_msg()
  :: run check_symbol_mapping_msg()
  :: run check_system_msg()
  :: run check_stat_msg()
  :: run check_consolidated_bid_ask_pair()
  fi
}
