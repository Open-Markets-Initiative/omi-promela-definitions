/*
 * Coinbase Market Data Api
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
#define WIRE 49

/* the bytes a record is written to and read back from */
byte wire[WIRE];

/* where the next byte is written or read, so a nested record carries on from its holder */
int at;

/* ---- Logical Expiry: 8 bytes ------------------------------------------------- */

/* InstrumentMessage */
typedef LogicalExpiry {
  byte year[2];
  byte month[2];
  byte week_of_month[2];
  byte day_of_month[2]
};

int logical_expiry_at;

/* every byte of Logical Expiry set to one value */
inline fill_logical_expiry(logical_expiry_record, logical_expiry_value) {
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.year[logical_expiry_at] = logical_expiry_value; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.month[logical_expiry_at] = logical_expiry_value; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.week_of_month[logical_expiry_at] = logical_expiry_value; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.day_of_month[logical_expiry_at] = logical_expiry_value; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Logical Expiry set to where it lies, so a field read out of place says so */
inline ramp_logical_expiry(logical_expiry_record, logical_expiry_base) {
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.year[logical_expiry_at] = (logical_expiry_base + 0 + logical_expiry_at + 1) % 256; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.month[logical_expiry_at] = (logical_expiry_base + 2 + logical_expiry_at + 1) % 256; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.week_of_month[logical_expiry_at] = (logical_expiry_base + 4 + logical_expiry_at + 1) % 256; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.day_of_month[logical_expiry_at] = (logical_expiry_base + 6 + logical_expiry_at + 1) % 256; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  skip
}

/* Logical Expiry to the wire, 8 bytes from where the cursor stands */
inline encode_logical_expiry(logical_expiry_record) {
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> wire[at] = logical_expiry_record.year[logical_expiry_at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> wire[at] = logical_expiry_record.month[logical_expiry_at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> wire[at] = logical_expiry_record.week_of_month[logical_expiry_at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> wire[at] = logical_expiry_record.day_of_month[logical_expiry_at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  skip
}

/* Logical Expiry off the wire, 8 bytes from where the cursor stands */
inline decode_logical_expiry(logical_expiry_record) {
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.year[logical_expiry_at] = wire[at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.month[logical_expiry_at] = wire[at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.week_of_month[logical_expiry_at] = wire[at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> logical_expiry_record.day_of_month[logical_expiry_at] = wire[at]; at = at + 1; logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Logical Expiry is what was written, byte for byte */
inline equal_logical_expiry(logical_expiry_read, logical_expiry_written) {
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> assert(logical_expiry_read.year[logical_expiry_at] == logical_expiry_written.year[logical_expiry_at]); logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> assert(logical_expiry_read.month[logical_expiry_at] == logical_expiry_written.month[logical_expiry_at]); logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> assert(logical_expiry_read.week_of_month[logical_expiry_at] == logical_expiry_written.week_of_month[logical_expiry_at]); logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  logical_expiry_at = 0;
  do
  :: logical_expiry_at < 2 -> assert(logical_expiry_read.day_of_month[logical_expiry_at] == logical_expiry_written.day_of_month[logical_expiry_at]); logical_expiry_at = logical_expiry_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Trading Status Update Message: 9 bytes ---------------------------------- */

/* TradingStatusUpdateMessage */
typedef TradingStatusUpdateMessage {
  byte instrument_id[8];
  byte trading_status
};

int trading_status_update_message_at;

/* every byte of Trading Status Update Message set to one value */
inline fill_trading_status_update_message(trading_status_update_message_record, trading_status_update_message_value) {
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.instrument_id[trading_status_update_message_at] = trading_status_update_message_value; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = trading_status_update_message_value;
  skip
}

/* each byte of Trading Status Update Message set to where it lies, so a field read out of place says so */
inline ramp_trading_status_update_message(trading_status_update_message_record, trading_status_update_message_base) {
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.instrument_id[trading_status_update_message_at] = (trading_status_update_message_base + 0 + trading_status_update_message_at + 1) % 256; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = (trading_status_update_message_base + 8 + 1) % 256;
  skip
}

/* Trading Status Update Message to the wire, 9 bytes from where the cursor stands */
inline encode_trading_status_update_message(trading_status_update_message_record) {
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> wire[at] = trading_status_update_message_record.instrument_id[trading_status_update_message_at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  wire[at] = trading_status_update_message_record.trading_status; at = at + 1;
  skip
}

/* Trading Status Update Message off the wire, 9 bytes from where the cursor stands */
inline decode_trading_status_update_message(trading_status_update_message_record) {
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> trading_status_update_message_record.instrument_id[trading_status_update_message_at] = wire[at]; at = at + 1; trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  trading_status_update_message_record.trading_status = wire[at]; at = at + 1;
  skip
}

/* what was read of Trading Status Update Message is what was written, byte for byte */
inline equal_trading_status_update_message(trading_status_update_message_read, trading_status_update_message_written) {
  trading_status_update_message_at = 0;
  do
  :: trading_status_update_message_at < 8 -> assert(trading_status_update_message_read.instrument_id[trading_status_update_message_at] == trading_status_update_message_written.instrument_id[trading_status_update_message_at]); trading_status_update_message_at = trading_status_update_message_at + 1
  :: else -> break
  od;
  assert(trading_status_update_message_read.trading_status == trading_status_update_message_written.trading_status);
  skip
}

/* ---- Instrument Info Message: 40 bytes --------------------------------------- */

/* InstrumentInfoMessage */
typedef InstrumentInfoMessage {
  byte instrument_id[8];
  byte min_sell_price[8];
  byte max_buy_price[8];
  byte index_price[8];
  byte mark_price[8]
};

int instrument_info_message_at;

/* every byte of Instrument Info Message set to one value */
inline fill_instrument_info_message(instrument_info_message_record, instrument_info_message_value) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.min_sell_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.max_buy_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.index_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.mark_price[instrument_info_message_at] = instrument_info_message_value; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Info Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_info_message(instrument_info_message_record, instrument_info_message_base) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = (instrument_info_message_base + 0 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.min_sell_price[instrument_info_message_at] = (instrument_info_message_base + 8 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.max_buy_price[instrument_info_message_at] = (instrument_info_message_base + 16 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.index_price[instrument_info_message_at] = (instrument_info_message_base + 24 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.mark_price[instrument_info_message_at] = (instrument_info_message_base + 32 + instrument_info_message_at + 1) % 256; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message to the wire, 40 bytes from where the cursor stands */
inline encode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.instrument_id[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.min_sell_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.max_buy_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.index_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> wire[at] = instrument_info_message_record.mark_price[instrument_info_message_at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Info Message off the wire, 40 bytes from where the cursor stands */
inline decode_instrument_info_message(instrument_info_message_record) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.instrument_id[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.min_sell_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.max_buy_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.index_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> instrument_info_message_record.mark_price[instrument_info_message_at] = wire[at]; at = at + 1; instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Info Message is what was written, byte for byte */
inline equal_instrument_info_message(instrument_info_message_read, instrument_info_message_written) {
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.instrument_id[instrument_info_message_at] == instrument_info_message_written.instrument_id[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.min_sell_price[instrument_info_message_at] == instrument_info_message_written.min_sell_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.max_buy_price[instrument_info_message_at] == instrument_info_message_written.max_buy_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.index_price[instrument_info_message_at] == instrument_info_message_written.index_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  instrument_info_message_at = 0;
  do
  :: instrument_info_message_at < 8 -> assert(instrument_info_message_read.mark_price[instrument_info_message_at] == instrument_info_message_written.mark_price[instrument_info_message_at]); instrument_info_message_at = instrument_info_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Instrument Ref Message: 48 bytes ---------------------------------------- */

/* InstrumentRefMessage */
typedef InstrumentRefMessage {
  byte instrument_id[8];
  byte current_funding[8];
  byte funding_8h[8];
  byte estimated_delivery_price[8];
  byte delivery_price[8];
  byte settlement_price[8]
};

int instrument_ref_message_at;

/* every byte of Instrument Ref Message set to one value */
inline fill_instrument_ref_message(instrument_ref_message_record, instrument_ref_message_value) {
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.instrument_id[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.current_funding[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.funding_8h[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.estimated_delivery_price[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.delivery_price[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.settlement_price[instrument_ref_message_at] = instrument_ref_message_value; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Instrument Ref Message set to where it lies, so a field read out of place says so */
inline ramp_instrument_ref_message(instrument_ref_message_record, instrument_ref_message_base) {
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.instrument_id[instrument_ref_message_at] = (instrument_ref_message_base + 0 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.current_funding[instrument_ref_message_at] = (instrument_ref_message_base + 8 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.funding_8h[instrument_ref_message_at] = (instrument_ref_message_base + 16 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.estimated_delivery_price[instrument_ref_message_at] = (instrument_ref_message_base + 24 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.delivery_price[instrument_ref_message_at] = (instrument_ref_message_base + 32 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.settlement_price[instrument_ref_message_at] = (instrument_ref_message_base + 40 + instrument_ref_message_at + 1) % 256; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Ref Message to the wire, 48 bytes from where the cursor stands */
inline encode_instrument_ref_message(instrument_ref_message_record) {
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.instrument_id[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.current_funding[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.funding_8h[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.estimated_delivery_price[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.delivery_price[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> wire[at] = instrument_ref_message_record.settlement_price[instrument_ref_message_at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  skip
}

/* Instrument Ref Message off the wire, 48 bytes from where the cursor stands */
inline decode_instrument_ref_message(instrument_ref_message_record) {
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.instrument_id[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.current_funding[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.funding_8h[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.estimated_delivery_price[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.delivery_price[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> instrument_ref_message_record.settlement_price[instrument_ref_message_at] = wire[at]; at = at + 1; instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Instrument Ref Message is what was written, byte for byte */
inline equal_instrument_ref_message(instrument_ref_message_read, instrument_ref_message_written) {
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.instrument_id[instrument_ref_message_at] == instrument_ref_message_written.instrument_id[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.current_funding[instrument_ref_message_at] == instrument_ref_message_written.current_funding[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.funding_8h[instrument_ref_message_at] == instrument_ref_message_written.funding_8h[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.estimated_delivery_price[instrument_ref_message_at] == instrument_ref_message_written.estimated_delivery_price[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.delivery_price[instrument_ref_message_at] == instrument_ref_message_written.delivery_price[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  instrument_ref_message_at = 0;
  do
  :: instrument_ref_message_at < 8 -> assert(instrument_ref_message_read.settlement_price[instrument_ref_message_at] == instrument_ref_message_written.settlement_price[instrument_ref_message_at]); instrument_ref_message_at = instrument_ref_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Put Message: 32 bytes ----------------------------------------------- */

/* BidPutMessage */
typedef BidPutMessage {
  byte order_id[8];
  byte instrument_id[8];
  byte quantity_mantissa[8];
  byte price[8]
};

int bid_put_message_at;

/* every byte of Bid Put Message set to one value */
inline fill_bid_put_message(bid_put_message_record, bid_put_message_value) {
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.order_id[bid_put_message_at] = bid_put_message_value; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.instrument_id[bid_put_message_at] = bid_put_message_value; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.quantity_mantissa[bid_put_message_at] = bid_put_message_value; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.price[bid_put_message_at] = bid_put_message_value; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid Put Message set to where it lies, so a field read out of place says so */
inline ramp_bid_put_message(bid_put_message_record, bid_put_message_base) {
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.order_id[bid_put_message_at] = (bid_put_message_base + 0 + bid_put_message_at + 1) % 256; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.instrument_id[bid_put_message_at] = (bid_put_message_base + 8 + bid_put_message_at + 1) % 256; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.quantity_mantissa[bid_put_message_at] = (bid_put_message_base + 16 + bid_put_message_at + 1) % 256; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.price[bid_put_message_at] = (bid_put_message_base + 24 + bid_put_message_at + 1) % 256; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Put Message to the wire, 32 bytes from where the cursor stands */
inline encode_bid_put_message(bid_put_message_record) {
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> wire[at] = bid_put_message_record.order_id[bid_put_message_at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> wire[at] = bid_put_message_record.instrument_id[bid_put_message_at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> wire[at] = bid_put_message_record.quantity_mantissa[bid_put_message_at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> wire[at] = bid_put_message_record.price[bid_put_message_at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Put Message off the wire, 32 bytes from where the cursor stands */
inline decode_bid_put_message(bid_put_message_record) {
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.order_id[bid_put_message_at] = wire[at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.instrument_id[bid_put_message_at] = wire[at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.quantity_mantissa[bid_put_message_at] = wire[at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> bid_put_message_record.price[bid_put_message_at] = wire[at]; at = at + 1; bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid Put Message is what was written, byte for byte */
inline equal_bid_put_message(bid_put_message_read, bid_put_message_written) {
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> assert(bid_put_message_read.order_id[bid_put_message_at] == bid_put_message_written.order_id[bid_put_message_at]); bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> assert(bid_put_message_read.instrument_id[bid_put_message_at] == bid_put_message_written.instrument_id[bid_put_message_at]); bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> assert(bid_put_message_read.quantity_mantissa[bid_put_message_at] == bid_put_message_written.quantity_mantissa[bid_put_message_at]); bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  bid_put_message_at = 0;
  do
  :: bid_put_message_at < 8 -> assert(bid_put_message_read.price[bid_put_message_at] == bid_put_message_written.price[bid_put_message_at]); bid_put_message_at = bid_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ask Put Message: 32 bytes ----------------------------------------------- */

/* AskPutMessage */
typedef AskPutMessage {
  byte order_id[8];
  byte instrument_id[8];
  byte quantity_mantissa[8];
  byte price[8]
};

int ask_put_message_at;

/* every byte of Ask Put Message set to one value */
inline fill_ask_put_message(ask_put_message_record, ask_put_message_value) {
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.order_id[ask_put_message_at] = ask_put_message_value; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.instrument_id[ask_put_message_at] = ask_put_message_value; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.quantity_mantissa[ask_put_message_at] = ask_put_message_value; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.price[ask_put_message_at] = ask_put_message_value; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ask Put Message set to where it lies, so a field read out of place says so */
inline ramp_ask_put_message(ask_put_message_record, ask_put_message_base) {
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.order_id[ask_put_message_at] = (ask_put_message_base + 0 + ask_put_message_at + 1) % 256; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.instrument_id[ask_put_message_at] = (ask_put_message_base + 8 + ask_put_message_at + 1) % 256; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.quantity_mantissa[ask_put_message_at] = (ask_put_message_base + 16 + ask_put_message_at + 1) % 256; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.price[ask_put_message_at] = (ask_put_message_base + 24 + ask_put_message_at + 1) % 256; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Put Message to the wire, 32 bytes from where the cursor stands */
inline encode_ask_put_message(ask_put_message_record) {
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> wire[at] = ask_put_message_record.order_id[ask_put_message_at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> wire[at] = ask_put_message_record.instrument_id[ask_put_message_at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> wire[at] = ask_put_message_record.quantity_mantissa[ask_put_message_at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> wire[at] = ask_put_message_record.price[ask_put_message_at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Put Message off the wire, 32 bytes from where the cursor stands */
inline decode_ask_put_message(ask_put_message_record) {
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.order_id[ask_put_message_at] = wire[at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.instrument_id[ask_put_message_at] = wire[at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.quantity_mantissa[ask_put_message_at] = wire[at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> ask_put_message_record.price[ask_put_message_at] = wire[at]; at = at + 1; ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ask Put Message is what was written, byte for byte */
inline equal_ask_put_message(ask_put_message_read, ask_put_message_written) {
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> assert(ask_put_message_read.order_id[ask_put_message_at] == ask_put_message_written.order_id[ask_put_message_at]); ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> assert(ask_put_message_read.instrument_id[ask_put_message_at] == ask_put_message_written.instrument_id[ask_put_message_at]); ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> assert(ask_put_message_read.quantity_mantissa[ask_put_message_at] == ask_put_message_written.quantity_mantissa[ask_put_message_at]); ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  ask_put_message_at = 0;
  do
  :: ask_put_message_at < 8 -> assert(ask_put_message_read.price[ask_put_message_at] == ask_put_message_written.price[ask_put_message_at]); ask_put_message_at = ask_put_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Qty Reduced Message: 24 bytes --------------------------------------- */

/* BidQtyReducedMessage */
typedef BidQtyReducedMessage {
  byte order_id[8];
  byte instrument_id[8];
  byte quantity_mantissa[8]
};

int bid_qty_reduced_message_at;

/* every byte of Bid Qty Reduced Message set to one value */
inline fill_bid_qty_reduced_message(bid_qty_reduced_message_record, bid_qty_reduced_message_value) {
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.order_id[bid_qty_reduced_message_at] = bid_qty_reduced_message_value; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.instrument_id[bid_qty_reduced_message_at] = bid_qty_reduced_message_value; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.quantity_mantissa[bid_qty_reduced_message_at] = bid_qty_reduced_message_value; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid Qty Reduced Message set to where it lies, so a field read out of place says so */
inline ramp_bid_qty_reduced_message(bid_qty_reduced_message_record, bid_qty_reduced_message_base) {
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.order_id[bid_qty_reduced_message_at] = (bid_qty_reduced_message_base + 0 + bid_qty_reduced_message_at + 1) % 256; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.instrument_id[bid_qty_reduced_message_at] = (bid_qty_reduced_message_base + 8 + bid_qty_reduced_message_at + 1) % 256; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.quantity_mantissa[bid_qty_reduced_message_at] = (bid_qty_reduced_message_base + 16 + bid_qty_reduced_message_at + 1) % 256; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Qty Reduced Message to the wire, 24 bytes from where the cursor stands */
inline encode_bid_qty_reduced_message(bid_qty_reduced_message_record) {
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> wire[at] = bid_qty_reduced_message_record.order_id[bid_qty_reduced_message_at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> wire[at] = bid_qty_reduced_message_record.instrument_id[bid_qty_reduced_message_at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> wire[at] = bid_qty_reduced_message_record.quantity_mantissa[bid_qty_reduced_message_at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Qty Reduced Message off the wire, 24 bytes from where the cursor stands */
inline decode_bid_qty_reduced_message(bid_qty_reduced_message_record) {
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.order_id[bid_qty_reduced_message_at] = wire[at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.instrument_id[bid_qty_reduced_message_at] = wire[at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> bid_qty_reduced_message_record.quantity_mantissa[bid_qty_reduced_message_at] = wire[at]; at = at + 1; bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid Qty Reduced Message is what was written, byte for byte */
inline equal_bid_qty_reduced_message(bid_qty_reduced_message_read, bid_qty_reduced_message_written) {
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> assert(bid_qty_reduced_message_read.order_id[bid_qty_reduced_message_at] == bid_qty_reduced_message_written.order_id[bid_qty_reduced_message_at]); bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> assert(bid_qty_reduced_message_read.instrument_id[bid_qty_reduced_message_at] == bid_qty_reduced_message_written.instrument_id[bid_qty_reduced_message_at]); bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  bid_qty_reduced_message_at = 0;
  do
  :: bid_qty_reduced_message_at < 8 -> assert(bid_qty_reduced_message_read.quantity_mantissa[bid_qty_reduced_message_at] == bid_qty_reduced_message_written.quantity_mantissa[bid_qty_reduced_message_at]); bid_qty_reduced_message_at = bid_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ask Qty Reduced Message: 24 bytes --------------------------------------- */

/* AskQtyReducedMessage */
typedef AskQtyReducedMessage {
  byte order_id[8];
  byte instrument_id[8];
  byte quantity_mantissa[8]
};

int ask_qty_reduced_message_at;

/* every byte of Ask Qty Reduced Message set to one value */
inline fill_ask_qty_reduced_message(ask_qty_reduced_message_record, ask_qty_reduced_message_value) {
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.order_id[ask_qty_reduced_message_at] = ask_qty_reduced_message_value; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.instrument_id[ask_qty_reduced_message_at] = ask_qty_reduced_message_value; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.quantity_mantissa[ask_qty_reduced_message_at] = ask_qty_reduced_message_value; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ask Qty Reduced Message set to where it lies, so a field read out of place says so */
inline ramp_ask_qty_reduced_message(ask_qty_reduced_message_record, ask_qty_reduced_message_base) {
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.order_id[ask_qty_reduced_message_at] = (ask_qty_reduced_message_base + 0 + ask_qty_reduced_message_at + 1) % 256; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.instrument_id[ask_qty_reduced_message_at] = (ask_qty_reduced_message_base + 8 + ask_qty_reduced_message_at + 1) % 256; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.quantity_mantissa[ask_qty_reduced_message_at] = (ask_qty_reduced_message_base + 16 + ask_qty_reduced_message_at + 1) % 256; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Qty Reduced Message to the wire, 24 bytes from where the cursor stands */
inline encode_ask_qty_reduced_message(ask_qty_reduced_message_record) {
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> wire[at] = ask_qty_reduced_message_record.order_id[ask_qty_reduced_message_at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> wire[at] = ask_qty_reduced_message_record.instrument_id[ask_qty_reduced_message_at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> wire[at] = ask_qty_reduced_message_record.quantity_mantissa[ask_qty_reduced_message_at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Qty Reduced Message off the wire, 24 bytes from where the cursor stands */
inline decode_ask_qty_reduced_message(ask_qty_reduced_message_record) {
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.order_id[ask_qty_reduced_message_at] = wire[at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.instrument_id[ask_qty_reduced_message_at] = wire[at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> ask_qty_reduced_message_record.quantity_mantissa[ask_qty_reduced_message_at] = wire[at]; at = at + 1; ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ask Qty Reduced Message is what was written, byte for byte */
inline equal_ask_qty_reduced_message(ask_qty_reduced_message_read, ask_qty_reduced_message_written) {
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> assert(ask_qty_reduced_message_read.order_id[ask_qty_reduced_message_at] == ask_qty_reduced_message_written.order_id[ask_qty_reduced_message_at]); ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> assert(ask_qty_reduced_message_read.instrument_id[ask_qty_reduced_message_at] == ask_qty_reduced_message_written.instrument_id[ask_qty_reduced_message_at]); ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  ask_qty_reduced_message_at = 0;
  do
  :: ask_qty_reduced_message_at < 8 -> assert(ask_qty_reduced_message_read.quantity_mantissa[ask_qty_reduced_message_at] == ask_qty_reduced_message_written.quantity_mantissa[ask_qty_reduced_message_at]); ask_qty_reduced_message_at = ask_qty_reduced_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Bid Delete Message: 16 bytes -------------------------------------------- */

/* BidDeleteMessage */
typedef BidDeleteMessage {
  byte order_id[8];
  byte instrument_id[8]
};

int bid_delete_message_at;

/* every byte of Bid Delete Message set to one value */
inline fill_bid_delete_message(bid_delete_message_record, bid_delete_message_value) {
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.order_id[bid_delete_message_at] = bid_delete_message_value; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.instrument_id[bid_delete_message_at] = bid_delete_message_value; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Bid Delete Message set to where it lies, so a field read out of place says so */
inline ramp_bid_delete_message(bid_delete_message_record, bid_delete_message_base) {
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.order_id[bid_delete_message_at] = (bid_delete_message_base + 0 + bid_delete_message_at + 1) % 256; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.instrument_id[bid_delete_message_at] = (bid_delete_message_base + 8 + bid_delete_message_at + 1) % 256; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Delete Message to the wire, 16 bytes from where the cursor stands */
inline encode_bid_delete_message(bid_delete_message_record) {
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> wire[at] = bid_delete_message_record.order_id[bid_delete_message_at]; at = at + 1; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> wire[at] = bid_delete_message_record.instrument_id[bid_delete_message_at]; at = at + 1; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Bid Delete Message off the wire, 16 bytes from where the cursor stands */
inline decode_bid_delete_message(bid_delete_message_record) {
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.order_id[bid_delete_message_at] = wire[at]; at = at + 1; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> bid_delete_message_record.instrument_id[bid_delete_message_at] = wire[at]; at = at + 1; bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Bid Delete Message is what was written, byte for byte */
inline equal_bid_delete_message(bid_delete_message_read, bid_delete_message_written) {
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> assert(bid_delete_message_read.order_id[bid_delete_message_at] == bid_delete_message_written.order_id[bid_delete_message_at]); bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  bid_delete_message_at = 0;
  do
  :: bid_delete_message_at < 8 -> assert(bid_delete_message_read.instrument_id[bid_delete_message_at] == bid_delete_message_written.instrument_id[bid_delete_message_at]); bid_delete_message_at = bid_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Ask Delete Message: 16 bytes -------------------------------------------- */

/* AskDeleteMessage */
typedef AskDeleteMessage {
  byte order_id[8];
  byte instrument_id[8]
};

int ask_delete_message_at;

/* every byte of Ask Delete Message set to one value */
inline fill_ask_delete_message(ask_delete_message_record, ask_delete_message_value) {
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.order_id[ask_delete_message_at] = ask_delete_message_value; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.instrument_id[ask_delete_message_at] = ask_delete_message_value; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Ask Delete Message set to where it lies, so a field read out of place says so */
inline ramp_ask_delete_message(ask_delete_message_record, ask_delete_message_base) {
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.order_id[ask_delete_message_at] = (ask_delete_message_base + 0 + ask_delete_message_at + 1) % 256; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.instrument_id[ask_delete_message_at] = (ask_delete_message_base + 8 + ask_delete_message_at + 1) % 256; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Delete Message to the wire, 16 bytes from where the cursor stands */
inline encode_ask_delete_message(ask_delete_message_record) {
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> wire[at] = ask_delete_message_record.order_id[ask_delete_message_at]; at = at + 1; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> wire[at] = ask_delete_message_record.instrument_id[ask_delete_message_at]; at = at + 1; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* Ask Delete Message off the wire, 16 bytes from where the cursor stands */
inline decode_ask_delete_message(ask_delete_message_record) {
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.order_id[ask_delete_message_at] = wire[at]; at = at + 1; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> ask_delete_message_record.instrument_id[ask_delete_message_at] = wire[at]; at = at + 1; ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Ask Delete Message is what was written, byte for byte */
inline equal_ask_delete_message(ask_delete_message_read, ask_delete_message_written) {
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> assert(ask_delete_message_read.order_id[ask_delete_message_at] == ask_delete_message_written.order_id[ask_delete_message_at]); ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  ask_delete_message_at = 0;
  do
  :: ask_delete_message_at < 8 -> assert(ask_delete_message_read.instrument_id[ask_delete_message_at] == ask_delete_message_written.instrument_id[ask_delete_message_at]); ask_delete_message_at = ask_delete_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Header Message: 24 bytes --------------------------------------- */

/* SnapshotHeaderMessage */
typedef SnapshotHeaderMessage {
  byte instrument_id[8];
  byte incremental_timestamp[8];
  byte incremental_seq_num[8]
};

int snapshot_header_message_at;

/* every byte of Snapshot Header Message set to one value */
inline fill_snapshot_header_message(snapshot_header_message_record, snapshot_header_message_value) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.instrument_id[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_timestamp[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_seq_num[snapshot_header_message_at] = snapshot_header_message_value; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Header Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_header_message(snapshot_header_message_record, snapshot_header_message_base) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.instrument_id[snapshot_header_message_at] = (snapshot_header_message_base + 0 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_timestamp[snapshot_header_message_at] = (snapshot_header_message_base + 8 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_seq_num[snapshot_header_message_at] = (snapshot_header_message_base + 16 + snapshot_header_message_at + 1) % 256; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header Message to the wire, 24 bytes from where the cursor stands */
inline encode_snapshot_header_message(snapshot_header_message_record) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> wire[at] = snapshot_header_message_record.instrument_id[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> wire[at] = snapshot_header_message_record.incremental_timestamp[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> wire[at] = snapshot_header_message_record.incremental_seq_num[snapshot_header_message_at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Header Message off the wire, 24 bytes from where the cursor stands */
inline decode_snapshot_header_message(snapshot_header_message_record) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.instrument_id[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_timestamp[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> snapshot_header_message_record.incremental_seq_num[snapshot_header_message_at] = wire[at]; at = at + 1; snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Header Message is what was written, byte for byte */
inline equal_snapshot_header_message(snapshot_header_message_read, snapshot_header_message_written) {
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> assert(snapshot_header_message_read.instrument_id[snapshot_header_message_at] == snapshot_header_message_written.instrument_id[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> assert(snapshot_header_message_read.incremental_timestamp[snapshot_header_message_at] == snapshot_header_message_written.incremental_timestamp[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  snapshot_header_message_at = 0;
  do
  :: snapshot_header_message_at < 8 -> assert(snapshot_header_message_read.incremental_seq_num[snapshot_header_message_at] == snapshot_header_message_written.incremental_seq_num[snapshot_header_message_at]); snapshot_header_message_at = snapshot_header_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Snapshot Trailer Message: 24 bytes -------------------------------------- */

/* SnapshotTrailerMessage */
typedef SnapshotTrailerMessage {
  byte instrument_id[8];
  byte timestamp[8];
  byte increment_seq_num[8]
};

int snapshot_trailer_message_at;

/* every byte of Snapshot Trailer Message set to one value */
inline fill_snapshot_trailer_message(snapshot_trailer_message_record, snapshot_trailer_message_value) {
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.instrument_id[snapshot_trailer_message_at] = snapshot_trailer_message_value; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.timestamp[snapshot_trailer_message_at] = snapshot_trailer_message_value; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.increment_seq_num[snapshot_trailer_message_at] = snapshot_trailer_message_value; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of Snapshot Trailer Message set to where it lies, so a field read out of place says so */
inline ramp_snapshot_trailer_message(snapshot_trailer_message_record, snapshot_trailer_message_base) {
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.instrument_id[snapshot_trailer_message_at] = (snapshot_trailer_message_base + 0 + snapshot_trailer_message_at + 1) % 256; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.timestamp[snapshot_trailer_message_at] = (snapshot_trailer_message_base + 8 + snapshot_trailer_message_at + 1) % 256; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.increment_seq_num[snapshot_trailer_message_at] = (snapshot_trailer_message_base + 16 + snapshot_trailer_message_at + 1) % 256; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Trailer Message to the wire, 24 bytes from where the cursor stands */
inline encode_snapshot_trailer_message(snapshot_trailer_message_record) {
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> wire[at] = snapshot_trailer_message_record.instrument_id[snapshot_trailer_message_at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> wire[at] = snapshot_trailer_message_record.timestamp[snapshot_trailer_message_at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> wire[at] = snapshot_trailer_message_record.increment_seq_num[snapshot_trailer_message_at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* Snapshot Trailer Message off the wire, 24 bytes from where the cursor stands */
inline decode_snapshot_trailer_message(snapshot_trailer_message_record) {
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.instrument_id[snapshot_trailer_message_at] = wire[at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.timestamp[snapshot_trailer_message_at] = wire[at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> snapshot_trailer_message_record.increment_seq_num[snapshot_trailer_message_at] = wire[at]; at = at + 1; snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of Snapshot Trailer Message is what was written, byte for byte */
inline equal_snapshot_trailer_message(snapshot_trailer_message_read, snapshot_trailer_message_written) {
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> assert(snapshot_trailer_message_read.instrument_id[snapshot_trailer_message_at] == snapshot_trailer_message_written.instrument_id[snapshot_trailer_message_at]); snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> assert(snapshot_trailer_message_read.timestamp[snapshot_trailer_message_at] == snapshot_trailer_message_written.timestamp[snapshot_trailer_message_at]); snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  snapshot_trailer_message_at = 0;
  do
  :: snapshot_trailer_message_at < 8 -> assert(snapshot_trailer_message_read.increment_seq_num[snapshot_trailer_message_at] == snapshot_trailer_message_written.increment_seq_num[snapshot_trailer_message_at]); snapshot_trailer_message_at = snapshot_trailer_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- End Of Cycle Message: 4 bytes ------------------------------------------- */

/* EndOfCycleMessage */
typedef EndOfCycleMessage {
  byte active_instrument_count[4]
};

int end_of_cycle_message_at;

/* every byte of End Of Cycle Message set to one value */
inline fill_end_of_cycle_message(end_of_cycle_message_record, end_of_cycle_message_value) {
  end_of_cycle_message_at = 0;
  do
  :: end_of_cycle_message_at < 4 -> end_of_cycle_message_record.active_instrument_count[end_of_cycle_message_at] = end_of_cycle_message_value; end_of_cycle_message_at = end_of_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* each byte of End Of Cycle Message set to where it lies, so a field read out of place says so */
inline ramp_end_of_cycle_message(end_of_cycle_message_record, end_of_cycle_message_base) {
  end_of_cycle_message_at = 0;
  do
  :: end_of_cycle_message_at < 4 -> end_of_cycle_message_record.active_instrument_count[end_of_cycle_message_at] = (end_of_cycle_message_base + 0 + end_of_cycle_message_at + 1) % 256; end_of_cycle_message_at = end_of_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Cycle Message to the wire, 4 bytes from where the cursor stands */
inline encode_end_of_cycle_message(end_of_cycle_message_record) {
  end_of_cycle_message_at = 0;
  do
  :: end_of_cycle_message_at < 4 -> wire[at] = end_of_cycle_message_record.active_instrument_count[end_of_cycle_message_at]; at = at + 1; end_of_cycle_message_at = end_of_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* End Of Cycle Message off the wire, 4 bytes from where the cursor stands */
inline decode_end_of_cycle_message(end_of_cycle_message_record) {
  end_of_cycle_message_at = 0;
  do
  :: end_of_cycle_message_at < 4 -> end_of_cycle_message_record.active_instrument_count[end_of_cycle_message_at] = wire[at]; at = at + 1; end_of_cycle_message_at = end_of_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* what was read of End Of Cycle Message is what was written, byte for byte */
inline equal_end_of_cycle_message(end_of_cycle_message_read, end_of_cycle_message_written) {
  end_of_cycle_message_at = 0;
  do
  :: end_of_cycle_message_at < 4 -> assert(end_of_cycle_message_read.active_instrument_count[end_of_cycle_message_at] == end_of_cycle_message_written.active_instrument_count[end_of_cycle_message_at]); end_of_cycle_message_at = end_of_cycle_message_at + 1
  :: else -> break
  od;
  skip
}

/* ---- Retransmit Request Message: 9 bytes ------------------------------------- */

/* RetransmitRequestMessage */
typedef RetransmitRequestMessage {
  byte begin_seq_num[8];
  byte message_count_short
};

int retransmit_request_message_at;

/* every byte of Retransmit Request Message set to one value */
inline fill_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_value) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = retransmit_request_message_value; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count_short = retransmit_request_message_value;
  skip
}

/* each byte of Retransmit Request Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_request_message(retransmit_request_message_record, retransmit_request_message_base) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = (retransmit_request_message_base + 0 + retransmit_request_message_at + 1) % 256; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count_short = (retransmit_request_message_base + 8 + 1) % 256;
  skip
}

/* Retransmit Request Message to the wire, 9 bytes from where the cursor stands */
inline encode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> wire[at] = retransmit_request_message_record.begin_seq_num[retransmit_request_message_at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_request_message_record.message_count_short; at = at + 1;
  skip
}

/* Retransmit Request Message off the wire, 9 bytes from where the cursor stands */
inline decode_retransmit_request_message(retransmit_request_message_record) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> retransmit_request_message_record.begin_seq_num[retransmit_request_message_at] = wire[at]; at = at + 1; retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  retransmit_request_message_record.message_count_short = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Request Message is what was written, byte for byte */
inline equal_retransmit_request_message(retransmit_request_message_read, retransmit_request_message_written) {
  retransmit_request_message_at = 0;
  do
  :: retransmit_request_message_at < 8 -> assert(retransmit_request_message_read.begin_seq_num[retransmit_request_message_at] == retransmit_request_message_written.begin_seq_num[retransmit_request_message_at]); retransmit_request_message_at = retransmit_request_message_at + 1
  :: else -> break
  od;
  assert(retransmit_request_message_read.message_count_short == retransmit_request_message_written.message_count_short);
  skip
}

/* ---- Retransmit Reject Message: 49 bytes ------------------------------------- */

/* RetransmitRejectMessage */
typedef RetransmitRejectMessage {
  byte retry_delay_nanos[8];
  byte details[40];
  byte reason
};

int retransmit_reject_message_at;

/* every byte of Retransmit Reject Message set to one value */
inline fill_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_value) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = retransmit_reject_message_value; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = retransmit_reject_message_value;
  skip
}

/* each byte of Retransmit Reject Message set to where it lies, so a field read out of place says so */
inline ramp_retransmit_reject_message(retransmit_reject_message_record, retransmit_reject_message_base) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = (retransmit_reject_message_base + 0 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = (retransmit_reject_message_base + 8 + retransmit_reject_message_at + 1) % 256; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = (retransmit_reject_message_base + 48 + 1) % 256;
  skip
}

/* Retransmit Reject Message to the wire, 49 bytes from where the cursor stands */
inline encode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> wire[at] = retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> wire[at] = retransmit_reject_message_record.details[retransmit_reject_message_at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  wire[at] = retransmit_reject_message_record.reason; at = at + 1;
  skip
}

/* Retransmit Reject Message off the wire, 49 bytes from where the cursor stands */
inline decode_retransmit_reject_message(retransmit_reject_message_record) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> retransmit_reject_message_record.retry_delay_nanos[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> retransmit_reject_message_record.details[retransmit_reject_message_at] = wire[at]; at = at + 1; retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_record.reason = wire[at]; at = at + 1;
  skip
}

/* what was read of Retransmit Reject Message is what was written, byte for byte */
inline equal_retransmit_reject_message(retransmit_reject_message_read, retransmit_reject_message_written) {
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 8 -> assert(retransmit_reject_message_read.retry_delay_nanos[retransmit_reject_message_at] == retransmit_reject_message_written.retry_delay_nanos[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  retransmit_reject_message_at = 0;
  do
  :: retransmit_reject_message_at < 40 -> assert(retransmit_reject_message_read.details[retransmit_reject_message_at] == retransmit_reject_message_written.details[retransmit_reject_message_at]); retransmit_reject_message_at = retransmit_reject_message_at + 1
  :: else -> break
  od;
  assert(retransmit_reject_message_read.reason == retransmit_reject_message_written.reason);
  skip
}

/* ---- What spin checks -------------------------------------------------------- */

/* Logical Expiry: encoded, read back, and compared */
proctype check_logical_expiry() {
  LogicalExpiry logical_expiry_sent;
  LogicalExpiry logical_expiry_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_logical_expiry(logical_expiry_sent, 0)
  :: pattern == 1 -> fill_logical_expiry(logical_expiry_sent, 32)
  :: pattern == 2 -> fill_logical_expiry(logical_expiry_sent, 255)
  :: else -> ramp_logical_expiry(logical_expiry_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_logical_expiry(logical_expiry_sent);
    assert(at == 8);
    at = 0;
    decode_logical_expiry(logical_expiry_got);
    assert(at == 8);
    equal_logical_expiry(logical_expiry_got, logical_expiry_sent)
  }
}

/* Trading Status Update Message: encoded, read back, and compared */
proctype check_trading_status_update_message() {
  TradingStatusUpdateMessage trading_status_update_message_sent;
  TradingStatusUpdateMessage trading_status_update_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_trading_status_update_message(trading_status_update_message_sent, 0)
  :: pattern == 1 -> fill_trading_status_update_message(trading_status_update_message_sent, 32)
  :: pattern == 2 -> fill_trading_status_update_message(trading_status_update_message_sent, 255)
  :: else -> ramp_trading_status_update_message(trading_status_update_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_trading_status_update_message(trading_status_update_message_sent);
    assert(at == 9);
    at = 0;
    decode_trading_status_update_message(trading_status_update_message_got);
    assert(at == 9);
    equal_trading_status_update_message(trading_status_update_message_got, trading_status_update_message_sent)
  }
}

/* Instrument Info Message: encoded, read back, and compared */
proctype check_instrument_info_message() {
  InstrumentInfoMessage instrument_info_message_sent;
  InstrumentInfoMessage instrument_info_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_info_message(instrument_info_message_sent, 0)
  :: pattern == 1 -> fill_instrument_info_message(instrument_info_message_sent, 32)
  :: pattern == 2 -> fill_instrument_info_message(instrument_info_message_sent, 255)
  :: else -> ramp_instrument_info_message(instrument_info_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_info_message(instrument_info_message_sent);
    assert(at == 40);
    at = 0;
    decode_instrument_info_message(instrument_info_message_got);
    assert(at == 40);
    equal_instrument_info_message(instrument_info_message_got, instrument_info_message_sent)
  }
}

/* Instrument Ref Message: encoded, read back, and compared */
proctype check_instrument_ref_message() {
  InstrumentRefMessage instrument_ref_message_sent;
  InstrumentRefMessage instrument_ref_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_instrument_ref_message(instrument_ref_message_sent, 0)
  :: pattern == 1 -> fill_instrument_ref_message(instrument_ref_message_sent, 32)
  :: pattern == 2 -> fill_instrument_ref_message(instrument_ref_message_sent, 255)
  :: else -> ramp_instrument_ref_message(instrument_ref_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_instrument_ref_message(instrument_ref_message_sent);
    assert(at == 48);
    at = 0;
    decode_instrument_ref_message(instrument_ref_message_got);
    assert(at == 48);
    equal_instrument_ref_message(instrument_ref_message_got, instrument_ref_message_sent)
  }
}

/* Bid Put Message: encoded, read back, and compared */
proctype check_bid_put_message() {
  BidPutMessage bid_put_message_sent;
  BidPutMessage bid_put_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_put_message(bid_put_message_sent, 0)
  :: pattern == 1 -> fill_bid_put_message(bid_put_message_sent, 32)
  :: pattern == 2 -> fill_bid_put_message(bid_put_message_sent, 255)
  :: else -> ramp_bid_put_message(bid_put_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_put_message(bid_put_message_sent);
    assert(at == 32);
    at = 0;
    decode_bid_put_message(bid_put_message_got);
    assert(at == 32);
    equal_bid_put_message(bid_put_message_got, bid_put_message_sent)
  }
}

/* Ask Put Message: encoded, read back, and compared */
proctype check_ask_put_message() {
  AskPutMessage ask_put_message_sent;
  AskPutMessage ask_put_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_put_message(ask_put_message_sent, 0)
  :: pattern == 1 -> fill_ask_put_message(ask_put_message_sent, 32)
  :: pattern == 2 -> fill_ask_put_message(ask_put_message_sent, 255)
  :: else -> ramp_ask_put_message(ask_put_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_put_message(ask_put_message_sent);
    assert(at == 32);
    at = 0;
    decode_ask_put_message(ask_put_message_got);
    assert(at == 32);
    equal_ask_put_message(ask_put_message_got, ask_put_message_sent)
  }
}

/* Bid Qty Reduced Message: encoded, read back, and compared */
proctype check_bid_qty_reduced_message() {
  BidQtyReducedMessage bid_qty_reduced_message_sent;
  BidQtyReducedMessage bid_qty_reduced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_qty_reduced_message(bid_qty_reduced_message_sent, 0)
  :: pattern == 1 -> fill_bid_qty_reduced_message(bid_qty_reduced_message_sent, 32)
  :: pattern == 2 -> fill_bid_qty_reduced_message(bid_qty_reduced_message_sent, 255)
  :: else -> ramp_bid_qty_reduced_message(bid_qty_reduced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_qty_reduced_message(bid_qty_reduced_message_sent);
    assert(at == 24);
    at = 0;
    decode_bid_qty_reduced_message(bid_qty_reduced_message_got);
    assert(at == 24);
    equal_bid_qty_reduced_message(bid_qty_reduced_message_got, bid_qty_reduced_message_sent)
  }
}

/* Ask Qty Reduced Message: encoded, read back, and compared */
proctype check_ask_qty_reduced_message() {
  AskQtyReducedMessage ask_qty_reduced_message_sent;
  AskQtyReducedMessage ask_qty_reduced_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_qty_reduced_message(ask_qty_reduced_message_sent, 0)
  :: pattern == 1 -> fill_ask_qty_reduced_message(ask_qty_reduced_message_sent, 32)
  :: pattern == 2 -> fill_ask_qty_reduced_message(ask_qty_reduced_message_sent, 255)
  :: else -> ramp_ask_qty_reduced_message(ask_qty_reduced_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_qty_reduced_message(ask_qty_reduced_message_sent);
    assert(at == 24);
    at = 0;
    decode_ask_qty_reduced_message(ask_qty_reduced_message_got);
    assert(at == 24);
    equal_ask_qty_reduced_message(ask_qty_reduced_message_got, ask_qty_reduced_message_sent)
  }
}

/* Bid Delete Message: encoded, read back, and compared */
proctype check_bid_delete_message() {
  BidDeleteMessage bid_delete_message_sent;
  BidDeleteMessage bid_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_bid_delete_message(bid_delete_message_sent, 0)
  :: pattern == 1 -> fill_bid_delete_message(bid_delete_message_sent, 32)
  :: pattern == 2 -> fill_bid_delete_message(bid_delete_message_sent, 255)
  :: else -> ramp_bid_delete_message(bid_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_bid_delete_message(bid_delete_message_sent);
    assert(at == 16);
    at = 0;
    decode_bid_delete_message(bid_delete_message_got);
    assert(at == 16);
    equal_bid_delete_message(bid_delete_message_got, bid_delete_message_sent)
  }
}

/* Ask Delete Message: encoded, read back, and compared */
proctype check_ask_delete_message() {
  AskDeleteMessage ask_delete_message_sent;
  AskDeleteMessage ask_delete_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_ask_delete_message(ask_delete_message_sent, 0)
  :: pattern == 1 -> fill_ask_delete_message(ask_delete_message_sent, 32)
  :: pattern == 2 -> fill_ask_delete_message(ask_delete_message_sent, 255)
  :: else -> ramp_ask_delete_message(ask_delete_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_ask_delete_message(ask_delete_message_sent);
    assert(at == 16);
    at = 0;
    decode_ask_delete_message(ask_delete_message_got);
    assert(at == 16);
    equal_ask_delete_message(ask_delete_message_got, ask_delete_message_sent)
  }
}

/* Snapshot Header Message: encoded, read back, and compared */
proctype check_snapshot_header_message() {
  SnapshotHeaderMessage snapshot_header_message_sent;
  SnapshotHeaderMessage snapshot_header_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_header_message(snapshot_header_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_header_message(snapshot_header_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_header_message(snapshot_header_message_sent, 255)
  :: else -> ramp_snapshot_header_message(snapshot_header_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_header_message(snapshot_header_message_sent);
    assert(at == 24);
    at = 0;
    decode_snapshot_header_message(snapshot_header_message_got);
    assert(at == 24);
    equal_snapshot_header_message(snapshot_header_message_got, snapshot_header_message_sent)
  }
}

/* Snapshot Trailer Message: encoded, read back, and compared */
proctype check_snapshot_trailer_message() {
  SnapshotTrailerMessage snapshot_trailer_message_sent;
  SnapshotTrailerMessage snapshot_trailer_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_snapshot_trailer_message(snapshot_trailer_message_sent, 0)
  :: pattern == 1 -> fill_snapshot_trailer_message(snapshot_trailer_message_sent, 32)
  :: pattern == 2 -> fill_snapshot_trailer_message(snapshot_trailer_message_sent, 255)
  :: else -> ramp_snapshot_trailer_message(snapshot_trailer_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_snapshot_trailer_message(snapshot_trailer_message_sent);
    assert(at == 24);
    at = 0;
    decode_snapshot_trailer_message(snapshot_trailer_message_got);
    assert(at == 24);
    equal_snapshot_trailer_message(snapshot_trailer_message_got, snapshot_trailer_message_sent)
  }
}

/* End Of Cycle Message: encoded, read back, and compared */
proctype check_end_of_cycle_message() {
  EndOfCycleMessage end_of_cycle_message_sent;
  EndOfCycleMessage end_of_cycle_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_end_of_cycle_message(end_of_cycle_message_sent, 0)
  :: pattern == 1 -> fill_end_of_cycle_message(end_of_cycle_message_sent, 32)
  :: pattern == 2 -> fill_end_of_cycle_message(end_of_cycle_message_sent, 255)
  :: else -> ramp_end_of_cycle_message(end_of_cycle_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_end_of_cycle_message(end_of_cycle_message_sent);
    assert(at == 4);
    at = 0;
    decode_end_of_cycle_message(end_of_cycle_message_got);
    assert(at == 4);
    equal_end_of_cycle_message(end_of_cycle_message_got, end_of_cycle_message_sent)
  }
}

/* Retransmit Request Message: encoded, read back, and compared */
proctype check_retransmit_request_message() {
  RetransmitRequestMessage retransmit_request_message_sent;
  RetransmitRequestMessage retransmit_request_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_request_message(retransmit_request_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_request_message(retransmit_request_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_request_message(retransmit_request_message_sent, 255)
  :: else -> ramp_retransmit_request_message(retransmit_request_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_request_message(retransmit_request_message_sent);
    assert(at == 9);
    at = 0;
    decode_retransmit_request_message(retransmit_request_message_got);
    assert(at == 9);
    equal_retransmit_request_message(retransmit_request_message_got, retransmit_request_message_sent)
  }
}

/* Retransmit Reject Message: encoded, read back, and compared */
proctype check_retransmit_reject_message() {
  RetransmitRejectMessage retransmit_reject_message_sent;
  RetransmitRejectMessage retransmit_reject_message_got;
  int pattern;

  if
  :: pattern = 0
  :: pattern = 1
  :: pattern = 2
  :: pattern = 3
  fi;

  if
  :: pattern == 0 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 0)
  :: pattern == 1 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 32)
  :: pattern == 2 -> fill_retransmit_reject_message(retransmit_reject_message_sent, 255)
  :: else -> ramp_retransmit_reject_message(retransmit_reject_message_sent, 0)
  fi;

  atomic {
    at = 0;
    encode_retransmit_reject_message(retransmit_reject_message_sent);
    assert(at == 49);
    at = 0;
    decode_retransmit_reject_message(retransmit_reject_message_got);
    assert(at == 49);
    equal_retransmit_reject_message(retransmit_reject_message_got, retransmit_reject_message_sent)
  }
}

/* one checking process, chosen nondeterministically, so every one of them runs */
init {
  if
  :: run check_logical_expiry()
  :: run check_trading_status_update_message()
  :: run check_instrument_info_message()
  :: run check_instrument_ref_message()
  :: run check_bid_put_message()
  :: run check_ask_put_message()
  :: run check_bid_qty_reduced_message()
  :: run check_ask_qty_reduced_message()
  :: run check_bid_delete_message()
  :: run check_ask_delete_message()
  :: run check_snapshot_header_message()
  :: run check_snapshot_trailer_message()
  :: run check_end_of_cycle_message()
  :: run check_retransmit_request_message()
  :: run check_retransmit_reject_message()
  fi
}
